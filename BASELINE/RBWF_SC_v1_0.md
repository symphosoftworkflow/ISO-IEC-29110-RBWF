<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# เอกสาร แผนการจัดการคอนฟิกูเรชันซอฟต์แวร์ (SOFTWARE CONFIGURATION MANAGEMENT PLAN - SC)

**ชื่อระบบงาน[TH]**: ระบบบริหารจัดการเวิร์กโฟลว์ สต็อกสินค้า และคำสั่งซื้อกระเบื้อง  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  
**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นายวีระ เนียมโภคะ (TL, AN)  
**วันที่อนุมัติเอกสาร**: 25 มกราคม พ.ศ. 2569  

---

## ประวัติการจัดทำเอกสาร

| ลำดับ | เวอร์ชัน | รายละเอียดการดำเนินการ | ผู้ดำเนินการ | วันที่ดำเนินการ |
|---|---|---|---|---|
| 1 | 0.1 | จัดทำแผนการจัดการคอนฟิกูเรชันซอฟต์แวร์ | นายวีระ เนียมโภคะ (TL, AN) | 20 มกราคม พ.ศ. 2569 |
| 2 | 1.0 | อนุมัติแผนการจัดการคอนฟิกูเรชันซอฟต์แวร์ | นางสาวปวริศา จันทรสถาพร (PM) | 25 มกราคม พ.ศ. 2569 |

---

## 1. วัตถุประสงค์ (Purpose)

เอกสารนี้กำหนดแนวทาง กฎเกณฑ์ เครื่องมือ และกระบวนการในการควบคุม ติดตาม และบริหารจัดการการเปลี่ยนแปลงรายการคอนฟิกูเรชัน (Configuration Items - CIs) ของโครงการ **Rabbit Workflow (RBWF)** ให้มีความเป็นระเบียบ ถูกต้อง และย้อนกลับได้ตลอดวงจรชีวิตซอฟต์แวร์

---

## 2. รายการคอนฟิกูเรชันหลัก (Configuration Items - CIs)

1. **Source Code**: Go REST API (`api/`), Svelte Frontend App (`frontend/`), Docker Specs (`docker-compose.yml`)
2. **Database Artifacts**: MySQL Database Schema Scripts, Migration Files
3. **Engineering Documents**: SOW, PMP, SRS, SDD, SWC, RTM, TP, TR, UAT, SUD
4. **Environment Configs**: Dockerfiles, Nginx Configurations, `.env.example`

---

## 3. การควบคุมเวอร์ชันและการตั้งชื่อ (Version Control & Naming Convention)

- **Version Control Tool**: Git
- **Repositories**:
  - Source Code: `git@github.com:symphosoftworkflow/workflowv2.rabbittile.com.git`
  - Baseline Work Products: `git@github.com:symphosoftworkflow/ISO-IEC-29110-RBWF.git`
- **Branching Strategy**:
  - `main`: สำหรับ Release Code ที่ผ่านการทดสอบ UAT แล้ว
  - `develop`: สำหรับการบำรุงรักษาและพัฒนาระบบหลัก
  - `feature/*`: สำหรับพัฒนาฟังก์ชันย่อย
- **Baseline Tagging**: ใช้รูปแบบ semantic versioning เช่น `v1.0.0-baseline`

---

## 4. กระบวนการควบคุมการเปลี่ยนแปลง (Change Control Process)

การแก้ไขหรือเปลี่ยนแปลงรายการคอนฟิกูเรชันใดๆ ต้องผ่านขั้นตอน:
1. การยื่นคำขออนุมัติเปลี่ยนแปลง (Change Request - CR)
2. การวิเคราะห์ผลกระทบโดย Team Lead / System Analyst
3. การอนุมัติโดย Project Manager และผู้มีอำนาจลงนามฝั่งลูกค้า
4. การลงบันทึกใน Change Request Record (CRR)

---

## 5. ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

 - [x] อนุมัติ  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้ว่าจ้าง / ลูกค้า** | **ผู้พัฒนาโครงการ** |
|---|---|
| <img src="../LOGO/nook.png" alt="Signature" width="180"/><br/>________________________________________ | <br/><br/>________________________________________ |
| **(นางษมาภรณ์ พงษ์ดนตรี)** | **(นางสาวปวริศา จันทรสถาพร)** |
| ผู้มีอำนาจลงนาม | ผู้จัดการโครงการ (PM) |
| **บริษัท ซิมโฟร์ซอฟท์ จำกัด** | โครงการ RABBIT WORKFLOW (RBWF) |
| วันที่: 25 มกราคม พ.ศ. 2569 | วันที่: 25 มกราคม พ.ศ. 2569 |
