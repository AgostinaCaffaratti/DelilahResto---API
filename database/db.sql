-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: delilah_resto
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

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
-- Table structure for table `favorites_plates`
--

DROP TABLE IF EXISTS `favorites_plates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites_plates` (
  `Plates_Plate_id` int(11) NOT NULL,
  `User_User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Plates_Plate_id`,`User_User_Id`),
  KEY `fk_Plates_has_User_User1_idx` (`User_User_Id`),
  KEY `fk_Plates_has_User_Plates1_idx` (`Plates_Plate_id`),
  CONSTRAINT `fk_Plates_has_User_Plates1` FOREIGN KEY (`Plates_Plate_id`) REFERENCES `plates` (`Plate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plates_has_User_User1` FOREIGN KEY (`User_User_Id`) REFERENCES `user` (`User_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites_plates`
--

LOCK TABLES `favorites_plates` WRITE;
/*!40000 ALTER TABLE `favorites_plates` DISABLE KEYS */;
INSERT INTO `favorites_plates` VALUES (1,1);
/*!40000 ALTER TABLE `favorites_plates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_`
--

DROP TABLE IF EXISTS `order_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `User_id` int(11) NOT NULL,
  `Hour` time NOT NULL,
  `Status_Id` int(11) NOT NULL,
  `Pay_method_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `User_Id_idx` (`User_id`),
  KEY `Status_Id_idx` (`Status_Id`),
  KEY `Pay_method_idx` (`Pay_method_Id`),
  CONSTRAINT `Pay_method` FOREIGN KEY (`Pay_method_Id`) REFERENCES `pay_method` (`Pay_Method_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Status_Id` FOREIGN KEY (`Status_Id`) REFERENCES `status` (`Status_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `User_Id` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_`
--

LOCK TABLES `order_` WRITE;
/*!40000 ALTER TABLE `order_` DISABLE KEYS */;
INSERT INTO `order_` VALUES (1,1,'15:30:00',1,1),(2,2,'17:00:00',2,2);
/*!40000 ALTER TABLE `order_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `Order_Detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Plate_Id` int(11) NOT NULL,
  `Subtotal` float NOT NULL,
  PRIMARY KEY (`Order_Detail_Id`),
  KEY `Plate_Id_idx` (`Plate_Id`),
  CONSTRAINT `Plate_Id` FOREIGN KEY (`Plate_Id`) REFERENCES `plates` (`Plate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,200),(2,2,250);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_has_order_details`
--

DROP TABLE IF EXISTS `order_has_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_has_order_details` (
  `Order_Id` int(11) NOT NULL,
  `Order_Detail_Order_Detail_Id` int(11) NOT NULL,
  PRIMARY KEY (`Order_Id`,`Order_Detail_Order_Detail_Id`),
  KEY `fk_Order_has_Order_Detail_Order_Detail1_idx` (`Order_Detail_Order_Detail_Id`),
  KEY `fk_Order_has_Order_Detail_Order1_idx` (`Order_Id`),
  CONSTRAINT `fk_Order_has_Order_Detail_Order1` FOREIGN KEY (`Order_Id`) REFERENCES `order_` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_has_Order_Detail_Order_Detail1` FOREIGN KEY (`Order_Detail_Order_Detail_Id`) REFERENCES `order_detail` (`Order_Detail_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_has_order_detail`
--

LOCK TABLES `order_has_order_detail` WRITE;
/*!40000 ALTER TABLE `order_has_order_detail` DISABLE KEYS */;
INSERT INTO `order_has_order_detail` VALUES (1,1),(1,2),(2,1);
/*!40000 ALTER TABLE `order_has_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_method`
--

DROP TABLE IF EXISTS `pay_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_method` (
  `Pay_Method_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pay-Method` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Pay_Method_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_method`
--

LOCK TABLES `pay_method` WRITE;
/*!40000 ALTER TABLE `pay_method` DISABLE KEYS */;
INSERT INTO `pay_method` VALUES (1,'Efvo'),(2,'Tarjeta');
/*!40000 ALTER TABLE `pay_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plates`
--

DROP TABLE IF EXISTS `plates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plates` (
  `Plate_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Price` float NOT NULL,
  `Available` varchar(45) NOT NULL,
  PRIMARY KEY (`Plate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plates`
--

LOCK TABLES `plates` WRITE;
/*!40000 ALTER TABLE `plates` DISABLE KEYS */;
INSERT INTO `plates` VALUES (1,'Hamburguesa Calsica',200,'yes'),(2,'Hamburguesa Veggie',250,'yes');
/*!40000 ALTER TABLE `plates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `Role_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(45) NOT NULL,
  PRIMARY KEY (`Role_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Adm'),(2,'Guest');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `Status_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`Status_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Confirmado'),(2,'Preparando'),(3,'Enviando'),(4,'Cancelado'),(5,'Etregado');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `CompleteName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Cel` int(11) NOT NULL,
  `Adress` varchar(255) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Role_Id` int(11) NOT NULL,
  PRIMARY KEY (`User_Id`),
  KEY `Role_Id_idx` (`Role_Id`),
  CONSTRAINT `Role_Id` FOREIGN KEY (`Role_Id`) REFERENCES `roles` (`Role_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Mike','Mike Ross','mross@gmail.com',351626262,'Sta Rosa 15','mike123',2),(2,'Harvey','Harvey Specter','hspecter@gmail.com',351242424,'Gral Paz 25','harvey123',1);
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

-- Dump completed on 2020-04-24 11:44:57
