-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_cinema
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `db_cinema`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_cinema` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `db_cinema`;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id_client` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nom_client` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse_client` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_tarif` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_paiement` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `id_tarif` (`id_tarif`),
  KEY `id_paiement` (`id_paiement`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_tarif`) REFERENCES `tarif` (`id_tarif`),
  CONSTRAINT `client_ibfk_2` FOREIGN KEY (`id_paiement`) REFERENCES `mode_de_paiement` (`id_paiement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('CL1','Client1','Avenue du parc','TA1','MP1'),('CL2','Client2','20 boulevard saint honore','TA1','MP2'),('CL3','Client3','10 avenue staint martin','TA3','MP1'),('CL4','Client4','6 rue vaugirard','TA2','MP1'),('CL5','Client5','15 rue de la paix','TA1','MP1'),('CL6','Client6','1 allee des baobabs','TA1','MP2');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complexe`
--

DROP TABLE IF EXISTS `complexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complexe` (
  `id_complexe` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nom_complexe` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_complexe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complexe`
--

LOCK TABLES `complexe` WRITE;
/*!40000 ALTER TABLE `complexe` DISABLE KEYS */;
INSERT INTO `complexe` VALUES ('CO1','Complexe1'),('CO2','Complexe2');
/*!40000 ALTER TABLE `complexe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film` (
  `id_film` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `titre_film` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duree_film` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_film`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES ('FI1','Film1','30mn'),('FI2','Film2','45mn'),('FI3','Film3','60mn');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horaire`
--

DROP TABLE IF EXISTS `horaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horaire` (
  `id_horaire` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `horaire` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_horaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horaire`
--

LOCK TABLES `horaire` WRITE;
/*!40000 ALTER TABLE `horaire` DISABLE KEYS */;
INSERT INTO `horaire` VALUES ('HO1','10h'),('HO2','14h'),('HO3','20h');
/*!40000 ALTER TABLE `horaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mode_de_paiement`
--

DROP TABLE IF EXISTS `mode_de_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mode_de_paiement` (
  `id_paiement` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type_paiement` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_paiement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mode_de_paiement`
--

LOCK TABLES `mode_de_paiement` WRITE;
/*!40000 ALTER TABLE `mode_de_paiement` DISABLE KEYS */;
INSERT INTO `mode_de_paiement` VALUES ('MP1','En ligne'),('MP2','Sur place');
/*!40000 ALTER TABLE `mode_de_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id_reservation` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_client` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_seance` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `id_client` (`id_client`),
  KEY `id_seance` (`id_seance`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id_seance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('RE1','CL1','SC1'),('RE2','CL2','SC1'),('RE3','CL3','SC4'),('RE4','CL4','SC4'),('RE5','CL5','SC6'),('RE6','CL6','SC5');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salle`
--

DROP TABLE IF EXISTS `salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salle` (
  `id_salle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nom_salle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_disponible` int(11) DEFAULT NULL,
  `id_horaire` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_complexe` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_salle`),
  KEY `id_horaire` (`id_horaire`),
  KEY `id_complexe` (`id_complexe`),
  CONSTRAINT `salle_ibfk_1` FOREIGN KEY (`id_horaire`) REFERENCES `horaire` (`id_horaire`),
  CONSTRAINT `salle_ibfk_2` FOREIGN KEY (`id_complexe`) REFERENCES `complexe` (`id_complexe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salle`
--

LOCK TABLES `salle` WRITE;
/*!40000 ALTER TABLE `salle` DISABLE KEYS */;
INSERT INTO `salle` VALUES ('SA1','Salle1',20,'HO1','CO1'),('SA2','Salle1',10,'HO2','CO1'),('SA3','Salle1',5,'HO3','CO1'),('SA4','Salle2',25,'HO1','CO1'),('SA5','Salle2',15,'HO2','CO1'),('SA6','Salle1',17,'HO1','CO2'),('SA7','Salle1',7,'HO3','CO2');
/*!40000 ALTER TABLE `salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seance`
--

DROP TABLE IF EXISTS `seance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seance` (
  `id_seance` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_salle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_film` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_seance`),
  KEY `id_salle` (`id_salle`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`),
  CONSTRAINT `seance_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seance`
--

LOCK TABLES `seance` WRITE;
/*!40000 ALTER TABLE `seance` DISABLE KEYS */;
INSERT INTO `seance` VALUES ('SC1','SA1','FI1'),('SC2','SA4','FI1'),('SC3','SA2','FI1'),('SC4','SA7','FI1'),('SC5','SA4','FI2'),('SC6','SA6','FI3');
/*!40000 ALTER TABLE `seance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarif` (
  `id_tarif` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nom_tarif` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tarif` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_tarif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarif`
--

LOCK TABLES `tarif` WRITE;
/*!40000 ALTER TABLE `tarif` DISABLE KEYS */;
INSERT INTO `tarif` VALUES ('TA1','PLEIN TARIF','9.20 EUR'),('TA2','ETUDIANT','7.60 EUR'),('TA3','MOINS DE 14ans','5.90 EUR');
/*!40000 ALTER TABLE `tarif` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20 23:15:45
