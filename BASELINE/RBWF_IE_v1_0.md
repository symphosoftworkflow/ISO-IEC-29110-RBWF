<img src="../LOGO/logo.png" alt="Symphosoft Logo" width="200"/>

# เอกสาร สภาพแวดล้อมการพัฒนาและปรับปรุงซอฟต์แวร์ (IMPLEMENTATION ENVIRONMENT - IE)

**ชื่อระบบงาน[TH]**: ระบบบริหารงานธุรกิจจัดจำหน่ายวัสดุก่อสร้างและกระเบื้องครบวงจร  
**ชื่อระบบงาน[EN]**: Rabbit Workflow System (RBWF)  

**เวอร์ชัน**: 1.0  
**จัดทำโดย**: นายปริญญา พงษ์ดนตรี (DES, PR)  
**วันที่อนุมัติเอกสาร**: 25 มกราคม พ.ศ. 2569  

---

## ประวัติการจัดทำเอกสาร

| ลำดับ | เวอร์ชัน | รายละเอียดการดำเนินการ | ผู้ดำเนินการ | วันที่ดำเนินการ |
|---|---|---|---|---|
| 1 | 0.1 | จัดทำเอกสาร สภาพแวดล้อมการพัฒนาและปรับปรุงซอฟต์แวร์ | นายปริญญา พงษ์ดนตรี (DES, PR) | 20 มกราคม พ.ศ. 2569 |
| 2 | 0.1 | ตรวจทาน สภาพแวดล้อมการพัฒนาและปรับปรุงซอฟต์แวร์ | นายวีระ เนียมโภคะ (TL, AN) | 25 มกราคม พ.ศ. 2569 |
| 3 | 1.0 | อนุมัติเอกสาร สภาพแวดล้อมการพัฒนาและปรับปรุงซอฟต์แวร์ | นางษมาภรณ์ พงษ์ดนตรี | 25 มกราคม พ.ศ. 2569 |

---

## 1. วัตถุประสงค์ (Purpose)
เอกสารสภาพแวดล้อมการพัฒนาซอฟต์แวร์ (Implementation Environment) จัดทำขึ้นตามมาตรฐาน **ISO/IEC 29110 (Basic Profile)** เพื่อกำหนดโครงสร้างพื้นฐาน เครื่องมือ (Tools) ฮาร์ดแวร์ ซอฟต์แวร์ ระบบเครือข่าย และสภาพแวดล้อมการพัฒนาระบบ (Development, Staging, Production) สำหรับโครงการ **RABBIT WORKFLOW (RBWF)** เพื่อให้มั่นใจว่าทีมงานทุกคนสามารถพัฒนาระบบ ติดตั้ง ทดสอบ และส่งมอบซอฟต์แวร์ได้อย่างมีประสิทธิภาพ มีความมั่นคงปลอดภัย และเป็นมาตรฐานเดียวกัน

---

## 2. ฮาร์ดแวร์และโครงสร้างพื้นฐาน (Hardware & Infrastructure)

### 2.1 เครื่องคอมพิวเตอร์สำหรับการพัฒนา (Development Workstations)
- **เครื่องคอมพิวเตอร์ทีมพัฒนา**: Apple Mac (macOS Sonoma 14+) / Intel Core i7 หรือ Apple Silicon (M1/M2/M3)
- **หน่วยความจำ (RAM)**: ขั้นต่ำ 16 GB DDR4/Unified Memory
- **พื้นที่จัดเก็บข้อมูล (Storage)**: NVMe SSD 512 GB ขึ้นไป

### 2.2 เครื่องแม่ข่ายและระบบคลาวด์ (Server Infrastructure)
- **Production / Staging Server**: Cloud VPS (Ubuntu Linux 22.04 LTS 64-bit)
- **vCPU**: 4 Core / RAM: 8 GB / NVMe SSD: 160 GB
- **ระบบโดเมนและ DNS**: Cloudflare DNS Management Proxy (`la-or.co.th`, `rabbittile.com`)
- **การรักษาความปลอดภัย**: SSL/TLS Certificate (HTTPS), Firewall (UFW/Cloudflare WAF), SSH Public Key Authentication

---

## 3. เครื่องมือและซอฟต์แวร์สำหรับการพัฒนา (Software Environment & Tools)

### 3.1 ระบบปฏิบัติการและสภาพแวดล้อมการรัน (Runtimes & Frameworks)
- **Backend Language & Runtime**: Go 1.22+ (Golang)
- **Frontend Framework**: Svelte 5 / SvelteKit (Node.js 20+ LTS)
- **Database Engine**: MySQL 8.0 / MariaDB 10.11 LTS
- **Caching & In-Memory Storage**: Redis 7.2+

### 3.2 เครื่องมือพัฒนาและจัดเก็บซอร์สโค้ด (Development & Version Control Tools)
- **IDE / Text Editor**: Visual Studio Code / Antigravity IDE / Cursor
- **Version Control System**: Git 2.40+
- **Source Code Repository**: GitHub (`git@github.com:symphosoftworkflow/workflowv2.rabbittile.com.git`)
- **API Testing Tools**: Postman / Bruno / Curl

### 3.3 เครื่องมือการจัดชุดและจำลองสภาพแวดล้อม (Containerization & Deployment)
- **Container Technology**: Docker 26.0+ & Docker Compose v2.26+
- **Web Server / Reverse Proxy**: Nginx 1.24+ with SSL Termination
- **CI/CD Automation**: GitHub Actions for automated build and unit testing

---

## 4. การกำหนดค่าและลำดับขั้นตอนการติดตั้ง (Environment Setup & Configuration)

### 4.1 การตั้งค่าไฟล์คอนฟิกูเรชัน (Environment Variables `.env`)
```ini
# Application Configuration
APP_ENV=production
APP_PORT=8080
APP_SECRET=your_jwt_secret_key_here

# Database Connection
DB_HOST=127.0.0.1
DB_PORT=3306
DB_USER=rbwf_user
DB_PASSWORD=rbwf_secure_password
DB_NAME=workflowv2_db

# Redis Cache
REDIS_HOST=127.0.0.1
REDIS_PORT=6379
```

### 4.2 ขั้นตอนการจำลองสภาพแวดล้อมการพัฒนา (Local Development Setup)
```bash
# 1. Clone Source Code Repository
git clone git@github.com:symphosoftworkflow/workflowv2.rabbittile.com.git
cd workflowv2.rabbittile.com

# 2. Start Services via Docker Compose
docker-compose up -d

# 3. Run Backend (Go Server)
go run main.go

# 4. Run Frontend (Svelte App)
npm install
npm run dev
```

---

## 5. สภาพแวดล้อมการทดสอบและการสำรองข้อมูล (Testing & Backup Environment)

### 5.1 สภาพแวดล้อมการทดสอบ (Testing Environment)
- **Automated Testing**: Go test toolsuite สำหรับ Unit Test และ Integration Test
- **UI / UAT Testing Environment**: Staging URL (`https://staging.rabbittile.com`) สำหรับการทดสอบโดยลูกค้าก่อนขึ้นระบบจริง

### 5.2 สภาพแวดล้อมการสำรองข้อมูล (Backup Environment)
- **Database Automated Backup**: `mysqldump` ทำงานร่วมกับ Cron Job ทุกวัน เวลา 01:00 น.
- **Off-site Backup Storage**: จัดเก็บไฟล์ `.sql.gz` สำรองย้อนหลัง 30 วัน และสำเนารายเดือนใน [โฟลเดอร์ Google Drive](https://drive.google.com/drive/folders/18E0MSSXUGmgzW8v-OFUDRGwLmIJXBSPX?usp=sharing) ตามทะเบียน [RBWF_BK_v1_0](RBWF_BK_v1_0.md)

---

## 6. ข้อตกลงและการลงนามอนุมัติ (Sign-off Agreement)

 - [x] อนุมัติเอกสารสภาพแวดล้อมการพัฒนา  
 - [ ] ไม่อนุมัติ  

<br/>

| **ผู้จัดทำ (Prepared By)** | **ผู้ทบทวน / สอบทาน (Reviewed By)** | **ผู้ว่าจ้าง / ลูกค้า (Customer Approver)** |
|---|---|---|
| <img src="../LOGO/signature_parinya.png" alt="Signature PR" width="150"/><br/>________________________________________ | <img src="../LOGO/signature_veera.png" alt="Signature TL" width="150"/><br/>________________________________________ | <img src="../LOGO/nook.png" alt="Signature Customer" width="150"/><br/>________________________________________ |
| **(นายปริญญา พงษ์ดนตรี)** | **(นายวีระ เนียมโภคะ)** | **(นางษมาภรณ์ พงษ์ดนตรี)** |
| ผู้ออกแบบและพัฒนา (DES, PR) | หัวหน้าทีมวิเคราะห์ (TL, AN) | ผู้มีอำนาจลงนาม |
| โครงการ RABBIT WORKFLOW (RBWF) | โครงการ RABBIT WORKFLOW (RBWF) | **บริษัท ซิมโฟร์ซอฟท์ จำกัด** |
| วันที่: 25 มกราคม พ.ศ. 2569 | วันที่: 25 มกราคม พ.ศ. 2569 | วันที่: 25 มกราคม พ.ศ. 2569 |
