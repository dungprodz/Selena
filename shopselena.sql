-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: shopselena
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_internal_idx` (`parent_id`),
  CONSTRAINT `fk_self_joing` FOREIGN KEY (`parent_id`) REFERENCES `tbl_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa danh mục sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (44,'kem dưỡng','kem dưỡng',NULL,NULL,NULL,NULL,NULL,'1',NULL),(45,'đồ dưỡng','đồ dưỡng',NULL,NULL,NULL,NULL,NULL,'1',NULL);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `request_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin liên hệ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
INSERT INTO `tbl_contact` VALUES (19,'nguyen dinh','dai','a@a.com',NULL,'a','2022-09-20 20:34:58',NULL,NULL,NULL,'1'),(20,'nguyen dinh','dai 2','a@a.com',NULL,'b','2022-09-20 20:35:28',NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `price_sale` decimal(13,2) DEFAULT NULL,
  `short_description` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `detail_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_category_products_idx` (`category_id`),
  CONSTRAINT `fk_category_products` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa danh mục sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products`
--

LOCK TABLES `tbl_products` WRITE;
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` VALUES (144,'Kem dưỡng trắng da Body Cream',650000.00,440000.00,'Độ makeup nhẹ rất tự nhiên\r\nChất kem mềm mịn,mát lạnh','<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style-type: none; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\"><li style=\"margin: 0px; padding: 0px;\">Sản phẩm chiết xuất hoàn toàn tự nhiên với các thành phần dưỡng trắng hiệu quả như:VITAMIN B3,VITAMIN C,đặc biệt là ALPHA ARBUTIN thành phần dưỡng trắng hiệu quả và tốt nhất hiện nay.</li><li style=\"margin: 0px; padding: 0px;\">Sản phẩm sử dụng hàng ngày nhằm cung cấp và bổ sung các dưỡng chất cần thiết giúp da luôn mềm mịn tự nhiên.</li></ul>','product/avatar/kemduong1673449702429.png',44,'2023-01-11 22:08:22',NULL,NULL,NULL,'1',NULL,0),(145,'Tinh chất dưỡng ẩm Skinceuticals Hydrating B5 30ml',2000000.00,1500000.00,'Thúc đẩy sự phục hồi da sau tổn thương do mụn, sau điều trị nặn mụn, kháng viêm, chữa da sau kích ứng.','<p><span style=\"color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\">Serum dưỡng ẩm da lí tưởng hàng ngày mà không hề gây nhờn hay bít tắc lỗ chân lông nhờ công thức serum dạng gel đặc biệt không chứa dầu. Với thành phần có axit hyaluronic - chất dưỡng và khóa ẩm tự nhiên cùng vitamin B5, sản phẩm giúp cấp nước, khóa ẩm và nuôi dưỡng da cực kì hiệu quả. Da bạn sẽ luôn căng mọng, mướt mịn, hồng hào cả trong những ngày thời tiết khô hanh nhất.</span><br></p>','product/avatar/item11673532072744.png',44,'2023-01-12 21:01:13',NULL,NULL,NULL,'1',NULL,0),(146,'Sữa dưỡng thể Bath & Body Work Dark Kiss',290000.00,270000.00,'Làn da mượt mà, trắng hồng nhờ Vitamin C','<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style-type: none; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\"><li style=\"margin: 0px; padding: 0px;\">Giúp duy trì làn da mềm mại tươi trẻ, mà còn ở các loại mùi hương đa dạng và đầy sức hút của bản thân sản phẩm</li></ul>','product/avatar/suaduong1673532177864.png',45,'2023-01-12 21:02:58',NULL,NULL,NULL,'1',NULL,0),(147,'Mặt Nạ Tẩy Tế Bào Chết Huxley Scrub Mask Sweet Therapy 30g',120000.00,85000.00,'Với chiết xuất từ ​​cây xương rồng lê của Sahara, chứa chất chống oxy hóa có lợi cho da, vitamin E và axit linoleic.','<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style-type: none; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\"><li style=\"margin: 0px; padding: 0px;\">Làm giảm sưng đỏ và giúp thúc đẩy da chết một cách nhẹn nhàng</li><li style=\"margin: 0px; padding: 0px;\">Phù hợp cho tất cả các loại da, đặc biệt với da dầu tiết nhiê bã nhờn dư thừa và lỗ chân lông bị tắc.</li><li style=\"margin: 0px; padding: 0px;\">Được sản xuất không có paraben, thuốc nhuộm tổng hợp hoặc dầu khoáng.</li></ul>','product/avatar/matna1673532291031.png',45,'2023-01-12 21:04:51',NULL,NULL,NULL,'1',NULL,0),(148,'Dầu gội Hischer Argan Oil for Dry cho tóc khô hư tổn 1000ml',450000.00,350000.00,'SẢN PHẨM PHÙ HỢP CHO TÓC KHÔ VÀ TÓC UỐN NHUỘM.','<p style=\"margin-bottom: 1rem; padding: 0px; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\">Dầu Gội Hischer có nguồn gốc thiên nhiên và mùi hương nhẹ nhàng thoang thoảng&nbsp;</p><p style=\"margin-bottom: 1rem; padding: 0px; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\">- 100% tinh dầu Agarn nguyên chất - giúp nuôi dưỡng và phục hồi tóc hiệu quả từ bên trong; khiến tóc chắc khỏe, giảm gãy rụng và thúc đẩy quá trình mọc tóc</p><p style=\"margin-bottom: 1rem; padding: 0px; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\">- Không chứa Silicone - Không gây \"\"mượt giả\"\", không gây nặng tóc khiến tóc gãy rụng</p><p style=\"margin-bottom: 1rem; padding: 0px; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\">- Không chứa chất bảo quản mỹ phẩm Paraben độc hại</p><p style=\"margin-bottom: 1rem; padding: 0px; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\">Dầu Gội dưỡng tóc HISCHER được đặc chế để điều trị tóc khô, hư, chẻ ngọn do uốn nhuộm và duỗi gây ra.</p><p style=\"margin-bottom: 1rem; padding: 0px; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\">Dầu Gội dưỡng tóc HISCHER có chứa loại tinh dầu giúp nuôi dưỡng và bổ sung những dưỡng chất cần thiết để phục hồi, nuôi dưỡng những phần tóc bị hư tổn, giữ độ ẩm và độ PH cho tóc.</p><p style=\"margin-bottom: 1rem; padding: 0px; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\">Thành phần: 100% dầu argan nguyên chất, tinh dầu macadamia, bạc hà, chiết xuất lô hội, tinh dầu hoa hồng,</p>','product/avatar/daugoi1674057041470.png',45,'2023-01-18 22:50:41',NULL,NULL,NULL,'1',NULL,0),(149,'Tẩy da chết đường đen dịu nhẹ, làm sạch mụn đầu đen Klairs Gentle Green Sugar Facial Polish 110g',250000.00,20000.00,'Sản phẩm phù hợp cho mọi loại da, đặc biệt là da khô / da có mụn đầu đen vùng mũi.','<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style-type: none; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\"><li style=\"margin: 0px; padding: 0px;\">Giúp loại bỏ tế bào chết hiệu quả, mang lại làn da mềm mại hơn.</li><li style=\"margin: 0px; padding: 0px;\">Giảm thiểu bít tắc lỗ chân lông, hỗ trợ cải thiện mụn đầu đen vùng mũi.</li><li style=\"margin: 0px; padding: 0px;\">Giúp lớp make-up “ăn phấn” hơn, giảm hiện tượng cakey.</li><li style=\"margin: 0px; padding: 0px;\">Thúc đẩy da tái tạo và sản sinh tế bào mới, duy trì làn da tươi trẻ và khỏe mạnh.</li><li style=\"margin: 0px; padding: 0px;\">Dưỡng ẩm, làm mềm da, giúp da không bị khô căng bong tróc sau khi sử dụng.</li></ul>','product/avatar/kemduongtaydachet1674057185319.png',44,'2023-01-18 22:53:05',NULL,NULL,NULL,'1',NULL,0),(150,'Bông tẩy trang The Body Shop Body Yogurt British Rose',100000.00,50000.00,'Kết hợp cùng British Rose Shower Gel và British Rose Body Scrub','<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style-type: none; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\"><li style=\"margin: 0px; padding: 0px;\">Dưỡng ẩm suốt 48h</li><li style=\"margin: 0px; padding: 0px;\">Gìau dưỡng chất từ chiết xuất hoa hồng Anh Quốc và sữa hạnh nhân hữu cơ từ chương trình Community Trade ở Tây Ban Nha.</li></ul>','product/avatar/duongda1674057488195.png',45,'2023-01-18 22:58:08',NULL,NULL,NULL,'1',NULL,0),(151,'Muối biển tinh khiết 500g',50000.00,25000.00,'Công dụng: Dùng để nấu ăn hoặc súc rửa đường tiêu hóa (salt water - cleanse) hoặc pha nước rửa rau củ,…','<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style-type: none; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\"><li style=\"margin: 0px; padding: 0px;\">Thành phần: 100% muối biển nguyên chất, giàu khoáng chất tự nhiên; không tẩy trắng, không tinh chế, không bổ sung iot.</li></ul>','product/avatar/muoibien1674057752761.png',45,'2023-01-18 23:02:33',NULL,NULL,NULL,'1',NULL,0),(152,'Bông ngoáy tai hữu cơ Masmi',80000.00,80000.00,'Bông ngoáy tai hữu cơ Masmi làm từ 100% bông hữu cơ nguyên chất, không chứa hóa chất gây hại, đảm bảo sức khỏe người tiêu dùng.\r\nBông là một trong những loại cây trồng biến đổi gen phổ biến trên thế giới nên hãy lựa chọn những sản phẩm được chứng nhận hữu cơ để đảm bảo sức khỏe','<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style-type: none; color: rgb(51, 51, 51); font-family: Quicksand, sans-serif;\"><li style=\"margin: 0px; padding: 0px;\">Xuất xứ: Tây Ban Nha</li><li style=\"margin: 0px; padding: 0px;\">Chứng nhận hữu cơ ICEA, GOTS</li><li style=\"margin: 0px; padding: 0px;\">Quy cách: Hộp 200 cây</li><li style=\"margin: 0px; padding: 0px;\">Bông ngoáy tai hữu cơ Masmi làm từ 100% bông hữu cơ nguyên chất, không chứa hóa chất gây hại, đảm bảo sức khỏe người tiêu dùng.</li></ul>','product/avatar/bongtai1677511545446.png',45,'2023-02-27 22:25:45',NULL,NULL,NULL,'1',NULL,0),(153,'Kem Dưỡng Clinique Cấp Ẩm Chuyên Sâu 50ml Moisture Surge 100H Auto-Replenishing Hydrator',1460000.00,1460000.00,'Moisture Surge 100H Auto-Replenishing Hydrator là kem dưỡng ẩm phiên bản nâng cấp từ dòng sản phẩm được yêu thích nhất của thương hiệu Clinique. Kết cấu kem gel mỏng nhẹ không chứa dầu với thành phần Men Vi Sinh Lô Hội độc quyền, Hyaluronic Acid & nước Lô Hội hoạt tính có khả năng cấp ẩm thẩm thấu chuyên sâu qua 10 tầng da* và giữ cho da ngậm nước liên tục trong suốt 100 giờ ngay cả sau khi rửa mặ','<p style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-family: arial, helvetica, sans-serif; font-size: 13px;\"><strong style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Thành phần chính:</strong></p><ul style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 10px; font-family: arial, helvetica, sans-serif; font-size: 13px;\"><li style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><p style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><strong style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Men Vi Sinh Lô Hội:</strong>&nbsp;gồm có lợi khuẩn lactobacillus, Nước Lô Hội hoạt tính và chiết xuất bột Lô Hội hữu cơ có nguồn gốc &amp; chứng nhận an toàn, chính những thành phần giàu chất dinh dưỡng độc quyền này sẽ cung cấp độ ẩm sâu bên trong da. Một trong những lợi ích của quá trình lên men chính là phá vỡ các phân tử lớn thành các phân tử có kích thước nhỏ hơn để hấp thụ vào da tốt hơn.</p></li><li style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><p style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><strong style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Hyaluronic Acid:</strong>&nbsp;Thành phần liên kết độ ẩm này sở hữu khả năng tuyệt đỉnh nhất chính là giữ được lượng nước nặng gấp 1000 lần trọng lượng, tạo nên một nguồn ẩm dùng để dưỡng ẩm vô cùng hiệu quả. Công thức này bao gồm 2 trọng lượng phân tử khác nhau có trong Axit Hyaluronic.</p></li><li style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><p style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><strong style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Nước lô hội hoạt tính:</strong>&nbsp;Nước tinh khiết đi cùng với chiết xuất lá lô hội, được hòa quyện chung dưới áp lực tăng áp cao để giữ cho các ion âm dương hoạt động, giúp da hấp thụ độ ẩm dễ dàng hơn.</p></li><li style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><p style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\"><strong style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Hỗn hợp vitamin C &amp; E:</strong>&nbsp;giúp chống oxy hoá, bảo vệ làn da khỏi các tác nhân gây hại và chống lại tình trạng mất nước hàng ngày.</p></li></ul>','product/avatar/kem1677513635561.png',44,'2023-02-27 23:00:36',NULL,NULL,NULL,'1',NULL,0),(154,'Phấn Nước Laneige Cho Lớp Nền Căng Bóng Tự Nhiên 24H #21N 15g',619000.00,619000.00,'Phấn Nước Laneige Căng Bóng 24h là dòng phấn nước cushion đến từ thương hiệu mỹ phẩm cao cấp Laneige của Hàn Quốc, sử dụng công nghệ Liquid Diamond™ giúp che phủ tối ưu các khuyết điểm, vùng da tối màu, đem lại hiệu ứng bóng khỏe, sáng mịn. Đồng thời sản phẩm bổ sung các thành phần dưỡng ẩm giúp da luôn ẩm mượt trong suốt 24 giờ.','<p style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-family: arial, helvetica, sans-serif; font-size: 13px;\"><strong style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Thành phần đầy đủ:</strong></p><p style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-family: arial, helvetica, sans-serif; font-size: 13px;\"><span style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">Water / Aqua / Eau, Cyclopentasiloxane, Titanium Dioxide (Ci 77891), Phenyl Trimethicone, Homosalate, Glycerin, Ethylhexyl Methoxycinnamate, Titanium Dioxide (Nano), Peg-10 Dimethicone, Cyclohexasiloxane, Boron Nitride, Trimethylsiloxysilicate, Niacinamide, Lauryl Peg-10 Tris(Trimethylsiloxy)Silylethyl Dimethicone, Propanediol, Polymethyl Methacrylate, 1,2-Hexanediol, Acrylates/Dimethicone Copolymer, Disteardimonium Hectorite, Iron Oxides (Ci 77492), Sodium Chloride, Alumina, Bismuth Oxychloride (Ci 77163), Glyceryl Stearate Citrate, Polysorbate 80, Disodium Stearoyl Glutamate, Fragrance / Parfum, Aluminum Hydroxide, Dimethicone/Peg-10/15 Crosspolymer, Caprylyl Glycol, Hydrogenated Lecithin, Ethylhexyl Hydroxystearate, Iron Oxides (Ci 77491), Simethicone, Glyceryl Caprylate, Ethylhexylglycerin, Disodium Edta, Adenosine, Iron Oxides (Ci 77499), Triethoxycaprylylsilane, Citronellol, Geraniol, Limonene, Dipropylene Glycol, Bht, Hydroxycitronellal, Thymol Trimethoxycinnamate, Sodium Citrate, Tocopherol, Sodium Benzoate, Lactic Acid, Potassium Sorbate, Diamond Powder, Xanthan Gum</span></p>','product/avatar/phannuoc1677513906477.png',45,'2023-02-27 23:05:06',NULL,NULL,NULL,'1',NULL,0),(155,'A',800000.00,750000.00,'aaa','<p>aaaa</p>','product/avatar/slider31678015372657.png',44,'2023-03-05 18:22:53',NULL,NULL,NULL,'0',NULL,0),(156,'Kem',120000.00,440000.00,'aa','<p>aaa</p>','product/avatar/ArcheAge_sample1686397118643.jpg',44,NULL,NULL,NULL,NULL,NULL,NULL,0),(157,'C',100000.00,50000.00,'asfasgadfhgsdf','<p>sgadsfhgsdfhsdhgf</p>','product/avatar/Warface_sample1698335633318.jpg',44,'2023-10-26 22:53:53',NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products_images`
--

DROP TABLE IF EXISTS `tbl_products_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_images_idx` (`product_id`),
  CONSTRAINT `fk_product_images` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu danh sách ảnh sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products_images`
--

LOCK TABLES `tbl_products_images` WRITE;
/*!40000 ALTER TABLE `tbl_products_images` DISABLE KEYS */;
INSERT INTO `tbl_products_images` VALUES (100,'Warface_sample1686397118643.jpg','product/pictures/Warface_sample1686397118643.jpg',156,NULL,NULL,NULL,NULL,'0'),(101,'ArcheAge_sample1686397118643.jpg','product/pictures/ArcheAge_sample1686397118643.jpg',156,NULL,NULL,NULL,NULL,'0'),(102,'Warface_sample1698335633319.jpg','product/pictures/Warface_sample1698335633319.jpg',157,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_products_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_roles`
--

LOCK TABLES `tbl_roles` WRITE;
/*!40000 ALTER TABLE `tbl_roles` DISABLE KEYS */;
INSERT INTO `tbl_roles` VALUES (16,'ADMIN','ADMIN',NULL,NULL,NULL,NULL,'1'),(17,'GUEST','GUEST',NULL,NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `tbl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder`
--

DROP TABLE IF EXISTS `tbl_saleorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `customer_address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `seo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `cutomer_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa phiếu mua hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder`
--

LOCK TABLES `tbl_saleorder` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder` DISABLE KEYS */;
INSERT INTO `tbl_saleorder` VALUES (34,'1665495968060',NULL,NULL,'2022-10-11 20:46:08',NULL,NULL,NULL,'1','nguyen van a','ha noi',NULL,'12121212','a@a.com'),(37,'1676050142153',NULL,NULL,'2023-02-11 00:29:02',NULL,NULL,NULL,'1','Dung Nguyen','ha noi',NULL,'123456789','nguyentiendunga42002@gmail.com'),(38,'1676051054226',NULL,NULL,'2023-02-11 00:44:14',NULL,NULL,NULL,'1','Dung Nguyen','Ha noi',NULL,'123465798','nguyentiendunga42002@gmail.com'),(39,'1676052674506',NULL,NULL,'2023-02-11 01:11:15',NULL,NULL,NULL,'1','Dung Nguyen','',NULL,'123456789','nguyentiendunga42002@gmail.com'),(40,'1676053226939',NULL,NULL,'2023-02-11 01:20:27',NULL,NULL,NULL,'1','Dung Nguyen','Ha noi',NULL,'123456789','nguyentiendunga42002@gmail.com'),(41,'1676053332236',NULL,NULL,'2023-02-11 01:22:12',NULL,NULL,NULL,'1','Dung Nguyen','Ha noi',NULL,'123456789','nguyentiendunga42002@gmail.com'),(42,'1676093573015',NULL,NULL,'2023-02-11 12:32:53',NULL,NULL,NULL,'1',' Nhu Nguyen','Ha noi',NULL,'123456789','kaito19022002@gmail.com'),(43,'1676093797248',NULL,NULL,'2023-02-11 12:36:37',NULL,NULL,NULL,'1','Nhu nguyễn','Ha noi',NULL,'123456789','kaito19022002@gmail.com'),(44,'1676093897984',NULL,NULL,'2023-02-11 12:38:18',NULL,NULL,NULL,'1','Nhu nguyễn','Ha noi',NULL,'123456789','kaito19022002@gmail.com'),(45,'1676093971885',NULL,NULL,'2023-02-11 12:39:32',NULL,NULL,NULL,'1','Dung Nguyen','',NULL,'123456789','nguyentiendunga42002@gmail.com'),(46,'1676094265314',NULL,NULL,'2023-02-11 12:44:25',NULL,NULL,NULL,'1','Nhu nguyễn','Ha noi',NULL,'123456789','kaito19022002@gmail.com'),(47,'1676094594993',NULL,NULL,'2023-02-11 12:49:55',NULL,NULL,NULL,'1','nhu đb','Ha noi',NULL,'123456','kaito19022002@gmail.com'),(48,'1676095107072',NULL,NULL,'2023-02-11 12:58:27',NULL,NULL,NULL,'1','nhu đb','',NULL,'123456','kaito19022002@gmail.com'),(49,'1676096157778',NULL,NULL,'2023-02-11 13:15:58',NULL,NULL,NULL,'1','Dung Nguyen','',NULL,'123456789','nguyentiendunga42002@gmail.com'),(50,'1676096295001',NULL,NULL,'2023-02-11 13:18:15',NULL,NULL,NULL,'1','Dung Nguyen','',NULL,'123456789','nguyentiendunga42002@gmail.com'),(51,'1676096334088',NULL,NULL,'2023-02-11 13:18:54',NULL,NULL,NULL,'1','Nhu Đb','Ha noi',NULL,'123456789','kaito19022002@gmail.com'),(52,'1676098364065',NULL,NULL,'2023-02-11 13:52:44',NULL,NULL,NULL,'1','Hiếu đb','',NULL,'123456789','hieunb20@gmail.com'),(53,'1676821111654',NULL,NULL,'2023-02-19 22:38:32',NULL,NULL,NULL,'0','Dung Nguyen','Ha noi',NULL,'123456789','nguyentiendunga42002@gmail.com'),(54,'1677520032234',NULL,NULL,'2023-02-28 00:47:12',NULL,NULL,NULL,'0','Dung Nguyen','Ha noi',NULL,'123456789','nguyentiendunga42002@gmail.com'),(55,'1677679887249',NULL,460000.00,'2023-03-01 21:11:27',NULL,NULL,NULL,'0','Dung Nguyen','Ha noi',NULL,'123456789','nguyentiendunga42002@gmail.com'),(56,'1677679979544',NULL,2220000.00,'2023-03-01 21:13:00',NULL,NULL,NULL,'0','Dung Nguyen','Ha noi',NULL,'123456789','nguyentiendunga42002@gmail.com'),(57,'1677680240958',NULL,1519000.00,'2023-03-01 21:17:21',NULL,NULL,NULL,'0','Dung Nguyen','Ha noi',NULL,'123456789','nguyentiendunga42002@gmail.com'),(58,'1677764476855',NULL,410000.00,'2023-03-02 20:41:17',NULL,NULL,NULL,'0','hang','Ha noi',NULL,'0326901096','nguyentiendunga42002@gmail.com'),(59,'1677919078507',NULL,820000.00,'2023-03-04 15:37:59',NULL,NULL,NULL,'0','xinmapmap','Ha noi',NULL,'0326901096','mdtpanh15082002@gmail.com'),(60,'1677919286117',NULL,410000.00,'2023-03-04 15:41:26',NULL,NULL,NULL,'0','trucnhan','Ha noi',NULL,'0326901096','fantrucnhan@gmail.com'),(61,'1677921757069',NULL,410000.00,'2023-03-04 16:22:37',NULL,NULL,NULL,'0','xinocconlon','Ha noi',NULL,'0326901096','mdtpanh15082002@gmail.com'),(62,'1678010442442',NULL,1550000.00,'2023-03-05 17:00:42',NULL,NULL,NULL,'0','nguyenvana','Ha noi',NULL,'0326901096','nguyentiendunga42002@gmail.com'),(63,'1678014333145',NULL,150000.00,'2023-03-05 18:05:33',NULL,NULL,NULL,'0','bach','Ha noi',NULL,'0326901096','nguyentiendunga42002@gmail.com'),(64,'1678015263795',NULL,220000.00,'2023-03-05 18:21:04',NULL,NULL,NULL,'0','devpro','Ha noi',NULL,'0326901096','nguyentiendunga42002@gmail.com'),(65,'1678186260512',NULL,120000.00,'2023-03-07 17:51:01',NULL,NULL,NULL,'0','duchai','Ha noi',NULL,'0326901096','haikun2804@gmail.com'),(66,'1683217874640',NULL,50000.00,'2023-05-04 23:31:15',NULL,NULL,NULL,'0','Dung Nguyen','Ha noi',NULL,'123456789','tuan2k21211@gmail.com'),(67,'1686391346582',NULL,2290000.00,'2023-06-10 17:02:27',NULL,NULL,NULL,'0','tung','Ha noi',NULL,'123456789','nguyentiendunga42002@gmail.com'),(68,'1697557774961',NULL,290000.00,'2023-10-17 22:49:35',NULL,NULL,NULL,'Đang giao hàng','Thái','Ha noi',NULL,'0326901096','sb23092002@gmail.com'),(69,'1708617017382',NULL,1238000.00,'2024-02-22 22:50:17',NULL,NULL,NULL,'Đã Thanh toán','Cường','ha noi',NULL,'2154878645231','lehungcuong2003nth@gmail.com');
/*!40000 ALTER TABLE `tbl_saleorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder_products`
--

DROP TABLE IF EXISTS `tbl_saleorder_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleorder_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quality` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_saleorder_product_idx` (`saleorder_id`),
  KEY `fk_product_saleorder_idx` (`product_id`),
  CONSTRAINT `fk_product_saleorder` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_saleorder_product` FOREIGN KEY (`saleorder_id`) REFERENCES `tbl_saleorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa phiếu mua hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder_products`
--

LOCK TABLES `tbl_saleorder_products` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder_products` DISABLE KEYS */;
INSERT INTO `tbl_saleorder_products` VALUES (56,37,146,1,NULL,NULL,NULL,NULL,'1'),(57,37,147,1,NULL,NULL,NULL,NULL,'1'),(58,38,146,1,NULL,NULL,NULL,NULL,'1'),(59,38,147,1,NULL,NULL,NULL,NULL,'1'),(60,39,146,1,NULL,NULL,NULL,NULL,'1'),(61,39,147,1,NULL,NULL,NULL,NULL,'1'),(62,40,146,1,NULL,NULL,NULL,NULL,'1'),(63,40,147,1,NULL,NULL,NULL,NULL,'1'),(64,41,145,1,NULL,NULL,NULL,NULL,'1'),(65,41,146,1,NULL,NULL,NULL,NULL,'1'),(66,42,147,1,NULL,NULL,NULL,NULL,'1'),(67,42,146,1,NULL,NULL,NULL,NULL,'1'),(68,43,146,1,NULL,NULL,NULL,NULL,'1'),(69,43,147,1,NULL,NULL,NULL,NULL,'1'),(70,44,146,1,NULL,NULL,NULL,NULL,'1'),(71,44,147,1,NULL,NULL,NULL,NULL,'1'),(72,45,146,1,NULL,NULL,NULL,NULL,'1'),(73,45,147,1,NULL,NULL,NULL,NULL,'1'),(74,46,146,1,NULL,NULL,NULL,NULL,'1'),(75,46,147,1,NULL,NULL,NULL,NULL,'1'),(76,47,147,1,NULL,NULL,NULL,NULL,'1'),(77,47,146,1,NULL,NULL,NULL,NULL,'1'),(78,48,147,1,NULL,NULL,NULL,NULL,'1'),(79,48,146,1,NULL,NULL,NULL,NULL,'1'),(80,49,147,1,NULL,NULL,NULL,NULL,'1'),(81,49,146,1,NULL,NULL,NULL,NULL,'1'),(82,50,146,1,NULL,NULL,NULL,NULL,'1'),(83,50,147,1,NULL,NULL,NULL,NULL,'1'),(84,51,146,1,NULL,NULL,NULL,NULL,'1'),(85,51,147,1,NULL,NULL,NULL,NULL,'1'),(86,52,150,1,NULL,NULL,NULL,NULL,'1'),(87,52,147,1,NULL,NULL,NULL,NULL,'1'),(88,53,145,1,NULL,NULL,NULL,NULL,'0'),(89,53,146,1,NULL,NULL,NULL,NULL,'0'),(90,53,144,1,NULL,NULL,NULL,NULL,'0'),(91,54,153,1,NULL,NULL,NULL,NULL,'0'),(92,54,152,1,NULL,NULL,NULL,NULL,'0'),(93,55,146,1,NULL,NULL,NULL,NULL,'0'),(94,55,151,1,NULL,NULL,NULL,NULL,'0'),(95,55,147,1,NULL,NULL,NULL,NULL,'0'),(96,56,145,1,NULL,NULL,NULL,NULL,'0'),(97,56,147,1,NULL,NULL,NULL,NULL,'0'),(98,56,150,1,NULL,NULL,NULL,NULL,'0'),(99,57,149,1,NULL,NULL,NULL,NULL,'0'),(100,57,144,1,NULL,NULL,NULL,NULL,'0'),(101,57,154,1,NULL,NULL,NULL,NULL,'0'),(102,58,146,1,NULL,NULL,NULL,NULL,'0'),(103,58,147,1,NULL,NULL,NULL,NULL,'0'),(104,59,146,2,NULL,NULL,NULL,NULL,'0'),(105,59,147,2,NULL,NULL,NULL,NULL,'0'),(106,60,146,1,NULL,NULL,NULL,NULL,'0'),(107,60,147,1,NULL,NULL,NULL,NULL,'0'),(108,61,147,1,NULL,NULL,NULL,NULL,'0'),(109,61,146,1,NULL,NULL,NULL,NULL,'0'),(110,62,144,2,NULL,NULL,NULL,NULL,'0'),(111,62,149,1,NULL,NULL,NULL,NULL,'0'),(112,63,150,1,NULL,NULL,NULL,NULL,'0'),(113,63,151,1,NULL,NULL,NULL,NULL,'0'),(114,64,147,1,NULL,NULL,NULL,NULL,'0'),(115,64,150,1,NULL,NULL,NULL,NULL,'0'),(116,65,147,1,NULL,NULL,NULL,NULL,'0'),(117,66,151,1,NULL,NULL,NULL,NULL,'0'),(118,67,145,1,NULL,NULL,NULL,NULL,'0'),(119,67,146,1,NULL,NULL,NULL,NULL,'0'),(120,68,146,1,NULL,NULL,NULL,NULL,NULL),(121,69,154,2,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_saleorder_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `shipping_address` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (69,'dung','$2a$10$Pi9VAPlAJ5wGU1jWEV8no.ULNtPjJGGjzTPiefMW44HPUHJrZ5kwi','nguyentiendunga42002@gmail.com','2023-03-02 21:14:56',NULL,NULL,NULL,'0','0326901096',NULL),(70,'a','$2a$10$JDVy2r52eg4LR3.Lx9oFf.BwKjqpiD7yJdpdFo5Sd4UEEi/VWLSou','nguyentiendunga42002@gmail.com','2023-03-02 21:19:49',NULL,NULL,NULL,'0','0326901096',NULL),(71,'b','$2a$04$I0OOQSXQyEfdv/P.uR7XkOMTXrhPWxcnUTFxrhDe64UTEpnW54hUq','nguyentiendunga42002@gmail.com','2023-03-02 21:21:53',NULL,NULL,NULL,'0','0326901096',NULL),(72,'c','$2a$04$3lnu15UuwolwKcdxR5NU/uucdulrUC7jh8V769VVNN.cQQk0XESzy','nguyentiendunga42002@gmail.com','2023-03-02 21:33:01',NULL,NULL,NULL,'0','0326901096',NULL),(74,'f','$2a$04$htxOPwSs2pYnQVOcXpQvmOgSq1eLEEvvx4S6NvIGysp.zXLZ68HRS','nguyentiendunga42002@gmail.com','2023-03-03 14:34:08',NULL,NULL,NULL,'0','0326901096',NULL),(75,'xinmapmap','$2a$04$FqFBvcpvpX0IRatSX1lGSe5/4AMkyhDbYBq1th41zoGgDOU3zdnXy','mdtpanh15082002@gmail.com','2023-03-04 15:37:15',NULL,NULL,NULL,'0','0326901096',NULL),(76,'trucnhan','$2a$04$zZepLmegVo0Hi/7/OS3ygur8MssFtJ7xiAnUPA3CdNy9nxNNC4yOu','fantrucnhan@gmail.com','2023-03-04 15:41:01',NULL,NULL,NULL,'0','0326901096',NULL),(77,'xinocconlon','$2a$04$lGcoz7La0xIYTV3gg6jDVui/bhpAjo9OwqAv0NcdKaJRJYJspQxee','mdtpanh15082002@gmail.com','2023-03-04 16:22:18',NULL,NULL,NULL,'0','0326901096',NULL),(78,'nguyenvana','$2a$04$YQgTsdMjQpukjwN/z77gnOV2a/GZzpeXBYsOCEcNnb3BMYcHdHrju','nguyentiendunga42002@gmail.com','2023-03-05 17:00:01',NULL,NULL,NULL,'0','0326901096',NULL),(79,'bach','$2a$04$6k7XaM6IFb/bchdsUZoBKe0V95XdQ3qwkx74F0hZ98vFWqbG9L8Pa','nguyentiendunga42002@gmail.com','2023-03-05 18:05:04',NULL,NULL,NULL,'0','0326901096',NULL),(80,'devpro','$2a$04$RUOSnHYDQueRhylkGKCqAuQI/5pRq8FTVGi/4U1GCeILlnw7gJhGq','nguyentiendunga42002@gmail.com','2023-03-05 18:20:06',NULL,NULL,NULL,'0','0326901096',NULL),(81,'duchai','$2a$04$FH7Dh1pEqXTZeSkN0946COyXa1PYxSNXFsV9qNIUBADi2H7E1bFR6','haikun2804@gmail.com','2023-03-07 17:50:37',NULL,NULL,NULL,'0','0326901096',NULL);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users_roles`
--

DROP TABLE IF EXISTS `tbl_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_roles_idx` (`role_id`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`),
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='bảng trung gian thể hiện quan hệ n-n của users và roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_roles`
--

LOCK TABLES `tbl_users_roles` WRITE;
/*!40000 ALTER TABLE `tbl_users_roles` DISABLE KEYS */;
INSERT INTO `tbl_users_roles` VALUES (69,16),(70,17),(71,17),(72,17),(74,17),(75,17),(76,17),(77,17),(78,17),(79,17),(80,17),(81,17);
/*!40000 ALTER TABLE `tbl_users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-19 19:44:17
