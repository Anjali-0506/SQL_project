-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: blood_bank_management_system
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(225) NOT NULL,
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Alice Johnson','alice.johnson@example.com','admin1234'),(2,'Bob Smith','bob.smith@example.com','securePass567'),(3,'Charlie Brown','charlie.brown@example.com','password789'),(4,'David Wilson','david.wilson@example.com','adminPass321'),(5,'Emma Davis','emma.davis@example.com','secure9876'),(6,'Frank Miller','frank.miller@example.com','admin2024'),(7,'Grace Moore','grace.moore@example.com','passAdmin999'),(8,'Hannah White','hannah.white@example.com','superSecure555'),(9,'Isaac Martinez','isaac.martinez@example.com','admin777'),(10,'Jack Taylor','jack.taylor@example.com','manager123'),(11,'Karen Anderson','karen.anderson@example.com','adminSuper456'),(12,'Liam Thomas','liam.thomas@example.com','strongPass890'),(13,'Mia Harris','mia.harris@example.com','adminProtected111'),(14,'Noah Clark','noah.clark@example.com','passwordSafe222'),(15,'Olivia Lewis','olivia.lewis@example.com','secureLogIn333'),(16,'Paul Young','paul.young@example.com','passAdmin777'),(17,'Quinn King','quinn.king@example.com','securityLock888'),(18,'Rachel Scott','rachel.scott@example.com','adminSafe999'),(19,'Samuel Adams','samuel.adams@example.com','passMaster123'),(20,'Tina Lopez','tina.lopez@example.com','ultimateSecure555');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodstock`
--

DROP TABLE IF EXISTS `bloodstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodstock` (
  `bloodID` int NOT NULL AUTO_INCREMENT,
  `bloodtype` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL,
  `quantityavailable` int DEFAULT '0',
  `collectionDate` date NOT NULL,
  `expiryDate` date NOT NULL,
  PRIMARY KEY (`bloodID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodstock`
--

LOCK TABLES `bloodstock` WRITE;
/*!40000 ALTER TABLE `bloodstock` DISABLE KEYS */;
INSERT INTO `bloodstock` VALUES (1,'O+',5,'2024-03-01','2024-06-01'),(2,'A-',3,'2024-03-05','2024-06-05'),(3,'B+',7,'2024-03-10','2024-06-10'),(4,'AB-',4,'2024-03-12','2024-06-12'),(5,'O-',6,'2024-03-15','2024-06-15'),(6,'A+',8,'2024-03-18','2024-06-18'),(7,'B-',2,'2024-03-20','2024-06-20'),(8,'AB+',9,'2024-03-22','2024-06-22'),(9,'O+',10,'2024-03-25','2024-06-25'),(10,'A-',5,'2024-03-28','2024-06-28'),(11,'B+',6,'2024-04-01','2024-07-01'),(12,'AB-',3,'2024-04-05','2024-07-05'),(13,'O-',7,'2024-04-10','2024-07-10'),(14,'A+',4,'2024-04-12','2024-07-12'),(15,'B-',5,'2024-04-15','2024-07-15'),(16,'AB+',8,'2024-04-18','2024-07-18'),(17,'O+',9,'2024-04-20','2024-07-20'),(18,'A-',2,'2024-04-22','2024-07-22'),(19,'B+',3,'2024-04-25','2024-07-25'),(20,'AB-',10,'2024-04-28','2024-07-28');
/*!40000 ALTER TABLE `bloodstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `donationID` int NOT NULL AUTO_INCREMENT,
  `donorID` int DEFAULT NULL,
  `bloodID` int DEFAULT NULL,
  `donationDate` date NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`donationID`),
  KEY `donorID` (`donorID`),
  KEY `bloodID` (`bloodID`),
  CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`donorID`) REFERENCES `donor` (`donorID`) ON DELETE CASCADE,
  CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`bloodID`) REFERENCES `bloodstock` (`bloodID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (1,1,1,'2024-03-01',1),(2,2,2,'2024-03-05',2),(3,3,3,'2024-03-10',1),(4,4,4,'2024-03-12',3),(5,5,5,'2024-03-15',2),(6,6,6,'2024-03-18',1),(7,7,7,'2024-03-20',2),(8,8,8,'2024-03-22',3),(9,9,9,'2024-03-25',1),(10,10,10,'2024-03-28',2),(11,11,11,'2024-04-01',1),(12,12,12,'2024-04-05',2),(13,13,13,'2024-04-10',3),(14,14,14,'2024-04-12',1),(15,15,15,'2024-04-15',2),(16,16,16,'2024-04-18',1),(17,17,17,'2024-04-20',3),(18,18,18,'2024-04-22',2),(19,19,19,'2024-04-25',1),(20,20,20,'2024-04-28',3);
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `donorID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `bloodtype` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `lastdonationDate` date DEFAULT NULL,
  PRIMARY KEY (`donorID`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `donor_chk_1` CHECK ((`age` >= 18))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (1,'John Doe',28,'male','O+','1111111111','123 Street, New York','2024-01-15'),(2,'Jane Smith',35,'female','A-','2222222222','456 Avenue, Los Angeles','2024-02-10'),(3,'Michael Johnson',40,'male','B+','3333333333','789 Road, Chicago','2024-03-05'),(4,'Emily Davis',29,'female','AB-','4444444444','567 Blvd, Houston','2024-03-20'),(5,'Daniel Martinez',37,'male','O-','5555555555','901 Lane, Miami','2024-04-01'),(6,'Sophia Brown',32,'female','A+','6666666666','102 Street, San Francisco','2023-12-20'),(7,'Ethan Williams',45,'male','B-','7777777777','222 Road, Boston','2024-02-25'),(8,'Olivia Taylor',30,'female','O+','8888888888','333 Avenue, Seattle','2024-03-12'),(9,'Liam Wilson',42,'male','AB+','9999999999','444 Lane, Denver','2023-11-18'),(10,'Emma Johnson',38,'female','O-','1010101010','555 Blvd, Austin','2024-01-30'),(11,'Noah Garcia',29,'male','A-','1212121212','666 Road, Phoenix','2024-03-01'),(12,'Ava Martinez',34,'female','B+','1313131313','777 Drive, Philadelphia','2023-12-15'),(13,'William Lee',41,'male','AB-','1414141414','888 Circle, Dallas','2024-02-05'),(14,'Mia Anderson',36,'female','O+','1515151515','999 Street, San Diego','2024-03-08'),(15,'James Thomas',27,'male','A+','1616161616','111 Lane, Atlanta','2024-01-12'),(16,'Charlotte Hernandez',39,'female','B-','1717171717','222 Road, Las Vegas','2023-11-25'),(17,'Benjamin Young',44,'male','O+','1818181818','333 Drive, Detroit','2024-02-14'),(18,'Amelia King',31,'female','AB+','1919191919','444 Blvd, Portland','2023-12-30'),(19,'Lucas Scott',26,'male','B+','2020202020','555 Avenue, Houston','2024-03-15'),(20,'Isabella Lopez',33,'female','A-','2121212121','666 Circle, Tampa','2024-02-28');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipient`
--

DROP TABLE IF EXISTS `recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipient` (
  `RecipientID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `Gender` enum('male','female','other') DEFAULT NULL,
  `BloodtypeRequired` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `hospital` varchar(100) NOT NULL,
  PRIMARY KEY (`RecipientID`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipient`
--

LOCK TABLES `recipient` WRITE;
/*!40000 ALTER TABLE `recipient` DISABLE KEYS */;
INSERT INTO `recipient` VALUES (1,'Alice Brown',40,'female','O+','3111111111','101 Avenue, NY','City Hospital'),(2,'Bob Johnson',50,'male','A-','3222222222','202 Road, LA','Red Cross Hospital'),(3,'Chris Wilson',45,'male','B+','3333333333','303 Street, Chicago','Metro Health Center'),(4,'Sophia Lee',30,'female','AB-','3444444444','404 Drive, Houston','Sunrise Hospital'),(5,'Ethan Thomas',55,'male','O-','3555555555','505 Circle, Miami','National Blood Center'),(6,'Emma Scott',29,'female','A+','3666666666','606 Lane, Dallas','St. Mary\'s Hospital'),(7,'Daniel White',42,'male','B-','3777777777','707 Avenue, Seattle','City Hospital'),(8,'Olivia Green',33,'female','O+','3888888888','808 Road, Boston','General Medical Center'),(9,'Liam Carter',48,'male','AB+','3999999999','909 Street, Denver','Hope Clinic'),(10,'Mia Hall',37,'female','O-','3101010101','1010 Blvd, Austin','Unity Health Center'),(11,'Noah Adams',31,'male','A-','3112121212','1111 Drive, Phoenix','City Hospital'),(12,'Ava Nelson',43,'female','B+','3123131313','1212 Lane, Philadelphia','Community Medical Center'),(13,'William Baker',46,'male','AB-','3134141414','1313 Road, Detroit','Grace Hospital'),(14,'Charlotte Harris',39,'female','O+','3145151515','1414 Circle, San Diego','Wellness Medical Center'),(15,'James Rivera',28,'male','A+','3156161616','1515 Avenue, Atlanta','St. Luke\'s Hospital'),(16,'Evelyn Cooper',41,'female','B-','3167171717','1616 Street, Las Vegas','Providence Medical Center'),(17,'Benjamin Torres',44,'male','O+','3178181818','1717 Blvd, Portland','Health First Hospital'),(18,'Amelia Ramirez',32,'female','AB+','3189191919','1818 Road, Tampa','Mercy Medical Center'),(19,'Lucas Martinez',36,'male','B+','3190202020','1919 Lane, Houston','Guardian Hospital'),(20,'Isabella Walker',34,'female','A-','3201212121','2020 Circle, New Orleans','New Hope Medical Center');
/*!40000 ALTER TABLE `recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `requestID` int NOT NULL AUTO_INCREMENT,
  `recipientid` int DEFAULT NULL,
  `bloodid` int DEFAULT NULL,
  `requestdate` date NOT NULL,
  `status` enum('pending','approved','rejected','completed') DEFAULT 'pending',
  PRIMARY KEY (`requestID`),
  KEY `recipientid` (`recipientid`),
  KEY `bloodid` (`bloodid`),
  CONSTRAINT `request_ibfk_1` FOREIGN KEY (`recipientid`) REFERENCES `recipient` (`RecipientID`) ON DELETE CASCADE,
  CONSTRAINT `request_ibfk_2` FOREIGN KEY (`bloodid`) REFERENCES `bloodstock` (`bloodID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,1,1,'2024-03-01','pending'),(2,2,2,'2024-03-05','approved'),(3,3,3,'2024-03-10','pending'),(4,4,4,'2024-03-12','completed'),(5,5,5,'2024-03-15','rejected'),(6,6,6,'2024-03-18','approved'),(7,7,7,'2024-03-20','pending'),(8,8,8,'2024-03-22','completed'),(9,9,9,'2024-03-25','approved'),(10,10,10,'2024-03-28','rejected'),(11,11,11,'2024-04-01','pending'),(12,12,12,'2024-04-05','approved'),(13,13,13,'2024-04-10','completed'),(14,14,14,'2024-04-12','rejected'),(15,15,15,'2024-04-15','pending'),(16,16,16,'2024-04-18','approved'),(17,17,17,'2024-04-20','completed'),(18,18,18,'2024-04-22','pending'),(19,19,19,'2024-04-25','rejected'),(20,20,20,'2024-04-28','approved');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'blood_bank_management_system'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetAllAdmins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllAdmins`()
BEGIN
    SELECT * FROM Admin 
    ORDER BY name ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBloodStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBloodStock`()
BEGIN
    SELECT bloodtype, SUM(quantityavailable) AS total_quantity 
    FROM BloodStock 
    GROUP BY bloodtype;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDonorDonationCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDonorDonationCount`()
BEGIN
    SELECT donorID, COUNT(*) AS total_donations 
    FROM Donation 
    GROUP BY donorID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFrequentDonors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFrequentDonors`()
BEGIN
    SELECT donorID, COUNT(*) AS total_donations 
    FROM Donation 
    GROUP BY donorID 
    HAVING total_donations > 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMostDonatedBloodType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMostDonatedBloodType`()
BEGIN
    SELECT B.bloodtype, COUNT(D.donationID) AS total_donations 
    FROM Donation D
    JOIN BloodStock B ON D.bloodID = B.bloodID
    GROUP BY B.bloodtype
    ORDER BY total_donations DESC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPendingRequests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPendingRequests`()
BEGIN
    SELECT * FROM Request WHERE status = 'pending';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRecentDonors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecentDonors`()
BEGIN
    SELECT * FROM Donor 
    WHERE lastdonationDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRecipientsByBloodType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecipientsByBloodType`(IN blood_type ENUM('A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'))
BEGIN
    SELECT Rec.name, Rec.hospital, R.requestDate, R.status 
    FROM Request R
    JOIN Recipient Rec ON R.recipientID = Rec.recipientID
    JOIN BloodStock B ON R.bloodID = B.bloodID
    WHERE B.bloodtype = blood_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRequestDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRequestDetails`()
BEGIN
    SELECT R.requestID, Rec.name AS recipient_name, B.bloodtype, R.status 
    FROM Request R
    JOIN Recipient Rec ON R.recipientID = Rec.recipientID
    JOIN BloodStock B ON R.bloodID = B.bloodID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTopHospitals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTopHospitals`()
BEGIN
    SELECT Rec.hospital, COUNT(R.requestID) AS total_requests 
    FROM Request R
    JOIN Recipient Rec ON R.recipientID = Rec.recipientID
    GROUP BY Rec.hospital
    ORDER BY total_requests DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-03 21:48:06
