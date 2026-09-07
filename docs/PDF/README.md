# RBWF Baseline PDF Pack (สำหรับส่ง Auditor)

ชุด PDF แยกไฟล์จาก Markdown ใน `BASELINE/` จัดหน้า A4 สไตล์เอกสารส่งตรวจ

**Engine:** Pandoc (Markdown → HTML) + **WeasyPrint** (HTML → PDF)  
**ไม่ใช้ Google Chrome** (headless Chrome ทำให้แอปเด้งบนเครื่องนี้)

## โครงสร้าง

โครงโฟลเดอร์สะท้อน `BASELINE/`:

```text
docs/PDF/
  RBWF_ALL.pdf
  RBWF_SRS_v1_0.pdf
  RBWF_SP_v1_0.pdf
  …
  RBWF_MOM/RBWF_MOM_EXT_20260529.pdf
  RBWF_VLD/RBWF_VLD_FINAL_20260529.pdf
  RBWF_VER/…
  RBWF_PSR/…
  RBWF_CR/…
```

จำนวนไฟล์: เท่ากับจำนวน `.md` ใน `BASELINE/` (ปัจจุบัน 60 ไฟล์)

## สร้างใหม่ / อัปเดต

จากรากโปรเจกต์:

```bash
# ครั้งแรกเท่านั้น
python3 -m venv .venv-pdf
.venv-pdf/bin/pip install -r scripts/pdf/requirements.txt

# สร้างทั้งหมด
./scripts/pdf/build-pdfs.sh

# ทดลอง 4 ไฟล์ (SP, TP, RTM, SDD)
./scripts/pdf/build-pdfs.sh --pilot

# สร้างเฉพาะที่ .md ใหม่กว่า PDF
./scripts/pdf/build-pdfs.sh --only-changed

# กรองชื่อไฟล์
./scripts/pdf/build-pdfs.sh RBWF_SP MOM_EXT
```

ไฟล์เครื่องมืออยู่ที่ `scripts/pdf/`:

| ไฟล์ | หน้าที่ |
|---|---|
| `build-pdfs.sh` | สคริปต์หลัก |
| `template.html` | หัวเอกสาร + โลโก้ |
| `print.css` | สไตล์ A4 portrait + เลขหน้า |
| `print-landscape.css` | เอกสารตารางกว้าง (TP/TR/RTM/SWC/DOT/ALL/UAT) |
| `requirements.txt` | weasyprint |

## หมายเหตุการจัดหน้า

- หัว/ท้ายหน้า: ชื่อโครงการ, รหัสเอกสาร, เลขหน้า
- ตารางกว้างใช้ landscape อัตโนมัติตามรายการในสคริปต์
- รูป `LOGO/`, `PROCESS/`, ลายเซ็นถูกฝังใน PDF
- ลิงก์ URL ในเอกสารยังคลิกได้ใน PDF readers ส่วนใหญ่

## สิ่งที่ไม่รวมในแพ็กนี้

- คลังซอฟต์แวร์ GitHub (`workflowv2.rabbittile.com`)
- Google Drive backup (BK)
- โน้ตวิดีโอ `docs/สรุปการปรับปรุงเอกสาร_…`
