<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# เอกสาร รายงานผลการทดสอบซอฟต์แวร์ (SOFTWARE TEST REPORT - TR)

**ชื่อระบบงาน[TH]**: ระบบบริหารจัดการเวิร์กโฟลว์ สต็อกสินค้า และคำสั่งซื้อกระเบื้อง  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  
**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นายประกาศิต ทองนอก (TESTER)  
**วันที่อนุมัติเอกสาร**: 30 เมษายน พ.ศ. 2569  

---

## ประวัติการจัดทำเอกสาร

| ลำดับ | เวอร์ชัน | รายละเอียดการดำเนินการ | ผู้ดำเนินการ | วันที่ดำเนินการ |
|---|---|---|---|---|
| 1 | 0.1 | รวบรวมและจัดทำรายงานผลการทดสอบ | นายประกาศิต ทองนอก (TESTER) | 26 เมษายน พ.ศ. 2569 |
| 2 | 1.0 | อนุมัติรายงานผลการทดสอบซอฟต์แวร์ | นางสาวปวริศา จันทรสถาพร (PM) | 30 เมษายน พ.ศ. 2569 |

---

## 1. สรุปผลการทดสอบ (Test Summary Results)

การทดสอบระบบ **Rabbit Workflow (RBWF)** ดำเนินการระหว่างวันที่ 16 เมษายน พ.ศ. 2569 ถึง วันที่ 28 เมษายน พ.ศ. 2569 ครอบคลุมกรณีทดสอบทั้งหมด 45 Test Cases โดยมีผลสรุปดังนี้:

- **Total Test Cases**: 45 Cases
- **Passed Test Cases**: 45 Cases (100%)
- **Failed Test Cases**: 0 Cases (0%)
- **Blocker / Critical Defects**: 0 Items

---

## 2. สรุปผลการทดสอบแยกตามโมดูล (Module Test Results)

| Module | Total Cases | Passed | Failed | Status |
|---|---|---|---|---|
| **Authentication & RBAC** | 5 | 5 | 0 | **PASSED** |
| **Stock & Edging Management** | 10 | 10 | 0 | **PASSED** |
| **RFQ & Quotation System** | 8 | 8 | 0 | **PASSED** |
| **Purchase Orders & Receipts** | 8 | 8 | 0 | **PASSED** |
| **Worker Jobs & Queue Display** | 6 | 6 | 0 | **PASSED** |
| **Finance, Cash Ledger & Salary** | 8 | 8 | 0 | **PASSED** |
| **Total Summary** | **45** | **45** | **0** | **PASSED (100%)** |

---

## 3. สรุปการแก้ไขข้อผิดพลาด (Defect Summary & Resolution)

ในระหว่างการทดสอบในระยะแรก พบข้อผิดพลาดย่อย (Minor Defects) จำนวน 3 รายการ ซึ่งได้รับการแก้ไขและทดสอบซ้ำ (Retest) จนผ่านทั้งหมดแล้ว:
1. *DEV-BUG-01*: แก้ไขการแสดงผลตัวเลขส่วนลดเปอร์เซ็นต์บน Quotation PDF ให้ตรงตามยอดคำนวณ (แก้ไขแล้ว)
2. *DEV-BUG-02*: แก้ไขปัญหาการ Reconnect ของ WebSocket บนหน้า Queue Display เมื่อเน็ตหลุดชั่วคราว (แก้ไขแล้ว)
3. *DEV-BUG-03*: แก้ไขการคำนวณยอดเงินสะสมในสมุดบัญชีเงินสด Cash Ledger หลังตัดจ่าย (แก้ไขแล้ว)

---

## 4. ข้อสรุปและการประเมินผล

ระบบ **Rabbit Workflow (RBWF)** มีคุณภาพ ฟังก์ชัน ความถูกต้อง และความเสถียรผ่านเกณฑ์มาตรฐานที่กำหนดในเอกสาร SRS และ SDD พร้อมสำหรับการทดสอบ User Acceptance Test (UAT) ต่อไป

---

## 5. ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้จัดทำ (Prepared By)** | **ผู้ทบทวน / สอบทาน (Reviewed By)** | **ผู้ว่าจ้าง / ลูกค้า (Customer Approver)** |
|---|---|---|
| <img src="../LOGO/signature_prakasit.png" alt="Signature TESTER" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_pawarisa.png" alt="Signature PM" width="150"/><br/>________________________________________ | <img src="../LOGO/nook.png" alt="Signature Customer" width="150"/><br/>________________________________________ |
| **(นายประกาศิต ทองนอก)** | **(นางสาวปวริศา จันทรสถาพร)** | **(นางษมาภรณ์ พงษ์ดนตรี)** |
| ผู้ทดสอบระบบ (TESTER) | ผู้จัดการโครงการ (PM) | ผู้มีอำนาจลงนาม |
| โครงการ RABBIT WORKFLOW (RBWF) | โครงการ RABBIT WORKFLOW (RBWF) | **บริษัท ซิมโฟร์ซอฟท์ จำกัด** |
| วันที่: 30 เมษายน พ.ศ. 2569 | วันที่: 30 เมษายน พ.ศ. 2569 | วันที่: 30 เมษายน พ.ศ. 2569 |
