<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# เอกสาร ส่วนประกอบซอฟต์แวร์ (SOFTWARE COMPONENTS DOCUMENT - SWC)

**ชื่อระบบงาน[TH]**: ระบบบริหารงานธุรกิจจัดจำหน่ายวัสดุก่อสร้างและกระเบื้องครบวงจร  
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

ซอร์สโค้ดทั้งหมดอยู่ที่ [https://github.com/symphosoftworkflow/workflowv2.rabbittile.com](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com)

วันที่ในตารางข้อ 1 สอดคล้องกับแผนโครงการ (PMP): พัฒนา 01/02/2026–15/04/2026 โดย PR จัดทำกรณีทดสอบตามเอกสาร TP 05/04/2026–15/04/2026 และทดสอบระบบ 16/04/2026–30/04/2026 โดย TESTER รหัสกรณีทดสอบตรงกับเอกสาร TP และ RTM

## 1. ตารางส่วนประกอบซอฟต์แวร์ (Software Components Schedule)

| Module Name | Coding | Assign To | Expected Date | Start Date | Finish Date | Test Cases | Assign To | Expected Date | Finish Date | Test | Assign To | Expected Date | Finish Date |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| [SC-STK-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/products.go` | REQ-STK-01 | นายปริญญา พงษ์ดนตรี (PR) | 07/02/2026 | 01/02/2026 | 07/02/2026 | TC-STK-01 | นายประกาศิต ทองนอก (TESTER) | 05/04/2026 | 05/04/2026 | TC-STK-01 | นายประกาศิต ทองนอก (TESTER) | 16/04/2026 | 17/04/2026 |
| [SC-STK-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/stock.go` | REQ-STK-02 | นายปริญญา พงษ์ดนตรี (PR) | 11/02/2026 | 08/02/2026 | 11/02/2026 | TC-STK-02 | นายประกาศิต ทองนอก (TESTER) | 05/04/2026 | 05/04/2026 | TC-STK-02 | นายประกาศิต ทองนอก (TESTER) | 16/04/2026 | 17/04/2026 |
| [SC-STK-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/stock_notify.go` | REQ-STK-04 | นายปริญญา พงษ์ดนตรี (PR) | 14/02/2026 | 12/02/2026 | 14/02/2026 | TC-STK-04 | นายประกาศิต ทองนอก (TESTER) | 05/04/2026 | 05/04/2026 | TC-STK-04 | นายประกาศิต ทองนอก (TESTER) | 16/04/2026 | 17/04/2026 |
| [SC-QTO-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/rfq.go` | REQ-QTO-01 | นายปริญญา พงษ์ดนตรี (PR) | 18/02/2026 | 15/02/2026 | 18/02/2026 | TC-QTO-01 | นายประกาศิต ทองนอก (TESTER) | 06/04/2026 | 06/04/2026 | TC-QTO-01 | นายประกาศิต ทองนอก (TESTER) | 18/04/2026 | 19/04/2026 |
| [SC-QTO-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/quotations.go` | REQ-QTO-02 | นายปริญญา พงษ์ดนตรี (PR) | 22/02/2026 | 19/02/2026 | 22/02/2026 | TC-QTO-02 | นายประกาศิต ทองนอก (TESTER) | 06/04/2026 | 06/04/2026 | TC-QTO-02 | นายประกาศิต ทองนอก (TESTER) | 18/04/2026 | 19/04/2026 |
| [SC-QTO-03](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `frontend/src/pages/QuotationManagement.svelte` | REQ-QTO-03 | นายปริญญา พงษ์ดนตรี (PR) | 25/02/2026 | 23/02/2026 | 25/02/2026 | TC-QTO-03 | นายประกาศิต ทองนอก (TESTER) | 06/04/2026 | 06/04/2026 | TC-QTO-03 | นายประกาศิต ทองนอก (TESTER) | 18/04/2026 | 19/04/2026 |
| [SC-QTO-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/quotation_profit.go` | REQ-QTO-04 | นายปริญญา พงษ์ดนตรี (PR) | 28/02/2026 | 26/02/2026 | 28/02/2026 | TC-QTO-04 | นายประกาศิต ทองนอก (TESTER) | 06/04/2026 | 06/04/2026 | TC-QTO-04 | นายประกาศิต ทองนอก (TESTER) | 18/04/2026 | 19/04/2026 |
| [SC-PO-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/po_v2.go` | REQ-PO-01 | นายปริญญา พงษ์ดนตรี (PR) | 04/03/2026 | 01/03/2026 | 04/03/2026 | TC-PO-01 | นายประกาศิต ทองนอก (TESTER) | 07/04/2026 | 07/04/2026 | TC-PO-01 | นายประกาศิต ทองนอก (TESTER) | 20/04/2026 | 21/04/2026 |
| [SC-PO-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/po_receipts.go` | REQ-PO-02 | นายปริญญา พงษ์ดนตรี (PR) | 08/03/2026 | 05/03/2026 | 08/03/2026 | TC-PO-02 | นายประกาศิต ทองนอก (TESTER) | 07/04/2026 | 07/04/2026 | TC-PO-02 | นายประกาศิต ทองนอก (TESTER) | 20/04/2026 | 21/04/2026 |
| [SC-PO-03](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/po_payments.go` | REQ-PO-03 | นายปริญญา พงษ์ดนตรี (PR) | 11/03/2026 | 09/03/2026 | 11/03/2026 | TC-PO-03 | นายประกาศิต ทองนอก (TESTER) | 07/04/2026 | 07/04/2026 | TC-PO-03 | นายประกาศิต ทองนอก (TESTER) | 20/04/2026 | 21/04/2026 |
| [SC-PO-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `frontend/src/pages/SuppliersPage.svelte` | REQ-PO-04 | นายปริญญา พงษ์ดนตรี (PR) | 14/03/2026 | 12/03/2026 | 14/03/2026 | TC-PO-04 | นายประกาศิต ทองนอก (TESTER) | 07/04/2026 | 07/04/2026 | TC-PO-04 | นายประกาศิต ทองนอก (TESTER) | 20/04/2026 | 21/04/2026 |
| [SC-WRK-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/worker_jobs.go` | REQ-WRK-01 | นายปริญญา พงษ์ดนตรี (PR) | 18/03/2026 | 15/03/2026 | 18/03/2026 | TC-WRK-01 | นายประกาศิต ทองนอก (TESTER) | 08/04/2026 | 08/04/2026 | TC-WRK-01 | นายประกาศิต ทองนอก (TESTER) | 22/04/2026 | 23/04/2026 |
| [SC-WRK-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/dn_job_photos.go` | REQ-WRK-02 | นายปริญญา พงษ์ดนตรี (PR) | 22/03/2026 | 19/03/2026 | 22/03/2026 | TC-WRK-02 | นายประกาศิต ทองนอก (TESTER) | 08/04/2026 | 08/04/2026 | TC-WRK-02 | นายประกาศิต ทองนอก (TESTER) | 22/04/2026 | 23/04/2026 |
| [SC-WRK-03](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/ws.go` | REQ-WRK-03 | นายปริญญา พงษ์ดนตรี (PR) | 26/03/2026 | 23/03/2026 | 26/03/2026 | TC-WRK-03 | นายประกาศิต ทองนอก (TESTER) | 08/04/2026 | 08/04/2026 | TC-WRK-03 | นายประกาศิต ทองนอก (TESTER) | 22/04/2026 | 23/04/2026 |
| [SC-WRK-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/delivery_pdf.go` | REQ-WRK-04 | นายปริญญา พงษ์ดนตรี (PR) | 31/03/2026 | 27/03/2026 | 31/03/2026 | TC-WRK-04 | นายประกาศิต ทองนอก (TESTER) | 08/04/2026 | 08/04/2026 | TC-WRK-04 | นายประกาศิต ทองนอก (TESTER) | 22/04/2026 | 23/04/2026 |
| [SC-FIN-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/cash_ledger.go` | REQ-FIN-01 | นายปริญญา พงษ์ดนตรี (PR) | 02/04/2026 | 01/04/2026 | 02/04/2026 | TC-FIN-01 | นายประกาศิต ทองนอก (TESTER) | 09/04/2026 | 09/04/2026 | TC-FIN-01 | นายประกาศิต ทองนอก (TESTER) | 24/04/2026 | 25/04/2026 |
| [SC-FIN-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/expenses.go` | REQ-FIN-02 | นายปริญญา พงษ์ดนตรี (PR) | 04/04/2026 | 03/04/2026 | 04/04/2026 | TC-FIN-02 | นายประกาศิต ทองนอก (TESTER) | 09/04/2026 | 09/04/2026 | TC-FIN-02 | นายประกาศิต ทองนอก (TESTER) | 24/04/2026 | 25/04/2026 |
| [SC-FIN-03](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/salary.go` | REQ-FIN-03 | นายปริญญา พงษ์ดนตรี (PR) | 06/04/2026 | 05/04/2026 | 06/04/2026 | TC-FIN-03 | นายประกาศิต ทองนอก (TESTER) | 09/04/2026 | 09/04/2026 | TC-FIN-03 | นายประกาศิต ทองนอก (TESTER) | 24/04/2026 | 25/04/2026 |
| [SC-FIN-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `frontend/src/pages/ReportsPage.svelte` | REQ-FIN-04 | นายปริญญา พงษ์ดนตรี (PR) | 08/04/2026 | 07/04/2026 | 08/04/2026 | TC-FIN-04 | นายประกาศิต ทองนอก (TESTER) | 09/04/2026 | 09/04/2026 | TC-FIN-04 | นายประกาศิต ทองนอก (TESTER) | 24/04/2026 | 25/04/2026 |
| [SC-SEC-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/auth.go` | REQ-SEC-01 | นายปริญญา พงษ์ดนตรี (PR) | 15/04/2026 | 09/04/2026 | 15/04/2026 | TC-SEC-01 | นายประกาศิต ทองนอก (TESTER) | 10/04/2026 | 10/04/2026 | TC-SEC-01 | นายประกาศิต ทองนอก (TESTER) | 26/04/2026 | 26/04/2026 |
| [SC-NFR-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `docker-compose.yml` | REQ-NFR-01 | นายปริญญา พงษ์ดนตรี (PR) | 15/04/2026 | 10/04/2026 | 15/04/2026 | TC-NFR-01 | นายประกาศิต ทองนอก (TESTER) | 12/04/2026 | 15/04/2026 | TC-NFR-01 | นายประกาศิต ทองนอก (TESTER) | 27/04/2026 | 28/04/2026 |
| [SC-NFR-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/` | REQ-NFR-02 | นายปริญญา พงษ์ดนตรี (PR) | 15/04/2026 | 10/04/2026 | 15/04/2026 | TC-NFR-02 | นายประกาศิต ทองนอก (TESTER) | 12/04/2026 | 15/04/2026 | TC-NFR-02 | นายประกาศิต ทองนอก (TESTER) | 27/04/2026 | 28/04/2026 |
| [SC-NFR-03](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/middleware/` | REQ-NFR-03 | นายปริญญา พงษ์ดนตรี (PR) | 15/04/2026 | 10/04/2026 | 15/04/2026 | TC-NFR-03 | นายประกาศิต ทองนอก (TESTER) | 12/04/2026 | 15/04/2026 | TC-NFR-03 | นายประกาศิต ทองนอก (TESTER) | 29/04/2026 | 29/04/2026 |
| [SC-NFR-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) | REQ-NFR-04 | นายปริญญา พงษ์ดนตรี (PR) | 15/04/2026 | 10/04/2026 | 15/04/2026 | TC-NFR-04 | นายประกาศิต ทองนอก (TESTER) | 12/04/2026 | 15/04/2026 | TC-NFR-04 | นายประกาศิต ทองนอก (TESTER) | 30/04/2026 | 30/04/2026 |

ไม่มีแถว **SC-STK-03** เพราะฟังก์ชัน Edging ถูกตัดออกจากขอบเขตแล้ว

---

## 2. ดรรชนีซอร์สโค้ดและโมดูลซอฟต์แวร์ (Source Code Component Index)

คลังซอร์ส: [https://github.com/symphosoftworkflow/workflowv2.rabbittile.com](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com)

### 2.1 Backend API Components (Go Language - `api/`)

#### 2.1.1 Core API Entry & Configuration
- [`api/main.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) - จุดเริ่มต้นการทำงานของ REST API Engine, Router Routing และ Middleware Setup
- [`api/go.mod`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `api/go.sum` - การจัดการ Go Dependencies
- [`api/Dockerfile`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) - Docker Build Specification สำหรับ Go Backend
- [`api/config/`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) - ค่าคอนฟิกูเรชันระบบและการเชื่อมต่อฐานข้อมูล
- [`api/middleware/`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) - JWT Authentication และ RBAC Middleware

#### 2.1.2 API Business Handlers (`api/handlers/`)
- [`auth.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) - ระบบล็อกอิน เข้าสู่ระบบ และยืนยันตัวตน JWT (SC-SEC-01)
- [`stock.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `stock_adjust.go` & `stock_notify.go` - บริหารจัดการสต็อกและระบบแจ้งเตือนสินค้า (SC-STK-01, SC-STK-02, SC-STK-04)
- [`products.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `product_categories.go` - จัดการแคตตาล็อกสินค้ากระเบื้อง (SC-STK-01)
- [`quotations.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `quotation_pdf.go` & `quotation_profit.go` - ออกใบเสนอราคา คำนวณกำไร และสร้าง PDF (SC-QTO-02, SC-QTO-03, SC-QTO-04)
- [`rfq.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `rfq_notify.go` - จัดการคำขอใบเสนอราคา (SC-QTO-01)
- [`po_v2.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `po_pdf.go` & `po_receipts.go` & `po_payments.go` - จัดการใบสั่งซื้อ รับสินค้า และชำระเงิน PO (SC-PO-01, SC-PO-02, SC-PO-03)
- [`worker_jobs.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `worker_assign.go` & `workers.go` - บริหารงานช่างและการมอบหมายงาน (SC-WRK-01)
- [`dn_prepare_queue.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `delivery_pdf.go` & `dn_job_photos.go` - คิวการจัดส่งและออก Delivery Note PDF (SC-WRK-02, SC-WRK-03, SC-WRK-04)
- [`cash_ledger.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `expenses.go` & `reimbursements.go` & `salary.go` - ระบบการเงินและบัญชีเงินสด (SC-FIN-01, SC-FIN-02, SC-FIN-03)
- [`users.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `rbac.go` & `registered_users.go` - บริหารผู้ใช้งานและสิทธิ์ (SC-SEC-01)
- [`ws.go`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) - WebSocket Server สำหรับการสื่อสารสถานะคิวงานเรียลไทม์ (SC-WRK-03)

### 2.2 Frontend Web App Components (Vite + Svelte - `frontend/`)

#### 2.2.1 Core App Setup
- [`frontend/src/App.svelte`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) - Root Component & Router Routing Table
- [`frontend/src/main.js`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) - Svelte Application Mount Entrypoint
- [`frontend/vite.config.js`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) - Vite Build Configuration
- [`frontend/package.json`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) - Node.js Dependency Index

#### 2.2.2 User Interface Pages (`frontend/src/pages/`)
- [`StockManagement.svelte`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) - หน้าจัดการสต็อกสินค้า (SC-STK-01, SC-STK-02)
- [`QuotationManagement.svelte`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `RFQPage.svelte` - หน้าออกใบเสนอราคาและจัดการ RFQ (SC-QTO-01, SC-QTO-02, SC-QTO-03)
- [`PurchaseOrdersPage.svelte`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `SuppliersPage.svelte` - หน้าจัดการใบสั่งซื้อและผู้จัดจำหน่าย (SC-PO-01, SC-PO-04)
- [`WorkerJobsPage.svelte`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `WorkerManagement.svelte` - หน้าจัดการงานช่าง (SC-WRK-01, SC-WRK-02)
- [`QueueDisplayPage.svelte`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `DNPublicView.svelte` - หน้าแสดงผลคิวงานเตรียมสินค้าและ DN (SC-WRK-03, SC-WRK-04)
- [`CashManagementPage.svelte`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `ExpensesPage.svelte` - หน้าสมุดบัญชีเงินสดและค่าใช้จ่าย (SC-FIN-01, SC-FIN-02)
- [`SalaryPage.svelte`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `ReimbursementsPage.svelte` - หน้าการจ่ายเงินเดือนและเบิกจ่าย (SC-FIN-02, SC-FIN-03)
- [`UserManagement.svelte`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `RoleManagement.svelte` - หน้าจัดการผู้ใช้งานและสิทธิ์ RBAC (SC-SEC-01)
- [`ReportsPage.svelte`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) & `ShowcasePage.svelte` - หน้าสรุปรายงานและโชว์รูมสินค้า (SC-FIN-04)

---

## 3. โครงสร้างคอนเทนเนอร์และ Docker Environment (`docker-compose.yml`)

ไฟล์ [`docker-compose.yml`](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) (SC-NFR-01)

- **`rbwf-api`**: Container รัน Go Backend REST API Services
- **`rbwf-frontend`**: Container รัน Svelte Frontend Web App
- **`rbwf-mysql`**: Database Container รัน MySQL 8.0 Engine
- **`rbwf-nginx`**: Reverse Proxy Container กระจาย Traffic Port 80/443

---

## 4. การอนุมัติภายในบริษัท (Internal Approval)

เอกสารนี้ใช้ภายในทีมพัฒนา ไม่มีลายเซ็นผู้ว่าจ้าง

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้จัดทำ (Prepared By)** | **ผู้ทบทวน / ผู้อนุมัติภายใน (Reviewed / Approved By)** |
|---|---|
| <img src="../LOGO/signature_parinya.png" alt="Signature PR" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_veera.png" alt="Signature TL" width="150"/><br/>________________________________________ |
| **(นายปริญญา พงษ์ดนตรี)** | **(นายวีระ เนียมโภคะ)** |
| ผู้ออกแบบและพัฒนา (DES, PR) | หัวหน้าทีมวิเคราะห์ (TL, AN) |
| โครงการ RABBIT WORKFLOW (RBWF) | โครงการ RABBIT WORKFLOW (RBWF) |
| วันที่: 25 มีนาคม พ.ศ. 2569 | วันที่: 25 มีนาคม พ.ศ. 2569 |
