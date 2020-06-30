-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: dbminishop
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chitiethoadon` (
  `idHoaDon` int(11) NOT NULL,
  `idChiTietSanPham` int(11) NOT NULL,
  `soLuong` int(11) DEFAULT NULL,
  `giaTien` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHoaDon`,`idChiTietSanPham`),
  KEY `idChiTietSanPham` (`idChiTietSanPham`),
  CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`idHoaDon`) REFERENCES `hoadon` (`idHoaDon`),
  CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`idChiTietSanPham`) REFERENCES `chitietsanpham` (`idChiTietSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiethoadon`
--

LOCK TABLES `chitiethoadon` WRITE;
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
INSERT INTO `chitiethoadon` VALUES (15,152,2,500),(15,153,1,500),(16,152,2,500),(16,153,1,500),(17,152,2,500),(17,153,1,500);
/*!40000 ALTER TABLE `chitiethoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietkhuyenmai`
--

DROP TABLE IF EXISTS `chitietkhuyenmai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chitietkhuyenmai` (
  `idKhuyenMai` int(11) NOT NULL,
  `idSanPham` int(11) NOT NULL,
  PRIMARY KEY (`idKhuyenMai`,`idSanPham`),
  KEY `idSanPham` (`idSanPham`),
  CONSTRAINT `chitietkhuyenmai_ibfk_1` FOREIGN KEY (`idKhuyenMai`) REFERENCES `khuyenmai` (`idKhuyenMai`),
  CONSTRAINT `chitietkhuyenmai_ibfk_2` FOREIGN KEY (`idSanPham`) REFERENCES `sanpham` (`idSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietkhuyenmai`
--

LOCK TABLES `chitietkhuyenmai` WRITE;
/*!40000 ALTER TABLE `chitietkhuyenmai` DISABLE KEYS */;
/*!40000 ALTER TABLE `chitietkhuyenmai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietsanpham`
--

DROP TABLE IF EXISTS `chitietsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chitietsanpham` (
  `idChiTietSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `idSanPham` int(11) DEFAULT NULL,
  `idMau` int(11) DEFAULT NULL,
  `idSize` int(11) DEFAULT NULL,
  `soLuong` int(11) DEFAULT NULL,
  `ngayNhap` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idChiTietSanPham`),
  KEY `idMau` (`idMau`),
  KEY `idSize` (`idSize`),
  KEY `idSanPham` (`idSanPham`),
  CONSTRAINT `chitietsanpham_ibfk_1` FOREIGN KEY (`idMau`) REFERENCES `mausanpham` (`idMauSanPham`),
  CONSTRAINT `chitietsanpham_ibfk_2` FOREIGN KEY (`idSize`) REFERENCES `sizesanpham` (`idSize`),
  CONSTRAINT `chitietsanpham_ibfk_3` FOREIGN KEY (`idSanPham`) REFERENCES `sanpham` (`idSanPham`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietsanpham`
--

LOCK TABLES `chitietsanpham` WRITE;
/*!40000 ALTER TABLE `chitietsanpham` DISABLE KEYS */;
INSERT INTO `chitietsanpham` VALUES (150,272,2,1,1,'15/05/2020  '),(151,272,1,2,1,'15/05/2020  '),(152,260,3,2,15,'16/05/2020  '),(153,260,4,1,1,'16/05/2020  '),(156,240,1,1,1,'07/06/2020  '),(157,240,2,2,6,'07/06/2020  ');
/*!40000 ALTER TABLE `chitietsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chucvu`
--

DROP TABLE IF EXISTS `chucvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chucvu` (
  `idChucVu` int(11) NOT NULL AUTO_INCREMENT,
  `tenChucVu` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idChucVu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucvu`
--

LOCK TABLES `chucvu` WRITE;
/*!40000 ALTER TABLE `chucvu` DISABLE KEYS */;
INSERT INTO `chucvu` VALUES (1,'ROLE_admin'),(2,'ROLE_manager'),(3,'ROLE_user');
/*!40000 ALTER TABLE `chucvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhmucsanpham`
--

DROP TABLE IF EXISTS `danhmucsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `danhmucsanpham` (
  `idDanhMuc` int(11) NOT NULL AUTO_INCREMENT,
  `tenDanhMuc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hinhDanhMuc` text,
  PRIMARY KEY (`idDanhMuc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhmucsanpham`
--

LOCK TABLES `danhmucsanpham` WRITE;
/*!40000 ALTER TABLE `danhmucsanpham` DISABLE KEYS */;
INSERT INTO `danhmucsanpham` VALUES (1,'Áo thun Y2010- MaBư cá tính',NULL),(2,'Áo thun No Style đơn giản',NULL),(3,'Áo thun KiriMaru giá rẻ',NULL),(4,'Áo thun Ba Lỗ',NULL);
/*!40000 ALTER TABLE `danhmucsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hinhsanpham`
--

DROP TABLE IF EXISTS `hinhsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hinhsanpham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(100) DEFAULT NULL,
  `idSanPham` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idSanPham` (`idSanPham`),
  CONSTRAINT `hinhsanpham_ibfk_1` FOREIGN KEY (`idSanPham`) REFERENCES `sanpham` (`idSanPham`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinhsanpham`
--

LOCK TABLES `hinhsanpham` WRITE;
/*!40000 ALTER TABLE `hinhsanpham` DISABLE KEYS */;
INSERT INTO `hinhsanpham` VALUES (245,'ao-thun-nam-y2010-bd-b05-0019600-6ecf4984-980d-0100-2948-0016cec6ea1f.jpg',240),(247,'ao-thun-nam-y2010-basic-l05-0019087-91909a8a-2e5b-0900-0bfd-0016cec7b0e6.jpg',241),(249,'ao-thun-nam-y2010-basic-l05-0019087-27c320ff-f24d-8400-1b13-0016ceceaf78.jpg',241),(250,'ao-thun-nam-y2010-basic-e10-0019433-56e244e8-a94a-0100-653d-0016c87ab280.jpg',242),(252,'ao-thun-nam-y2010-basic-e10-0019433-b7c5dc1b-67e2-0400-d102-0016c87ad9c2.jpg',242),(253,'ao-thun-nam-y2010-basic-e10-0019433-7a3b0dcd-6633-0200-971d-0016c87ac1d5.jpg',242),(254,'ao-thun-nam-y2010-basic-e10-0019433-f0e1928a-bc34-0300-4096-0016c87ad178.jpg',242),(255,'ao-thun-nam-y2010-bd-b01-0019570-f7e1d4ae-c9b3-0100-d1ac-0016c9eb68f5.jpg',243),(257,'ao-thun-nam-y2010-basic-l03-0019085-a441b97a-0186-0500-9b15-0016cec76630.jpg',244),(260,'ao-thun-nam-y2010-bd-b03-0019572-d901b2c4-22ec-0300-5539-0016c9eb9d40.jpg',245),(262,'ao-thun-nam-ma-bu-basic-st51-0017597-d22986c9-0685-0100-2294-0016c637b81a.jpg',246),(264,'ao-thun-nam-y2010-bd-b02-0019571-a88772bd-d195-0200-6d36-0016c9eb82c5.jpg',247),(266,'ao-thun-nam-y2010-co-tru-c01-0019042-8b346e88-2040-be00-d0de-00164ac28415.jpg',248),(267,'ao-thun-nam-y2010-co-tru-c01-0019042-7073abc8-6f2b-cc00-c392-00164ac307f7.jpg',248),(269,'ao-thun-nam-y2010-co-tru-c01-0019042-7b199794-1be9-d500-aa24-00164ac3b8df.jpg',248),(270,'ao-thun-nam-y2010-co-tru-c01-0019042-2a1ace04-c40a-d400-1758-00164ac3af41.jpg',248),(271,'ao-thun-nam-y2010-basic-l01-0019083-ae159112-c926-0300-44c1-0016cec733b1.jpg',249),(273,'ao-thun-nam-y2010-basic-l01-0019083-62d04353-99a4-0400-f5ac-0016cec7518e.jpg',249),(274,'ao-thun-nam-ma-bu-basic-cg02-0018326-b62fd680-00e2-3300-d9f1-0015a1ad0945.jpg',250),(276,'ao-thun-nam-y2010-basic-u01-0019225-37cde528-8a9c-0300-7a82-0016707b2e90.jpg',251),(278,'ao-thun-nam-y2010-basic-ac02-0019421-01434f36-6531-2300-c153-0016a7833529.jpg',252),(281,'ao-thun-nam-y2010-bd-b04-0019573-6878a250-56bb-0400-3fe4-0016c9ebb082.jpg',253),(283,'ao-thun-nam-kirimaru-basic-gh03-0019322-b2e93076-61c0-0a00-3920-001679c78938.jpg',254),(285,'ao-thun-nam-y2010-basic-ac03-0019422-2c6deffe-97c9-2500-507b-0016a7835cc4.jpg',255),(288,'ao-thun-nam-y2010-basic-l04-0019086-10adfcfd-3cf8-0700-7373-0016cec78842.jpg',256),(291,'ao-thun-nam-y2010-basic-aj02-0019494-99b87074-1b36-1100-7915-0016a1cf9a04.jpg',257),(294,'ao-thun-nam-y2010-basic-ak02-0019516-747272af-43c0-1200-b953-00169c50993a.jpg',258),(296,'ao-thun-nam-y2010-basic-ak02-0019516-747272af-43c0-1200-b953-00169c50993a.jpg',258),(297,'ao-thun-nam-y2010-basic-n01-0019093-98961963-0eb7-a200-950e-001697c6b200.jpg',259),(299,'ao-thun-nam-y2010-co-tru-g01-0018970-527e3912-ebcd-4b00-7c31-0016566aa981.jpg',260),(300,'ao-thun-nam-y2010-co-tru-g01-0018970-e727f78a-2495-4600-dae2-0016566a70f2.jpg',260),(301,'ao-thun-nam-y2010-co-tru-g01-0018970-5cca9ea8-e8ac-3e00-81ca-00165669f0d6.jpg',260),(303,'ao-thun-nam-y2010-co-tru-g01-0018970-5940ffa8-525a-4a00-41fc-0016566aa111.jpg',260),(309,'ao-thun-nam-y2010-basic-ak03-0019517-9e397722-51c3-0f00-84b5-00169c506e71.jpg',262),(315,'ao-thun-nam-y2010-bd-a83-0019327-b84556fa-cc8a-0b00-d215-0016979701ca.jpg',263),(316,'ao-thun-nam-y2010-basic-e07-0019030-bea4f26b-074c-2a00-b610-001649ed3588.jpg',264),(320,'ao-thun-nam-y2010-bd-a82-0019326-5506dd67-1fb2-0d00-f90b-001697974588.jpg',265),(324,'ao-thun-nam-y2010-basic-ak01-0019515-b9b071f4-14bd-1300-1ea2-00169c50b337.jpg',266),(326,'ao-thun-nam-ma-bu-basic-cf06-0018321-0502a437-885c-4d00-bb1a-0015e30c6b6c.jpg',267),(328,'ao-thun-nam-ma-bu-basic-cl04-0018519-859ac8f5-a6c4-2400-768c-0015c6968567.jpg',268),(330,'ao-thun-nam-ma-bu-basic-cl04-0018519-710ef482-c3ac-1600-3eee-0015c6965308.jpg',268),(331,'ao-thun-nam-y2010-bd-a80-0019324-823598ca-1776-1100-2427-00169797ccbe.jpg',269),(332,'ao-thun-nam-y2010-bd-a80-0019324-3ea04740-9cc7-1000-0d21-00169797c44e.jpg',269),(334,'ao-thun-nam-y2010-basic-ah01-0019462-6b4d8b88-e187-1a00-b523-00169173d35c.jpg',270),(336,'ao-thun-nam-y2010-basic-td-f01-0019224-f37399e7-ee88-8900-4df0-001676bd6449.jpg',271),(341,'ao-thun-nam-y2010-co-tru-f14-0019397-4c8c5d33-5b65-a300-7719-001657feb9a4.jpg',272),(346,'ao-thun-nam-ma-bu-3-lo-h01-0017374-bff36466-59c1-c500-b9bd-0014d00ce4db.jpg',273),(348,'ao-thun-nam-y2010-basic-s01-0019198-3f5f4974-4c1b-1300-bc23-00169172b4ea.jpg',274),(353,'ao-thun-nam-y2010-co-tru-e03-0019180-69db988c-4d31-8a00-371f-001676c3b56e.jpg',275),(356,'ao-thun-nam-y2010-basic-am02-0019540-b919ddb2-a520-1200-ad13-0016a781119b.jpg',276),(358,'ao-thun-nam-y2010-basic-ac01-0019420-ea6172a7-0f68-2100-9f56-0016a783031a.jpg',277);
/*!40000 ALTER TABLE `hinhsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hoadon` (
  `idhoadon` int(11) NOT NULL,
  `ngayLap` date NOT NULL,
  `tongGia` double NOT NULL,
  PRIMARY KEY (`idhoadon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khuyenmai`
--

DROP TABLE IF EXISTS `khuyenmai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `khuyenmai` (
  `idKhuyenMai` int(11) NOT NULL AUTO_INCREMENT,
  `moTa` text,
  `hinhKhuyenMai` text,
  `tenKhuyenMai` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ngayBatDau` varchar(30) DEFAULT NULL,
  `giaGiam` int(11) DEFAULT NULL,
  `ngayKetThuc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idKhuyenMai`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khuyenmai`
--

LOCK TABLES `khuyenmai` WRITE;
/*!40000 ALTER TABLE `khuyenmai` DISABLE KEYS */;
/*!40000 ALTER TABLE `khuyenmai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mausanpham`
--

DROP TABLE IF EXISTS `mausanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mausanpham` (
  `idMauSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `mauSanPham` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idMauSanPham`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mausanpham`
--

LOCK TABLES `mausanpham` WRITE;
/*!40000 ALTER TABLE `mausanpham` DISABLE KEYS */;
INSERT INTO `mausanpham` VALUES (1,'Đỏ'),(2,'Xanh da trời'),(3,'Vàng '),(4,'Cam'),(5,'Trắng '),(6,'Đen'),(7,'Xám'),(8,'Xanh Chuối');
/*!40000 ALTER TABLE `mausanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nhanvien` (
  `idNhanVien` int(11) NOT NULL AUTO_INCREMENT,
  `hoTen` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `diaChi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gioiTinh` varchar(10) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `CMND` char(12) DEFAULT NULL,
  `soDT` varchar(10) DEFAULT NULL,
  `idChucVu` int(11) DEFAULT NULL,
  `tenDangNhap` varchar(20) DEFAULT NULL,
  `matKhau` varchar(255) DEFAULT NULL,
  `isEnabled` bit(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `timeToken` timestamp(1) NULL DEFAULT NULL,
  `isNonBanned` bit(1) DEFAULT NULL,
  `ToKenFB` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idNhanVien`),
  KEY `idChucVu` (`idChucVu`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`idChucVu`) REFERENCES `chucvu` (`idChucVu`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'Thông Trần',NULL,NULL,'thongdeptrai9x@gmail.com',NULL,NULL,3,'960867821011287',NULL,_binary '','4387a1d5-036c-4ae2-b9f8-ec9313fbd76a',NULL,_binary '','EAAWhnupRIcYBAMIP7ylQdbZCsN1oYQgMH24hiNOI1ax5fbNTZAZBtPSa0qJmZBhPeHbg6NLeH6up6yppjIjEzyHcSTxZALYpj69PBZBFvjG3dBAPdLIBeiUSn2RMrm4ojv7C1sHN3fvO3U3LcfnVHAjAOZA52s1yb8PRoOZBSNJlWeaR3255x9kvBJZCGwqmxFwpROuJWsN9CVwZDZD'),(3,NULL,NULL,NULL,'thongmap0909310872@gmail.com',NULL,NULL,1,'thong999','$2a$10$gK4WmT2kB9EsPvJ4Ryy6guEpJ5HX0EpZjZmD4GxheMObw5N.2dk.6',_binary '','942b48b6-cbdd-458c-9782-677611983ef4',NULL,_binary '',NULL),(6,NULL,NULL,NULL,'thongmap0909310872@gmail.com',NULL,NULL,3,'thong998','$2a$10$32lSHRllixHtWTN0Qd/xIO6QjdwpYwSVt9Pt4/fWPb6vya9Qqo8Ha',_binary '',NULL,NULL,_binary '',NULL);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sanpham` (
  `idSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `tenSanPham` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `giaTien` int(11) DEFAULT NULL,
  `moTa` text,
  `idDanhMuc` int(11) DEFAULT NULL,
  `danhCho` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idSanPham`),
  KEY `idDanhMuc` (`idDanhMuc`),
  CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`idDanhMuc`) REFERENCES `danhmucsanpham` (`idDanhMuc`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (240,'ao-thun-nam-y2010-bd-b05',100,'',1,'Nam'),(241,'ao-thun-nam-y2010-basic-l05',99,NULL,1,'nam'),(242,'ao-thun-nam-y2010-basic-e10',99,NULL,1,'nam'),(243,'ao-thun-nam-y2010-bd-b01',599,NULL,1,'nam'),(244,'ao-thun-nam-y2010-basic-l03',699,NULL,1,'nam'),(245,'ao-thun-nam-y2010-bd-b03',999,NULL,1,'nam'),(246,'ao-thun-nam-ma-bu-basic-st51',150,NULL,1,'nam'),(247,'ao-thun-nam-y2010-bd-b02',80,NULL,1,'nam'),(248,'ao-thun-nam-y2010-co-tru-c01',100,NULL,1,'nam'),(249,'ao-thun-nam-y2010-basic-l01',500,NULL,1,'nam'),(250,'ao-thun-nam-ma-bu-basic-cg02',400,NULL,1,NULL),(251,'ao-thun-nam-y2010-basic-u01',200,NULL,1,NULL),(252,'ao-thun-nam-y2010-basic-ac02',300,NULL,1,NULL),(253,'ao-thun-nam-y2010-bd-b04',500,NULL,1,NULL),(254,'ao-thun-nam-kirimaru-basic-gh03',500,NULL,1,NULL),(255,'ao-thun-nam-y2010-basic-ac03',500,NULL,1,NULL),(256,'ao-thun-nam-y2010-basic-l04',500,NULL,1,NULL),(257,'ao-thun-nam-y2010-basic-aj02',500,NULL,1,NULL),(258,'ao-thun-nam-y2010-basic-ak02',500,NULL,1,NULL),(259,'ao-thun-nam-y2010-basic-n01',500,NULL,1,NULL),(260,'ao-thun-nam-y2010-co-tru-g01',300,'<p><strong>Yame </strong><img class=\"content-img\" src=\"../resources/Images/gai5.png\" /></p>',1,'Nam'),(262,'ao-thun-nam-y2010-basic-ak03',500,NULL,1,NULL),(263,'ao-thun-nam-y2010-bd-a83',500,NULL,1,NULL),(264,'ao-thun-nam-y2010-basic-e07',500,NULL,1,NULL),(265,'ao-thun-nam-y2010-bd-a82',500,NULL,1,NULL),(266,'ao-thun-nam-y2010-basic-ak01',500,NULL,1,NULL),(267,'ao-thun-nam-ma-bu-basic-cf06',500,NULL,1,NULL),(268,'ao-thun-nam-ma-bu-basic-cl04',500,NULL,1,NULL),(269,'ao-thun-nam-y2010-bd-a80',500,NULL,1,NULL),(270,'ao-thun-nam-y2010-basic-ah01',500,NULL,1,NULL),(271,'ao-thun-nam-y2010-basic-td-f01',500,NULL,1,NULL),(272,'ao-thun-nam-y2010-co-tru-f14',500,'<p>kh&ocirc;ng c&oacute; g&igrave;</p>',1,'Nam'),(273,'ao-thun-nam-ma-bu-3-lo-h01',500,NULL,1,NULL),(274,'ao-thun-nam-y2010-basic-s01',500,NULL,1,NULL),(275,'ao-thun-nam-y2010-co-tru-e03',500,NULL,1,NULL),(276,'ao-thun-nam-y2010-basic-am02',500,NULL,1,NULL),(277,'ao-thun-nam-y2010-basic-ac01',500,NULL,1,NULL);
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizesanpham`
--

DROP TABLE IF EXISTS `sizesanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sizesanpham` (
  `idSize` int(11) NOT NULL AUTO_INCREMENT,
  `tenKichThuoc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idSize`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizesanpham`
--

LOCK TABLES `sizesanpham` WRITE;
/*!40000 ALTER TABLE `sizesanpham` DISABLE KEYS */;
INSERT INTO `sizesanpham` VALUES (1,'XL'),(2,'L'),(3,'M'),(4,'XXL');
/*!40000 ALTER TABLE `sizesanpham` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-29 22:26:27
