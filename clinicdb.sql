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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2023-07-15 09:00:00',1,'2023-07-19 09:00:00',1,2,6,4),(2,'2023-07-15 09:00:00',1,'2023-07-18 09:00:00',2,3,6,4),(3,'2023-10-08 00:00:00',0,NULL,NULL,NULL,6,NULL);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
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
  `num_med` int DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Paracetamol',10.50,'JAPAN',100,'2023-10-08','2024-10-08'),(2,'Amoxicillin',20.00,'KOREA',100,'2023-10-08','2024-10-08');
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
  `appointment_id` int DEFAULT NULL,
  `examination_fee` float DEFAULT '1000000',
  `payment_method` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apo_idx` (`appointment_id`),
  CONSTRAINT `apo` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,100000,'cash');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'2023-07-15 16:24:05','Prescription B','Fever, cough','Prescribed painkillers.'),(2,'2023-07-15 16:24:23','Prescription A','Fever, cough','Advised to gargle with warm water.'),(3,'2023-08-01 00:00:00','Prescription A','Fever, cough','Diagnosed with flu. Take rest.'),(4,'2023-08-02 00:00:00','Prescription B','Headache','Prescribed painkillers.'),(5,'2023-08-03 00:00:00','Prescription C','Sore throat','Advised to gargle with warm water.'),(6,'2023-08-04 00:00:00','Prescription D','Allergies','Recommended antihistamines.');
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
  `dosage` varchar(255) DEFAULT NULL,
  `instructions` text,
  PRIMARY KEY (`id`),
  KEY `prescription_item_ibfk_1` (`prescription_id`),
  KEY `prescription_item_ibfk_2` (`medicine_id`),
  CONSTRAINT `prescription_item_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`id`),
  CONSTRAINT `prescription_item_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_item`
--

LOCK TABLES `prescription_item` WRITE;
/*!40000 ALTER TABLE `prescription_item` DISABLE KEYS */;
INSERT INTO `prescription_item` VALUES (1,1,1,20,'500mg','Uống 1 viên mỗi 6 tiếng trong 3 ngày'),(2,1,2,10,'500mg','Uống 1 viên mỗi 8 tiếng trong 7 ngày'),(3,2,1,30,'500mg','Uống mỗi ngày một viên');
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
-- Table structure for table `schedule_clinic`
--

DROP TABLE IF EXISTS `schedule_clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_clinic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `u_idx` (`user_id`),
  CONSTRAINT `u` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_clinic`
--

LOCK TABLES `schedule_clinic` WRITE;
/*!40000 ALTER TABLE `schedule_clinic` DISABLE KEYS */;
INSERT INTO `schedule_clinic` VALUES (1,1,2),(2,0,3);
/*!40000 ALTER TABLE `schedule_clinic` ENABLE KEYS */;
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
  `schedule_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `SHI_idx` (`shift_id`),
  KEY `sche_idx` (`schedule_id`),
  CONSTRAINT `sche` FOREIGN KEY (`schedule_id`) REFERENCES `schedule_clinic` (`id`),
  CONSTRAINT `SHI` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_detail`
--

LOCK TABLES `schedule_detail` WRITE;
/*!40000 ALTER TABLE `schedule_detail` DISABLE KEYS */;
INSERT INTO `schedule_detail` VALUES ('2023-08-01',1,1,1),('2023-08-02',2,1,2),('2023-08-03',1,2,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_items`
--

LOCK TABLES `service_items` WRITE;
/*!40000 ALTER TABLE `service_items` DISABLE KEYS */;
INSERT INTO `service_items` VALUES (1,'2023-10-08 00:00:00',1,3);
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$12$m.6Wyu5HSAzwdv8RSQmxwuW24uapMoa8LPbrnCNZoaTkmE8yWsEyO',1,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691306503/avatar1.png','admin','042302340243','123ABC','123@123','1991-01-01','Nam'),(2,'doctor1','$2a$12$S6GNLW60N031dXxU5wYnMesRp1A1/Uj1XJ6IvOE8xP5XAkz2uftmS',2,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691307639/avatar2.png','Nguyễn Văn A','001233012312','123ABC','123@123','1992-02-02','Nam'),(3,'doctor2','$2a$12$ugHEVyKVH2nOSVjOQIeqGuEgEPsq0rhrgsz4OL8L0df84BIZG3i4y',2,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691307639/avatar2.png','Trịnh Bảo D','321231230132','123DCQ','123@124','1992-02-02','Nữ'),(4,'nurse1','$2a$12$C1R23YsWTklMn/gsICiyE.7rhXRKPXLITcs9ADVB8cqUhVOWjrisK',3,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691307639/avatar3.png','Phạm Huỳnh N','212301231230','123QWER','123@123','1993-03-03','Nữ'),(5,'nurse2','$2a$12$4U5WueGLKEQrpS9.te6g9.xl3XELxjp66qxirurQZYfNH3YJpQIW.',3,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691307639/avatar3.png','Trịnh Thanh B','1231231212','1121Q12','122@13','1993-03-03','Nam'),(6,'sickperson1','$2a$12$/5co2R/d2mrvBZ8oLhUjHeNyzP.wsuNlRaqFPKWmjwIAOXznflFqm',4,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691306503/avatar1.png','Nguyễn Văn P','12312312313','qADFEQ','123@123','1993-04-04','Nam'),(7,NULL,NULL,1,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691407329/n1v9tzudntetcmftbyp5.png','Trịnh Bảo Duy','0388853371','089202010041','2051050075duy@ou.edu.vn',NULL,'Nam'),(8,NULL,NULL,4,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691487808/manaftzcpxuc51is3tyj.png','Cô giáo','0388853371','089202010041','giao@ou.edgiao',NULL,'Nữ'),(9,NULL,NULL,2,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691554847/y2emx9kd0d6pppvnp6u4.png','Trịnh Bảo Duy','0388853371','089202010041','2051050075duy@ou.edu.vn',NULL,'Nam'),(10,NULL,NULL,2,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691563203/bh2tgu9qnl1ed0bpsbrc.png','Trịnh Bảo Duy','0388853371','089202010041','2051050075duy@ou.edu.vn',NULL,'Nam'),(11,NULL,NULL,2,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691563236/lgeqplb44rlblvgei3sb.png','Thanh','0388853371','089202010041','2051050075duy@ou.edu.vn',NULL,'Nữ'),(12,NULL,NULL,3,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691563270/srzsjsvxg0cgvgyamdnb.png','Thanh Thành Thanh','0388853371','089202010041','2051050075duy@ou.edu.vn',NULL,'Nữ'),(13,NULL,NULL,3,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691563866/pqzbizyukjveyko4vrry.png','Thanh Thành Thanh Thanh Thanh','0388853371','089202010041','2051050075duy@ou.edu.vn',NULL,'Nữ'),(20,NULL,NULL,1,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691573345/fjoaptoudj3on9upced7.jpg','Trịnh Bảo Duy','0388853371','089202010041','2051050075duy@ou.edu.vn',NULL,'Nam'),(21,NULL,NULL,4,'https://res.cloudinary.com/dstqvlt8d/image/upload/v1691720824/phzbo4dtxo587rrfhd9a.png','Yen Vi','123456789','Moon','vi@123',NULL,'Nữ');
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

-- Dump completed on 2023-08-14 12:32:59
