CREATE DATABASE  IF NOT EXISTS `webaodai` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webaodai`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: webaodai
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `product_size_id` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `size_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKwf7ajefj1nkvesk74p2i87vb` (`product_size_id`),
  KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
  KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  KEY `FK1g6tqdhv91y5fytvihysvcuw5` (`size_id`),
  CONSTRAINT `FK1g6tqdhv91y5fytvihysvcuw5` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKwf7ajefj1nkvesk74p2i87vb` FOREIGN KEY (`product_size_id`) REFERENCES `product_size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2,1,NULL,2,3,2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Áo dài truyền thống',1),(2,'Áo dài cách tân',1),(3,'Áo dài cưới',1),(4,'Áo dài',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_size`
--

DROP TABLE IF EXISTS `category_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `size_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKko9w2jke3lr73fwbiad0q3ojv` (`category_id`),
  KEY `FKiqt5jcixwfl19w2l7saugxden` (`size_id`),
  CONSTRAINT `FKiqt5jcixwfl19w2l7saugxden` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `FKko9w2jke3lr73fwbiad0q3ojv` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_size`
--

LOCK TABLES `category_size` WRITE;
/*!40000 ALTER TABLE `category_size` DISABLE KEYS */;
INSERT INTO `category_size` VALUES (27,1,1),(28,1,2),(29,1,3),(30,2,1),(31,2,2),(32,2,3),(33,3,1),(34,3,2);
/*!40000 ALTER TABLE `category_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `country` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fullname` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `note` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `payment_method` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcpl0mjoeqhxvgeeeq5piwpd3i` (`user_id`),
  CONSTRAINT `FKcpl0mjoeqhxvgeeeq5piwpd3i` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'3602 Gaylord Dr','2025-06-07','Việt Nam','phamminhhiep0402@gmail.com','Nguyễn Trang','','Payment on delivery','6308348000','Pending',1500000,2),(2,'3602 Gaylord Dr','2025-06-06','Hoa Kỳ','phamminhhiep0402@gmail.com','Nguyễn Trang','','Payment on delivery','6308348000','Succeeded',1500000,2),(3,'12 Đống Đa','2025-06-06','Việt Nam','phamminhhiep0402@gmail.com','Nguyễn Trang','','Payment with VNPay','6308348000','Succeeded',1500000,2),(4,'12 Lê Duẩn ','2025-06-07','Việt Nam','phamminhhiep0402@gmail.com','Nguyễn Trang','','Payment on delivery','6308348000','Pending',1500000,2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_size_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `size_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs234mi6jususbx4b37k44cipy` (`order_id`),
  KEY `FKhhtfmjxqj7awt1qmiydpp4n9e` (`product_size_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  KEY `FK8klnbu469mgjnuybpa6lbkljo` (`size_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK8klnbu469mgjnuybpa6lbkljo` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `FKhhtfmjxqj7awt1qmiydpp4n9e` FOREIGN KEY (`product_size_id`) REFERENCES `product_size` (`id`),
  CONSTRAINT `FKs234mi6jususbx4b37k44cipy` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,NULL,3,1),(2,1,2,NULL,3,1),(3,1,3,NULL,3,2),(4,1,4,NULL,3,2);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `description` varchar(11111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `is_selling` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `product_name` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sold` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2025-06-03','Áo dài đỏ truyền thống với họa tiết tinh tế',1,1,1200000,'Áo dài đỏ',10,1,'https://trangphuchonghanh.com/files/assets/tin_tuc/ao-dai-lua-to-tam-2.jpg',12),(2,'2025-06-03','Áo dài trắng học sinh dịu dàng, thanh lịch',1,1,1000000,'Áo dài trắng',5,1,'https://aodaiphuongdong.com/image/cache/catalog/san-pham/truyen%20thong/ao%20dai%20hoc%20sinh/THS008-800x1067.jpg',12),(3,'2025-05-30','Áo dài cách tân với họa tiết hoa nổi bật',1,1,1500000,'Áo dài hoa',7,2,'https://aodaisumo.com/wp-content/uploads/2022/11/9001F31D-7497-4BF4-BF3B-0813497D464F.jpeg',8),(4,'2025-06-03','Áo dài cách tân màu vàng chanh nổi bật',1,1,1600000,'Áo dài vàng',3,2,'https://aodaisumo.com/wp-content/uploads/2020/11/1CE55B72-EB05-426B-B346-F394FC8183B3.jpeg',22),(11,'2025-06-07','Set áo dài cách tân nữ Econice Nga Tô',1,NULL,990000,'Set áo dài cách tân nữ Econice Nga Tô',0,2,'http://res.cloudinary.com/dnoitd3ju/image/upload/v1749393062/bivu9m6laavcu5w8jpmj.png',12),(12,'2025-06-07','Sét bộ áo dài tơ thêu hoa',1,NULL,678000,'Sét bộ áo dài tơ thêu hoa',0,1,'http://res.cloudinary.com/dnoitd3ju/image/upload/v1749400051/p16dnorkywtubqn2iut0.png',12);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url_image` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6oo0cvcdtb6qmwsga468uuukk` (`product_id`),
  CONSTRAINT `FK6oo0cvcdtb6qmwsga468uuukk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `size_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8i3jm2ctt0lsyeik2wt76yvv0` (`product_id`),
  KEY `FKnlkh5xcjuopsnoimdvmumioia` (`size_id`),
  CONSTRAINT `FK8i3jm2ctt0lsyeik2wt76yvv0` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKnlkh5xcjuopsnoimdvmumioia` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size`
--

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `description` varchar(11111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `size_name` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,NULL,'L','L'),(2,NULL,'M','M'),(3,NULL,'S','S');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_number` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `role` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'3602 Gaylord Dr','admin@gmail.com','Nguyễn Thuỳ Trang','$2a$10$uZaIQELsBySLjCWEru9XEOAAajDAKU4r2i1PpkpRy2GssE4UWw6ye','6308348000','ADMIN',1),(2,'3602 Gaylord Dr','phamminhhiep0402@gmail.com','Nguyễn Trang','$2a$10$obOZRq.2xzUB9ATCJMje7upt1qZ1L7eIgZzdrmUq07Y69FWVOV/62','6308348000','USER',1),(3,'3602 Gaylord Dr','hvv@gmail.com','Hoàng Văn Vinh','123456a@A','6308348000','ADMIN',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'webaodai'
--

--
-- Dumping routines for database 'webaodai'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-08 23:29:23
