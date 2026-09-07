#!/usr/bin/env bash
# Build auditor PDFs from BASELINE/*.md → docs/PDF/ (mirrored tree)
# Engine: pandoc (Markdown→HTML) + WeasyPrint (HTML→PDF) — does NOT use Chrome
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SCRIPT_DIR="$ROOT/scripts/pdf"
BASELINE="$ROOT/BASELINE"
OUT_ROOT="$ROOT/docs/PDF"
TEMPLATE="$SCRIPT_DIR/template.html"
CSS="$SCRIPT_DIR/print.css"
CSS_LAND="$SCRIPT_DIR/print-landscape.css"
LOGO="$ROOT/LOGO/logo.png"
VENV_PY="$ROOT/.venv-pdf/bin/python"
TMP_DIR="$(mktemp -d "${TMPDIR:-/tmp}/rbwf-pdf.XXXXXX")"
trap 'rm -rf "$TMP_DIR"' EXIT

# Keep fontconfig writable inside the repo (avoids sandbox / permission noise)
export XDG_CACHE_HOME="$ROOT/.cache"
mkdir -p "$XDG_CACHE_HOME/fontconfig"

ONLY_CHANGED=0
PILOT_ONLY=0
FILTER=""

usage() {
  cat <<'EOF'
Usage: scripts/pdf/build-pdfs.sh [--pilot] [--only-changed] [path-substring...]

  --pilot         Build only SP, TP, RTM, SDD (for CSS tuning)
  --only-changed  Skip if PDF exists and is newer than source .md
  path-substring  Optional filters matched against relative md path

Requires: pandoc, and Python venv at .venv-pdf with weasyprint
  python3 -m venv .venv-pdf && .venv-pdf/bin/pip install -r scripts/pdf/requirements.txt
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --pilot) PILOT_ONLY=1; shift ;;
    --only-changed) ONLY_CHANGED=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) FILTER="${FILTER:+$FILTER }$1"; shift ;;
  esac
done

command -v pandoc >/dev/null || { echo "ERROR: pandoc required" >&2; exit 1; }
if [[ ! -x "$VENV_PY" ]]; then
  echo "ERROR: missing $VENV_PY — create venv and install weasyprint" >&2
  exit 1
fi
"$VENV_PY" -c "import weasyprint" 2>/dev/null || {
  echo "ERROR: weasyprint not installed in .venv-pdf" >&2
  exit 1
}

is_landscape() {
  local base="$1"
  case "$base" in
    RBWF_RTM_v1_0|RBWF_SWC_v1_0|RBWF_DOT_v1_0|RBWF_TP_v1_0|RBWF_TR_v1_0|RBWF_ALL|RBWF_UAT_v1_0)
      return 0 ;;
    *) return 1 ;;
  esac
}

is_long_doc() {
  local base="$1"
  case "$base" in
    RBWF_SDD_v1_0|RBWF_SCM_v1_0|RBWF_PMP_v1_0|RBWF_SRS_v1_0|RBWF_SUD_v1_0)
      return 0 ;;
    *) return 1 ;;
  esac
}

should_pilot() {
  local base="$1"
  case "$base" in
    RBWF_SP_v1_0|RBWF_TP_v1_0|RBWF_RTM_v1_0|RBWF_SDD_v1_0) return 0 ;;
    *) return 1 ;;
  esac
}

html_to_pdf() {
  local html="$1"
  local pdf="$2"
  local base_url="$3"
  "$VENV_PY" - "$html" "$pdf" "$base_url" <<'PY'
import sys
from pathlib import Path
from weasyprint import HTML

html_path, pdf_path, base_url = sys.argv[1], sys.argv[2], sys.argv[3]
HTML(filename=html_path, base_url=base_url).write_pdf(pdf_path)
print(f"wrote {pdf_path} ({Path(pdf_path).stat().st_size} bytes)")
PY
}

build_one() {
  local md="$1"
  local rel="${md#"$BASELINE"/}"
  local stem="${rel%.md}"
  local base
  base="$(basename "$stem")"
  local out_pdf="$OUT_ROOT/${stem}.pdf"
  local out_dir
  out_dir="$(dirname "$out_pdf")"
  local built=0

  if [[ $PILOT_ONLY -eq 1 ]] && ! should_pilot "$base"; then
    echo "SKIP"
    return 0
  fi

  if [[ -n "$FILTER" ]]; then
    local ok=0
    for f in $FILTER; do
      if [[ "$rel" == *"$f"* ]]; then ok=1; break; fi
    done
    if [[ $ok -ne 1 ]]; then
      echo "SKIP"
      return 0
    fi
  fi

  if [[ $ONLY_CHANGED -eq 1 && -f "$out_pdf" && "$out_pdf" -nt "$md" ]]; then
    echo "SKIP (up-to-date): $rel"
    return 0
  fi

  mkdir -p "$out_dir"
  local html="$TMP_DIR/${base}.html"
  local bodyclass=""
  local css_args=(--css="$CSS")

  if is_landscape "$base"; then
    bodyclass="landscape"
    css_args+=(--css="$CSS_LAND")
  fi
  if is_long_doc "$base"; then
    bodyclass="${bodyclass:+$bodyclass }long-doc"
  fi

  local md_dir
  md_dir="$(dirname "$md")"

  pandoc "$md" \
    -f gfm \
    -t html5 \
    --standalone \
    --template="$TEMPLATE" \
    --resource-path="$md_dir:$BASELINE:$ROOT" \
    --embed-resources \
    "${css_args[@]}" \
    -V "docid=$base" \
    -V "logopath=$LOGO" \
    -V "bodyclass=$bodyclass" \
    -o "$html"

  echo -n "PDF  $rel … "
  html_to_pdf "$html" "$out_pdf" "$ROOT/"

  if [[ ! -s "$out_pdf" ]]; then
    echo "ERROR: empty PDF for $rel" >&2
    return 1
  fi
  built=1
  return 0
}

echo "ROOT=$ROOT"
echo "OUT =$OUT_ROOT"
echo "Engine=WeasyPrint (no Chrome)"
mkdir -p "$OUT_ROOT"
# remove leftover chrome crash artifacts if any
rm -rf "$OUT_ROOT/_tmp"

ok=0
fail=0
skip=0
while IFS= read -r -d '' md; do
  result="$(build_one "$md" 2>&1)" || {
    echo "$result" >&2
    fail=$((fail + 1))
    continue
  }
  if [[ "$result" == SKIP* ]]; then
    skip=$((skip + 1))
  else
    echo "$result"
    ok=$((ok + 1))
  fi
done < <(find "$BASELINE" -type f -name '*.md' -print0 | sort -z)

echo "Done. built=$ok skipped=$skip failures=$fail"
pdf_count="$(find "$OUT_ROOT" -type f -name '*.pdf' | wc -l | tr -d ' ')"
md_count="$(find "$BASELINE" -type f -name '*.md' | wc -l | tr -d ' ')"
echo "PDF files now: $pdf_count / MD sources: $md_count"
[[ $fail -eq 0 ]]
