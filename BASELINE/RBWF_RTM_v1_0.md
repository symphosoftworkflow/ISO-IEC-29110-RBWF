<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# Traceability Record Document

**ชื่อระบบงาน[TH]**: ระบบบริหารงานธุรกิจจัดจำหน่ายวัสดุก่อสร้างและกระเบื้องครบวงจร  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  
**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นายวีระ เนียมโภคะ (TL, AN)  
**วันที่อนุมัติเอกสาร**: 15 พฤษภาคม พ.ศ. 2569

---

## ประวัติการจัดทำเอกสาร

| ลำดับ | เวอร์ชัน | รายละเอียดการดำเนินการ | ผู้ดำเนินการ | วันที่ดำเนินการ |
|---|---|---|---|---|
| 1 | 0.1 | จัดทำ Traceability Record | นายวีระ เนียมโภคะ | 10 พฤษภาคม พ.ศ. 2569 |
| 2 | 1.0 | อนุมัติ Traceability Record | นางสาวปวริศา จันทรสถาพร | 15 พฤษภาคม พ.ศ. 2569 |

---

ไม่มี **REQ-STK-03** เพราะเป็นฟังก์ชัน Edging ที่ตัดออกจากขอบเขตแล้ว

| เลขที่ความต้องการ | สรุปสาระสำคัญความต้องการของระบบ | Software Design | Software Components | Unit Test | Test Cases |
|---|---|---|---|---|---|
| REQ-STK-01 | ระบบสามารถเพิ่ม แก้ไข และลบหมวดหมู่และรายการสินค้ากระเบื้อง พร้อมระบุขนาด เกรด สี ราคา และตำแหน่งจัดเก็บ | [DES-STK-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_stock.png) | [SC-STK-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/products.go` | pass | [TC-STK-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-STK-02 | ระบบสามารถบันทึกรับเข้า-จ่ายออกสต็อกกระเบื้องและปรับปรุงยอด (Stock Adjust) | [DES-STK-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_stock.png) | [SC-STK-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/stock.go` | pass | [TC-STK-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-STK-04 | ระบบสามารถส่งการแจ้งเตือนสินค้าคงคลังต่ำกว่าเกณฑ์ (Stock Notification) ผ่านระบบและอีเมล | [DES-STK-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_stock.png) | [SC-STK-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/stock_notify.go` | pass | [TC-STK-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-QTO-01 | ระบบสามารถบันทึกและติดตามคำขอใบเสนอราคา (RFQ) จากลูกค้า | [DES-QTO-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_rfq.png) | [SC-QTO-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/rfq.go` | pass | [TC-QTO-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-QTO-02 | ระบบสามารถสร้างใบเสนอราคา (Quotation) คำนวณส่วนลด กำไรขั้นต้น (Profit Analysis) และออก PDF | [DES-QTO-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_quotation.png) | [SC-QTO-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/quotations.go` | pass | [TC-QTO-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-QTO-03 | ระบบมีเวิร์กโฟลว์การอนุมัติใบเสนอราคาตามมูลค่าอนุมัติ | [DES-QTO-03](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_quotation.png) | [SC-QTO-03](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `frontend/src/pages/QuotationManagement.svelte` | pass | [TC-QTO-03](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-QTO-04 | ระบบสามารถคำนวณและบันทึกประวัติการจ่ายค่าคอมมิชชันสำหรับพนักงานขาย | [DES-QTO-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_quotation.png) | [SC-QTO-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/quotation_profit.go` | pass | [TC-QTO-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-PO-01 | ระบบสามารถสร้างและออกใบสั่งซื้อ (PO PDF) ส่งไปยังซัพพลายเออร์ | [DES-PO-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_po.png) | [SC-PO-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/po_v2.go` | pass | [TC-PO-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-PO-02 | ระบบสามารถบันทึกการรับสินค้า (PO Receipts) พร้อมอัปโหลดรูปภาพและเอกสารกำกับ | [DES-PO-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_po.png) | [SC-PO-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/po_receipts.go` | pass | [TC-PO-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-PO-03 | ระบบสามารถบันทึกการชำระเงินค่างวด PO ใบกำกับภาษี และเอกสารใบเสร็จ | [DES-PO-03](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_po.png) | [SC-PO-03](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/po_payments.go` | pass | [TC-PO-03](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-PO-04 | ระบบจัดการข้อมูลซัพพลายเออร์และประวัติการสั่งซื้อ | [DES-PO-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_suppliers.png) | [SC-PO-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `frontend/src/pages/SuppliersPage.svelte` | pass | [TC-PO-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-WRK-01 | ระบบสามารถมอบหมายงานช่าง (Worker Jobs) และติดตามสถานะการตัด/เตรียมกระเบื้อง | [DES-WRK-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_worker_jobs.png) | [SC-WRK-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/worker_jobs.go` | pass | [TC-WRK-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-WRK-02 | ช่างสามารถอัปโหลดรูปภาพผลงานหลังทำเสร็จ | [DES-WRK-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_worker_jobs.png) | [SC-WRK-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/dn_job_photos.go` | pass | [TC-WRK-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-WRK-03 | ระบบสามารถแสดงผลหน้าจอคิวการเตรียมสินค้า (Queue Display Page) แบบเรียลไทม์ | [DES-WRK-03](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_queue.png) | [SC-WRK-03](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/ws.go` | pass | [TC-WRK-03](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-WRK-04 | ระบบสามารถออกใบส่งของ (Delivery Note PDF) และส่งแจ้งเตือนการจัดส่ง | [DES-WRK-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_queue.png) | [SC-WRK-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/delivery_pdf.go` | pass | [TC-WRK-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-FIN-01 | ระบบสามารถบันทึกสมุดบัญชีเงินสดรับ-จ่าย (Cash Ledger) และสรุปยอดคงเหลือ | [DES-FIN-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_cash.png) | [SC-FIN-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/cash_ledger.go` | pass | [TC-FIN-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-FIN-02 | ระบบสามารถบันทึกค่าใช้จ่ายองค์กร (Expenses) และคำขอเบิกจ่ายพนักงาน (Reimbursements) | [DES-FIN-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_expenses.png) | [SC-FIN-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/expenses.go` | pass | [TC-FIN-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-FIN-03 | ระบบคำนวณเงินเดือนพนักงาน (Salary Management) และออกใบเสร็จรับเงิน (Receipt PDF) | [DES-FIN-03](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_salary.png) | [SC-FIN-03](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/salary.go` | pass | [TC-FIN-03](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-FIN-04 | ระบบจัดทำรายงานสรุปผลการดำเนินงานและรายงานการเงินประจำเดือน | [DES-FIN-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_reports.png) | [SC-FIN-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `frontend/src/pages/ReportsPage.svelte` | pass | [TC-FIN-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-SEC-01 | ระบบบริหารผู้ใช้งาน (Users), เอเจนต์ (Agents), พนักงาน (Workers) และผู้จัดจำหน่าย (Suppliers) กำหนดสิทธิ์ตามบทบาท (RBAC) และเปลี่ยนรหัสผ่าน | [DES-SEC-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_users.png) | [SC-SEC-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/handlers/auth.go` | pass | [TC-SEC-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-NFR-01 | ระบบมีความเสถียร มี Uptime ไม่น้อยกว่า 99.5% ต่อเดือน | [DES-NFR-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/diag_deployment.svg) | [SC-NFR-01](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `docker-compose.yml` | pass | [TC-NFR-01](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-NFR-02 | รองรับผู้ใช้พร้อมกันไม่น้อยกว่า 50 คน Response time ของ REST API เฉลี่ยต่ำกว่า 500 ms และหน้าจอตอบสนองไม่เกิน 2 วินาที | [DES-NFR-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_SDD_v1_0) | [SC-NFR-02](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/` | pass | [TC-NFR-02](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-NFR-03 | เข้ารหัสรหัสผ่านด้วย bcrypt ใช้ JWT Token สื่อสารผ่าน HTTPS/TLS และบังคับสิทธิ์ RBAC | [DES-NFR-03](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/LOGO/sdd/ui_login.png) | [SC-NFR-03](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) `api/middleware/` | pass | [TC-NFR-03](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| REQ-NFR-04 | สำรองข้อมูล MySQL ตามรอบในแผน SCM และสามารถ Restore กลับคืนได้ภายใน 1 ชั่วโมง | [DES-NFR-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_BK_v1_0) | [SC-NFR-04](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) | pass | [TC-NFR-04](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |

---

## ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

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
