<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# Software Product Delivery Record (WP.17)

**ชื่อระบบงาน[TH]**: ระบบบริหารงานธุรกิจจัดจำหน่ายวัสดุก่อสร้างและกระเบื้องครบวงจร  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  
**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นางสาวปวริศา จันทรสถาพร (PM)  
**วันที่จัดทำเอกสาร**: 29 พฤษภาคม พ.ศ. 2569

เอกสารนี้เป็นหลักฐาน **WP.17 Software Product** ตาม ISO/IEC 29110 (Table 29) สำหรับชุดผลิตภัณฑ์ซอฟต์แวร์ที่ส่งมอบและได้รับการยอมรับ

---

## 1. นิยามตามมาตรฐาน (WP.17)

Software Product คือชุดผลิตภัณฑ์ซอฟต์แวร์ที่ระบุตัวตนได้อย่างสอดคล้องกัน ประกอบด้วยอย่างน้อย:

- Requirements specification  
- Software design  
- Traceability record  
- Software components  
- Software  
- Test cases and test procedures  
- Test report  
- Product operation guideline  
- Software user documentation  
- Maintenance documentation  

**Applicable states ในโครงการนี้**

| สถานะ | ความหมายในโครงการ RBWF | หลักฐาน |
|---|---|---|
| **delivered** | ส่งมอบระบบ Production และเอกสารประกอบแก่ลูกค้า | วันที่ 29 พฤษภาคม พ.ศ. 2569 |
| **accepted** | ลูกค้าลงนามรับมอบขั้นสุดท้าย | [RBWF_VLD_FINAL_20260529](RBWF_VLD/RBWF_VLD_FINAL_20260529.md), [RBWF_MOM_EXT_20260529](RBWF_MOM/RBWF_MOM_EXT_20260529.md) |

---

## 2. Delivered software URL (Production)

| รายการ | รายละเอียด |
|---|---|
| **Delivered URL** | [https://iso29110.la-or.co.th/](https://iso29110.la-or.co.th/) |
| สภาพแวดล้อม | Production (HTTPS) |
| วันที่ส่งมอบ / รับมอบ | 29 พฤษภาคม พ.ศ. 2569 |
| ผู้รับมอบ | **บริษัท ซิมโฟร์ซอฟท์ จำกัด** (นายทิโนภาส อรไทวรรณ) |
| ขอบเขตที่ส่งมอบ | ระบบ Rabbit Workflow (API Backend + Frontend) พร้อมเอกสารประกอบในตารางข้อ 4 |
| หลักฐานการรับมอบ | [RBWF_VLD_FINAL_20260529](RBWF_VLD/RBWF_VLD_FINAL_20260529.md), [RBWF_VLD_20260529](RBWF_VLD/RBWF_VLD_20260529.md), [RBWF_MOM_EXT_20260529](RBWF_MOM/RBWF_MOM_EXT_20260529.md) |

### รายละเอียดการเข้าใช้งาน Production

- โปรโตคอล: HTTPS  
- จุดเข้าใช้งานหลัก: `https://iso29110.la-or.co.th/`  
- คู่มือผู้ดูแลระบบ: [RBWF_POG_v1_0](RBWF_POG_v1_0.md)  
- คู่มือผู้ใช้ปลายทาง: [RBWF_SUD_v1_0](RBWF_SUD_v1_0.md)  
- แผนบำรุงรักษาทางเทคนิค: [RBWF_MA_v1_0](RBWF_MA_v1_0.md)  

---

## 3. Source software ในชุด (WP.14)

| รายการ | รายละเอียด |
|---|---|
| **Source repository** | [https://github.com/symphosoftworkflow/workflowv2.rabbittile.com](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) |
| ชื่อในดัชนี ALL | WP.14 Software |
| ส่วนประกอบโค้ด | [RBWF_SWC_v1_0](RBWF_SWC_v1_0.md) |

หมายเหตุ: URL โดเมน `workflowv2.rabbittile.com` ที่ใช้ในช่วงพัฒนา/Staging (เช่น รับมอบงวดที่ 2) **ไม่ใช่** Delivered URL ของสถานะ Production สุดท้าย

---

## 4. ตารางส่วนประกอบ Software Product (ชุดส่งมอบ)

| ส่วนประกอบตาม Table 29 | เอกสาร / หลักฐานในโครงการ | URL |
|---|---|---|
| Requirements specification | RBWF_SRS_v1_0 | [RBWF_SRS_v1_0](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_SRS_v1_0) |
| Software design | RBWF_SDD_v1_0 | [RBWF_SDD_v1_0](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_SDD_v1_0) |
| Traceability record | RBWF_RTM_v1_0 | [RBWF_RTM_v1_0](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_RTM_v1_0) |
| Software components | RBWF_SWC_v1_0 | [RBWF_SWC_v1_0](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_SWC_v1_0) |
| Software | workflowv2.rabbittile.com (source) | [GitHub](https://github.com/symphosoftworkflow/workflowv2.rabbittile.com) |
| Software (delivered instance) | Production | [https://iso29110.la-or.co.th/](https://iso29110.la-or.co.th/) |
| Test cases and test procedures | RBWF_TP_v1_0 | [RBWF_TP_v1_0](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TP_v1_0) |
| Test report | RBWF_TR_v1_0 | [RBWF_TR_v1_0](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_TR_v1_0) |
| Product operation guideline | RBWF_POG_v1_0 | [RBWF_POG_v1_0](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_POG_v1_0) |
| Software user documentation | RBWF_SUD_v1_0 | [RBWF_SUD_v1_0](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_SUD_v1_0) |
| Maintenance documentation | RBWF_MA_v1_0 | [RBWF_MA_v1_0](https://symphosoftworkflow.github.io/ISO-IEC-29110-RBWF/BASELINE/RBWF_MA_v1_0) |

ดัชนีครบชุดงานโครงการ: [RBWF_ALL](RBWF_ALL.md)

---

## 5. สรุปสถานะ WP.17

- [x] **delivered** — ส่งมอบ Production URL และชุดเอกสารประกอบแล้ว  
- [x] **accepted** — ลูกค้าลงนามรับมอบ Final Delivery วันที่ 29 พฤษภาคม พ.ศ. 2569  

---

## ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

เอกสารนี้ใช้ภายในโครงการเป็นหลักฐานประกอบดัชนี WP.17 การรับมอบกับลูกค้าอยู่ใน VLD Final

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้จัดทำ (Prepared By)** | **ผู้ทบทวน / ผู้อนุมัติภายใน (Reviewed / Approved By)** |
|---|---|
| <img src="../LOGO/signature_pawarisa.png" alt="Signature PM" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_veera.png" alt="Signature TL" width="150"/><br/>________________________________________ |
| **(นางสาวปวริศา จันทรสถาพร)** | **(นายวีระ เนียมโภคะ)** |
| ผู้จัดการโครงการ (PM) | หัวหน้าทีมวิเคราะห์ (TL) |
| โครงการ RABBIT WORKFLOW (RBWF) | โครงการ RABBIT WORKFLOW (RBWF) |
| วันที่: 29 พฤษภาคม พ.ศ. 2569 | วันที่: 29 พฤษภาคม พ.ศ. 2569 |
