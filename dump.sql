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
  `Aadhar_No` int(12) NOT NULL,
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
  CONSTRAINT `Villagers_ibfk_1` FOREIGN KEY (`Caste_or_Sect`) REFERENCES `Religion_and_Caste` (`Caste_or_Sect`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Villagers`
--

LOCK TABLES `Villagers` WRITE;
/*!40000 ALTER TABLE `Villagers` DISABLE KEYS */;
INSERT INTO `Villagers` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Villagers` ENABLE KEYS */;
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
  `Aadhar_No` int(12) NOT NULL,
  `Pan_No` char(12) NOT NULL,
  `Years_of_Service` int(2),
  `Ward_No` int(2),
  `Salary` int(2),
  `Supervisor_Aadhar_No` int(12) NOT NULL,
  PRIMARY KEY (`Aadhar_No`),
  CONSTRAINT `Panchayat_Members_ibfk_1` FOREIGN KEY (`Supervisor_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `Panchayat_Members` WRITE;
/*!40000 ALTER TABLE `Panchayat_Members` DISABLE KEYS */;
INSERT INTO `Panchayat_Members` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Panchayat_Members` ENABLE KEYS */;
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
  `Aadhar_No` int(12) NOT NULL,
  PRIMARY KEY (`ITR_No`),
  CONSTRAINT `Taxation_ibfk_1` FOREIGN KEY (`Aadhar_No`) REFERENCES `Villagers` (`Aadhar_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taxation`
--

LOCK TABLES `Taxation` WRITE;
/*!40000 ALTER TABLE `Taxation` DISABLE KEYS */;
INSERT INTO `Taxation` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Taxation` ENABLE KEYS */;
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
  `Description` varchar(100),
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
INSERT INTO `Expenditure` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
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
  `Aadhar_No` int(12) NOT NULL,
  `Serial_No` int(6) NOT NULL,
  `Area` int NOT NULL,
  `ITR_No` char(12) NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Serial_No`),
  CONSTRAINT `Farmlands_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Farmlands`
--

LOCK TABLES `Farmlands` WRITE;
/*!40000 ALTER TABLE `Farmlands` DISABLE KEYS */;
INSERT INTO `Farmlands` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Farmlands` ENABLE KEYS */;
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
  `Aadhar_No` int(12) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Type` varchar(50),
  `No_of_employees` int,
  `Govt_Support_Provided` varchar(100),
  `ITR_No` char(12) NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Name`),
  CONSTRAINT `Small_Businesses_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `Small_Businesses` WRITE;
/*!40000 ALTER TABLE `Small_Businesses` DISABLE KEYS */;
INSERT INTO `Small_Businesses` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Small_Businesses` ENABLE KEYS */;
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
INSERT INTO `Sources` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
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
  `Aadhar_No` int(12) NOT NULL,
  `Serial_No` int(6) NOT NULL,
  `Mode_of_Irrigation` varchar(20) NOT NULL CHECK (`Mode_of_Irrigation` in ('Well','Tubewell','Canal')),
  PRIMARY KEY (`Aadhar_No`,`Serial_No`,`Mode_of_Irrigation`),
  CONSTRAINT `Irrigation_ibfk_1` FOREIGN KEY (`Aadhar_No`,`Serial_No`) REFERENCES `Farmlands` (`Aadhar_No`,`Serial_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Irrigation`
--

LOCK TABLES `Irrigation` WRITE;
/*!40000 ALTER TABLE `Irrigation` DISABLE KEYS */;
INSERT INTO `Irrigation` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
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
INSERT INTO `Age_Group` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Age_Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

-------------------------------------------------------------------- RU END ------------------------------------------------------------------------

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
  CONSTRAINT `Tax_Waivers_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`)
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
INSERT INTO `Events` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
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
  `Aadhar_No` int(12) NOT NULL,
  `Which` varchar(30) NOT NULL,
  `Since_When` date NOT NULL,
  `Benefits_Provided` varchar(100),
  PRIMARY KEY (`Aadhar_no`,`Which`),
  CONSTRAINT `Govt_Schemes_ibfk_1` FOREIGN KEY (`Aadhar_No`) REFERENCES `Villagers` (`Aadhar_No`)
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
  CONSTRAINT `Sponsors_ibfk_1` FOREIGN KEY (`Date`,`Name`) REFERENCES `Events` (`Date`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `Sponsors` WRITE;
/*!40000 ALTER TABLE `Sponsors` DISABLE KEYS */;
INSERT INTO `Sponsors` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
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
  `Aadhar_No` int(12) NOT NULL,
  `Source_ID` int(6) NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Source_ID`),
  CONSTRAINT `Manage_Sources_ibfk_1` FOREIGN KEY (`Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`),
  CONSTRAINT `Manage_Sources_ibfk_2` FOREIGN KEY (`Source_ID`) REFERENCES `Sources` (`Source_ID`)
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
  `Aadhar_No` int(12) NOT NULL,
  `Expenditure_ID` int(6) NOT NULL,
  PRIMARY KEY (`Aadhar_No`,`Expenditure_ID`),
  CONSTRAINT `Manage_Expenditure_ibfk_1` FOREIGN KEY (`Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`),
  CONSTRAINT `Manage_Expenditure_ibfk_2` FOREIGN KEY (`Expenditure_ID`) REFERENCES `Expenditure` (`Expenditure_ID`)
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
  `Villager_Aadhar_No` int(12) NOT NULL,
  `Panchayat_Member_Aadhar_No` int(12) NOT NULL,
  PRIMARY KEY (`Villager_Aadhar_No`,`Panchayat_Member_Aadhar_No`),
  CONSTRAINT `Elect_ibfk_1` FOREIGN KEY (`Villager_Aadhar_No`) REFERENCES `Villagers` (`Aadhar_No`),
  CONSTRAINT `Elect_ibfk_2` FOREIGN KEY (`Panchayat_Member_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`)
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
  `Panchayat_Member_Aadhar_No` int(12) NOT NULL,
  `ITR_No` char(12) NOT NULL,
  PRIMARY KEY (`Panchayat_Member_Aadhar_No`,`ITR_No`)
  CONSTRAINT `Collect_ibfk_1` FOREIGN KEY (`ITR_No`) REFERENCES `Taxation` (`ITR_No`)
  CONSTRAINT `Collect_ibfk_1` FOREIGN KEY (`Panchayat_Member_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`)
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
  `Aadhar_No` int(12) NOT NULL,
  `Serial_No` int(6) NOT NULL,
  `Name_of_Crop` varchar(20) NOT NULL CHECK (`Name_of_Crop` in ('Jowar','Bajra','Wheat','Corn','Rice')),
  `Yield_Year_1` int,
  `Yield_Year_2` int,
  `Yield_Year_3` int,
  `Yield_Year_4` int,
  `Yield_Year_5` int,
  PRIMARY KEY (`Aadhar_No`,`Serial_No`,`Name_of_Crop`),
  CONSTRAINT `Crops_Grown_ibfk_1` FOREIGN KEY (`Aadhar_No`,`Serial_No`) REFERENCES `Farmlands` (`Aadhar_No`,`Serial_No`)
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
  `Villager_Aadhar_No` int(12) NOT NULL,
  `Panchayat_Member_Aadhar_No` int(12) NOT NULL,
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Expenditure_ID` int(6) NOT NULL,
  
  PRIMARY KEY (`Villager_Aadhar_No`,`Panchayat_Member_Aadhar_No`,`Date`,`Name`,`Expenditure_ID`),
  CONSTRAINT `Event_Participation_ibfk_1` FOREIGN KEY (`Villager_Aadhar_No`) REFERENCES `Villagers` (`Aadhar_No`),
  CONSTRAINT `Event_Participation_ibfk_2` FOREIGN KEY (`Panchayat_Member_Aadhar_No`) REFERENCES `Panchayat_Members` (`Aadhar_No`),
  CONSTRAINT `Event_Participation_ibfk_3` FOREIGN KEY (`Date`,`Name`) REFERENCES `Events` (`Date`,`Name`),
  CONSTRAINT `Event_Participation_ibfk_4` FOREIGN KEY (`Expenditure_ID`) REFERENCES `Expenditure` (`Expenditure_ID`)
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
