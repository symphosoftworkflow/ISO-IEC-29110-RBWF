<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# เอกสาร ส่วนประกอบซอฟต์แวร์ (SOFTWARE COMPONENTS DOCUMENT - SWC)

**ชื่อระบบงาน[TH]**: ระบบบริหารจัดการเวิร์กโฟลว์ สต็อกสินค้า และคำสั่งซื้อกระเบื้อง  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  
**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นายปริญญา พงษ์ดนตรี (DES, PR)  
**วันที่อนุมัติเอกสาร**: 25 มีนาคม พ.ศ. 2569  

---

## ประวัติการจัดทำเอกสาร

| ลำดับ | เวอร์ชัน | รายละเอียดการดำเนินการ | ผู้ดำเนินการ | วันที่ดำเนินการ |
|---|---|---|---|---|
| 1 | 0.1 | จัดทำดรรชนีและโครงสร้างส่วนประกอบซอฟต์แวร์ | นายปริญญา พงษ์ดนตรี (DES, PR) | 20 มีนาคม พ.ศ. 2569 |
| 2 | 1.0 | อนุมัติเอกสารส่วนประกอบซอฟต์แวร์ | นายวีระ เนียมโภคะ (TL, AN) | 25 มีนาคม พ.ศ. 2569 |

---

## 1. ดรรชนีซอร์สโค้ดและโมดูลซอฟต์แวร์ (Source Code Component Index)

ซอร์สโค้ดทั้งหมดของโครงการ **Rabbit Workflow (RBWF)** จัดเก็บอยู่ที่ Repository `git@github.com:symphosoftworkflow/workflowv2.rabbittile.com.git` โดยแบ่งส่วนประกอบดังนี้:

### 1.1 Backend API Components (Go Language - `api/`)

#### 1.1.1 Core API Entry & Configuration
- `api/main.go` - จุดเริ่มต้นการทำงานของ REST API Engine, Router Routing และ Middleware Setup
- `api/go.mod` & `api/go.sum` - การจัดการ Go Dependencies
- `api/Dockerfile` - Docker Build Specification สำหรับ Go Backend
- `api/config/` - ค่าคอนฟิกูเรชันระบบและการเชื่อมต่อฐานข้อมูล
- `api/middleware/` - JWT Authentication และ RBAC Middleware

#### 1.1.2 API Business Handlers (`api/handlers/`)
- `auth.go` - ระบบล็อกอิน เข้าสู่ระบบ และยืนยันตัวตน JWT
- `stock.go` & `stock_adjust.go` & `stock_notify.go` - บริหารจัดการสต็อกและระบบแจ้งเตือนสินค้า
- `products.go` & `product_categories.go` - จัดการแคตตาล็อกสินค้ากระเบื้อง
- `quotations.go` & `quotation_pdf.go` & `quotation_profit.go` - ออกใบเสนอราคา คำนวณกำไร และสร้าง PDF
- `rfq.go` & `rfq_notify.go` - จัดการคำขอใบเสนอราคา
- `po_v2.go` & `po_pdf.go` & `po_receipts.go` & `po_payments.go` - จัดการใบสั่งซื้อ รับสินค้า และชำระเงิน PO
- `worker_jobs.go` & `worker_assign.go` & `workers.go` - บริหารงานช่างและการมอบหมายงาน
- `dn_prepare_queue.go` & `delivery_pdf.go` & `dn_job_photos.go` - คิวการจัดส่งและออก Delivery Note PDF
- `cash_ledger.go` & `expenses.go` & `reimbursements.go` & `salary.go` - ระบบการเงินและบัญชีเงินสด
- `users.go` & `rbac.go` & `registered_users.go` - บริหารผู้ใช้งานและสิทธิ์
- `ws.go` - WebSocket Server สำหรับการสื่อสารสถานะคิวงานเรียลไทม์

---

### 1.2 Frontend Web App Components (Vite + Svelte - `frontend/`)

#### 1.2.1 Core App Setup
- `frontend/src/App.svelte` - Root Component & Router Routing Table
- `frontend/src/main.js` - Svelte Application Mount Entrypoint
- `frontend/vite.config.js` - Vite Build Configuration
- `frontend/package.json` - Node.js Dependency Index

#### 1.2.2 User Interface Pages (`frontend/src/pages/`)
- `StockManagement.svelte` & `EdgingManagement.svelte` - หน้าจัดการสต็อกและการแปรรูปกระเบื้อง
- `QuotationManagement.svelte` & `RFQPage.svelte` - หน้าออกใบเสนอราคาและจัดการ RFQ
- `PurchaseOrdersPage.svelte` & `SuppliersPage.svelte` - หน้าจัดการใบสั่งซื้อและผู้จัดจำหน่าย
- `WorkerJobsPage.svelte` & `WorkerManagement.svelte` - หน้าจัดการงานช่าง
- `QueueDisplayPage.svelte` & `DNPublicView.svelte` - หน้าแสดงผลคิวงานเตรียมสินค้าและ DN
- `CashManagementPage.svelte` & `ExpensesPage.svelte` - หน้าสมุดบัญชีเงินสดและค่าใช้จ่าย
- `SalaryPage.svelte` & `ReimbursementsPage.svelte` - หน้าการจ่ายเงินเดือนและเบิกจ่าย
- `UserManagement.svelte` & `RoleManagement.svelte` - หน้าจัดการผู้ใช้งานและสิทธิ์ RBAC
- `ReportsPage.svelte` & `ShowcasePage.svelte` - หน้าสรุปรายงานและโชว์รูมสินค้า

---

## 2. โครงสร้างคอนเทนเนอร์และ Docker Environment (`docker-compose.yml`)

- **`rbwf-api`**: Container รัน Go Backend REST API Services
- **`rbwf-frontend`**: Container รัน Svelte Frontend Web App
- **`rbwf-mysql`**: Database Container รัน MySQL 8.0 Engine
- **`rbwf-nginx`**: Reverse Proxy Container กระจาย Traffic Port 80/443

---

## 3. ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้จัดทำ (Prepared By)** | **ผู้ทบทวน / สอบทาน (Reviewed By)** | **ผู้ว่าจ้าง / ลูกค้า (Customer Approver)** |
|---|---|---|
| <img src="../LOGO/signature_parinya.png" alt="Signature PR" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_veera.png" alt="Signature TL" width="150"/><br/>________________________________________ | <img src="../LOGO/nook.png" alt="Signature Customer" width="150"/><br/>________________________________________ |
| **(นายปริญญา พงษ์ดนตรี)** | **(นายวีระ เนียมโภคะ)** | **(นางษมาภรณ์ พงษ์ดนตรี)** |
| ผู้ออกแบบและพัฒนา (DES, PR) | หัวหน้าทีมวิเคราะห์ (TL, AN) | ผู้มีอำนาจลงนาม |
| โครงการ RABBIT WORKFLOW (RBWF) | โครงการ RABBIT WORKFLOW (RBWF) | **บริษัท ซิมโฟร์ซอฟท์ จำกัด** |
| วันที่: 25 มีนาคม พ.ศ. 2569 | วันที่: 25 มีนาคม พ.ศ. 2569 | วันที่: 25 มีนาคม พ.ศ. 2569 |
