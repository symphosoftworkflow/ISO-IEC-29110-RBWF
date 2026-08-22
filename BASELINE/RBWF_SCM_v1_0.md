<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# เอกสาร แผนการจัดการคอนฟิกูเรชันซอฟต์แวร์ (SOFTWARE CONFIGURATION MANAGEMENT PLAN - SCM)

**ชื่อระบบงาน[TH]**: ระบบบริหารงานธุรกิจจัดจำหน่ายวัสดุก่อสร้างและกระเบื้องครบวงจร  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  
**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นายวีระ เนียมโภคะ (TL, AN)  
**วันที่อนุมัติเอกสาร**: 25 มกราคม พ.ศ. 2569  

---

## ประวัติการจัดทำเอกสาร

| ลำดับ | เวอร์ชัน | รายละเอียดการดำเนินการ | ผู้ดำเนินการ | วันที่ดำเนินการ |
|---|---|---|---|---|
| 1 | 0.1 | จัดทำแผนการจัดการคอนฟิกูเรชันซอฟต์แวร์ | นายวีระ เนียมโภคะ (TL, AN) | 20 มกราคม พ.ศ. 2569 |
| 2 | 0.1 | ตรวจทาน แผนการจัดการคอนฟิกูเรชันซอฟต์แวร์ | นางสาวปวริศา จันทรสถาพร (PM) | 25 มกราคม พ.ศ. 2569 |
| 3 | 1.0 | อนุมัติแผนการจัดการคอนฟิกูเรชันซอฟต์แวร์ | นายทิโนภาส อรไทวรรณ | 25 มกราคม พ.ศ. 2569 |

---

## 1. วัตถุประสงค์ (Purpose)

เอกสารนี้กำหนดแนวทาง กฎเกณฑ์ เครื่องมือ และกระบวนการในการระบุ ควบคุม ติดตาม และบริหารจัดการรายการคอนฟิกูเรชัน (Configuration Items - CIs) ของโครงการ **Rabbit Workflow (RBWF)** ให้มีความเป็นระเบียบ ถูกต้อง ย้อนกลับได้ และเปลี่ยนแปลงได้เฉพาะผ่านขั้นตอนที่อนุมัติแล้วตลอดวงจรชีวิตซอฟต์แวร์

แผนนี้เป็น **Version Control Strategy** ของโครงการ ตาม ISO/IEC 29110 Basic Profile และใช้ประกอบการตรวจประเมินในหัวข้อ Software Configuration and QA

---

## 2. ขอบเขต SCM ตาม ISO/IEC 29110

SCM ของโครงการนี้ครอบคลุมงานต่อไปนี้ในแต่ละระยะ:

| ระยะโครงการ | สิ่งที่ต้องปฏิบัติ |
|---|---|
| Project Initiation and Planning | กำหนดกลยุทธ์ควบคุมเวอร์ชัน และกลไก Backup / Recovery ทำ baseline ข้อตกลง (SOW) และแผนโครงการ (PMP) |
| Project Plan Execution | ใช้กลยุทธ์ควบคุมเวอร์ชันจริง สร้าง baseline ตามที่กำหนด และสำรองข้อมูลตามรอบ |
| Project Assessment and Control | ประเมินคำขอเปลี่ยนแปลง (CR) ด้านต้นทุน เวลา และผลกระทบทางเทคนิคก่อนอนุมัติ |
| Software Implementation | ทำ baseline ข้อกำหนด (SRS) การออกแบบ (SDD) กรณีทดสอบ (TP) และส่วนประกอบซอฟต์แวร์ (SWC) |
| Product Assembly and Closure | ประกอบงานเป็นชุดส่งมอบที่ผ่าน baseline เก็บหลักฐานการรับมอบในคลังโครงการ |

สี่รายการหลักที่ผู้ตรวจประเมินจะขอดูเสมอ:
1. คลังโครงการที่มีการควบคุมเวอร์ชันและ baseline (WP.11) พร้อมหลักฐาน Backup (WP.12)
2. บันทึกการติดตามความต้องการ (WP.21 / RTM)
3. บันทึกการทวนสอบ (WP.23 / VER)
4. บันทึกการตรวจสอบความถูกต้อง (WP.22 / VLD)

---

## 3. บทบาทและความรับผิดชอบ (CM Roles)

| บทบาท SCM | ผู้รับผิดชอบในโครงการ RBWF | ความรับผิดชอบ |
|---|---|---|
| Configuration Manager | นายวีระ เนียมโภคะ (TL, AN) | กำหนดขั้นตอนการระบุ CI การตั้งชื่อ การทำ baseline และการจัดเก็บในคลังโครงการ |
| Configuration Control Board (CCB) | นางสาวปวริศา จันทรสถาพร (PM), นายวีระ เนียมโภคะ (TL, AN), นายทิโนภาส อรไทวรรณ (ผู้มีอำนาจลงนามฝั่งลูกค้า) | พิจารณาอนุมัติหรือปฏิเสธการเปลี่ยนแปลงรายการที่ผ่าน baseline แล้ว |
| Developer | นายปริญญา พงษ์ดนตรี (DES, PR) | พัฒนาตาม CR ที่อนุมัติ ควบคุมเวอร์ชันซอร์สโค้ด และจัดทำ Backup ประจำเดือน |
| Auditor / Reviewer | นางสาวปวริศา จันทรสถาพร (PM) และ นายประกาศิต ทองนอก (TESTER) ตามงานที่มอบหมาย | ทบทวนความครบถ้วนของ baseline ผ่านเอกสาร VER / VLD และผลการทดสอบ |

โครงการขนาดเล็กนี้ไม่ตั้งคณะกรรมการ CCB แยกหน่วยงาน ใช้บทบาทที่มีอยู่ทำหน้าที่ CCB ในขั้นตอนอนุมัติ CR

---

## 4. การระบุรายการคอนฟิกูเรชัน (Configuration Identification)

รายการที่ต้องติดตามและควบคุมการเปลี่ยนแปลงถือเป็น Configuration Item (CI) การแก้ไข CI ที่ผ่าน baseline แล้วต้องผ่านขั้นตอนในข้อ 9

| รหัส CI | รายการ | ที่เก็บ | เจ้าของ | เมื่อเข้า Baseline |
|---|---|---|---|---|
| CI-SRC | Source Code (Go API `api/`, Svelte Frontend `frontend/`, `docker-compose.yml`) | Source Code Repository | DES, PR | เมื่อผ่านการทดสอบ UAT และแท็ก release |
| CI-DB | Database Schema และ Migration Files | Source Code Repository | DES, PR | พร้อมชุดส่งมอบซอฟต์แวร์ |
| CI-ENV | Dockerfiles, Nginx Config, `.env.example` | Source Code Repository | DES, PR | พร้อมชุดส่งมอบซอฟต์แวร์ |
| CI-SOW | Statement of Work | `BASELINE/RBWF_SOW_v1_0.md` | PM | หลังอนุมัติ SOW |
| CI-PMP | Project Plan และเอกสารต้นทุน (PMPC) | `BASELINE/RBWF_PMP_v1_0.md`, `RBWF_PMPC_v1_0.md` | PM | หลังอนุมัติแผนโครงการ |
| CI-SRS | Software Requirements Specification | `BASELINE/RBWF_SRS_v1_0.md` | AN, TL | หลังทวนสอบและตรวจสอบกับลูกค้า |
| CI-SDD | Software Design Description | `BASELINE/RBWF_SDD_v1_0.md` | DES, PR | หลังทวนสอบการออกแบบ |
| CI-SWC | Software Components | `BASELINE/RBWF_SWC_v1_0.md` | DES, PR | หลังประกอบส่วนประกอบซอฟต์แวร์ |
| CI-IE | Implementation Environment | `BASELINE/RBWF_IE_v1_0.md` | DES, PR | หลังอนุมัติสภาพแวดล้อมพัฒนา |
| CI-SCM | Software Configuration Management Plan | `BASELINE/RBWF_SCM_v1_0.md` | AN, TL | หลังอนุมัติแผน SCM |
| CI-TP | Test Cases and Test Procedures | `BASELINE/RBWF_TP_v1_0.md` | TESTER | หลังทวนสอบกรณีทดสอบ |
| CI-TR | Test Report | `BASELINE/RBWF_TR_v1_0.md` | TESTER | หลังสรุปผลการทดสอบ |
| CI-UAT | User Acceptance Test / Acceptance Record | `BASELINE/RBWF_UAT_v1_0.md` | PM | หลังลูกค้าลงนามรับผลการ UAT |
| CI-SUD | Software User Documentation | `BASELINE/RBWF_SUD_v1_0.md` | TESTER | หลังทวนสอบคู่มือผู้ใช้ |
| CI-POG | Product Operation Guide | `BASELINE/RBWF_POG_v1_0.md` | TESTER | หลังอนุมัติคู่มือผู้ดูแลระบบ |
| CI-MA | Maintenance Documentation | `BASELINE/RBWF_MA_v1_0.md` | PM | หลังอนุมัติเอกสารบำรุงรักษา |
| CI-RTM | Requirements Traceability Matrix | `BASELINE/RBWF_RTM_v1_0.md` | AN, TL | หลังอัปเดตความเชื่อมโยงครบถ้วน |
| CI-CR | Change Request | `BASELINE/RBWF_CR.md`, `BASELINE/RBWF_CR/` | AN | เมื่ออนุมัติและปิดรายการเปลี่ยนแปลง |
| CI-CRR | Correction Register | `BASELINE/RBWF_CRR.md` | PM | เมื่อปิดรายการแก้ไขปัญหาและความเสี่ยง |
| CI-BK | Project Repository Backup | `BASELINE/RBWF_BK_v1_0.md`, [Google Drive](https://drive.google.com/drive/folders/18E0MSSXUGmgzW8v-OFUDRGwLmIJXBSPX?usp=sharing) | PR | เมื่อสำรองรายเดือนครบรอบ |
| CI-REC | ระเบียนโครงการ (MOM, PSR, VER, VLD) | `BASELINE/RBWF_MOM/`, `RBWF_PSR/`, `RBWF_VER/`, `RBWF_VLD/` | ตามบทบาท | เก็บในคลังโครงการเมื่อจัดทำเสร็จ (ไม่ต้องทำ baseline ซ้ำทุกฉบับ) |

---

## 5. คลังโครงการและสิทธิ์การเข้าถึง (Project Repository)

### 5.1 ที่เก็บหลัก

- **ซอร์สโค้ด**: [https://github.com/symphosoftworkflow/workflowv2.rabbittile.com](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com)
- **เอกสารงาน ISO/IEC 29110**: [https://github.com/symphosoftworkflow/ISO-IEC-29110-RBWF](https://github.com/symphosoftworkflow/ISO-IEC-29110-RBWF) โฟลเดอร์ `BASELINE/`
- **ดัชนีงานสำหรับผู้ตรวจ**: [`BASELINE/RBWF_ALL.md`](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_ALL)

### 5.2 เจ้าของเอกสารและสิทธิ์

เจ้าของเอกสารมีสิทธิ์ Full (สร้าง แก้ไข ย้ายเข้า baseline) คณะทำงานอื่นเข้าถึงแบบ Read Only ยกเว้นเมื่อได้รับมอบหมายให้ทบทวน

| ชื่อเอกสาร | ตำแหน่งเจ้าของ |
|---|---|
| Statement of Work (SOW) | PM |
| Project Plan (PMP), Project Plan Cost (PMPC) | PM |
| Meeting Record (MOM) | PM |
| Progress Status Record (PSR) | PM |
| Change Request (CR) — ทะเบียน `RBWF_CR.md` และแบบฟอร์มใน `RBWF_CR/` | AN |
| Correction Register (CRR) | PM |
| Project Repository Backup (BK) | PR |
| Acceptance Record / UAT | PM |
| Verification Results (VER) | TL |
| Software Configuration Management Plan (SCM) | AN |
| Validation Results (VLD) | AN |
| Software Requirements Specification (SRS) | AN |
| Software Design Description (SDD) | AN |
| Traceability Matrix (RTM) | AN |
| Software Components (SWC), Implementation Environment (IE) | PR |
| Test Cases and Test Procedures (TP) | TESTER |
| Test Report (TR) | TESTER |
| Software User Documentation (SUD), Product Operation Guide (POG) | TESTER |
| Maintenance Documentation (MA) | PM |

โฟลเดอร์ `BASELINE/` ถือเป็นพื้นที่เอกสารที่อนุมัติแล้ว การแก้ไขโดยตรงโดยไม่ผ่าน CR ไม่อนุญาต

---

## 6. การตั้งชื่อไฟล์ (Naming Convention)

ไฟล์เอกสารขึ้นต้นด้วยชื่อย่อโครงการ `RBWF` ตามด้วยประเภทเอกสาร และเวอร์ชัน

รูปแบบเอกสารหลัก:

`RBWF_<TYPE>_v<Major>_<Minor>.md`

ตัวอย่าง: `RBWF_PMP_v1_0.md`, `RBWF_SCM_v1_0.md`

รูปแบบระเบียนตามวันที่:

- MOM (Meeting Record):
  - ประชุมภายในทีม: `RBWF_MOM_INT_YYYYMMDD.md`
  - ประชุมร่วมลูกค้า (ภายนอก): `RBWF_MOM_EXT_YYYYMMDD.md`
- PSR: `RBWF_PSR_YYYYMMDD.md`
- CR (รายฉบับ): `RBWF_CR_YYYYMMDD.md`
- CR (ทะเบียนรวม): `RBWF_CR.md`
- CRR (Correction Register): `RBWF_CRR.md`
- BK (Project Repository Backup): `RBWF_BK_v1_0.md`
- VER: `RBWF_VER_<TYPE>_YYYYMMDD.md`
- VLD: `RBWF_VLD_YYYYMMDD.md`

ฉบับร่างก่อนอนุมัติใช้สถานะในประวัติเอกสาร (เช่น เวอร์ชัน 0.1) เมื่ออนุมัติแล้วจึงเป็น `v1_0` และเก็บใน `BASELINE/`

---

## 7. การระบุเวอร์ชัน (Version Identification)

### 7.1 เอกสาร

- ทุกเอกสารมีตารางประวัติการจัดทำเอกสาร ระบุเวอร์ชัน ผู้ดำเนินการ และวันที่
- `v0.1` = ฉบับร่าง, `v1.0` = ฉบับอนุมัติครั้งแรก
- การแก้ไขเล็กน้อยที่ไม่เปลี่ยนขอบเขตใช้เลขรอง เช่น `v1.1`
- การเปลี่ยนแปลงขอบเขตหรือโครงสร้างหลักใช้เลขหลัก เช่น `v2.0` และต้องมี CR ที่อนุมัติแล้ว

### 7.2 ซอร์สโค้ด

- ใช้ Git เป็นเครื่องมือควบคุมเวอร์ชัน
- ข้อความ commit อธิบายสิ่งที่เปลี่ยน
- แท็ก baseline ใช้ semantic versioning เช่น `v1.0.0-baseline`

### 7.3 สาขา (Branching Strategy)

- `main`: รหัสที่ผ่านการทดสอบ UAT แล้ว
- `develop`: การพัฒนาและบำรุงรักษาหลัก
- `feature/*`: ฟังก์ชันย่อยก่อนรวมเข้า `develop`

---

## 8. การทำ Baseline

Baseline คือข้อกำหนดหรือผลิตภัณฑ์ที่ผ่านการทบทวนและเห็นชอบโดยผู้มีหน้าที่รับผิดชอบแล้ว ใช้เป็นฐานของการทำงานขั้นต่อไป และจะเปลี่ยนได้เฉพาะผ่านขั้นตอนควบคุมการเปลี่ยนแปลง

หลักปฏิบัติของโครงการ RBWF:
1. งานจะเข้า baseline ได้เมื่อมีผู้จัดทำ ผู้ทบทวน และผู้มีอำนาจลงนามตามตารางลงนามของเอกสารนั้น
2. เอกสารที่ผ่าน baseline เก็บในโฟลเดอร์ `BASELINE/` ของคลังงาน ISO/IEC 29110
3. ซอร์สโค้ดที่ผ่าน baseline ใช้ Git tag และถ้าจำเป็นจัดทำ GitHub Release
4. การแก้ไขเอกสารหรือรหัสที่ผ่าน baseline แล้วต้องมี CR ที่อนุมัติ ห้ามแก้เงียบ
5. รายการ baseline บันทึกในตารางด้านล่าง และชี้จากดัชนี `RBWF_ALL.md`

| รายการ | เวอร์ชัน Baseline | วันที่อนุมัติ | ผู้อนุมัติ |
|---|---|---|---|
| SOW | v1.0 | 05 มกราคม พ.ศ. 2569 | TL / ลูกค้า |
| PMP | v1.0 | 20 มกราคม พ.ศ. 2569 | TL / ลูกค้า |
| SCM | v1.0 | 25 มกราคม พ.ศ. 2569 | PM / ลูกค้า |
| IE | v1.0 | 25 มกราคม พ.ศ. 2569 | PM / ลูกค้า |
| SRS | v1.0 | ตามเอกสาร SRS | PM / ลูกค้า |
| SDD | v1.0 | ตามเอกสาร SDD | TL / ลูกค้า |
| TP | v1.0 | ตามเอกสาร TP | TL / ลูกค้า |
| ซอฟต์แวร์ส่งมอบ | v1.0.0-baseline | หลัง UAT | PM / ลูกค้า |

---

## 9. การควบคุมการเปลี่ยนแปลง (Configuration Control)

การแก้ไข CI ที่ผ่าน baseline แล้วต้องดำเนินการตามลำดับ:

1. ยื่นคำขออนุมัติเปลี่ยนแปลง (Change Request - CR) ใน `BASELINE/RBWF_CR/`
2. วิเคราะห์ผลกระทบด้านขอบเขต ต้นทุน เวลา และเทคนิค โดย Team Lead / System Analyst
3. CCB พิจารณาอนุมัติหรือปฏิเสธ (PM, TL และผู้มีอำนาจลงนามฝั่งลูกค้าตามความจำเป็น)
4. ลงบันทึกสถานะในทะเบียนคำขอเปลี่ยนแปลง (`RBWF_CR.md`)
5. ผู้พัฒนาดำเนินการตามที่อนุมัติ แล้วอัปเดตเอกสารหรือซอร์สที่เกี่ยวข้องพร้อมเลขเวอร์ชันใหม่
6. ทวนสอบผล (VER) หรือตรวจสอบกับลูกค้า (VLD / UAT) ตามลักษณะการเปลี่ยนแปลง

หลักฐานที่ผู้ตรวจต้องการคือ **สายงาน CR หนึ่งรายการที่ตามได้ตลอด** ตั้งแต่คำขอ การวิเคราะห์ การอนุมัติ จนถึงผลในโค้ดหรือเอกสาร ไม่ใช่แบบฟอร์มจำนวนมากที่ไม่มีสายโยง

---

## 10. Configuration Status Accounting

สถานะของ CI ติดตามจากหลักฐานที่มีอยู่ในคลังโครงการ ไม่ใช้ระบบออกตั๋วแยกต่างหาก:

- **Git history / GitHub**: ประวัติการเปลี่ยนแปลงซอร์สโค้ดและเอกสาร markdown
- **ตารางประวัติในเอกสาร**: เวอร์ชัน ผู้ดำเนินการ วันที่ของแต่ละ work product
- **CR (`RBWF_CR.md`)**: สถานะคำขอเปลี่ยนแปลงที่เปิด อนุมัติ ปฏิเสธ หรือปิดแล้ว
- **CRR (`RBWF_CRR.md`)**: สถานะการแก้ไขปัญหาและความเสี่ยง
- **ดัชนี `RBWF_ALL.md`**: รายการเอกสาร baseline ที่ใช้นำเสนอและตรวจประเมิน
- **บันทึก Backup**: รอบการสำรองข้อมูลตามข้อ 12

---

## 11. Configuration Audit

โครงการใช้เอกสารทวนสอบและตรวจสอบความถูกต้องที่มีอยู่แล้วเป็นหลักฐานการตรวจคอนฟิกูเรชัน ระดับ VSE ไม่จัดทำแบบฟอร์ม FCA/PCA แยกชุด

| ประเภทการตรวจ | วัตถุประสงค์ | หลักฐานในโครงการ RBWF |
|---|---|---|
| Baseline Audit | ยืนยันว่าชุด baseline ใช้เวอร์ชันเอกสารและรหัสที่ถูกต้อง | โฟลเดอร์ `BASELINE/`, Git tag, ตารางในข้อ 8 |
| Functional Configuration Audit | ยืนยันว่างานตรงตามความต้องการที่อนุมัติ | RTM, VER ของ SRS/SDD/TP, ผลการทดสอบ TR/UAT |
| Physical Configuration Audit | ยืนยันว่าของที่ส่งมอบครบตามรายการ | SWC, SUD, POG, MA, คลังซอร์สโค้ดชุดส่งมอบ |

ผู้ทบทวนคือ Configuration Manager ร่วมกับ PM หรือ TESTER ตามงาน และลูกค้าลงนามใน VLD/UAT เมื่อเป็นการตรวจสอบความถูกต้องกับผู้ใช้

---

## 12. การสำรองข้อมูลและการกู้คืน (Backup & Recovery)

### 12.1 รายละเอียดการสำรองข้อมูล

- **ข้อมูลที่สำรอง**: ซอร์สโค้ด ฐานข้อมูล MySQL เอกสารงานในคลัง ISO/IEC 29110 และข้อมูลทดสอบที่เกี่ยวข้อง
- **เครื่องมือ**: Git/GitHub สำหรับซอร์สและเอกสาร markdown, Google Drive ของ**บริษัท LA-OR** พาธ `My Drive/BACKUP/RBWF_REPOSITORY_BACKUP` ([เปิดโฟลเดอร์](https://drive.google.com/drive/folders/18E0MSSXUGmgzW8v-OFUDRGwLmIJXBSPX?usp=sharing)) สำหรับสำเนารายเดือนระยะยาว ตามทะเบียน [RBWF_BK_v1_0](RBWF_BK_v1_0.md)
- **ความถี่**: สำรองทุกสิ้นเดือน (Monthly Backup)
- **ผู้รับผิดชอบ**: นายปริญญา พงษ์ดนตรี (PR)

### 12.2 แผนการกู้คืน

- กู้ซอร์สโค้ดจาก Git โดยดึงแท็กหรือคอมมิตที่เป็น baseline ล่าสุดที่อนุมัติ
- กู้เอกสารจากคลัง `ISO-IEC-29110-RBWF` และสำเนาใน Google Drive ของ**บริษัท LA-OR** พาธ `My Drive/BACKUP/RBWF_REPOSITORY_BACKUP` ([เปิดโฟลเดอร์](https://drive.google.com/drive/folders/18E0MSSXUGmgzW8v-OFUDRGwLmIJXBSPX?usp=sharing)) ของเดือนนั้น
- กู้ฐานข้อมูลจากไฟล์สำรองรายเดือนบน Google Drive ของบริษัท LA-OR พาธ `My Drive/BACKUP/RBWF_REPOSITORY_BACKUP` เดียวกัน
- ก่อนกู้คืนจริง ให้ทำสำเนาชั่วคราว (Temporary Backup) ของสภาพปัจจุบันเพื่อลดความผิดพลาด
- ทดสอบการกู้คืนอย่างน้อยปีละครั้ง หรือเมื่อเปลี่ยนโครงสร้างคลัง/เซิร์ฟเวอร์

---

## 13. เครื่องมือที่ใช้สนับสนุน SCM

| หน้าที่ SCM | เครื่องมือของโครงการ RBWF |
|---|---|
| Version control | Git, GitHub |
| จัดเก็บเอกสาร baseline | GitHub repository `ISO-IEC-29110-RBWF` โฟลเดอร์ `BASELINE/` |
| ควบคุมการเปลี่ยนแปลง | แบบฟอร์ม CR ทะเบียน `RBWF_CR.md` และ Correction Register `RBWF_CRR.md` |
| สถานะและการตรวจ | ประวัติในเอกสาร, VER, VLD, RTM, `RBWF_ALL.md` |
| Backup ระยะยาว | Google Drive ของบริษัท LA-OR พาธ `My Drive/BACKUP/RBWF_REPOSITORY_BACKUP` ([เปิดโฟลเดอร์](https://drive.google.com/drive/folders/18E0MSSXUGmgzW8v-OFUDRGwLmIJXBSPX?usp=sharing)) (ผู้รับผิดชอบ PR) |

โครงการนี้ไม่ใช้ Jira หรือระบบออกตั๋วแยก ใช้สายงาน CR ในคลังเอกสารร่วมกับ Git เป็นหลักฐานการควบคุมการเปลี่ยนแปลง

---

## 14. ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้จัดทำ (Prepared By)** | **ผู้ทบทวน / สอบทาน (Reviewed By)** | **ผู้ว่าจ้าง / ลูกค้า (Customer Approver)** |
|---|---|---|
| <img src="../LOGO/signature_veera.png" alt="Signature TL" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_pawarisa.png" alt="Signature PM" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_tinophat.png" alt="Signature Customer" width="150"/><br/>________________________________________ |
| **(นายวีระ เนียมโภคะ)** | **(นางสาวปวริศา จันทรสถาพร)** | **(นายทิโนภาส อรไทวรรณ)** |
| หัวหน้าทีมวิเคราะห์ (TL, AN) | ผู้จัดการโครงการ (PM) | ผู้มีอำนาจลงนาม |
| โครงการ RABBIT WORKFLOW (RBWF) | โครงการ RABBIT WORKFLOW (RBWF) | **บริษัท ซิมโฟร์ซอฟท์ จำกัด** |
| วันที่: 20 มกราคม พ.ศ. 2569 | วันที่: 25 มกราคม พ.ศ. 2569 | วันที่: 25 มกราคม พ.ศ. 2569 |
