<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# เอกสาร ข้อตกลงและแผนการบำรุงรักษาซอฟต์แวร์ (MAINTENANCE AGREEMENT - MA)

**ชื่อระบบงาน[TH]**: ระบบบริหารงานธุรกิจจัดจำหน่ายวัสดุก่อสร้างและกระเบื้องครบวงจร  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  
**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นางสาวปวริศา จันทรสถาพร (PM)  
**วันที่อนุมัติเอกสาร**: 25 พฤษภาคม พ.ศ. 2569  

---

## ประวัติการจัดทำเอกสาร

| ลำดับ | เวอร์ชัน | รายละเอียดการดำเนินการ | ผู้ดำเนินการ | วันที่ดำเนินการ |
|---|---|---|---|---|
| 1 | 0.1 | จัดทำร่างข้อตกลงและแผนการบำรุงรักษา | นางสาวปวริศา จันทรสถาพร (PM) | 20 พฤษภาคม พ.ศ. 2569 |
| 2 | 1.0 | อนุมัติข้อตกลงและแผนการบำรุงรักษา | นางษมาภรณ์ พงษ์ดนตรี (ผู้แทนลูกค้า) | 25 พฤษภาคม พ.ศ. 2569 |

---

## 1. ขอบเขตการบำรุงรักษาระบบ (Scope of Maintenance)

ทีมผู้พัฒนาตกลงให้บริการบำรุงรักษาซอฟต์แวร์ **Rabbit Workflow (RBWF)** แก่ **บริษัท ซิมโฟร์ซอฟท์ จำกัด** เป็นระยะเวลา 1 ปี (12 เดือน) นับตั้งแต่วันที่รับมอบงาน โดยครอบคลุมประเภทงานบำรุงรักษาดังนี้:
1. **Corrective Maintenance**: แก้ไขข้อผิดพลาดของซอฟต์แวร์ (Bugs) ที่เกิดขึ้นจากการใช้งานปกติ
2. **Adaptive Maintenance**: ปรับปรุงการทำงานให้รองรับการอัปเดตระบบปฏิบัติการ OS และ Web Browser เวอร์ชันใหม่
3. **Preventive Maintenance**: ตรวจสอบความสมบูรณ์ของฐานข้อมูล ล้างไฟล์ Cache และตรวจสอบ Security Patch ประจำเดือน

---

## 2. การตั้งค่าและการกำหนดค่าระบบ (System Configuration Controls)

### 2.1 สภาพแวดล้อมระบบ Production (Production Environment Configuration)
- **Database Server**: MySQL 8.0 LTS (Port 3306) พร้อมการตั้งค่า Connection Pool Max=100
- **Cache Server**: Redis 7.2 (Port 6379) พร้อมการตั้งค่า Eviction Policy = volatile-lru
- **Web Application Server**: Nginx Reverse Proxy (Port 80/443 SSL TLS 1.3)

### 2.2 สภาพแวดล้อมการพัฒนาและทดสอบ (Development & Staging Configuration)
- **Development Environment**: Docker & Docker Compose จำลองสภาพแวดล้อมตรงกับ Production 100%
- **Version Control**: Git Branch `main` สำหรับ Production, `staging` สำหรับการทดสอบ UAT และ `feature/*` สำหรับการพัฒนาย่อย

---

## 3. การควบคุมรายการและทรัพย์สินซอฟต์แวร์ (Configuration Control & Non-deliverables)

### 3.1 รายการที่ส่งมอบ (Deliverable Items)
- ซอร์สโค้ดภาษา Go (Backend) และ Svelte (Frontend) บน GitHub Repository
- เอกสาร ISO/IEC 29110 Work Products ทั้ง 21 ฉบับ
- ไฟล์ฐานข้อมูลสคริปต์โครงสร้าง DB Schema (`.sql`)

### 3.2 รายการที่ไม่ต้องส่งมอบ (Non-deliverable Items)
- รหัสผ่านลับส่วนตัวของผู้ดูแลระบบ (Private Keys & Production Secrets)
- สภาพแวดล้อม Sandbox ส่วนบุคคลของนักพัฒนา (Local Scratch Workspace)

---

## 4. การบำรุงรักษาประจำและขั้นตอนการสำรองข้อมูล (Preventive Maintenance & Backup)

- **การบำรุงรักษาฐานข้อมูล MySQL**: ทำการ `OPTIMIZE TABLE` และตรวจสอบ Database Indexing ทุกวันอาทิตย์สัปดาห์ที่ 2 ของเดือน
- **การบำรุงรักษาเซิร์ฟเวอร์**: ตรวจสอบ Disk Space, Memory Usage และ Log Rotation ทุกสัปดาห์
- **การสำรองข้อมูลอัตโนมัติ**: สำรองฐานข้อมูลแบบอัตโนมัติด้วย Cron Job ทุกวัน เวลา 01:00 น. จัดเก็บไฟล์ย้อนหลัง 30 วัน

---

## 5. การบริหารจัดการเหตุการณ์และปัญหา (Incident Management & Root Cause Analysis)

เมื่อเกิดเหตุการณ์ระบบขัดข้อง ทีมงานจะดำเนินการตามขั้นตอน:
1. **การแจ้งเตือนและการระบุปัญหา (Incident Logging)**: บันทึกในระบบ Helpdesk ภายใน 1 ชั่วโมง
2. **การวิเคราะห์หาสาเหตุหลัก (Root Cause Analysis - RCA)**: ดำเนินการตรวจสอบ Log Traceback และแก้ไขที่ต้นเหตุ
3. **การทดสอบและการอัปเดต (Patch Deployment)**: ทดสอบแพตช์บน Staging Server ก่อนอัปเดตขึ้น Production ในช่วงเวลาที่มีการใช้งานต่ำ

---

## 6. ข้อตกลงระดับการให้บริการ (Service Level Agreement - SLA) และระยะเวลารับประกัน (Warranty Period)

- **ระยะเวลารับประกัน (Warranty Period)**: 12 เดือน นับจากวันส่งมอบงานสำเร็จ (01 มิถุนายน 2569 - 31 พฤษภาคม 2570)

| ความรุนแรงของปัญหา (Severity) | เวลาในการตอบรับ (Response Time) | เวลาในการแก้ไข (Resolution Time) |
|---|---|---|
| **Critical (ระบบล่ม ไม่สามารถทำงานได้)** | ภายใน 1 ชั่วโมง | ภายใน 8 ชั่วโมง |
| **High (ฟังก์ชันหลักมีปัญหา)** | ภายใน 2 ชั่วโมง | ภายใน 24 ชั่วโมง |
| **Medium/Low (ปัญหาย่อย/ข้อสอบถาม)** | ภายใน 4 ชั่วโมง | ภายใน 48 ชั่วโมง |

---

## 7. ช่องทางการติดต่อและรับแจ้งปัญหา (Helpdesk Channels)

- **Email Support**: support@symphosoft.com
- **Hotline Support**: 02-XXX-XXXX
- **เวลาทำการ**: วันจันทร์ - ศุกร์ (08:30 - 17:30 น.)

---

## 8. ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้จัดทำ (Prepared By)** | **ผู้ทบทวน / สอบทาน (Reviewed By)** | **ผู้ว่าจ้าง / ลูกค้า (Customer Approver)** |
|---|---|---|
| <img src="../LOGO/signature_pawarisa.png" alt="Signature PM" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_veera.png" alt="Signature TL" width="150"/><br/>________________________________________ | <img src="../LOGO/nook.png" alt="Signature Customer" width="150"/><br/>________________________________________ |
| **(นางสาวปวริศา จันทรสถาพร)** | **(นายวีระ เนียมโภคะ)** | **(นางษมาภรณ์ พงษ์ดนตรี)** |
| ผู้จัดการโครงการ (PM) | หัวหน้าทีมวิเคราะห์ (TL, AN) | ผู้มีอำนาจลงนาม |
| โครงการ RABBIT WORKFLOW (RBWF) | โครงการ RABBIT WORKFLOW (RBWF) | **บริษัท ซิมโฟร์ซอฟท์ จำกัด** |
| วันที่: 25 พฤษภาคม พ.ศ. 2569 | วันที่: 25 พฤษภาคม พ.ศ. 2569 | วันที่: 25 พฤษภาคม พ.ศ. 2569 |
