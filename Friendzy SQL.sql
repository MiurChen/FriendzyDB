CREATE DATABASE  IF NOT EXISTS `friendzy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `friendzy`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: friendzy
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `applicant`
--

DROP TABLE IF EXISTS `applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `applicant_account` int NOT NULL,
  `application_date` datetime DEFAULT NULL,
  `apply_status` tinyint DEFAULT NULL,
  `application_result` tinyint DEFAULT NULL,
  PRIMARY KEY (`service_id`,`applicant_account`),
  KEY `applicant_account` (`applicant_account`),
  CONSTRAINT `applicant_ibfk_1` FOREIGN KEY (`applicant_account`) REFERENCES `member_info` (`member_no`),
  CONSTRAINT `applicant_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant`
--

LOCK TABLES `applicant` WRITE;
/*!40000 ALTER TABLE `applicant` DISABLE KEYS */;
INSERT INTO `applicant` VALUES (1,1,'2024-12-29 10:00:00',1,0),(2,2,'2024-12-28 12:00:00',1,1),(3,3,'2024-12-27 14:30:00',1,0),(4,4,'2024-12-26 16:15:00',1,1),(5,5,'2024-12-25 09:45:00',0,0);
/*!40000 ALTER TABLE `applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_deploy`
--

DROP TABLE IF EXISTS `area_deploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_deploy` (
  `member_no` int NOT NULL,
  `area_info_no` char(5) NOT NULL,
  PRIMARY KEY (`member_no`,`area_info_no`),
  KEY `area_info_no` (`area_info_no`),
  CONSTRAINT `area_deploy_ibfk_1` FOREIGN KEY (`member_no`) REFERENCES `member_info` (`member_no`),
  CONSTRAINT `area_deploy_ibfk_2` FOREIGN KEY (`area_info_no`) REFERENCES `service_area` (`area_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_deploy`
--

LOCK TABLES `area_deploy` WRITE;
/*!40000 ALTER TABLE `area_deploy` DISABLE KEYS */;
INSERT INTO `area_deploy` VALUES (1,'A001'),(2,'A002'),(3,'A003'),(4,'A004'),(5,'A005');
/*!40000 ALTER TABLE `area_deploy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas_of_expertise`
--

DROP TABLE IF EXISTS `areas_of_expertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas_of_expertise` (
  `expertise_no` char(5) NOT NULL,
  `expertise_label` varchar(30) NOT NULL,
  PRIMARY KEY (`expertise_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_of_expertise`
--

LOCK TABLES `areas_of_expertise` WRITE;
/*!40000 ALTER TABLE `areas_of_expertise` DISABLE KEYS */;
INSERT INTO `areas_of_expertise` VALUES ('SK001','Web Development'),('SK002','Graphic Design'),('SK003','Photography'),('SK004','Cooking'),('SK005','Basketball');
/*!40000 ALTER TABLE `areas_of_expertise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist` (
  `user_id` int NOT NULL,
  `blacklist_id` int NOT NULL,
  `blacklist_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`blacklist_id`),
  KEY `blacklist_id` (`blacklist_id`),
  CONSTRAINT `blacklist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `member_info` (`member_no`),
  CONSTRAINT `blacklist_ibfk_2` FOREIGN KEY (`blacklist_id`) REFERENCES `member_info` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
INSERT INTO `blacklist` VALUES (1,2,'Unacceptable behavior during service.'),(2,3,'Repeated cancellations of services.'),(3,4,'Inappropriate comments during bookings.'),(4,5,'Failure to follow service terms.'),(5,1,'Non-payment after service completion.');
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_room`
--

DROP TABLE IF EXISTS `chat_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_room` (
  `room_no` int NOT NULL AUTO_INCREMENT,
  `room_user_one` int DEFAULT NULL,
  `room_user_two` int DEFAULT NULL,
  PRIMARY KEY (`room_no`),
  KEY `room_user_one` (`room_user_one`),
  KEY `room_user_two` (`room_user_two`),
  CONSTRAINT `chat_room_ibfk_1` FOREIGN KEY (`room_user_one`) REFERENCES `member_info` (`member_no`),
  CONSTRAINT `chat_room_ibfk_2` FOREIGN KEY (`room_user_two`) REFERENCES `member_info` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_room`
--

LOCK TABLES `chat_room` WRITE;
/*!40000 ALTER TABLE `chat_room` DISABLE KEYS */;
INSERT INTO `chat_room` VALUES (1,1,2),(2,2,3),(3,3,4),(4,4,5),(5,5,1);
/*!40000 ALTER TABLE `chat_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_mgmt`
--

DROP TABLE IF EXISTS `complaint_mgmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint_mgmt` (
  `order_id` int NOT NULL,
  `complaint` int NOT NULL,
  `complaint_content` varchar(100) NOT NULL,
  `complaint_date` datetime DEFAULT NULL,
  `resolution_status` tinyint DEFAULT NULL,
  `closure_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`,`complaint`),
  CONSTRAINT `complaint_mgmt_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_mgmt`
--

LOCK TABLES `complaint_mgmt` WRITE;
/*!40000 ALTER TABLE `complaint_mgmt` DISABLE KEYS */;
INSERT INTO `complaint_mgmt` VALUES (1,1,'Service not completed on time.','2024-12-30 10:30:00',0,NULL),(2,2,'The photos were not as expected.','2024-12-29 12:20:00',1,'2024-12-29 14:00:00'),(3,1,'The gardening work was not done well.','2024-12-28 13:30:00',0,NULL),(4,1,'Food was cold during delivery.','2024-12-27 15:10:00',1,'2024-12-27 16:00:00'),(5,2,'Logo design was not to my liking.','2024-12-26 17:00:00',0,NULL);
/*!40000 ALTER TABLE `complaint_mgmt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `question` varchar(50) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES ('How do I book a service?','Simply select the service, choose the date and time, and confirm your booking.'),('How can I change my profile picture?','Go to your profile settings and upload a new picture.'),('How do I report a problem with my order?','You can file a complaint from your order details page.'),('How can I contact customer support?','You can contact customer support through the app or website.'),('What is the cancellation policy?','You can cancel the service up to 24 hours before the scheduled time.');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `hunter` int NOT NULL,
  `be_hunted` int NOT NULL,
  PRIMARY KEY (`hunter`,`be_hunted`),
  KEY `be_hunted` (`be_hunted`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`hunter`) REFERENCES `member_info` (`member_no`),
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`be_hunted`) REFERENCES `member_info` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (5,1),(1,2),(2,3),(3,4),(4,5);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_info`
--

DROP TABLE IF EXISTS `member_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_info` (
  `member_no` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `mpassword` varchar(64) NOT NULL,
  `member_name` varchar(20) NOT NULL,
  `member_nick_name` varchar(20) DEFAULT NULL,
  `member_pic` varchar(500) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `introduction` varchar(100) DEFAULT NULL,
  `companion_comment` int DEFAULT NULL,
  `companion_score` int DEFAULT NULL,
  `custmer_comment` int DEFAULT NULL,
  `custmer_score` int DEFAULT NULL,
  `registration_time` datetime DEFAULT NULL,
  `member_status` tinyint(1) DEFAULT NULL,
  `member_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`member_no`),
  UNIQUE KEY `unique_token` (`member_token`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_info`
--

LOCK TABLES `member_info` WRITE;
/*!40000 ALTER TABLE `member_info` DISABLE KEYS */;
INSERT INTO `member_info` VALUES (1,'john.doe@example.com','hashedpassword1','John Doe','Johnny','http://example.com/pic1.jpg','0912345678','Love to travel and explore new places.',10,4,5,3,'2024-12-29 10:30:00',1,'token1'),(2,'jane.smith@example.com','hashedpassword2','Jane Smith','Janey','http://example.com/pic2.jpg','0923456789','A passionate cook and a bookworm.',20,5,10,4,'2024-12-28 09:20:00',1,'token2'),(3,'alex.jones@example.com','hashedpassword3','Alex Jones','Alex','http://example.com/pic3.jpg','0934567890','Enthusiast in tech and gadgets.',15,3,8,2,'2024-12-27 11:45:00',1,'token3'),(4,'mary.johnson@example.com','hashedpassword4','Mary Johnson','Mary','http://example.com/pic4.jpg','0945678901','Lover of pets and nature walks.',12,4,9,4,'2024-12-26 14:00:00',1,'token4'),(5,'peter.brown@example.com','hashedpassword5','Peter Brown','Pete','http://example.com/pic5.jpg','0956789012','Avid photographer and traveler.',18,5,7,4,'2024-12-25 16:10:00',1,'token5'),(6,'1234@gmail.com','12345678','Miu',NULL,NULL,NULL,NULL,0,0,0,0,'2024-12-30 23:47:55',1,NULL),(7,'12345678@gmail.com','12345678','Mary',NULL,NULL,NULL,NULL,0,0,0,0,'2024-12-30 23:53:50',1,NULL),(8,'1234567890@gmail.com','12345678','Miu',NULL,NULL,NULL,NULL,0,0,0,0,'2025-01-01 15:06:08',1,NULL),(9,'93812846@gmail.com','12345678','Miu',NULL,NULL,NULL,NULL,0,0,0,0,'2025-01-01 17:03:50',1,NULL),(10,'222@gmail.com','1234567890','Miu',NULL,NULL,NULL,NULL,0,0,0,0,'2025-01-02 18:14:36',1,NULL),(11,'22233@gmail.com','1234567890','Miu',NULL,NULL,NULL,NULL,0,0,0,0,'2025-01-02 18:50:18',1,NULL),(12,'2223344@gmail.com','1234567890','Miu',NULL,NULL,NULL,NULL,0,0,0,0,'2025-01-02 21:49:24',1,NULL),(13,'test@example.com','12345678','John Doe',NULL,NULL,NULL,NULL,0,0,0,0,'2025-01-03 00:01:04',1,NULL),(14,'111111@gmail.com','11111111','eee',NULL,NULL,NULL,NULL,0,0,0,0,'2025-01-03 14:04:09',1,NULL),(15,'1209@gmail.com.tw','11111111','brbr',NULL,NULL,NULL,NULL,0,0,0,0,'2025-01-03 14:08:37',1,NULL);
/*!40000 ALTER TABLE `member_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_no` int NOT NULL AUTO_INCREMENT,
  `room_no` int DEFAULT NULL,
  `sender_id` int DEFAULT NULL,
  `message` text,
  `sent_time` datetime DEFAULT NULL,
  `receiver_id` int DEFAULT NULL,
  `sender_token` varchar(255) DEFAULT NULL,
  `receiver_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`message_no`),
  KEY `room_no` (`room_no`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  KEY `sender_token` (`sender_token`),
  KEY `receiver_token` (`receiver_token`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`room_no`) REFERENCES `chat_room` (`room_no`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `member_info` (`member_no`),
  CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`receiver_id`) REFERENCES `member_info` (`member_no`),
  CONSTRAINT `messages_ibfk_4` FOREIGN KEY (`sender_token`) REFERENCES `member_info` (`member_token`),
  CONSTRAINT `messages_ibfk_5` FOREIGN KEY (`receiver_token`) REFERENCES `member_info` (`member_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Hello, I have a question about your service.','2024-12-29 10:10:00',2,'token1','token2'),(2,2,2,'I am interested in your photography service.','2024-12-28 12:15:00',3,'token2','token3'),(3,3,3,'Can you please send me more details about your gardening service?','2024-12-27 14:35:00',4,'token3','token4'),(4,4,4,'Looking forward to working with you!','2024-12-26 16:40:00',5,'token4','token5'),(5,5,5,'Thanks for the branding, it looks great!','2024-12-25 16:50:00',1,'token5','token1');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notif_no` int NOT NULL AUTO_INCREMENT,
  `reciver` int DEFAULT NULL,
  `notif_content` varchar(100) DEFAULT NULL,
  `notif_date` datetime DEFAULT NULL,
  `notif_read_status` tinyint DEFAULT NULL,
  PRIMARY KEY (`notif_no`),
  KEY `reciver` (`reciver`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`reciver`) REFERENCES `member_info` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,1,'You have a new message from Alex.','2024-12-29 10:05:00',0),(2,2,'Your application has been accepted!','2024-12-28 12:10:00',1),(3,3,'Reminder: Your service is starting in 30 minutes.','2024-12-27 11:50:00',0),(4,4,'You have been added to a new chat room.','2024-12-26 16:30:00',1),(5,5,'Your service has been successfully completed.','2024-12-25 16:20:00',0);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_list` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `service_idno` int DEFAULT NULL,
  `order_person` int NOT NULL,
  `customer_rate` int DEFAULT NULL,
  `customer_rate_content` varchar(50) DEFAULT NULL,
  `companion_rate` int DEFAULT NULL,
  `companion_rate_content` varchar(50) DEFAULT NULL,
  `order_price` double NOT NULL,
  `order_status` tinyint DEFAULT NULL,
  `order_poster` int DEFAULT NULL,
  `order_title` varchar(30) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `service_idno` (`service_idno`),
  KEY `order_person` (`order_person`),
  KEY `order_poster` (`order_poster`),
  CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`service_idno`) REFERENCES `service` (`service_id`),
  CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`order_person`) REFERENCES `member_info` (`member_no`),
  CONSTRAINT `order_list_ibfk_3` FOREIGN KEY (`order_poster`) REFERENCES `member_info` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` VALUES (1,1,2,5,'Excellent service, very happy with the design.',4,'Great photography.',1500,0,1,''),(2,2,3,4,'Good photography but could improve lighting.',5,'Great job on the event shoot!',700,1,2,''),(3,3,4,3,'Service was okay, not as expected.',4,'Good gardening work.',500,2,3,''),(4,4,5,5,'Delicious food, will book again.',5,'Food was amazing!',900,3,4,''),(5,5,1,5,'Loved the logo design, very creative!',5,'Perfect branding work.',1200,1,5,'');
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `service_poster` int NOT NULL,
  `service` varchar(30) NOT NULL,
  `servicr_detail` varchar(100) DEFAULT NULL,
  `service_pic` varchar(500) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `finished_time` datetime NOT NULL,
  `sverice_charge` double NOT NULL,
  `service_status` tinyint NOT NULL,
  `service_location` char(5) DEFAULT NULL,
  `poster_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `service_poster` (`service_poster`),
  KEY `service_location` (`service_location`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`service_poster`) REFERENCES `member_info` (`member_no`),
  CONSTRAINT `service_ibfk_2` FOREIGN KEY (`service_location`) REFERENCES `service_area` (`area_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,1,'Website Design','Complete website development and design.','http://example.com/service1.jpg','2024-12-30 09:00:00','2024-12-30 18:00:00',1000,1,'A001',0),(2,2,'Photography','Professional photography for events.','http://example.com/service2.jpg','2024-12-29 10:00:00','2024-12-29 15:00:00',500,1,'A002',0),(3,3,'Gardening','Landscape gardening and design services.','http://example.com/service3.jpg','2024-12-28 11:00:00','2024-12-28 16:00:00',300,1,'A003',0),(4,4,'Cooking','Catering for events and private dinners.','http://example.com/service4.jpg','2024-12-27 12:00:00','2024-12-27 17:00:00',700,1,'A004',0),(5,5,'Graphic Design','Custom logo and branding designs.','http://example.com/service5.jpg','2024-12-26 13:00:00','2024-12-26 18:00:00',1200,1,'A005',0);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_area`
--

DROP TABLE IF EXISTS `service_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_area` (
  `area_no` char(5) NOT NULL,
  `area_city` varchar(30) NOT NULL,
  `area_district` varchar(30) NOT NULL,
  PRIMARY KEY (`area_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_area`
--

LOCK TABLES `service_area` WRITE;
/*!40000 ALTER TABLE `service_area` DISABLE KEYS */;
INSERT INTO `service_area` VALUES ('A001','Taipei','Xinyi'),('A002','Kaohsiung','Lingya'),('A003','Taichung','West'),('A004','Tainan','East'),('A005','Hsinchu','North');
/*!40000 ALTER TABLE `service_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_deploy`
--

DROP TABLE IF EXISTS `skill_deploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_deploy` (
  `member_no` int NOT NULL,
  `expertise_no` char(5) NOT NULL,
  PRIMARY KEY (`member_no`,`expertise_no`),
  KEY `expertise_no` (`expertise_no`),
  CONSTRAINT `skill_deploy_ibfk_1` FOREIGN KEY (`member_no`) REFERENCES `member_info` (`member_no`),
  CONSTRAINT `skill_deploy_ibfk_2` FOREIGN KEY (`expertise_no`) REFERENCES `areas_of_expertise` (`expertise_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_deploy`
--

LOCK TABLES `skill_deploy` WRITE;
/*!40000 ALTER TABLE `skill_deploy` DISABLE KEYS */;
INSERT INTO `skill_deploy` VALUES (1,'SK001'),(2,'SK002'),(3,'SK003'),(4,'SK004'),(5,'SK005');
/*!40000 ALTER TABLE `skill_deploy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 14:40:30
