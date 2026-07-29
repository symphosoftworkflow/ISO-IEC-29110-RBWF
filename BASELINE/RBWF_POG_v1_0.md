<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# คู่มือการปฏิบัติงานสำหรับผู้ดูแลระบบ (Product Operation Guide - POG)

**ชื่อระบบงาน[TH]**: ระบบบริหารจัดการเวิร์กโฟลว์ สต็อกสินค้า และคำสั่งซื้อกระเบื้อง  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  
**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นายประกาศิต ทองนอก (TESTER)  
**วันที่อนุมัติเอกสาร**: 25 พฤษภาคม พ.ศ. 2569  

---

## ประวัติการจัดทำเอกสาร

| ลำดับ | เวอร์ชัน | รายละเอียดการดำเนินการ | ผู้ดำเนินการ | วันที่ดำเนินการ |
|---|---|---|---|---|
| 1 | 0.1 | ร่างคู่มือการปฏิบัติงานสำหรับผู้ดูแลระบบ | นายประกาศิต ทองนอก (TESTER) | 20 พฤษภาคม พ.ศ. 2569 |
| 2 | 1.0 | อนุมัติคู่มือการปฏิบัติงานสำหรับผู้ดูแลระบบ | นางสาวปวริศา จันทรสถาพร (PM) | 25 พฤษภาคม พ.ศ. 2569 |

---

## 1. วัตถุประสงค์และการใช้งานระบบ

**Rabbit Workflow (RBWF)** ถูกพัฒนาขึ้นเพื่อบริหารจัดการกระบวนการคลังสินค้ากระเบื้อง การตัดแปรรูปกระเบื้อง (Edging) การออกคำขอใบเสนอราคา (RFQ) ใบเสนอราคา (Quotation) ใบสั่งซื้อ (PO) คิวงานช่าง (Worker Jobs) คิวการจัดส่ง (Delivery Note - DN) และระบบบัญชีการเงินสด (Cash Ledger) ของ บริษัท แรบบิท ไทล์ จำกัด

---

## 2. สภาพแวดล้อมระบบที่ต้องการ (System Requirements)

- **Operating System**: Linux (Ubuntu 22.04 LTS recommended) หรือ macOS
- **Containerization**: Docker v24+ และ Docker Compose v2+
- **Backend Runtime**: Go (Golang) v1.22+
- **Frontend Stack**: Node.js v20+, Vite + Svelte (หรือ React), Nginx Reverse Proxy
- **Database Server**: MySQL 8.0 (UTF8MB4 charset)
- **Minimum Hardware**: CPU 4 Cores, RAM 8 GB, Storage 100 GB SSD

---

## 3. ขั้นตอนการติดตั้งและเริ่มต้นใช้งานระบบ (Installation & Startup)

### 3.1 การเริ่มต้นระบบผ่าน Docker Compose
```bash
# สั่งปิดระบบบริการเดิม (ถ้ามี)
docker compose down --rmi local

# สั่ง Build และเริ่มต้นคอนเทนเนอร์ในโหมด Background
docker compose up --build -d

# ตรวจสอบสถานะการทำงานของคอนเทนเนอร์
docker compose ps
```

### 3.2 การบริการคอนเทนเนอร์ในระบบ
- **`rbwf-api`**: บริการ Go REST API Backend Port `8080`
- **`rbwf-frontend`**: บริการ Vite/Svelte Web App Port `3000`
- **`rbwf-mysql`**: บริการ MySQL Database Port `3306`
- **`rbwf-nginx`**: บริการ Nginx Reverse Proxy Port `80/443`

---

## 4. ขั้นตอนการดูแลระบบประจำวันสำหรับ Administrator

### 4.1 การจัดการสิทธิ์และผู้ใช้งาน (User & Role Management)
1. เข้าสู่ระบบด้วยสิทธิ์ Administrator ทางเมนู `/users` และ `/roles`
2. สร้างและจัดการสิทธิ์การเข้าถึงเมนู/API ตามโครงสร้าง Role-Based Access Control (RBAC)
3. ตรวจสอบการเปลี่ยนรหัสผ่านพนักงานและการเปิด/ปิดใช้งานบัญชีผู้ใช้

### 4.2 การตรวจสอบคลังสินค้าและสต็อก (Stock & Edging Operation)
1. เข้าสู่หน้าจอ `/stock` เพื่อตรวจสอบระดับสินค้าคงคลังและรายการเตือน Stock Alert
2. ตรวจสอบการตัดขอบกระเบื้องและการแปลงสภาพสินค้าผ่านเมนู `/edging`

### 4.3 การตรวจสอบระบบคิวจัดส่งและงานช่าง (Queue & Worker Jobs)
1. ตรวจสอบการทำงานเรียลไทม์ผ่าน WebSocket หน้าจอ `/queue-display` และ `/worker-jobs`
2. ตรวจสอบเอกสาร Delivery Note PDF และรายการใบสั่งซื้อ PO

---

## 5. การกู้คืนระบบและการสำรองข้อมูล (Backup & Recovery)

```bash
# คำสั่ง Backup ฐานข้อมูล MySQL แบบ Manual
docker exec rbwf-mysql mysqldump -u root -p'PASSWORD' rabbittile > backup_$(date +%Y%m%m).sql

# คำสั่ง Restore ฐานข้อมูล MySQL
docker exec -i rbwf-mysql mysql -u root -p'PASSWORD' rabbittile < backup_20260525.sql
```

---

## 6. ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้ว่าจ้าง / ลูกค้า** | **ผู้พัฒนาโครงการ** |
|---|---|
| <img src="../LOGO/nook.png" alt="Signature" width="180"/><br/>________________________________________ | <br/><br/>________________________________________ |
| **(นางษมาภรณ์ พงษ์ดนตรี)** | **(นางสาวปวริศา จันทรสถาพร)** |
| ผู้มีอำนาจลงนาม | ผู้จัดการโครงการ (PM) |
| **บริษัท ซิมโฟร์ซอฟท์ จำกัด** | โครงการ RABBIT WORKFLOW (RBWF) |
| วันที่: 25 พฤษภาคม พ.ศ. 2569 | วันที่: 25 พฤษภาคม พ.ศ. 2569 |
