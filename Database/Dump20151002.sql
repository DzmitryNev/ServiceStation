CREATE DATABASE  IF NOT EXISTS `service_station` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `service_station`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: service_station
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `model_year`
--

DROP TABLE IF EXISTS `model_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_year` (
  `model_year_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `model_id` bigint(20) NOT NULL,
  `year_id` bigint(20) NOT NULL,
  PRIMARY KEY (`model_year_id`),
  KEY `fk_year_model_year` (`year_id`),
  KEY `fk_model_model_year` (`model_id`),
  CONSTRAINT `fk_model_model_year` FOREIGN KEY (`model_id`) REFERENCES `model` (`model_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_year_model_year` FOREIGN KEY (`year_id`) REFERENCES `year` (`year_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_year`
--

LOCK TABLES `model_year` WRITE;
/*!40000 ALTER TABLE `model_year` DISABLE KEYS */;
INSERT INTO `model_year` VALUES (1,1,1),(2,1,2),(3,2,2),(4,3,2),(5,4,2),(6,5,2),(7,6,2),(8,7,2),(9,8,2),(10,9,2),(11,10,2),(12,11,2),(13,12,2),(14,13,2),(15,14,2),(16,15,2),(17,16,2),(18,17,2),(19,18,2),(20,1,3),(21,2,3),(22,3,3),(23,4,3),(24,5,3),(25,6,3),(26,7,3),(27,19,2),(28,8,3),(29,9,3),(30,10,3),(31,11,3),(32,12,3),(33,13,3),(34,14,3),(35,15,3),(36,16,3),(37,17,3),(38,18,3);
/*!40000 ALTER TABLE `model_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `year` (
  `year_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (1,2016),(2,2015),(3,2014);
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `car_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vin` varchar(17) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `model_year_id` bigint(20) NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `fk_client_car` (`client_id`),
  KEY `fk_model_year_car` (`model_year_id`),
  CONSTRAINT `fk_client_car` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_model_year_car` FOREIGN KEY (`model_year_id`) REFERENCES `model_year` (`model_year_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'1ZHT82H4851134564',1,6);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `make`
--

DROP TABLE IF EXISTS `make`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `make` (
  `make_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `make` varchar(25) NOT NULL,
  PRIMARY KEY (`make_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `make`
--

LOCK TABLES `make` WRITE;
/*!40000 ALTER TABLE `make` DISABLE KEYS */;
INSERT INTO `make` VALUES (1,'Ford'),(2,'Audi'),(3,'BMV'),(4,'Toyota'),(5,'Volkswagen');
/*!40000 ALTER TABLE `make` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_order`
--

DROP TABLE IF EXISTS `service_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_order` (
  `service_order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `order_amount` decimal(19,4) NOT NULL,
  `order_status` varchar(25) NOT NULL,
  PRIMARY KEY (`service_order_id`),
  KEY `fk_car_order` (`car_id`),
  CONSTRAINT `fk_car_service_order` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_order`
--

LOCK TABLES `service_order` WRITE;
/*!40000 ALTER TABLE `service_order` DISABLE KEYS */;
INSERT INTO `service_order` VALUES (1,1,'2015-12-12',1000.0000,'In Progress');
/*!40000 ALTER TABLE `service_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `model_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `model` varchar(25) NOT NULL,
  `make_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  KEY `fk_make_model` (`make_id`),
  CONSTRAINT `fk_make_model` FOREIGN KEY (`make_id`) REFERENCES `make` (`make_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,'Mustang',1),(2,'Fiesta',1),(3,'Edge',1),(4,'A5',2),(5,'A6',2),(6,'A7',2),(7,'A8',2),(8,'750 Series',3),(9,'M6',3),(10,'X5',3),(11,'i3 Hybrid',3),(12,'Camry',4),(13,'Corolla',4),(14,'Land Cruiser',4),(15,'Golf',5),(16,'Passat',5),(17,'CC',5),(18,'Jetta',5),(19,'M3',3);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `client_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Kitty','Hello','2019-12-12','London','1321266','wqw@wew.com'),(7,'Anton','Petrov','1987-12-09','Minsk','12345678','ewe@dsgh'),(8,'Ivan','Ivanov','1980-02-01','Minsk','123456789','email@tut.by'),(9,'Ann','Fedorova','1976-12-09','MInsk','375295673212','ann@mail.com'),(10,'IU','Kim','1990-12-12','Minsk','375443452465','iu@mail.ru');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-02 12:08:06
