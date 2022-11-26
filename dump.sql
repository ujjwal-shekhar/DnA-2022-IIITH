-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: Company
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP DATABASE IF EXISTS `DnA_PP4`;
CREATE SCHEMA `DnA_PP4`;
USE `DnA_PP4`;


-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Religion_and_Caste`
--
DROP TABLE IF EXISTS `Religion_and_Caste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `Religion_and_Caste` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Religion_and_Caste` ENABLE KEYS */;
UNLOCK TABLES;

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Villagers`
--
DROP TABLE IF EXISTS `Villagers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Villagers` (
  `Aadhar_No` char(12) NOT NULL,
  `Pan_No` char(12) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Sex` varchar(50) CHECK (`Sex` in ('Male','Female','Intersex')),
  `Caste_or_Sect` varchar(30) NOT NULL,
  `Age` int(3) CHECK (`AGE` >= 18 ),
  `Phone_No` int(10) NOT NULL,
  `Literacy` varchar(10) NOT NULL CHECK (`Literacy` in ('Literate','Illiterate')),
  `Occupation` varchar(30) NOT NULL,
  PRIMARY KEY (`Aadhar_No`),
  UNIQUE KEY `Pan_No` (`Pan_No`),
  UNIQUE KEY `Phone_No` (`Phone_No`),
  CONSTRAINT `Villagers_ibfk_1` FOREIGN KEY (`Caste_or_Sect`) REFERENCES `Religion_and_Caste` (`Caste_or_Sect`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Villagers`
--

LOCK TABLES `Villagers` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `Villagers` VALUES 
('123456123411','ABCDEF123411','Dhruv Madan','Brahmin','Male',21,1234567811,'Illiterate','Nurse'),
('123456123412','ABCDEF123412','Vasu Sood','Brahmin','Male',50,1234567812,'Illiterate','Farmer'),
('123456123413','ABCDEF123413','Chandan Mishra','Kadia','Male',63,1234567813,'Literate','Farmer'),
('123456123414','ABCDEF123414','Bhavana Bala','Kadia','Male',19,1234567814,'Literate','Doctor'),
('123456123415','ABCDEF123415','Vinay Sen','Nair','Male',75,1234567815,'Illiterate','Secretary'),
('123456123416','ABCDEF123416','Karthik Pillay','Dalit','Male',45,1234567816,'Illiterate','Businessman'),
('123456123421','ABCDEF123421','Varsha Balay','Mahuri','Female',42,1234567821,'Literate','Farmer'),
('123456123422','ABCDEF123422','Sona Bhattacharyya','Halba','Female',27,1234567822,'Literate','Farmer'),
('123456123423','ABCDEF123423','Dipali Dora','Dalit','Female',38,1234567823,'Illiterate','Manager'),
('123456123424','ABCDEF123424','Radha Bhatia','Mahuri','Female',29,1234567824,'Illiterate','Farmer'),
('123456123425','ABCDEF123425','Durga Mathur','Iyer','Female',45,1234567825,'Literate','Housewife'),
('123456123426','ABCDEF123426','Lal Dayal','Brahmin','Male',47,1234567826,'Literate','Teacher'),
('123456123431','ABCDEF123431','Akhil Dey','Dalit','Male',67,1234567831,'Illiterate','Teacher'),
('123456123432','ABCDEF123432','Abhilash Salvi','Vaishya','Male',90,1234567832,'Illiterate','Principal'),
('123456123433','ABCDEF123433','Shivansh Mehan','Dalit','Male',83,1234567833,'Literate','Postman'),
('123456123434','ABCDEF123434','Amrit Halder','Kshatriya','Male',101,1234567834,'Literate','Businessman'),
('123456123435','ABCDEF123435','Rajni Shenoy','Brahmin','Female',19,1234567835,'Illiterate','Postmaster'),
('123456123436','ABCDEF123436','Indrani Narula','Kshatriya','Female',18,1234567836,'Illiterate','Policeman'),
('123456123441','ABCDEF123441','Roshan Kota','Dalit','Male',18,1234567841,'Literate','Farmer'),
('123456123442','ABCDEF123442','Ayush Sen','Vaishya','Male',21,1234567842,'Literate','Businessman');

/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;
-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `DEPARTMENT`
--
DROP TABLE IF EXISTS `Panchayat_Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Panchayat_Members` (
  `Aadhar_No` char(12) NOT NULL,
  `Pan_No` char(12) NOT NULL,
  `Years_of_Service` int(2),
  `Ward_No` int(2),
  `Salary` int(2),
  `Supervisor_Aadhar_No` char(12) NOT NULL,
  PRIMARY KEY (`Aadhar_No`),
  CONSTRAINT `Panchayat_Members_ibfk_1` FOREIGN KEY (`Supervisor_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `Panchayat_Members` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `Panchayat_Members` VALUES 
/*sarpanch*/
('123456123413','ABCDEF123413',22,3,20000,63,NULL),

('123456123411','ABCDEF123411',2,1,10000,21,'1234567813'),
('123456123412','ABCDEF123412',7,2,12000,50,'1234567813'),
('123456123426','ABCDEF123426',12,4,15000,47,'1234567813'),
('123456123431','ABCDEF123431',22,5,18000,67,'1234567813'),
('123456123432','ABCDEF123432',12,6,15000,90,'1234567813');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Taxation`
--
DROP TABLE IF EXISTS `Taxation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxation` (
  `ITR_No` char(12) NOT NULL,
  `Category` varchar(20) NOT NULL CHECK (`Category` in ('Business','Personal', 'Property')),
  `Total_Income` int(10),
  `Amount_Paid` int(10),
  `Aadhar_No` char(12) NOT NULL,
  PRIMARY KEY (`ITR_No`),
  CONSTRAINT `Taxation_ibfk_1` FOREIGN KEY (`Aadhar_No`) REFERENCES `Villagers` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taxation`
--

LOCK TABLES `Taxation` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `Taxation` VALUES 
/*personal_taxes*/
('P23456123411','Personal',150000,50000,'123456123411'),
/*('P23456123412','Personal','50000','0','123456123412'),*/
-- ('P23456123413','Personal','400000','200000','123456123413'),
('P23456123414','Personal',1000000,400000,'123456123414'),
('P23456123415','Personal',400000,100000,'123456123415'),
-- ('P23456123416','Personal','1000000','300000','123456123416'),
-- ('P23456123421','Personal','300000','70000','123456123421'),
-- ('P23456123422','Personal','15000','0','123456123422'),
('P23456123423','Personal',200000,30000,'123456123423'),
-- ('P23456123424','Personal','200000','80000','123456123424'),
('P23456123425','Personal',0,0,'123456123425',),
('P23456123426','Personal',250000,100000,'123456123426'),
('P23456123431','Personal',150000,50000,'123456123431'),
('P23456123432','Personal',300000,90000,'123456123432'),
('P23456123433','Personal',40000,0,'123456123433'),
-- ('P23456123434','Personal','400000','100000','123456123434'),
('P23456123435','Personal',90000,30000,'123456123435'),
('P23456123436','Personal',500000,200000,'123456123436'),
-- ('P23456123441','Personal','1000000','400000','123456123441'),
-- ('P23456123442','Personal','600000','150000','123456123442'),

/*property tax on farmland*/
('F23456123412','Property',50000,0,'123456123412'),
('F23456123413','Property',400000,200000,'123456123413'),
('F23456123421','Property',300000,70000,'123456123421'),
('F23456123422','Property',15000,0,'123456123422'),
('F23456123424','Property',200000,80000,'123456123424'),
/*farmlands owned by 41*/
('F23456123441','Property',1000000,400000,'123456123441'),
('F33456123441','Property',1000000,400000,'123456123441'),

/*business tax*/
('B23456123416','Business',1000000,300000,'123456123416'),
('B23456123434','Business',400000,100000,'123456123434'),
('B23456123442','Business',600000,150000,'123456123442'),

/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Expenditure`
--
DROP TABLE IF EXISTS `Expenditure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Expenditure` (
  `Expenditure_ID` int(6) NOT NULL,
  `Budget_Assigned` int,
  `Description` varchar(30),
  `Date_of_Aassignment` date NOT NULL,
  `Status` varchar(10) CHECK (`Status` in ('Past','Ongoing','Future')),
  PRIMARY KEY (`Expenditure_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Expenditure`
--

LOCK TABLES `Expenditure` WRITE;
/*!40000 ALTER TABLE `Expenditure` DISABLE KEYS */;
INSERT INTO `Expenditure` VALUES 
(773653,30000,'Shauchalay Abhiyan','2022-02-15','Past'),
(174575,39000,'Polio Vaccination 2022','2022-04-06','Ongoing'),
(482186,23500,'COVID Vaccination Dose 1','2022-05-09','Past'), 
(682130,15700,'Hospital Road reconstruction','2023-05-25','Future'),
(318916,35000,'COVID Vaccination Dose 2','2022-07-21','Past'),
(414460,29000,'Thana Renovation','2023-07-11','Future'),
(731910,11000,'Earthquake Repairs','2022-07-21','Past'),
(530885,18300,'Solar Panel Construction','2023-08-26','Future'),
(403957,9300,'Jail Construction','2022-10-21','Ongoing'),
(644822,30500,'Navratri','2022-12-19','Past'),
(441856,12000 ,'Drinking Water Taps','2022-03-21','Ongoing');
/*!40000 ALTER TABLE `Expenditure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Farmlands`
--
DROP TABLE IF EXISTS `Farmlands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Farmlands` (
  `Aadhar_No` char(12) NOT NULL,
  `Serial_No` int(1) NOT NULL,
  `Area` int NOT NULL,
  `ITR_No` char(12) NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Serial_No`),
  CONSTRAINT `Farmlands_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Farmlands`
--

LOCK TABLES `Farmlands` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `Farmlands` VALUES 
('123456123412',1,500,'F23456123412'),
('123456123413',1,400,'F23456123413'),
('123456123421',1,300,'F23456123421'),
('123456123422',1,150,'F23456123422'),
('123456123424',1,200,'F23456123424'),
/*farmlands owned by 41*/
('123456123441',1,1000,'F23456123441'),
('123456123441',2,5000,'F33456123441');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Small_Businesses`
--
DROP TABLE IF EXISTS `Small_Businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Small_Businesses` (
  `Aadhar_No` char(12) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Type` varchar(50),
  `No_of_employees` int,
  `Govt_Support_Provided` varchar(100),
  `ITR_No` char(12) NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Name`),
  CONSTRAINT `Small_Businesses_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `Small_Businesses` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `Small_Businesses` VALUES 
('123456123416','Sunny Electronics','Electronics',2,'Electricity','B23456123416'),
('123456123434','Halder Fabrics','Clothes',10,'Electricity','B23456123434'),
('123456123442','Evergreen Sweets','Food',20,'Ration Subsidy','B23456123442');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Sources`
--
DROP TABLE IF EXISTS `Sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sources` (
  `Source_ID` int(6) NOT NULL,
  `Amount` int,
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
INSERT INTO `Sources` VALUES
(12776,150000,'2022-03-04','Central Government'),
(34767,89000,'2022-03-10','State Government'),
(23446,65000 ,'2022-05-25','Thambani Pvt Ltd'),
(14042,31000 ,'2022-06-03','Village Welfare Fund'),
(30815,49000,'2022-09-16','Flood Relief'),
(26870,12500,'2022-09-08','Amarnath Gates Foundation');
/*!40000 ALTER TABLE `Sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Irrigation`
--
DROP TABLE IF EXISTS `Irrigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Irrigation` (
  `Aadhar_No` char(12) NOT NULL,
  `Serial_No` int(1) NOT NULL,
  `Mode_of_Irrigation` varchar(20) NOT NULL CHECK (`Mode_of_Irrigation` in ('Well','Tubewell','Canal')),
  PRIMARY KEY (`Aadhar_No`,`Serial_No`,`Mode_of_Irrigation`),
  CONSTRAINT `Irrigation_ibfk_1` FOREIGN KEY (`Aadhar_No`,`Serial_No`) REFERENCES `Farmlands` (`Aadhar_No`,`Serial_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Irrigation`
--

LOCK TABLES `Irrigation` WRITE;
/*!40000 ALTER TABLE `Irrigation` DISABLE KEYS */;
INSERT INTO `Irrigation` VALUES
('123456123412',1,'Well'),
('123456123413',1,'Canal'),
('123456123421',1,'Well'),
('123456123422',1,'Tubewell'),
('123456123424',1,'Canal'),
('123456123441',1,'Well'),
('123456123441',2'Tubewell');
/*!40000 ALTER TABLE `Irrigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Age_Group`
--
DROP TABLE IF EXISTS `Age_Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Age_Group` (
  `Min_Age` int(3) NOT NULL,
  `Max_Age` int(3) NOT NULL,
  `Age_Group` varchar(30) NOT NULL CHECK (`Age_Group` in ('Youth','Middle-Aged','Old','Declining')),
  PRIMARY KEY (`Min_Age`,`Max_Age`),
  UNIQUE KEY `Age_Group` (`Age_Group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `Age_Group` WRITE;
/*!40000 ALTER TABLE `Age_Group` DISABLE KEYS */;
INSERT INTO `Age_Group` VALUES
(18,35,'Youth'),
(36,60,'Middle-Aged'),
(61,80,'Old'),
(81,150,'Declining');
/*!40000 ALTER TABLE `Age_Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Tax_Bracket`
--
DROP TABLE IF EXISTS `Tax_Bracket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tax_Bracket` (
  `Min_Income` int NOT NULL,
  `Max_Income` int NOT NULL,
  `Tax_bracket` varchar(30) NOT NULL CHECK (`Tax_Bracket` in ('BPL','Non-BPL')),
  PRIMARY KEY (`Min_Income`,`Max_Income`),
  UNIQUE KEY `Tax_Bracket` (`Tax_Bracket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `Tax_Bracket` WRITE;
/*!40000 ALTER TABLE `Tax_Bracket` DISABLE KEYS */;
INSERT INTO `Tax_Bracket` VALUES
(0,50000,'BPL'),
(50000,100000000,'Non_BPL');
/*!40000 ALTER TABLE `Tax_Bracket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--
-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Tax_Waivers`
--
DROP TABLE IF EXISTS `Tax_Waivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tax_Waivers` (
  `Tax_Waiver` int NOT NULL,
  `ITR_No` char(12) NOT NULL,
  PRIMARY KEY (`Tax_Waiver`,`ITR_No`),
  CONSTRAINT `Tax_Waivers_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tax_Waivers`
--

LOCK TABLES `Tax_Waivers` WRITE;
/*!40000 ALTER TABLE `Tax_Waivers` DISABLE KEYS */;
INSERT INTO `Tax_Waivers` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Tax_Waivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Events`
--
DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Events` (
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Purpose` varchar(50),
  PRIMARY KEY (`Date`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
INSERT INTO `Events` VALUES
('2022-06-10','COVID Vaccination Drive','Vaccination Drive for 2nd dose of COVID Vaccine'),
('2022-08-25','Village Fair','Fair organized for villagers'),
('2022-04-22','COVID Vaccination Drive','Vaccination Drive for 1st dose of COVID Vaccine'),
('2022-09-21','Dussehra','Dussehra Celebration');
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Govt_Schemes`
--
DROP TABLE IF EXISTS `Govt_Schemes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Govt_Schemes` (
  `Aadhar_No` char(12) NOT NULL,
  `Which` varchar(30) NOT NULL,
  `Since_When` date NOT NULL,
  `Benefits_Provided` varchar(100),
  PRIMARY KEY (`Aadhar_no`,`Which`),
  CONSTRAINT `Govt_Schemes_ibfk_1` FOREIGN KEY (`Aadhar_No`) REFERENCES `Villagers` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `Govt_Schemes` WRITE;
/*!40000 ALTER TABLE `Govt_Schemes` DISABLE KEYS */;
INSERT INTO `Govt_Schemes` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Govt_Schemes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Sponsors`
--
DROP TABLE IF EXISTS `Sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sponsors` (
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Sponsor` varchar(30) NOT NULL,
  PRIMARY KEY (`Date`,`Name`,`Sponsor`),
  CONSTRAINT `Sponsors_ibfk_1` FOREIGN KEY (`Date`,`Name`) REFERENCES `Events` (`Date`,`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `Sponsors` WRITE;
/*!40000 ALTER TABLE `Sponsors` DISABLE KEYS */;
INSERT INTO `Sponsors` VALUES
('2022-06-10','COVID Vaccination Drive','Central Government'),
('2022-08-25','Village Fair','Panchayat'),
('2022-04-22','COVID Vaccination Drive','Village Hospital'),
('2022-09-21','Dussehra','Temple Priest'),
('2022-06-10','COVID Vaccination Drive','Thambani Pvt Ltd'),
('2022-08-25','Village Fair','State Government'),
('2022-04-22','COVID Vaccination Drive','Central Government'),
('2022-09-21','Dussehra','Sarpanch');
/*!40000 ALTER TABLE `Sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Manage_Sources`
--
DROP TABLE IF EXISTS `Manage_Sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manage_Sources` (
  `Aadhar_No` char(12) NOT NULL,
  `Source_ID` int(6) NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Source_ID`),
  CONSTRAINT `Manage_Sources_ibfk_1` FOREIGN KEY (`Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Manage_Sources_ibfk_2` FOREIGN KEY (`Source_ID`) REFERENCES `Sources` (`Source_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manage_Sources`
--

LOCK TABLES `Manage_Sources` WRITE;
/*!40000 ALTER TABLE `Manage_Sources` DISABLE KEYS */;
INSERT INTO `Manage_Sources` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Manage_Sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Manage_Expenditure`
--
DROP TABLE IF EXISTS `Manage_Expenditure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manage_Expenditure` (
  `Aadhar_No` char(12) NOT NULL,
  `Expenditure_ID` int(6) NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Expenditure_ID`),
  CONSTRAINT `Manage_Expenditure_ibfk_1` FOREIGN KEY (`Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Manage_Expenditure_ibfk_2` FOREIGN KEY (`Expenditure_ID`) REFERENCES `Expenditure` (`Expenditure_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `Manage_Expenditure` WRITE;
/*!40000 ALTER TABLE `Manage_Expenditure` DISABLE KEYS */;
INSERT INTO `Manage_Expenditure` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Manage_Expenditure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Elect`
--
DROP TABLE IF EXISTS `Elect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Elect` (
  `Villager_Aadhar_No` char(12) NOT NULL,
  `Panchayat_Member_Aadhar_No` char(12) NOT NULL,
  PRIMARY KEY (`Villager_Aadhar_No`,`Panchayat_Member_Aadhar_No`),
  CONSTRAINT `Elect_ibfk_1` FOREIGN KEY (`Villager_Aadhar_No`) REFERENCES `Villagers` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Elect_ibfk_2` FOREIGN KEY (`Panchayat_Member_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Elect`
--

LOCK TABLES `Elect` WRITE;
/*!40000 ALTER TABLE `Elect` DISABLE KEYS */;
INSERT INTO `Elect` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Elect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Collect`
--
DROP TABLE IF EXISTS `Collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Collect` (
  `Panchayat_Member_Aadhar_No` char(12) NOT NULL,
  `ITR_No` char(12) NOT NULL,
  PRIMARY KEY (`Panchayat_Member_Aadhar_No`,`ITR_No`),
  CONSTRAINT `Collect_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Collect_ibfk_2` FOREIGN KEY (`Panchayat_Member_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Collect`
--

LOCK TABLES `Collect` WRITE;
/*!40000 ALTER TABLE `Collect` DISABLE KEYS */;
INSERT INTO `Collect` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Crops_Grown`
--
DROP TABLE IF EXISTS `Crops_Grown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Crops_Grown` (
  `Aadhar_No` char(12) NOT NULL,
  `Serial_No` int(1) NOT NULL,
  `Name_of_Crop` varchar(20) NOT NULL CHECK (`Name_of_Crop` in ('Jowar','Bajra','Wheat','Corn','Rice')),
  `Yield_Year_1` int,
  `Yield_Year_2` int,
  `Yield_Year_3` int,
  `Yield_Year_4` int,
  `Yield_Year_5` int,
  PRIMARY KEY (`Aadhar_No`,`Serial_No`,`Name_of_Crop`),
  CONSTRAINT `Crops_Grown_ibfk_1` FOREIGN KEY (`Aadhar_No`,`Serial_No`) REFERENCES `Farmlands` (`Aadhar_No`,`Serial_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `Crops_Grown` WRITE;
/*!40000 ALTER TABLE `Crops_Grown` DISABLE KEYS */;
INSERT INTO `Crops_Grown` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Crops_Grown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

-------------------------------------------------------------------- RU START ------------------------------------------------------------------------
--
-- Table structure for table `Event_Participation`
--
DROP TABLE IF EXISTS `Event_Participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_Participation` (
  `Villager_Aadhar_No` char(12) NOT NULL,
  `Panchayat_Member_Aadhar_No` char(12) NOT NULL,
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Expenditure_ID` int(6) NOT NULL,

  PRIMARY KEY (`Villager_Aadhar_No`,`Panchayat_Member_Aadhar_No`,`Date`,`Name`,`Expenditure_ID`),
  CONSTRAINT `Event_Participation_ibfk_1` FOREIGN KEY (`Villager_Aadhar_No`) REFERENCES `Villagers` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Event_Participation_ibfk_2` FOREIGN KEY (`Panchayat_Member_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Event_Participation_ibfk_3` FOREIGN KEY (`Date`,`Name`) REFERENCES `Events` (`Date`,`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Event_Participation_ibfk_4` FOREIGN KEY (`Expenditure_ID`) REFERENCES `Expenditure` (`Expenditure_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `Event_Participation` WRITE;
/*!40000 ALTER TABLE `Event_Participation` DISABLE KEYS */;
INSERT INTO `Event_Participation` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Event_Participation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
