-- MySQL dump 10.16  Distrib 10.1.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Books
-- ------------------------------------------------------
-- Server version	10.1.12-MariaDB-1~wily

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
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS `Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authors` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors`
--

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
INSERT INTO `Authors` VALUES (1,'Chris Smith'),(2,'Steven Levithan'),(3,' Jan Goyvaerts'),(4,'Ryan Benedetti'),(5,' Al Anderson'),(6,'Clay Breshears'),(7,'Kevlin Henney'),(10,'Jonas Biliūnas');
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `year` year(4) DEFAULT NULL,
  `genreId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES (1,'Programming F# 3.0, 2nd Edition',2012,4),(2,'Regular Expressions Cookbook, 2nd Edition',2012,1),(3,'Head First Networking',2009,2),(4,'The Art of Concurrency',2009,3),(5,'97 Things Every Programmer Should Know',2010,3),(11,'Liūdna pasaka',1980,4);
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BooksGenres`
--

DROP TABLE IF EXISTS `BooksGenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BooksGenres` (
  `genreId` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `genreDescription` text COLLATE utf8_lithuanian_ci,
  PRIMARY KEY (`genreId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BooksGenres`
--

LOCK TABLES `BooksGenres` WRITE;
/*!40000 ALTER TABLE `BooksGenres` DISABLE KEYS */;
INSERT INTO `BooksGenres` VALUES (1,'Detektyvas','Šio žanro knygos apie kriminalus'),(2,'Romanas','Romantikos mėgėjams'),(3,'Mokslas','Mokslo šaknys karčios, bet vaisiai saldūs'),(4,'Apysaka','Literatūrinė apysaka');
/*!40000 ALTER TABLE `BooksGenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BooksMap`
--

DROP TABLE IF EXISTS `BooksMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BooksMap` (
  `mapId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`mapId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BooksMap`
--

LOCK TABLES `BooksMap` WRITE;
/*!40000 ALTER TABLE `BooksMap` DISABLE KEYS */;
INSERT INTO `BooksMap` VALUES (1,1,1),(2,2,4),(3,3,4),(4,4,6),(5,5,7),(6,1,7),(7,1,5),(8,11,10);
/*!40000 ALTER TABLE `BooksMap` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-25 22:09:47
