-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotelsdb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `cityID` int NOT NULL AUTO_INCREMENT,
  `cityName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cityID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Chernivtsi'),(2,'Kyiv'),(3,'Lviv'),(4,'Ivano_frankivsk'),(5,'Ternopil'),(6,'Rivne'),(7,'Uzhgorod'),(8,'Lutsk'),(9,'Zhytomyr'),(10,'Chernihiv'),(11,'Cherkasy'),(12,'Zaporizhya'),(13,'Krym'),(14,'Odessa'),(15,'Mykolaiv'),(16,'Kherson'),(17,'Khemlnyskuy'),(18,'Donetsk'),(19,'Dnipro'),(20,'Luhansk'),(21,'Sumy'),(22,'Poltava'),(23,'Propyvniyskyi'),(24,'Vinnytsya');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `clientID` int NOT NULL AUTO_INCREMENT,
  `clientName` varchar(50) DEFAULT NULL,
  `clientNumber` mediumtext,
  `age` int DEFAULT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`clientID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Natalia','380631111111',20,3000),(2,'Mariia','380632222222',21,3500),(3,'Mykola','380633333333',22,3600),(4,'Ivan','380634444444',23,2000),(5,'Taras','380635555555',30,2000),(6,'Sofiia','380666666666',30,2500),(7,'Maksym','380677777777',40,300),(8,'Nadiia','380638888888',45,300);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `hotelID` int NOT NULL AUTO_INCREMENT,
  `hotelName` varchar(20) DEFAULT NULL,
  `starsCounts` int NOT NULL,
  `creationDate` date DEFAULT NULL,
  `cityId` int DEFAULT NULL,
  PRIMARY KEY (`hotelID`),
  KEY `cityId` (`cityId`),
  CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `cities` (`cityID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Bucovina',4,'2000-01-05',2),(2,'Kyiv',5,'2002-01-03',4),(3,'Bukovel',5,'2003-05-06',13),(4,'Terrasa',4,'2010-02-03',20),(5,'Victoria',3,'2015-03-07',5),(6,'Edem',5,'2020-04-07',8),(7,'Eurohotel',5,'2018-04-08',17),(8,'Hotel',3,'2016-05-08',5);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `clientID` int DEFAULT NULL,
  `roomId` int DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `clientID` (`clientID`),
  KEY `roomId` (`roomId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `clients` (`clientID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`roomId`) REFERENCES `rooms` (`roomID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,13),(2,2,8),(3,3,6),(4,3,12),(5,4,11),(6,4,2),(7,5,16),(8,6,4),(9,6,1),(10,7,5),(11,8,17),(12,8,14);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `roomID` int NOT NULL AUTO_INCREMENT,
  `comfortLevel` varchar(20) DEFAULT NULL,
  `hotelID` int DEFAULT NULL,
  PRIMARY KEY (`roomID`),
  KEY `hotelID` (`hotelID`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`hotelID`) REFERENCES `hotels` (`hotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'normal',1),(2,'cheap',1),(3,'lux',1),(4,'normal',2),(5,'cheap',2),(6,'lux',2),(7,'normal',3),(8,'cheap',3),(9,'lux',3),(10,'normal',4),(11,'cheap ',4),(12,'lux',4),(13,'normal',5),(14,'cheap',5),(15,'lux',5),(16,'normal',6),(17,'cheap',6),(18,'lux',6);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hotelsdb'
--

--
-- Dumping routines for database 'hotelsdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-15  0:07:48
