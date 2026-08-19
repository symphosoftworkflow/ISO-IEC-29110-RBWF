<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# เอกสารบำรุงรักษาซอฟต์แวร์ทางเทคนิค (MAINTENANCE DOCUMENTATION - MA)

เอกสารนี้สำหรับ**ทีมเทคนิค** (ติดตั้ง เฝ้าระวัง สำรอง กู้คืน) และกำหนด SLA หลังส่งมอบ ไม่ใช่คู่มือผู้ใช้ปลายทาง

**ชื่อระบบงาน[TH]**: ระบบบริหารงานธุรกิจจัดจำหน่ายวัสดุก่อสร้างและกระเบื้องครบวงจร  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  
**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นางสาวปวริศา จันทรสถาพร (PM)  
**วันที่อนุมัติเอกสาร**: 25 พฤษภาคม พ.ศ. 2569

---

## ประวัติการจัดทำเอกสาร

| ลำดับ | เวอร์ชัน | รายละเอียดการดำเนินการ | ผู้ดำเนินการ | วันที่ดำเนินการ |
|---|---|---|---|---|
| 1 | 0.1 | จัดทำร่างเอกสารบำรุงรักษาทางเทคนิค | นางสาวปวริศา จันทรสถาพร (PM) | 21 พฤษภาคม พ.ศ. 2569 |
| 2 | 1.0 | อนุมัติเอกสารบำรุงรักษาทางเทคนิค | นางษมาภรณ์ พงษ์ดนตรี (ผู้แทนลูกค้า) | 25 พฤษภาคม พ.ศ. 2569 |

---

## 1. ขอบเขตการบำรุงรักษา

ทีมผู้พัฒนาให้บริการบำรุงรักษา **Rabbit Workflow (RBWF)** แก่ **บริษัท ซิมโฟร์ซอฟท์ จำกัด** 12 เดือน นับจากวันถัดจากปิดโครงการ

1. **Corrective**: แก้ข้อผิดพลาดจากการใช้งานปกติ
2. **Adaptive**: รองรับการอัปเดต OS และเบราว์เซอร์
3. **Preventive**: ตรวจฐานข้อมูล แคช และ Security Patch ประจำเดือน

ไม่มี Payment Gateway หรือ Mapping API ในขอบเขตระบบ

---

## 2. สภาพแวดล้อมทางเทคนิค

อ้างอิง [RBWF_IE_v1_0](RBWF_IE_v1_0.md)

- Production: Ubuntu 22.04 LTS, 4 vCPU, RAM 8 GB, NVMe 160 GB
- Docker 26+ / Docker Compose v2.26+, Nginx HTTPS, MySQL 8.0, Redis 7.2, Go 1.22+, Svelte
- ซอร์ส: [github.com/symphosoftworkflow/workflowv2.rabbittile.com](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com)
- สาขา: `main` = Production, `staging` = ทดสอบ, `feature/*` = พัฒนา

บริการหลัก: `rbwf-api` (8080), `rbwf-frontend` (3000), `rbwf-mysql` (3306), `rbwf-redis` (6379), `rbwf-nginx` (80/443)

---

## 3. การเริ่มต้นและหยุดบริการ

```bash
git clone git@github.com:symphosoftworkflow/workflowv2.rabbittile.com.git
cd workflowv2.rabbittile.com
docker compose down
docker compose up --build -d
docker compose ps
docker compose logs -f rbwf-api
```

รีเซ็ตรหัสผ่านผู้ดูแลทำบนเซิร์ฟเวอร์โดยทีมเทคนิคเท่านั้น ห้ามเก็บ Production secrets ในคลังเอกสาร

---

## 4. สำรองข้อมูลและกู้คืน

- **รายวัน**: `mysqldump` ผ่าน Cron เวลา 01:00 น. เก็บ `.sql.gz` ย้อนหลัง 30 วัน
- **รายเดือน**: สำเนาคลังโครงการและ dump ตาม [RBWF_BK_v1_0](RBWF_BK_v1_0.md) ที่ [โฟลเดอร์ Google Drive](https://drive.google.com/drive/folders/18E0MSSXUGmgzW8v-OFUDRGwLmIJXBSPX?usp=sharing)
- **กู้คืน**: ต้องทำให้เสร็จภายใน 1 ชั่วโมง (REQ-NFR-04) การทดสอบ Restore ISS-010 วันที่ 25 พฤษภาคม พ.ศ. 2569 ผ่านเกณฑ์แล้ว ไม่สร้างโฟลเดอร์สำรองใหม่จากการทดสอบ
- **Preventive**: `OPTIMIZE TABLE` และตรวจ index ทุกวันอาทิตย์สัปดาห์ที่ 2 ของเดือน ตรวจ disk/memory และ log rotation ทุกสัปดาห์

---

## 5. เหตุการณ์ขัดข้อง (Incident)

1. บันทึก Helpdesk ภายใน 1 ชั่วโมง
2. วิเคราะห์สาเหตุจาก log (`docker compose logs`)
3. ทดสอบแพตช์บน Staging ก่อนขึ้น Production นอกชั่วโมงใช้งานสูง

---

## 6. SLA และระยะเวลารับประกัน

**ระยะเวลารับประกัน**: 01 มิถุนายน พ.ศ. 2569 – 31 พฤษภาคม พ.ศ. 2570

| ความรุนแรง | เวลาตอบรับ | เวลาแก้ไข |
|---|---|---|
| Critical (ระบบใช้ไม่ได้) | 1 ชั่วโมง | 8 ชั่วโมง |
| High (ฟังก์ชันหลักเสีย) | 2 ชั่วโมง | 24 ชั่วโมง |
| Medium/Low | 4 ชั่วโมง | 48 ชั่วโมง |

**ช่องทาง**: support@symphosoft.com วันจันทร์–ศุกร์ 08:30–17:30 น.

---

## 7. รายการส่งมอบและไม่ส่งมอบ

**ส่งมอบ**: ซอร์ส Go/Svelte, เอกสาร ISO/IEC 29110, สคริปต์ schema  
**ไม่ส่งมอบ**: Production secrets, workspace เฉพาะนักพัฒนา

---

## ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้จัดทำ (Prepared By)** | **ผู้ทบทวน (Reviewed By)** | **ผู้ว่าจ้าง / ลูกค้า (Customer Approver)** |
|---|---|---|
| <img src="../LOGO/signature_pawarisa.png" alt="Signature PM" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_veera.png" alt="Signature TL" width="150"/><br/>________________________________________ | <img src="../LOGO/nook.png" alt="Signature Customer" width="150"/><br/>________________________________________ |
| **(นางสาวปวริศา จันทรสถาพร)** | **(นายวีระ เนียมโภคะ)** | **(นางษมาภรณ์ พงษ์ดนตรี)** |
| ผู้จัดการโครงการ (PM) | หัวหน้าทีมวิเคราะห์ (TL) | ผู้มีอำนาจลงนาม |
| โครงการ RABBIT WORKFLOW (RBWF) | โครงการ RABBIT WORKFLOW (RBWF) | **บริษัท ซิมโฟร์ซอฟท์ จำกัด** |
| วันที่: 25 พฤษภาคม พ.ศ. 2569 | วันที่: 25 พฤษภาคม พ.ศ. 2569 | วันที่: 25 พฤษภาคม พ.ศ. 2569 |
