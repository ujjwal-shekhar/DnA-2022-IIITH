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

-- Dump completed on 2022-11-27 16:58:03
