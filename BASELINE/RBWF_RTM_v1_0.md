<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# เอกสาร เมทริกซ์การติดตามความต้องการ (REQUIREMENTS TRACEABILITY MATRIX - RTM)

**ชื่อระบบงาน[TH]**: ระบบบริหารงานธุรกิจจัดจำหน่ายวัสดุก่อสร้างและกระเบื้องครบวงจร  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  
**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นายวีระ เนียมโภคะ (TL, AN)  
**วันที่อนุมัติเอกสาร**: 15 พฤษภาคม พ.ศ. 2569  

---

## ประวัติการจัดทำเอกสาร

| ลำดับ | เวอร์ชัน | รายละเอียดการดำเนินการ | ผู้ดำเนินการ | วันที่ดำเนินการ |
|---|---|---|---|---|
| 1 | 0.1 | จัดทำตารางติดตามความต้องการระบบ | นายวีระ เนียมโภคะ (TL, AN) | 10 พฤษภาคม พ.ศ. 2569 |
| 2 | 1.0 | อนุมัติเอกสารเมทริกซ์การติดตามความต้องการ | นางสาวปวริศา จันทรสถาพร (PM) | 15 พฤษภาคม พ.ศ. 2569 |

---

## 1. วัตถุประสงค์ (Purpose)

เอกสารเมทริกซ์การติดตามความต้องการ (RTM) จัดทำขึ้นเพื่อเชื่อมโยงและตรวจสอบความสอดคล้องระหว่าง **ความต้องการผู้ใช้ (User Requirements)** -> **ข้อกำหนดความต้องการซอฟต์แวร์ (SRS)** -> **การออกแบบซอฟต์แวร์ (SDD)** -> **ส่วนประกอบซอฟต์แวร์ (SWC)** -> **กรณีทดสอบ (TP & TR)**

---

## 2. ตารางการติดตามความต้องการ (Traceability Matrix Table)

| User Req ID | SOW | SRS ID | SDD Module / DB Table | SWC File / Component | Test Case ID | Status |
|---|---|---|---|---|---|---|
| **UR-STK-01** | 3.1 | REQ-STK-01 | `products`, `product_categories` | `handlers/products.go`, `StockManagement.svelte` | TC-STK-01 | **VERIFIED** |
| **UR-STK-02** | 3.1 | REQ-STK-02 | `stock`, `stock_adjustments` | `handlers/stock.go`, `stock_adjust.go`, `StockManagement.svelte` | TC-STK-02 | **VERIFIED** |
| **UR-STK-04** | 3.1 | REQ-STK-04 | `stock_notifications` | `handlers/stock_notify.go`, `StockManagement.svelte` | TC-STK-04 | **VERIFIED** |
| **UR-QTO-01** | 3.2 | REQ-QTO-01 | `rfq` | `handlers/rfq.go`, `RFQPage.svelte` | TC-QTO-01 | **VERIFIED** |
| **UR-QTO-02** | 3.2 | REQ-QTO-02 | `quotations`, `quotation_items` | `handlers/quotations.go`, `quotation_pdf.go`, `QuotationManagement.svelte` | TC-QTO-02 | **VERIFIED** |
| **UR-QTO-03** | 3.2 | REQ-QTO-03 | `quotations` approval workflow | `handlers/quotations.go`, `QuotationManagement.svelte` | TC-QTO-03 | **VERIFIED** |
| **UR-QTO-04** | 3.2 | REQ-QTO-04 | `commissions` | `handlers/quotations.go`, `QuotationManagement.svelte` | TC-QTO-04 | **VERIFIED** |
| **UR-PO-01** | 3.3 | REQ-PO-01 | `purchase_orders`, `po_items` | `handlers/po_v2.go`, `po_pdf.go`, `PurchaseOrdersPage.svelte` | TC-PO-01 | **VERIFIED** |
| **UR-PO-02** | 3.3 | REQ-PO-02 | `po_receipts` | `handlers/po_receipts.go`, `PurchaseOrdersPage.svelte` | TC-PO-02 | **VERIFIED** |
| **UR-PO-03** | 3.3 | REQ-PO-03 | `po_payments`, tax invoices | `handlers/po_payments.go`, `PurchaseOrdersPage.svelte` | TC-PO-03 | **VERIFIED** |
| **UR-PO-04** | 3.3 | REQ-PO-04 | `suppliers` | `handlers/po_v2.go`, `SuppliersPage.svelte` | TC-PO-04 | **VERIFIED** |
| **UR-WRK-01** | 3.4 | REQ-WRK-01 | `worker_jobs`, `workers` | `handlers/worker_jobs.go`, `worker_assign.go`, `WorkerJobsPage.svelte` | TC-WRK-01 | **VERIFIED** |
| **UR-WRK-02** | 3.4 | REQ-WRK-02 | `dn_job_photos` | `handlers/dn_job_photos.go`, `WorkerJobsPage.svelte` | TC-WRK-02 | **VERIFIED** |
| **UR-WRK-03** | 3.4 | REQ-WRK-03 | WebSocket Hub, `dn_prepare_queue` | `handlers/ws.go`, `QueueDisplayPage.svelte` | TC-WRK-03 | **VERIFIED** |
| **UR-WRK-04** | 3.4 | REQ-WRK-04 | `delivery_notes` | `handlers/delivery_pdf.go`, `DNPublicView.svelte` | TC-WRK-04 | **VERIFIED** |
| **UR-FIN-01** | 3.5 | REQ-FIN-01 | `cash_ledger` | `handlers/cash_ledger.go`, `CashManagementPage.svelte` | TC-FIN-01 | **VERIFIED** |
| **UR-FIN-02** | 3.5 | REQ-FIN-02 | `expenses`, `reimbursements` | `handlers/expenses.go`, `ReimbursementsPage.svelte` | TC-FIN-02 | **VERIFIED** |
| **UR-FIN-03** | 3.5 | REQ-FIN-03 | `salary` | `handlers/salary.go`, `SalaryPage.svelte` | TC-FIN-03 | **VERIFIED** |
| **UR-FIN-04** | 3.5 | REQ-FIN-04 | monthly reports | `ReportsPage.svelte` | TC-FIN-04 | **VERIFIED** |
| **UR-SEC-01** | 3.6 | REQ-SEC-01 | `users`, `roles`, `permissions` | `handlers/auth.go`, `handlers/rbac.go`, `UserManagement.svelte` | TC-SEC-01 | **VERIFIED** |
| **UR-NFR-01** | PMP 2.2 | REQ-NFR-01 | Availability / uptime | Docker + Nginx production | TC-NFR-01 | **VERIFIED** |
| **UR-NFR-02** | PMP 2.2 | REQ-NFR-02 | Performance / concurrent users | API handlers, Svelte UI | TC-NFR-02 | **VERIFIED** |
| **UR-NFR-03** | PMP 2.2 | REQ-NFR-03 | JWT, HTTPS, bcrypt, RBAC | `middleware/`, `handlers/auth.go` | TC-NFR-03 | **VERIFIED** |
| **UR-NFR-04** | PMP 2.2 | REQ-NFR-04 | MySQL backup / restore | SCM monthly dump, Google Drive | TC-NFR-04 | **VERIFIED** |

---

## 3. ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้จัดทำ (Prepared By)** | **ผู้ทบทวน / สอบทาน (Reviewed By)** | **ผู้ว่าจ้าง / ลูกค้า (Customer Approver)** |
|---|---|---|
| <img src="../LOGO/signature_veera.png" alt="Signature TL" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_pawarisa.png" alt="Signature PM" width="150"/><br/>________________________________________ | <img src="../LOGO/nook.png" alt="Signature Customer" width="150"/><br/>________________________________________ |
| **(นายวีระ เนียมโภคะ)** | **(นางสาวปวริศา จันทรสถาพร)** | **(นางษมาภรณ์ พงษ์ดนตรี)** |
| หัวหน้าทีมวิเคราะห์ (TL, AN) | ผู้จัดการโครงการ (PM) | ผู้มีอำนาจลงนาม |
| โครงการ RABBIT WORKFLOW (RBWF) | โครงการ RABBIT WORKFLOW (RBWF) | **บริษัท ซิมโฟร์ซอฟท์ จำกัด** |
| วันที่: 15 พฤษภาคม พ.ศ. 2569 | วันที่: 15 พฤษภาคม พ.ศ. 2569 | วันที่: 15 พฤษภาคม พ.ศ. 2569 |
