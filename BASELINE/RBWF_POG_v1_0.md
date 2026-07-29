<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# คู่มือการปฏิบัติงานสำหรับผู้ดูแลระบบ (PRODUCT OPERATION GUIDE - POG)

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

## 1. วัตถุประสงค์ของการพัฒนาระบบ (Purpose)

**Rabbit Workflow (RBWF)** ถูกพัฒนาขึ้นเพื่อบริหารจัดการกระบวนการคลังสินค้ากระเบื้อง การตัดแปรรูปกระเบื้อง (Edging) การออกคำขอใบเสนอราคา (RFQ) ใบเสนอราคา (Quotation) ใบสั่งซื้อ (PO) คิวงานช่าง (Worker Jobs) คิวการจัดส่ง (Delivery Note - DN) และระบบบัญชีการเงินสด (Cash Ledger) ของ บริษัท แรบบิท ไทล์ จำกัด โดยมุ่งเน้นการทำงานแบบเรียลไทม์ผ่านเว็บแอปพลิเคชัน

---

## 2. เกณฑ์ในการใช้งานระบบ (Prerequisites)

- ผู้ดูแลระบบ (Administrator) ต้องมีสิทธิ์การเข้าถึงผ่านระบบ RBAC (Role-Based Access Control)
- การเชื่อมต่ออินเทอร์เน็ตความเร็วสูง และเว็บเบราว์เซอร์เวอร์ชันล่าสุด (Google Chrome, Microsoft Edge, Safari)
- บัญชีผู้ใช้ Administrator มีสิทธิ์สูงสุดในการสร้าง แก้ไข ปิดการใช้งานบัญชีผู้ใช้อื่น และเข้าถึงข้อมูลการเงิน

---

## 3. สภาพแวดล้อมที่ต้องการ (System Requirements)

- **Operating System**: Ubuntu Linux 22.04 LTS 64-bit (หรือ macOS / Debian)
- **Container Technology**: Docker 26.0+ และ Docker Compose v2.26+
- **Backend Runtime**: Go (Golang) v1.22+
- **Frontend Stack**: Node.js v20+, Vite + Svelte (หรือ SvelteKit)
- **Database & Cache**: MySQL 8.0 (UTF8MB4) & Redis 7.2 Cache
- **Minimum Hardware**: CPU 4 Cores, RAM 8 GB, NVMe SSD 160 GB

---

## 4. เครื่องมือและวัสดุสนับสนุนที่จำเป็น (Required Supporting Tools)

- **เครื่องสแกนบาร์โค้ด / QR Code Scanner**: รองรับ USB/Bluetooth สำหรับคลังสินค้า
- **จอแสดงผลทีวี (TV Display / Smart TV)**: สำหรับเปิดหน้าจอคิวงานเรียลไทม์ (`/queue-display`)
- **เครื่องพิมพ์เอกสาร (PDF Printer / Receipt Printer)**: สำหรับพิมพ์ใบเสนอราคา PO และใบส่งสินค้า

---

## 5. ข้อควรระวังด้านความปลอดภัย (Security Precautions)

1. **การรักษาความลับรหัสผ่าน**: ห้ามแชร์รหัสผ่านผู้ดูแลระบบ และต้องเปลี่ยนรหัสผ่านทุก 90 วัน
2. **การใช้งานโปรโตคอลความปลอดภัย**: ให้เข้าใช้งานระบบผ่านโปรโตคอล HTTPS (SSL/TLS 1.3) เท่านั้น
3. **การเข้าถึงระบบจากภายนอก**: หากเข้าใช้งานนอกเครือข่ายองค์กร ต้องผ่านระบบ VPN หรือ Cloudflare WAF Access

---

## 6. ขั้นตอนการเตรียมและการเริ่มต้นใช้งานระบบ (System Preparation & Startup)

### 6.1 การเริ่มต้นระบบผ่าน Docker Compose
```bash
# 1. สั่งปิดระบบบริการเดิม (ถ้ามี)
docker compose down --rmi local

# 2. สั่ง Build และเริ่มต้นคอนเทนเนอร์ในโหมด Background
docker compose up --build -d

# 3. ตรวจสอบสถานะการทำงานของคอนเทนเนอร์
docker compose ps
```

### 6.2 การบริการคอนเทนเนอร์หลักในระบบ
- **`rbwf-api`**: บริการ Go REST API Backend Port `8080`
- **`rbwf-frontend`**: บริการ Svelte Web App Port `3000`
- **`rbwf-mysql`**: บริการ MySQL Database Port `3306`
- **`rbwf-redis`**: บริการ Redis Cache Port `6379`
- **`rbwf-nginx`**: บริการ Nginx Reverse Proxy Port `80/443`

---

## 7. ขั้นตอนการทำงานของผู้ดูแลระบบ (Administrator Operation Steps)

### 7.1 การเข้าสู่ระบบ (System Login)
1. เปิดเว็บเบราว์เซอร์ไปที่ `https://workflowv2.rabbittile.com`
2. กรอก Username/Email และ Password จากนั้นคลิก **"เข้าสู่ระบบ"**

### 7.2 การจัดการคำร้องขอและคำสั่งซื้อ (Sales & RFQ Management)
1. ตรวจสอบรายการคำขอใบเสนอราคา (RFQ) ที่เข้ามาทางหน้า `/rfq`
2. อนุมัติใบเสนอราคา (Quotation) และเปิดใบสั่งซื้อ (PO) ทางเมนู `/quotations` และ `/purchase-orders`

### 7.3 การอัปเดตราคาและสูตรแปรรูปกระเบื้อง (Price & Edging Update)
1. ปรับปรุงราคาขายและตารางส่วนลดกระเบื้องประจำวันทางหน้า `/stock`
2. กำหนดสูตรการตัดขอบกระเบื้อง (Edging Recipe) ทางเมนู `/edging`

### 7.4 การจัดการผู้ใช้งานและสิทธิ์ในระบบ (User & Role Management)
1. เพิ่ม พานิช/พนักงานใหม่ หรือเปลี่ยนบทบาทสิทธิ์ (Role-Based Access Control) ทางเมนู `/users` และ `/roles`
2. ระงับการใช้งานบัญชีผู้ใช้เมื่อพนักงานพ้นสภาพ

### 7.5 การตรวจสอบสถานะและรายงานสรุป (Status Monitoring & Reports)
1. ตรวจสอบกระบวนการงานช่างและคิวจัดส่งเรียลไทม์ทางหน้าจอ `/queue-display` และ `/worker-jobs`
2. ตรวจสอบรายงานบัญชีเงินสดรับ-จ่าย และรายงานค่าใช้จ่ายองค์กรทางเมนู `/cash-management`

### 7.6 การจัดการปัญหาและการบำรุงรักษา (Maintenance & System Recovery)
- สำรองข้อมูลฐานข้อมูลประจำวันด้วยคำสั่ง `mysqldump`
- ตรวจสอบไฟล์ระบบบันทึก (System Logs) ผ่านคำสั่ง `docker compose logs -f rbwf-api`

---

## 8. คำถามที่พบบ่อย (FAQ)

- **Q1: หากลืมรหัสผ่าน Administrator ต้องทำอย่างไร?**  
  *A1*: สามารถใช้คำสั่ง Go CLI Command บนเซิร์ฟเวอร์เพื่อ Reset Admin Password หรือแจ้งทีม Helpdesk
- **Q2: หากหน้าจอคิวการจัดส่ง (`/queue-display`) หลุดการเชื่อมต่อเรียลไทม์?**  
  *A2*: ระบบมี Auto-reconnect WebSocket หากไม่เชื่อมต่ออัตโนมัติ ให้รีเฟรชหน้าจอ F5 บน Smart TV

---

## 9. แหล่งข้อมูลและความช่วยเหลือเพิ่มเติม (Additional Resources & Support)

- **คู่มือผู้ใช้งาน (SUD)**: `https://iso29110.la-or.co.th/BASELINE/RBWF_SUD_v1_0`
- **Helpdesk Email**: support@symphosoft.com
- **Hotline Support**: 02-XXX-XXXX (วันจันทร์ - ศุกร์ 08:30 - 17:30 น.)

---

## 10. การรับรองและความปลอดภัย (Security & Compliance)

ระบบได้รับการรับรองมาตรฐานการพัฒนาซอฟต์แวร์ **ISO/IEC 29110 (Basic Profile)** มีการเข้ารหัสข้อมูลลับด้วย bcrypt และสื่อสารข้อมูลผ่านโปรโตคอล HTTPS SSL/TLS 1.3

---

## 11. การรับประกันและการเปลี่ยนทดแทน (Warranty & Replacement)

ทีมผู้พัฒนาการรับประกันการดูแลซอฟต์แวร์เป็นระยะเวลา 12 เดือน นับจากวันส่งมอบงาน หากพบข้อผิดพลาดรุนแรงที่ทำให้ระบบไม่สามารถทำงานได้ ทีมผู้พัฒนาจะเข้าแก้ไขปัญหาภายใน 8 ชั่วโมง ตามข้อตกลง SLA ในเอกสาร MA

---

## 12. ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้จัดทำ (Prepared By)** | **ผู้ทบทวน / สอบทาน (Reviewed By)** | **ผู้ว่าจ้าง / ลูกค้า (Customer Approver)** |
|---|---|---|
| <img src="../LOGO/signature_prakasit.png" alt="Signature TESTER" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_pawarisa.png" alt="Signature PM" width="150"/><br/>________________________________________ | <img src="../LOGO/nook.png" alt="Signature Customer" width="150"/><br/>________________________________________ |
| **(นายประกาศิต ทองนอก)** | **(นางสาวปวริศา จันทรสถาพร)** | **(นางษมาภรณ์ พงษ์ดนตรี)** |
| ผู้จัดทำคู่มือ (TESTER) | ผู้จัดการโครงการ (PM) | ผู้มีอำนาจลงนาม |
| โครงการ RABBIT WORKFLOW (RBWF) | โครงการ RABBIT WORKFLOW (RBWF) | **บริษัท ซิมโฟร์ซอฟท์ จำกัด** |
| วันที่: 25 พฤษภาคม พ.ศ. 2569 | วันที่: 25 พฤษภาคม พ.ศ. 2569 | วันที่: 25 พฤษภาคม พ.ศ. 2569 |
