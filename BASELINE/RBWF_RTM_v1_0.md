<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# เอกสาร เมทริกซ์การติดตามความต้องการ (REQUIREMENTS TRACEABILITY MATRIX - RTM)

**ชื่อระบบงาน[TH]**: ระบบบริหารจัดการเวิร์กโฟลว์ สต็อกสินค้า และคำสั่งซื้อกระเบื้อง  
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

| User Req ID | SRS ID | SDD Module / DB Table | SWC File / Component | Test Case ID | Status |
|---|---|---|---|---|---|
| **UR-STK-01** | REQ-STK-01 | `products`, `product_categories` | `handlers/products.go`, `ProductManagement.svelte` | TC-STK-01 | **VERIFIED** |
| **UR-STK-02** | REQ-STK-02 | `stock`, `stock_adjustments` | `handlers/stock.go`, `StockManagement.svelte` | TC-STK-02 | **VERIFIED** |
| **UR-EDG-01** | REQ-STK-03 | `edging_recipes` | `handlers/stock_adjust.go`, `EdgingManagement.svelte` | TC-EDG-01 | **VERIFIED** |
| **UR-QTO-01** | REQ-QTO-01 | `rfq` | `handlers/rfq.go`, `RFQPage.svelte` | TC-QTO-01 | **VERIFIED** |
| **UR-QTO-02** | REQ-QTO-02 | `quotations`, `quotation_items` | `handlers/quotations.go`, `QuotationManagement.svelte` | TC-QTO-02 | **VERIFIED** |
| **UR-PO-01** | REQ-PO-01 | `purchase_orders`, `po_items` | `handlers/po_v2.go`, `PurchaseOrdersPage.svelte` | TC-PO-01 | **VERIFIED** |
| **UR-PO-02** | REQ-PO-02 | `po_receipts` | `handlers/po_receipts.go`, `PurchaseOrdersPage.svelte` | TC-PO-02 | **VERIFIED** |
| **UR-WRK-01** | REQ-WRK-01 | `worker_jobs`, `workers` | `handlers/worker_jobs.go`, `WorkerJobsPage.svelte` | TC-WRK-01 | **VERIFIED** |
| **UR-WRK-02** | REQ-WRK-03 | `delivery_notes` WebSocket Hub | `handlers/ws.go`, `QueueDisplayPage.svelte` | TC-WRK-02 | **VERIFIED** |
| **UR-FIN-01** | REQ-FIN-01 | `cash_ledger` | `handlers/cash_ledger.go`, `CashManagementPage.svelte` | TC-FIN-01 | **VERIFIED** |
| **UR-FIN-02** | REQ-FIN-02 | `expenses`, `reimbursements` | `handlers/expenses.go`, `ExpensesPage.svelte` | TC-FIN-02 | **VERIFIED** |
| **UR-SEC-01** | REQ-SEC-01 | `users`, `roles`, `permissions` | `handlers/auth.go`, `handlers/rbac.go`, `UserManagement.svelte` | TC-SEC-01 | **VERIFIED** |

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
