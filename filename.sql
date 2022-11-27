-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: DnA_PP4
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Age_Group`
--

DROP TABLE IF EXISTS `Age_Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Age_Group` (
  `Min_Age` int NOT NULL,
  `Max_Age` int NOT NULL,
  `Age_Group` varchar(30) NOT NULL,
  PRIMARY KEY (`Min_Age`,`Max_Age`),
  UNIQUE KEY `Age_Group` (`Age_Group`),
  CONSTRAINT `Age_Group_chk_1` CHECK ((`Age_Group` in (_utf8mb3'Youth',_utf8mb3'Middle-Aged',_utf8mb3'Old',_utf8mb3'Declining')))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Age_Group`
--

LOCK TABLES `Age_Group` WRITE;
/*!40000 ALTER TABLE `Age_Group` DISABLE KEYS */;
INSERT INTO `Age_Group` VALUES (81,150,'Declining'),(36,60,'Middle-Aged'),(61,80,'Old'),(18,35,'Youth');
/*!40000 ALTER TABLE `Age_Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Collect`
--

DROP TABLE IF EXISTS `Collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Collect` (
  `Panchayat_Member_Aadhar_No` char(12) NOT NULL,
  `ITR_No` char(12) NOT NULL,
  PRIMARY KEY (`Panchayat_Member_Aadhar_No`,`ITR_No`),
  KEY `Collect_ibfk_1` (`ITR_No`),
  CONSTRAINT `Collect_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Collect_ibfk_2` FOREIGN KEY (`Panchayat_Member_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Collect`
--

LOCK TABLES `Collect` WRITE;
/*!40000 ALTER TABLE `Collect` DISABLE KEYS */;
INSERT INTO `Collect` VALUES ('123456123432','B23456123416'),('123456123432','B23456123434'),('123456123432','B23456123442'),('123456123426','F23456123412'),('123456123426','F23456123413'),('123456123431','F23456123421'),('123456123431','F23456123422'),('123456123431','F23456123424'),('123456123432','F23456123441'),('123456123432','F33456123441'),('123456123413','P23456123411'),('123456123413','P23456123414'),('123456123413','P23456123415'),('123456123413','P23456123423'),('123456123411','P23456123425'),('123456123411','P23456123426'),('123456123411','P23456123431'),('123456123412','P23456123432'),('123456123412','P23456123433'),('123456123412','P23456123435'),('123456123426','P23456123436');
/*!40000 ALTER TABLE `Collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Elect`
--

DROP TABLE IF EXISTS `Elect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Elect` (
  `Panchayat_Member_Aadhar_No` char(12) NOT NULL,
  `Villager_Aadhar_No` char(12) NOT NULL,
  PRIMARY KEY (`Villager_Aadhar_No`,`Panchayat_Member_Aadhar_No`),
  KEY `Elect_ibfk_2` (`Panchayat_Member_Aadhar_No`),
  CONSTRAINT `Elect_ibfk_1` FOREIGN KEY (`Villager_Aadhar_No`) REFERENCES `Villagers` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Elect_ibfk_2` FOREIGN KEY (`Panchayat_Member_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Elect`
--

LOCK TABLES `Elect` WRITE;
/*!40000 ALTER TABLE `Elect` DISABLE KEYS */;
INSERT INTO `Elect` VALUES ('123456123411','123456123411'),('123456123411','123456123416'),('123456123411','123456123421'),('123456123412','123456123412'),('123456123412','123456123423'),('123456123412','123456123424'),('123456123413','123456123413'),('123456123413','123456123414'),('123456123413','123456123415'),('123456123413','123456123422'),('123456123426','123456123425'),('123456123426','123456123426'),('123456123426','123456123433'),('123456123431','123456123431'),('123456123431','123456123434'),('123456123431','123456123435'),('123456123432','123456123432'),('123456123432','123456123436');
/*!40000 ALTER TABLE `Elect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event_Participation`
--

DROP TABLE IF EXISTS `Event_Participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event_Participation` (
  `Villager_Aadhar_No` char(12) NOT NULL,
  `Panchayat_Member_Aadhar_No` char(12) NOT NULL,
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Expenditure_ID` int NOT NULL,
  PRIMARY KEY (`Villager_Aadhar_No`,`Panchayat_Member_Aadhar_No`,`Date`,`Name`,`Expenditure_ID`),
  KEY `Event_Participation_ibfk_2` (`Panchayat_Member_Aadhar_No`),
  KEY `Event_Participation_ibfk_3` (`Date`,`Name`),
  KEY `Event_Participation_ibfk_4` (`Expenditure_ID`),
  CONSTRAINT `Event_Participation_ibfk_1` FOREIGN KEY (`Villager_Aadhar_No`) REFERENCES `Villagers` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Event_Participation_ibfk_2` FOREIGN KEY (`Panchayat_Member_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Event_Participation_ibfk_3` FOREIGN KEY (`Date`, `Name`) REFERENCES `Events` (`Date`, `Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Event_Participation_ibfk_4` FOREIGN KEY (`Expenditure_ID`) REFERENCES `Expenditure` (`Expenditure_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event_Participation`
--

LOCK TABLES `Event_Participation` WRITE;
/*!40000 ALTER TABLE `Event_Participation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Event_Participation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Events` (
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Purpose` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Date`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
INSERT INTO `Events` VALUES ('2022-04-22','COVID Vaccination Drive','Vaccination Drive for 1st dose of COVID Vaccine'),('2022-06-10','COVID Vaccination Drive','Vaccination Drive for 2nd dose of COVID Vaccine'),('2022-08-25','Village Fair','Fair organized for villagers'),('2022-09-21','Dussehra','Dussehra Celebration');
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Expenditure`
--

DROP TABLE IF EXISTS `Expenditure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Expenditure` (
  `Expenditure_ID` int NOT NULL,
  `Budget_Assigned` int DEFAULT NULL,
  `Description` varchar(30) DEFAULT NULL,
  `Date_of_Aassignment` date NOT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Expenditure_ID`),
  CONSTRAINT `Expenditure_chk_1` CHECK ((`Status` in (_utf8mb3'Past',_utf8mb3'Ongoing',_utf8mb3'Future')))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Expenditure`
--

LOCK TABLES `Expenditure` WRITE;
/*!40000 ALTER TABLE `Expenditure` DISABLE KEYS */;
INSERT INTO `Expenditure` VALUES (220201,30000,'Shauchalay Abhiyan','2022-02-15','Past'),(220202,39000,'Village Fair','2022-08-06','Past'),(220203,23500,'COVID Vaccination Dose 1','2022-05-09','Past'),(220204,15700,'Hospital Road reconstruction','2023-05-25','Future'),(220205,35000,'COVID Vaccination Dose 2','2022-07-21','Past'),(220206,29000,'Thana Renovation','2023-07-11','Future'),(220207,11000,'Earthquake Repairs','2022-07-21','Past'),(220208,18300,'Solar Panel Construction','2023-08-26','Future'),(220209,9300,'Jail Construction','2022-10-21','Ongoing'),(220210,30500,'Dussehra','2022-09-01','Past'),(220211,12000,'Drinking Water Taps','2022-03-21','Ongoing');
/*!40000 ALTER TABLE `Expenditure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Farmlands`
--

DROP TABLE IF EXISTS `Farmlands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Farmlands` (
  `Aadhar_No` char(12) NOT NULL,
  `Serial_No` int NOT NULL,
  `Area` int NOT NULL,
  `ITR_No` char(12) NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Serial_No`),
  KEY `Farmlands_ibfk_1` (`ITR_No`),
  CONSTRAINT `Farmlands_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Farmlands`
--

LOCK TABLES `Farmlands` WRITE;
/*!40000 ALTER TABLE `Farmlands` DISABLE KEYS */;
INSERT INTO `Farmlands` VALUES ('123456123412',1,500,'F23456123412'),('123456123413',1,400,'F23456123413'),('123456123421',1,300,'F23456123421'),('123456123422',1,150,'F23456123422'),('123456123424',1,200,'F23456123424'),('123456123441',1,1000,'F23456123441'),('123456123441',2,5000,'F33456123441');
/*!40000 ALTER TABLE `Farmlands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Irrigation`
--

DROP TABLE IF EXISTS `Irrigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Irrigation` (
  `Aadhar_No` char(12) NOT NULL,
  `Serial_No` int NOT NULL,
  `Mode_of_Irrigation` varchar(20) NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Serial_No`,`Mode_of_Irrigation`),
  CONSTRAINT `Irrigation_ibfk_1` FOREIGN KEY (`Aadhar_No`, `Serial_No`) REFERENCES `Farmlands` (`Aadhar_No`, `Serial_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Irrigation_chk_1` CHECK ((`Mode_of_Irrigation` in (_utf8mb3'Well',_utf8mb3'Tubewell',_utf8mb3'Canal')))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Irrigation`
--

LOCK TABLES `Irrigation` WRITE;
/*!40000 ALTER TABLE `Irrigation` DISABLE KEYS */;
INSERT INTO `Irrigation` VALUES ('123456123412',1,'Well'),('123456123413',1,'Canal'),('123456123421',1,'Well'),('123456123422',1,'Tubewell'),('123456123424',1,'Canal'),('123456123441',1,'Well'),('123456123441',2,'Tubewell');
/*!40000 ALTER TABLE `Irrigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manage_Expenditure`
--

DROP TABLE IF EXISTS `Manage_Expenditure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manage_Expenditure` (
  `Aadhar_No` char(12) NOT NULL,
  `Expenditure_ID` int NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Expenditure_ID`),
  KEY `Manage_Expenditure_ibfk_2` (`Expenditure_ID`),
  CONSTRAINT `Manage_Expenditure_ibfk_1` FOREIGN KEY (`Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Manage_Expenditure_ibfk_2` FOREIGN KEY (`Expenditure_ID`) REFERENCES `Expenditure` (`Expenditure_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manage_Expenditure`
--

LOCK TABLES `Manage_Expenditure` WRITE;
/*!40000 ALTER TABLE `Manage_Expenditure` DISABLE KEYS */;
INSERT INTO `Manage_Expenditure` VALUES ('123456123413',220201),('123456123411',220202),('123456123412',220203),('123456123426',220204),('123456123431',220205),('123456123432',220206);
/*!40000 ALTER TABLE `Manage_Expenditure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Panchayat_Members`
--

DROP TABLE IF EXISTS `Panchayat_Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Panchayat_Members` (
  `Aadhar_No` char(12) NOT NULL,
  `Pan_No` char(12) NOT NULL,
  `Years_of_Service` int DEFAULT NULL,
  `Ward_No` int DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `Supervisor_Aadhar_No` char(12) NOT NULL,
  PRIMARY KEY (`Aadhar_No`),
  KEY `Panchayat_Members_ibfk_1` (`Supervisor_Aadhar_No`),
  CONSTRAINT `Panchayat_Members_ibfk_1` FOREIGN KEY (`Supervisor_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Panchayat_Members`
--

LOCK TABLES `Panchayat_Members` WRITE;
/*!40000 ALTER TABLE `Panchayat_Members` DISABLE KEYS */;
/*!40000 ALTER TABLE `Panchayat_Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Religion_and_Caste`
--

DROP TABLE IF EXISTS `Religion_and_Caste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Religion_and_Caste` (
  `Caste_or_Sect` varchar(30) NOT NULL,
  `Religion` varchar(30) NOT NULL,
  PRIMARY KEY (`Caste_or_Sect`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Religion_and_Caste`
--

LOCK TABLES `Religion_and_Caste` WRITE;
/*!40000 ALTER TABLE `Religion_and_Caste` DISABLE KEYS */;
INSERT INTO `Religion_and_Caste` VALUES ('Brahmin','Hindu'),('Dalit','Hindu'),('Halba','Tribal'),('Iyer','Hindu'),('Kadia','Muslim'),('Kshatriya','Hindu'),('Mahuri','Hindu'),('Nair','Hindu'),('Vaishya','Hindu');
/*!40000 ALTER TABLE `Religion_and_Caste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Small_Businesses`
--

DROP TABLE IF EXISTS `Small_Businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Small_Businesses` (
  `Aadhar_No` char(12) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `No_of_employees` int DEFAULT NULL,
  `Govt_Support_Provided` varchar(100) DEFAULT NULL,
  `ITR_No` char(12) NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Name`),
  KEY `Small_Businesses_ibfk_1` (`ITR_No`),
  CONSTRAINT `Small_Businesses_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Small_Businesses`
--

LOCK TABLES `Small_Businesses` WRITE;
/*!40000 ALTER TABLE `Small_Businesses` DISABLE KEYS */;
INSERT INTO `Small_Businesses` VALUES ('123456123416','Sunny Electronics','Electronics',2,'Electricity','B23456123416'),('123456123434','Halder Fabrics','Clothes',10,'Electricity','B23456123434'),('123456123442','Evergreen Sweets','Food',20,'Ration Subsidy','B23456123442');
/*!40000 ALTER TABLE `Small_Businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sources`
--

DROP TABLE IF EXISTS `Sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sources` (
  `Source_ID` int NOT NULL,
  `Amount` int DEFAULT NULL,
  `Allocation_Date` date NOT NULL,
  `By_Whom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Source_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sources`
--

LOCK TABLES `Sources` WRITE;
/*!40000 ALTER TABLE `Sources` DISABLE KEYS */;
INSERT INTO `Sources` VALUES (220101,150000,'2022-03-04','Central Government'),(220102,89000,'2022-03-10','State Government'),(220103,65000,'2022-05-25','Thambani Pvt Ltd'),(220104,31000,'2022-06-03','Village Welfare Fund'),(220105,49000,'2022-09-16','Flood Relief'),(220106,12500,'2022-09-08','Amarnath Gates Foundation');
/*!40000 ALTER TABLE `Sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sponsors`
--

DROP TABLE IF EXISTS `Sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sponsors` (
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Sponsor` varchar(30) NOT NULL,
  PRIMARY KEY (`Date`,`Name`,`Sponsor`),
  CONSTRAINT `Sponsors_ibfk_1` FOREIGN KEY (`Date`, `Name`) REFERENCES `Events` (`Date`, `Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sponsors`
--

LOCK TABLES `Sponsors` WRITE;
/*!40000 ALTER TABLE `Sponsors` DISABLE KEYS */;
INSERT INTO `Sponsors` VALUES ('2022-04-22','COVID Vaccination Drive','Central Government'),('2022-04-22','COVID Vaccination Drive','Village Hospital'),('2022-06-10','COVID Vaccination Drive','Central Government'),('2022-06-10','COVID Vaccination Drive','Thambani Pvt Ltd'),('2022-08-25','Village Fair','Panchayat'),('2022-08-25','Village Fair','State Government'),('2022-09-21','Dussehra','Sarpanch'),('2022-09-21','Dussehra','Temple Priest');
/*!40000 ALTER TABLE `Sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tax_Bracket`
--

DROP TABLE IF EXISTS `Tax_Bracket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tax_Bracket` (
  `Min_Income` int NOT NULL,
  `Max_Income` int NOT NULL,
  `Tax_bracket` varchar(30) NOT NULL,
  PRIMARY KEY (`Min_Income`,`Max_Income`),
  UNIQUE KEY `Tax_Bracket` (`Tax_bracket`),
  CONSTRAINT `Tax_Bracket_chk_1` CHECK ((`Tax_Bracket` in (_utf8mb3'BPL',_utf8mb3'Non-BPL')))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tax_Bracket`
--

LOCK TABLES `Tax_Bracket` WRITE;
/*!40000 ALTER TABLE `Tax_Bracket` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tax_Bracket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tax_Waivers`
--

DROP TABLE IF EXISTS `Tax_Waivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tax_Waivers` (
  `Tax_Waiver` int NOT NULL,
  `ITR_No` char(12) NOT NULL,
  PRIMARY KEY (`ITR_No`),
  CONSTRAINT `Tax_Waivers_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tax_Waivers`
--

LOCK TABLES `Tax_Waivers` WRITE;
/*!40000 ALTER TABLE `Tax_Waivers` DISABLE KEYS */;
INSERT INTO `Tax_Waivers` VALUES (10,'B23456123434'),(2,'F23456123424'),(3,'P23456123432');
/*!40000 ALTER TABLE `Tax_Waivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taxation`
--

DROP TABLE IF EXISTS `Taxation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Taxation` (
  `ITR_No` char(12) NOT NULL,
  `Category` varchar(20) NOT NULL,
  `Total_Income` int DEFAULT NULL,
  `Amount_Paid` int DEFAULT NULL,
  `Aadhar_No` char(12) NOT NULL,
  PRIMARY KEY (`ITR_No`),
  KEY `Taxation_ibfk_1` (`Aadhar_No`),
  CONSTRAINT `Taxation_ibfk_1` FOREIGN KEY (`Aadhar_No`) REFERENCES `Villagers` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Taxation_chk_1` CHECK ((`Category` in (_utf8mb3'Business',_utf8mb3'Personal',_utf8mb3'Property')))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taxation`
--

LOCK TABLES `Taxation` WRITE;
/*!40000 ALTER TABLE `Taxation` DISABLE KEYS */;
INSERT INTO `Taxation` VALUES ('B23456123416','Business',1000000,300000,'123456123416'),('B23456123434','Business',400000,100000,'123456123434'),('B23456123442','Business',600000,150000,'123456123442'),('F23456123412','Property',50000,0,'123456123412'),('F23456123413','Property',400000,200000,'123456123413'),('F23456123421','Property',300000,70000,'123456123421'),('F23456123422','Property',15000,0,'123456123422'),('F23456123424','Property',200000,80000,'123456123424'),('F23456123441','Property',1000000,400000,'123456123441'),('F33456123441','Property',1000000,400000,'123456123441'),('P23456123411','Personal',150000,50000,'123456123411'),('P23456123414','Personal',1000000,400000,'123456123414'),('P23456123415','Personal',400000,100000,'123456123415'),('P23456123423','Personal',200000,30000,'123456123423'),('P23456123425','Personal',0,0,'123456123425'),('P23456123426','Personal',250000,100000,'123456123426'),('P23456123431','Personal',150000,50000,'123456123431'),('P23456123432','Personal',300000,90000,'123456123432'),('P23456123433','Personal',40000,0,'123456123433'),('P23456123435','Personal',90000,30000,'123456123435'),('P23456123436','Personal',500000,200000,'123456123436');
/*!40000 ALTER TABLE `Taxation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Villagers`
--

DROP TABLE IF EXISTS `Villagers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Villagers` (
  `Aadhar_No` char(12) NOT NULL,
  `Pan_No` char(12) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Caste_or_Sect` varchar(30) NOT NULL,
  `Sex` varchar(50) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Phone_No` int NOT NULL,
  `Literacy` varchar(10) NOT NULL,
  `Occupation` varchar(30) NOT NULL,
  PRIMARY KEY (`Aadhar_No`),
  UNIQUE KEY `Pan_No` (`Pan_No`),
  UNIQUE KEY `Phone_No` (`Phone_No`),
  KEY `Villagers_ibfk_1` (`Caste_or_Sect`),
  CONSTRAINT `Villagers_ibfk_1` FOREIGN KEY (`Caste_or_Sect`) REFERENCES `Religion_and_Caste` (`Caste_or_Sect`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Villagers_chk_1` CHECK ((`Sex` in (_utf8mb3'Male',_utf8mb3'Female',_utf8mb3'Intersex'))),
  CONSTRAINT `Villagers_chk_2` CHECK ((`AGE` >= 18)),
  CONSTRAINT `Villagers_chk_3` CHECK ((`Literacy` in (_utf8mb3'Literate',_utf8mb3'Illiterate')))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Villagers`
--

LOCK TABLES `Villagers` WRITE;
/*!40000 ALTER TABLE `Villagers` DISABLE KEYS */;
INSERT INTO `Villagers` VALUES ('123456123411','ABCDEF123411','Dhruv Madan','Brahmin','Male',21,1234567811,'Illiterate','Nurse'),('123456123412','ABCDEF123412','Vasu Sood','Brahmin','Male',50,1234567812,'Illiterate','Farmer'),('123456123413','ABCDEF123413','Chandan Mishra','Kadia','Male',63,1234567813,'Literate','Farmer'),('123456123414','ABCDEF123414','Bhavana Bala','Kadia','Male',19,1234567814,'Literate','Doctor'),('123456123415','ABCDEF123415','Vinay Sen','Nair','Male',75,1234567815,'Illiterate','Secretary'),('123456123416','ABCDEF123416','Karthik Pillay','Dalit','Male',45,1234567816,'Illiterate','Businessman'),('123456123421','ABCDEF123421','Varsha Balay','Mahuri','Female',42,1234567821,'Literate','Farmer'),('123456123422','ABCDEF123422','Sona Bhattacharyya','Halba','Female',27,1234567822,'Literate','Farmer'),('123456123423','ABCDEF123423','Dipali Dora','Dalit','Female',38,1234567823,'Illiterate','Manager'),('123456123424','ABCDEF123424','Radha Bhatia','Mahuri','Female',29,1234567824,'Illiterate','Farmer'),('123456123425','ABCDEF123425','Durga Mathur','Iyer','Female',45,1234567825,'Literate','Housewife'),('123456123426','ABCDEF123426','Lal Dayal','Brahmin','Male',47,1234567826,'Literate','Teacher'),('123456123431','ABCDEF123431','Akhil Dey','Dalit','Male',67,1234567831,'Illiterate','Teacher'),('123456123432','ABCDEF123432','Abhilash Salvi','Vaishya','Male',90,1234567832,'Illiterate','Principal'),('123456123433','ABCDEF123433','Shivansh Mehan','Dalit','Male',83,1234567833,'Literate','Postman'),('123456123434','ABCDEF123434','Amrit Halder','Kshatriya','Male',101,1234567834,'Literate','Businessman'),('123456123435','ABCDEF123435','Rajni Shenoy','Brahmin','Female',19,1234567835,'Illiterate','Postmaster'),('123456123436','ABCDEF123436','Indrani Narula','Kshatriya','Female',18,1234567836,'Illiterate','Policeman'),('123456123441','ABCDEF123441','Roshan Kota','Dalit','Male',18,1234567841,'Literate','Farmer'),('123456123442','ABCDEF123442','Ayush Sen','Vaishya','Male',21,1234567842,'Literate','Businessman');
/*!40000 ALTER TABLE `Villagers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 15:00:47
