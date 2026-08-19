<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# เอกสาร การออกแบบระบบ (SOFTWARE DESIGN DOCUMENT - SDD)

**ชื่อระบบงาน[TH]**: ระบบบริหารงานธุรกิจจัดจำหน่ายวัสดุก่อสร้างและกระเบื้องครบวงจร  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  
**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นายปริญญา พงษ์ดนตรี (DES, PR) / นายวีระ เนียมโภคะ (TL, AN)  
**วันที่อนุมัติเอกสาร**: 10 มีนาคม พ.ศ. 2569  

---

## ประวัติการจัดทำเอกสาร

| ลำดับ | เวอร์ชัน | รายละเอียดการดำเนินการ | ผู้ดำเนินการ | วันที่ดำเนินการ |
|---|---|---|---|---|
| 1 | 0.1 | ร่างเอกสารการออกแบบระบบและฐานข้อมูล | นายปริญญา พงษ์ดนตรี (DES, PR) | 01 มีนาคม พ.ศ. 2569 |
| 2 | 1.0 | อนุมัติเอกสารการออกแบบระบบ | นายวีระ เนียมโภคะ (TL, AN) | 10 มีนาคม พ.ศ. 2569 |

---

## สารบัญ

1. [ภาพรวมการออกแบบระบบ (System Design Overview)](#1-ภาพรวมการออกแบบระบบ)  
2. [สถาปัตยกรรมระบบ (System Architecture & Technology Stack)](#2-สถาปัตยกรรมระบบ)  
3. [การออกแบบฐานข้อมูล (Database Schema Design)](#3-การออกแบบฐานข้อมูล)  
4. [การออกแบบส่วนติดต่อโปรแกรมประยุกต์ (REST API Design)](#4-การออกแบบส่วนติดต่อโปรแกรมประยุกต์)  
5. [แผนภาพระบบ (System Diagrams)](#5-แผนภาพระบบ)  

---

## 1. ภาพรวมการออกแบบระบบ (System Design Overview)

**Rabbit Workflow (RBWF)** ถูกออกแบบให้เป็นระบบบริหารจัดการองค์กรแบบรวมศูนย์ (Modular Monolith Web Architecture) เพื่อรองรับการทำงานของพนักงานขาย ช่างตัดกระเบื้อง ฝ่ายจัดซื้อ ฝ่ายคลังสินค้า ฝ่ายการเงิน และผู้บริหารได้อย่างรวดเร็วและปลอดภัย

---

## 2. สถาปัตยกรรมระบบ (System Architecture & Technology Stack)

```
[ Web Browser / Svelte Single Page App ]
                  │
                  ▼ (HTTP REST / WebSocket)
[ Nginx Reverse Proxy (Port 80/443) ]
                  │
                  ▼
[ Go REST API Backend Server (Port 8080) ]
       │          │           │
       ▼          ▼           ▼
[ MySQL DB ] [ File Storage ] [ WebSocket Hub ]
 (Port 3306)  (PDF / Photos)  (Realtime Queue)
```

- **Frontend Tier**: Vite + Svelte (Single Page Application, Tailwind CSS, Svelte Store)
- **Backend Tier**: Go (Golang) RESTful API Engine, Fiber/Chi HTTP Router, JWT Middleware
- **Database Tier**: MySQL 8.0 Engine (InnoDB, UTF8MB4)
- **Deployment**: Docker Containerization & Docker Compose

---

## 3. การออกแบบฐานข้อมูล (Database Schema Design)

### 3.1 ตารางระบบผู้ใช้งานและสิทธิ์ (Users & RBAC)
- `users` (id, username, password_hash, full_name, email, role_id, created_at)
- `roles` (id, role_name, description, permissions_json)
- `permissions` (id, code, module_name, description)

### 3.2 ตารางสินค้าและสต็อก (Products & Stock)
- `products` (id, code, name, category_id, size, grade, price, alert_level)
- `product_categories` (id, name, description)
- `stock` (id, product_id, warehouse_id, quantity, updated_at)
- `stock_adjustments` (id, product_id, adjust_type, qty_change, reason, created_by)

### 3.3 ตารางงานขาย คำสั่งซื้อ และซัพพลายเออร์ (RFQ, Quotations & PO)
- `rfq` (id, rfq_number, customer_name, status, created_at)
- `quotations` (id, quote_number, customer_name, total_amount, profit_margin, status, pdf_path)
- `purchase_orders` (id, po_number, supplier_id, total_price, payment_status, pdf_path)
- `po_receipts` (id, po_id, receipt_number, received_date, photo_urls)

### 3.4 ตารางงานช่าง การส่งสินค้า และการเงิน (Workers, Delivery & Finance)
- `workers` (id, name, skill, phone, status)
- `worker_jobs` (id, job_number, worker_id, product_id, qty, status, photo_path)
- `delivery_notes` (id, dn_number, customer_name, address, status, pdf_path)
- `expenses` (id, title, category, amount, date, receipt_photo)
- `cash_ledger` (id, transaction_type, amount, balance_after, note, date)

---

## 4. การออกแบบส่วนติดต่อโปรแกรมประยุกต์ (REST API Design)

| Category | Endpoint | Method | Description |
|---|---|---|---|
| **Auth** | `/api/v1/auth/login` | `POST` | เข้าสู่ระบบและรับ JWT Token |
| **Stock** | `/api/v1/stock` | `GET/POST` | สอบถามและอัปเดตสต็อกสินค้า |
| **Quotation** | `/api/v1/quotations` | `GET/POST` | สร้างและค้นหาใบเสนอราคา |
| **PO** | `/api/v1/po` | `GET/POST` | สร้างและติดตามใบสั่งซื้อ |
| **Worker Jobs** | `/api/v1/worker-jobs` | `GET/POST` | มอบหมายและอัปเดตงานช่าง |
| **Queue** | `/api/v1/ws/queue` | `GET` | WebSocket สื่อสารสถานะคิวงานเรียลไทม์ |
| **Cash Ledger** | `/api/v1/cash-ledger` | `GET/POST` | บันทึกรับ-จ่ายสมุดบัญชีเงินสด |

---

## 5. แผนภาพประกอบ (System Diagrams)

### 5.1 Deployment Diagram
- **Node 1**: Docker Container `rbwf-nginx` Handling Port 80 / SSL Termination
- **Node 2**: Docker Container `rbwf-frontend` Serving Web Assets
- **Node 3**: Docker Container `rbwf-api` Running Go Compiled Binary
- **Node 4**: Docker Container `rbwf-mysql` Managing Relational Database

---

## 6. ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้จัดทำ (Prepared By)** | **ผู้ทบทวน / สอบทาน (Reviewed By)** | **ผู้ว่าจ้าง / ลูกค้า (Customer Approver)** |
|---|---|---|
| <img src="../LOGO/signature_parinya.png" alt="Signature PR" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_veera.png" alt="Signature TL" width="150"/><br/>________________________________________ | <img src="../LOGO/nook.png" alt="Signature Customer" width="150"/><br/>________________________________________ |
| **(นายปริญญา พงษ์ดนตรี)** | **(นายวีระ เนียมโภคะ)** | **(นางษมาภรณ์ พงษ์ดนตรี)** |
| ผู้ออกแบบและพัฒนา (DES, PR) | หัวหน้าทีมวิเคราะห์ (TL, AN) | ผู้มีอำนาจลงนาม |
| โครงการ RABBIT WORKFLOW (RBWF) | โครงการ RABBIT WORKFLOW (RBWF) | **บริษัท ซิมโฟร์ซอฟท์ จำกัด** |
| วันที่: 10 มีนาคม พ.ศ. 2569 | วันที่: 10 มีนาคม พ.ศ. 2569 | วันที่: 10 มีนาคม พ.ศ. 2569 |
