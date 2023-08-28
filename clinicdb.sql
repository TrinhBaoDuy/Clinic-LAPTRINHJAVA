CREATE DATABASE  IF NOT EXISTS `clinicdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinicdb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: clinicdb
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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_date` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `medicalappointment_date` datetime DEFAULT NULL,
  `prescription_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `sickperson_id` int DEFAULT NULL,
  `nurse_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `per_idx` (`prescription_id`),
  KEY `user_idx` (`doctor_id`),
  KEY `sick_idx` (`sickperson_id`),
  KEY `nu_idx` (`nurse_id`),
  CONSTRAINT `doc` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`id`),
  CONSTRAINT `nu` FOREIGN KEY (`nurse_id`) REFERENCES `user` (`id`),
  CONSTRAINT `per` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`id`),
  CONSTRAINT `sick` FOREIGN KEY (`sickperson_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2023-10-08 00:00:00',1,'2023-10-09 00:00:00',1,2,6,4),(2,'2023-10-08 00:00:00',1,'2023-10-09 00:00:00',NULL,9,6,4),(3,'2023-10-08 00:00:00',1,'2023-10-09 00:00:00',18,2,6,4),(4,'2023-10-08 00:00:00',1,'2023-10-09 00:00:00',NULL,9,4,4),(5,'2023-07-15 09:00:00',1,'2023-07-18 09:00:00',16,2,5,4),(6,'2023-08-02 00:00:00',1,NULL,19,2,6,4),(7,'2023-08-02 00:00:00',1,NULL,20,2,6,4),(8,'2023-08-24 00:00:00',1,NULL,22,2,6,4),(9,'2023-08-08 00:00:00',1,NULL,21,9,6,4),(12,'2023-08-11 00:00:00',1,NULL,1,2,6,4),(13,'2023-08-22 00:00:00',1,NULL,1,2,6,4),(14,'2023-08-27 00:00:00',1,NULL,1,2,6,4),(16,'2023-08-25 00:00:00',1,NULL,28,2,6,4),(17,'2023-08-23 00:00:00',1,NULL,29,2,6,4),(18,'2023-08-10 00:00:00',1,NULL,30,2,6,4),(19,'2023-09-09 00:00:00',1,NULL,31,2,6,4),(20,'2023-09-14 00:00:00',1,NULL,32,2,6,4),(21,'2023-09-05 00:00:00',1,NULL,33,2,6,4),(22,NULL,1,NULL,35,2,6,4),(23,'2023-08-26 00:00:00',1,NULL,34,2,6,4),(24,'2023-08-18 00:00:00',1,NULL,36,2,6,4),(25,'2023-08-09 00:00:00',1,NULL,37,2,6,4),(26,'2023-08-24 00:00:00',1,NULL,38,2,6,4),(27,'2023-08-09 00:00:00',1,NULL,39,2,6,4),(28,'2023-08-17 00:00:00',1,NULL,41,2,6,4),(29,'2023-08-17 00:00:00',1,NULL,NULL,2,6,4),(30,'2023-08-10 00:00:00',1,NULL,NULL,2,6,4),(31,'2023-08-26 00:00:00',1,NULL,NULL,2,6,4),(32,'2023-08-09 00:00:00',1,NULL,NULL,2,6,4),(33,'2023-08-25 00:00:00',1,NULL,NULL,2,6,4),(34,'2023-08-10 00:00:00',1,NULL,NULL,2,6,4),(35,'2023-08-10 00:00:00',0,NULL,NULL,NULL,6,NULL);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` varchar(45) NOT NULL,
  `appo_id` int DEFAULT NULL,
  `pay_id` int DEFAULT NULL,
  `pay_money` int DEFAULT NULL,
  `tienkham` int DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `apo_idx` (`appo_id`),
  KEY `pay_idx` (`pay_id`),
  KEY `kham_idx` (`tienkham`),
  CONSTRAINT `apo` FOREIGN KEY (`appo_id`) REFERENCES `appointment` (`id`),
  CONSTRAINT `kham` FOREIGN KEY (`tienkham`) REFERENCES `tienkham` (`id`),
  CONSTRAINT `pay` FOREIGN KEY (`pay_id`) REFERENCES `payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES ('1',1,1,1000000,1);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `provider` varchar(45) DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `id_unit` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_idx` (`id_unit`),
  CONSTRAINT `unit` FOREIGN KEY (`id_unit`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Paracetamol',10.50,'JAPAN','2023-10-08','2024-10-08',2,95),(2,'Amoxicillin',20.00,'KOREA','2023-10-08','2024-10-08',2,199),(8,'Thanh bug',15.00,'VIETNAM','2023-08-17','2023-09-17',3,295),(18,'Thanh bug',123.00,'123123','1111-11-11','1111-11-22',2,10),(19,'Thuốc Ý',10000000.00,'VIETNAM','2023-08-28','2023-08-29',6,1000);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'TIỀN MẶT'),(2,'MOMO'),(3,'ZALOPAY'),(4,'CASD');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prescription_date` datetime DEFAULT NULL,
  `prescriptioncol` varchar(45) DEFAULT NULL,
  `symptom` varchar(45) DEFAULT NULL,
  `conclusion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'2023-07-15 16:24:05','Prescription B','Fever, cough','Prescribed painkillers.'),(2,'2023-07-15 16:24:23','Prescription A','Fever, cough','Advised to gargle with warm water.'),(3,NULL,NULL,NULL,NULL),(4,'2023-08-02 00:00:00','Prescription B','Headache','Prescribed painkillers.'),(5,'2023-08-03 00:00:00','Prescription C','Sore throat','Advised to gargle with warm water.'),(6,'2023-08-04 00:00:00','Prescription D','Allergies','Recommended antihistamines.'),(15,'2023-08-24 00:00:00','1','cáº£m','ho hen'),(16,'2023-08-24 00:00:00','1','cáº£m','ho hen'),(17,'2023-08-24 00:00:00','1','cáº£m','ho hen'),(18,'2023-08-24 00:00:00','1','cáº£m','ho hen'),(19,'2023-08-24 00:00:00','1','cáº£m','ho hen'),(20,'2023-08-24 00:00:00','1','cáº£m','ho hen'),(21,'2023-08-24 00:00:00','1','cáº£m','ho hen'),(22,'2023-08-24 00:00:00','1','cáº£m láº¡nh','ho hen'),(26,'2023-08-25 00:00:00','1','cáº£m láº¡nh','ho hen'),(27,'2023-08-25 00:00:00','1','cáº£m','ho hen'),(28,'2023-08-25 00:00:00','1','cáº£m láº¡nh','ho hen'),(29,'2023-08-25 00:00:00','1','cáº£m láº¡nh','ho hen'),(30,'2023-08-25 00:00:00','1','cáº£m láº¡nh','ho hen'),(31,'2023-08-25 00:00:00','1','cáº£m','ho hen'),(32,'2023-08-25 00:00:00','1','Cáº£m','ho hen'),(33,'2023-08-25 00:00:00','1','cáº£m','ho hen'),(34,'2023-08-25 00:00:00','1','cáº£m láº¡nh','ho hen'),(35,'2023-08-25 00:00:00','1','cáº£m láº¡nh','ho hen'),(36,'2023-08-26 00:00:00','1','cáº£m láº¡nh','ho hen'),(37,'2023-08-26 00:00:00','1','cáº£m láº¡nh','ho hen'),(38,'2023-08-26 00:00:00','1','cáº£m','ho hen'),(39,'2023-08-27 00:00:00','1','cáº£m','ho hen'),(40,'2023-08-27 00:00:00','1','cáº£m láº¡nh','ho hen'),(41,'2023-08-27 00:00:00','1','cáº£m láº¡nh','ho hen');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_item`
--

DROP TABLE IF EXISTS `prescription_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prescription_id` int DEFAULT NULL,
  `medicine_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `instructions` text,
  PRIMARY KEY (`id`),
  KEY `prescription_item_ibfk_1` (`prescription_id`),
  KEY `prescription_item_ibfk_2` (`medicine_id`),
  CONSTRAINT `prescription_item_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`id`),
  CONSTRAINT `prescription_item_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_item`
--

LOCK TABLES `prescription_item` WRITE;
/*!40000 ALTER TABLE `prescription_item` DISABLE KEYS */;
INSERT INTO `prescription_item` VALUES (1,1,1,20,'Uống 1 viên mỗi 6 tiếng trong 3 ngày'),(2,1,2,10,'Uống 1 viên mỗi 8 tiếng trong 7 ngày'),(3,2,1,30,'Uống mỗi ngày một viên'),(5,NULL,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(6,NULL,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(7,NULL,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(8,NULL,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(9,NULL,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(10,29,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(11,30,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(12,31,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(13,32,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(14,33,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(15,34,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(16,35,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(17,35,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(18,35,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(19,35,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(20,37,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(21,37,1,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(27,39,8,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(28,39,2,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(29,39,8,2,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(30,39,8,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(33,38,1,2,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(34,38,18,2,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau'),(35,38,8,1,'uá»ng vÃ o buá»i sÃ¡ng hÃ´m sau');
/*!40000 ALTER TABLE `prescription_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_DOCTOR'),(3,'ROLE_NURSE'),(4,'ROLE_SICKPERSON');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_detail`
--

DROP TABLE IF EXISTS `schedule_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_detail` (
  `date_schedule` date DEFAULT NULL,
  `shift_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SHI_idx` (`shift_id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `SHI` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id`),
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_detail`
--

LOCK TABLES `schedule_detail` WRITE;
/*!40000 ALTER TABLE `schedule_detail` DISABLE KEYS */;
INSERT INTO `schedule_detail` VALUES ('2023-08-01',1,1,1,1),('2023-08-02',2,1,2,1),('2023-08-03',1,2,3,1),('2023-08-28',1,2,4,NULL),('2023-09-03',1,2,5,NULL),('2023-08-30',1,2,6,NULL),('2023-08-28',1,2,7,NULL),('2023-08-29',1,2,8,NULL),('2023-08-29',1,2,9,NULL),('2023-09-03',1,2,10,NULL),('2023-08-29',1,3,11,NULL),('2023-09-02',1,3,12,NULL),('2023-08-31',1,3,13,NULL),('2023-09-03',1,2,14,NULL),('2023-08-30',1,2,15,NULL);
/*!40000 ALTER TABLE `schedule_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'X-QUANG',500000),(2,'TỔNG QUÁT',1000000),(3,'XÉT NGHIỆM MÁU',200000),(4,'XÉT NGHIỆM ADN',400000);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_items`
--

DROP TABLE IF EXISTS `service_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_items` (
  `appo_id` int DEFAULT NULL,
  `date_ser` datetime DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `se_idx` (`service_id`),
  KEY `appo_idx` (`appo_id`),
  CONSTRAINT `appo` FOREIGN KEY (`appo_id`) REFERENCES `appointment` (`id`),
  CONSTRAINT `se` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_items`
--

LOCK TABLES `service_items` WRITE;
/*!40000 ALTER TABLE `service_items` DISABLE KEYS */;
INSERT INTO `service_items` VALUES (1,'2023-10-08 00:00:00',1,3),(4,'2023-10-08 00:00:00',2,2),(2,'2023-10-08 00:00:00',4,1),(3,'2023-10-08 00:00:00',5,2),(3,'2023-08-24 00:00:00',8,2),(3,'2023-08-24 00:00:00',9,1),(7,'2023-08-24 00:00:00',10,1),(3,'2023-08-24 00:00:00',11,2),(3,'2023-08-24 00:00:00',12,2),(3,'2023-08-24 00:00:00',13,2),(3,'2023-08-24 00:00:00',14,2),(13,'2023-08-24 00:00:00',18,3),(13,'2023-08-24 00:00:00',19,2),(12,'2023-08-25 00:00:00',20,2),(16,NULL,24,NULL),(17,NULL,25,NULL),(18,NULL,26,NULL),(19,NULL,27,NULL),(20,NULL,28,NULL),(21,NULL,29,NULL),(23,NULL,30,NULL),(22,NULL,31,NULL),(24,NULL,32,NULL),(25,NULL,33,NULL),(26,NULL,34,NULL),(27,NULL,35,NULL),(28,NULL,36,NULL),(28,NULL,37,NULL);
/*!40000 ALTER TABLE `service_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'Ca sáng','08:00:00','16:00:00'),(2,'Ca chiều','16:00:00','00:00:00'),(3,'Ca đêm','00:00:00','08:00:00');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienkham`
--

DROP TABLE IF EXISTS `tienkham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienkham` (
  `id` int NOT NULL,
  `tienkham` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienkham`
--

LOCK TABLES `tienkham` WRITE;
/*!40000 ALTER TABLE `tienkham` DISABLE KEYS */;
INSERT INTO `tienkham` VALUES (1,100000);
/*!40000 ALTER TABLE `tienkham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'Hộp'),(2,'Viên'),(3,'Vỉ thuốc'),(4,'Gram'),(5,'Ống'),(6,'Gối');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `role_id` int NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `emaill` varchar(45) DEFAULT NULL,
  `dod` date DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_idx` (`role_id`),
  CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$12$m.6Wyu5HSAzwdv8RSQmxwuW24uapMoa8LPbrnCNZoaTkmE8yWsEyO',1,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691306503/avatar1.png','admin','042302340243','123ABC','123@123','1991-01-01','Nam'),(2,'doctor1','$2a$12$S6GNLW60N031dXxU5wYnMesRp1A1/Uj1XJ6IvOE8xP5XAkz2uftmS',2,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691307639/avatar2.png','Nguyễn Văn A','001233012312','123ABC','123@123','1992-02-02','Nam'),(3,'doctor2','$2a$12$ugHEVyKVH2nOSVjOQIeqGuEgEPsq0rhrgsz4OL8L0df84BIZG3i4y',2,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691307639/avatar2.png','Trịnh Bảo D','321231230132','123DCQ','123@124','1992-02-02','Nữ'),(4,'nurse1','$2a$12$C1R23YsWTklMn/gsICiyE.7rhXRKPXLITcs9ADVB8cqUhVOWjrisK',3,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691307639/avatar3.png','Phạm Huỳnh N','212301231230','123QWER','2051050075duy@ou.edu.vn','1993-03-03','Nữ'),(5,'nurse2','$2a$12$4U5WueGLKEQrpS9.te6g9.xl3XELxjp66qxirurQZYfNH3YJpQIW.',3,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691307639/avatar3.png','Trịnh Thanh B','1231231212','1121Q12','122@13','1993-03-03','Nam'),(6,'sickperson1','$2a$12$/5co2R/d2mrvBZ8oLhUjHeNyzP.wsuNlRaqFPKWmjwIAOXznflFqm',4,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691306503/avatar1.png','Nguyễn Văn P','12312312313','qADFEQ','2051050381phuoc@ou.edu.vn','1993-04-04','Nam'),(7,NULL,NULL,1,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691407329/n1v9tzudntetcmftbyp5.png','Trịnh Bảo Duy','0388853371','089202010041','2051050075duy@ou.edu.vn',NULL,'Nam'),(8,NULL,NULL,4,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691487808/manaftzcpxuc51is3tyj.png','Cô giáo','0388853371','089202010041','giao@ou.edgiao',NULL,'Nữ'),(9,NULL,NULL,2,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691554847/y2emx9kd0d6pppvnp6u4.png','Trịnh Bảo Duy','0388853371','089202010041','2051050075duy@ou.edu.vn',NULL,'Nam'),(10,NULL,NULL,2,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691563203/bh2tgu9qnl1ed0bpsbrc.png','Trịnh Bảo Duy','0388853371','089202010041','2051050075duy@ou.edu.vn',NULL,'Nam'),(23,'thanh','123',4,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1693133917/stzdaleqwxvmlxfa0itq.png','thanh','0388853371','089202010041','2051050075duy@ou.edu.vn','2023-08-10','Nữ'),(24,'duy','$2a$10$e6RAi7FaR.tm2wrys14nyub5NhCCLGo5z.nOCAhykiItH5pc0KUPG',4,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1693133812/vxzfmxxnwfeitkkcdd1g.png','duy','0388853371','089202010041','2051050075duy@ou.edu.vn','2023-08-22','Nam');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-28 16:10:07
