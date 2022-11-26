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

--
-- Table structure for table `DEPARTMENT`
--
DROP DATABASE IF EXISTS `COMPANY`;
CREATE SCHEMA `COMPANY`;
USE `COMPANY`;
DROP TABLE IF EXISTS `DEPARTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENT` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int(11) NOT NULL,
  `Mgr_ssn` char(9) NOT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `Dname` (`Dname`),
  KEY `Mgr_ssn` (`Mgr_ssn`),
  CONSTRAINT `DEPARTMENT_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `EMPLOYEE` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `Villagers` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `Villagers` VALUES 
('123456123411','ABCDEF123411','Dhruv Madan','Brahmin','Male','21','1234567811','Illiterate','Nurse'),
('123456123412','ABCDEF123412','Vasu Sood','Brahmin','Male','50','1234567812','Illiterate','Farmer'),
('123456123413','ABCDEF123413','Chandan Mishra','Kadia','Male','63','1234567813','Literate','Farmer'),
('123456123414','ABCDEF123414','Bhavana Bala','Kadia','Male','19','1234567814','Literate','Doctor'),
('123456123415','ABCDEF123415','Vinay Sen','Nair','Male','75','1234567815','Illiterate','Secretary'),
('123456123416','ABCDEF123416','Karthik Pillay','Dalit','Male','45','1234567816','Illiterate','Businessman'),
('123456123421','ABCDEF123421','Varsha Balay','Mahuri','Female','42','1234567821','Literate','Businessman'),
('123456123422','ABCDEF123422','Sona Bhattacharyya','Halba','Female','27','1234567822','Literate','Farmer'),
('123456123423','ABCDEF123423','Dipali Dora','Dalit','Female','38','1234567823','Illiterate','Manager'),
('123456123424','ABCDEF123424','Radha Bhatia','Mahuri','Female','29','1234567824','Illiterate','Farmer'),
('123456123425','ABCDEF123425','Durga Mathur','Iyer','Female','45','1234567825','Literate','Housewife'),
('123456123426','ABCDEF123426','Lal Dayal','Brahmin','Male','47','1234567826','Literate','Teacher'),
('123456123431','ABCDEF123431','Akhil Dey','Dalit','Male','67','1234567831','Illiterate','Teacher'),
('123456123432','ABCDEF123432','Abhilash Salvi','Vaishya','Male','90','1234567832','Illiterate','Principal'),
('123456123433','ABCDEF123433','Shivansh Mehan','Dalit','Male','83','1234567833','Literate','Postman'),
('123456123434','ABCDEF123434','Amrit Halder','Kshatriya','Male','101','1234567834','Literate','Businessman'),
('123456123435','ABCDEF123435','Rajni Shenoy','Brahmin','Female','19','1234567835','Illiterate','Postmaster'),
('123456123436','ABCDEF123436','Indrani Narula','Kshatriya','Female','18','1234567836','Illiterate','Policeman'),
('123456123441','ABCDEF123441','Roshan Kota','Dalit','Male','18','1234567841','Literate','Trader'),
('123456123442','ABCDEF123441','Ayush Sen','Vaishya','Male','21','1234567841','Literate','Trader');

/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

LOCK TABLES `Panchayat_Members` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `Panchayat_Members` VALUES 
/*sarpanch*/
('123456123413','ABCDEF123413','22','3','20000','63',NULL),

('123456123411','ABCDEF123411','2','1','10000','21','1234567813'),
('123456123412','ABCDEF123412','7','2','12000','50','1234567813'),
('123456123426','ABCDEF123426','12','4','15000','47','1234567813'),
('123456123431','ABCDEF123431','22','5','18000','67','1234567813'),
('123456123432','ABCDEF123432','12','6','15000','90','1234567813');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `Taxation` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `Taxation` VALUES 
/*personal_taxes*/
('P23456123411','Personal','150000','50000','123456123411'),
('P23456123412','Personal','50000','0','123456123412'),
('P23456123413','Personal','400000','123456123413'),
('P23456123414','Personal','1000000','400000','123456123414'),
('P23456123415','Personal','400000','100000','123456123415'),
('P23456123416','Personal','1000000','300000','123456123416'),
('P23456123421','Personal','300000','70000','123456123421'),
('P23456123422','Personal','15000','0','123456123422'),
('P23456123423','Personal','200000','30000','123456123423'),
('P23456123424','Personal','200000','80000','123456123424'),
('P23456123425','Personal','0','0','123456123425',),
('P23456123426','Personal','250000','123456123426'),
('P23456123431','Personal','150000','123456123431'),
('P23456123432','Personal','300000','90000','123456123432'),
('P23456123433','Personal','40000','0','123456123433'),
('P23456123434','Personal','400000','100000','123456123434'),
('P23456123435','Personal','90000','30000','123456123435'),
('P23456123436','Personal','500000','200000','123456123436'),
('P23456123441','Personal','1000000','400000','123456123441'),
('P23456123442','Personal','600000','150000','123456123442');

/*property tax on farmland*/





/*business tax*/

/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
