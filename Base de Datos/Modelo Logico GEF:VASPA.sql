CREATE DATABASE  IF NOT EXISTS `bdProgramas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bdProgramas`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: bdProgramas
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `ABARCA`
--

DROP TABLE IF EXISTS `ABARCA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ABARCA` (
  `LLAMADO_id` int(10) unsigned NOT NULL,
  `MESA_EXAMEN_codMesa` int(10) unsigned NOT NULL,
  KEY `fk_ABARCA_MESA_EXAMEN_idx` (`MESA_EXAMEN_codMesa`),
  KEY `fk_ABARCA_LLAMADO_idx` (`LLAMADO_id`),
  CONSTRAINT `fk_ABARCA_LLAMADO` FOREIGN KEY (`LLAMADO_id`) REFERENCES `LLAMADO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ABARCA_MESA_EXAMEN` FOREIGN KEY (`MESA_EXAMEN_codMesa`) REFERENCES `MESA_EXAMEN` (`codMesa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ABARCA`
--

LOCK TABLES `ABARCA` WRITE;
/*!40000 ALTER TABLE `ABARCA` DISABLE KEYS */;
/*!40000 ALTER TABLE `ABARCA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASIGNATURA`
--

DROP TABLE IF EXISTS `ASIGNATURA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASIGNATURA` (
  `codAsignatura` int(10) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `departamento` varchar(45) NOT NULL,
  `contenidosMinimos` text NOT NULL,
  `PROFESOR_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codAsignatura`),
  KEY `fk_ASIGNATURA_PROFESOR_idx` (`PROFESOR_id`),
  CONSTRAINT `fk_ASIGNATURA_PROFESOR` FOREIGN KEY (`PROFESOR_id`) REFERENCES `PROFESOR` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASIGNATURA`
--

LOCK TABLES `ASIGNATURA` WRITE;
/*!40000 ALTER TABLE `ASIGNATURA` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASIGNATURA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARRERA`
--

DROP TABLE IF EXISTS `CARRERA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CARRERA` (
  `codCarrera` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`codCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARRERA`
--

LOCK TABLES `CARRERA` WRITE;
/*!40000 ALTER TABLE `CARRERA` DISABLE KEYS */;
/*!40000 ALTER TABLE `CARRERA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORRELATIVAD`
--

DROP TABLE IF EXISTS `CORRELATIVAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CORRELATIVAD` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requisito` enum('Regular','Aprobada') DEFAULT NULL,
  `codAsignatura` int(10) unsigned NOT NULL,
  `codAsignatura_Correlatividad` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CORRELATIVAD_ASIGNATURA1_idx` (`codAsignatura`),
  KEY `fk_CORRELATIVAD_ASIGNATURA2_idx` (`codAsignatura_Correlatividad`),
  CONSTRAINT `fk_CORRELATIVAD_ASIGNATURA1` FOREIGN KEY (`codAsignatura`) REFERENCES `ASIGNATURA` (`codAsignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CORRELATIVAD_ASIGNATURA2` FOREIGN KEY (`codAsignatura_Correlatividad`) REFERENCES `ASIGNATURA` (`codAsignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORRELATIVAD`
--

LOCK TABLES `CORRELATIVAD` WRITE;
/*!40000 ALTER TABLE `CORRELATIVAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `CORRELATIVAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTAMENTO`
--

DROP TABLE IF EXISTS `DEPARTAMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTAMENTO` (
  `id` int(10) unsigned NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTAMENTO`
--

LOCK TABLES `DEPARTAMENTO` WRITE;
/*!40000 ALTER TABLE `DEPARTAMENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `DEPARTAMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FECHA`
--

DROP TABLE IF EXISTS `FECHA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FECHA` (
  `dia` varchar(45) NOT NULL,
  `mes` varchar(45) NOT NULL,
  `año` varchar(45) NOT NULL,
  `LLAMADO_id` int(10) unsigned NOT NULL,
  KEY `fk_FECHA_LLAMADO_idx` (`LLAMADO_id`),
  CONSTRAINT `fk_FECHA_LLAMADO` FOREIGN KEY (`LLAMADO_id`) REFERENCES `LLAMADO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FECHA`
--

LOCK TABLES `FECHA` WRITE;
/*!40000 ALTER TABLE `FECHA` DISABLE KEYS */;
/*!40000 ALTER TABLE `FECHA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LICENCIA`
--

DROP TABLE IF EXISTS `LICENCIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LICENCIA` (
  `id` int(10) unsigned NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `PROFESOR_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LICENCIA_PROFESOR_idx` (`PROFESOR_id`),
  CONSTRAINT `fk_LICENCIA_PROFESOR` FOREIGN KEY (`PROFESOR_id`) REFERENCES `PROFESOR` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LICENCIA`
--

LOCK TABLES `LICENCIA` WRITE;
/*!40000 ALTER TABLE `LICENCIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `LICENCIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LLAMADO`
--

DROP TABLE IF EXISTS `LLAMADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LLAMADO` (
  `id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LLAMADO`
--

LOCK TABLES `LLAMADO` WRITE;
/*!40000 ALTER TABLE `LLAMADO` DISABLE KEYS */;
/*!40000 ALTER TABLE `LLAMADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MESA_EXAMEN`
--

DROP TABLE IF EXISTS `MESA_EXAMEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MESA_EXAMEN` (
  `codMesa` int(10) unsigned NOT NULL,
  `tipo` enum('todoTiempo','general','extraordinaria') NOT NULL,
  `TRIBUNAL_id` int(10) unsigned NOT NULL,
  `ASIGNATURA_codAsignatura` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codMesa`),
  KEY `fk_MESA_EXAMEN_TRIBUNAL_idx` (`TRIBUNAL_id`),
  KEY `fk_MESA_EXAMEN_ASIGNATURA_idx` (`ASIGNATURA_codAsignatura`),
  CONSTRAINT `fk_MESA_EXAMEN_ASIGNATURA` FOREIGN KEY (`ASIGNATURA_codAsignatura`) REFERENCES `ASIGNATURA` (`codAsignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MESA_EXAMEN_TRIBUNAL` FOREIGN KEY (`TRIBUNAL_id`) REFERENCES `TRIBUNAL` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MESA_EXAMEN`
--

LOCK TABLES `MESA_EXAMEN` WRITE;
/*!40000 ALTER TABLE `MESA_EXAMEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `MESA_EXAMEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAN`
--

DROP TABLE IF EXISTS `PLAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLAN` (
  `codPlan` varchar(10) NOT NULL,
  `anio` year(4) NOT NULL,
  `CARRERA_codCarrera` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codPlan`),
  KEY `fk_PLAN_CARRERA_idx` (`CARRERA_codCarrera`),
  CONSTRAINT `fk_PLAN_CARRERA` FOREIGN KEY (`CARRERA_codCarrera`) REFERENCES `CARRERA` (`codCarrera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAN`
--

LOCK TABLES `PLAN` WRITE;
/*!40000 ALTER TABLE `PLAN` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAN_ASIGNATURA`
--

DROP TABLE IF EXISTS `PLAN_ASIGNATURA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLAN_ASIGNATURA` (
  `PLAN_codPlan` varchar(10) NOT NULL,
  `ASIGNATURA_codAsignatura` int(10) unsigned NOT NULL,
  KEY `fk_PLAN_ASIGNATURA_ASIGNATURA_idx` (`ASIGNATURA_codAsignatura`),
  KEY `fk_PLAN_ASIGNATURA_PLAN_idx` (`PLAN_codPlan`),
  CONSTRAINT `fk_PLAN_ASIGNATURA` FOREIGN KEY (`ASIGNATURA_codAsignatura`) REFERENCES `ASIGNATURA` (`codAsignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PLAN_ASIGNATURA_PLAN` FOREIGN KEY (`PLAN_codPlan`) REFERENCES `PLAN` (`codPlan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAN_ASIGNATURA`
--

LOCK TABLES `PLAN_ASIGNATURA` WRITE;
/*!40000 ALTER TABLE `PLAN_ASIGNATURA` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLAN_ASIGNATURA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFESOR`
--

DROP TABLE IF EXISTS `PROFESOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROFESOR` (
  `id` int(10) unsigned NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `cargo` enum('') NOT NULL,
  `categoria` enum('') NOT NULL,
  `DEPARTAMENTO_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_PROFESOR_DEPARTAMENTO_idx` (`DEPARTAMENTO_id`),
  CONSTRAINT `fk_PROFESOR_DEPARTAMENTO` FOREIGN KEY (`DEPARTAMENTO_id`) REFERENCES `DEPARTAMENTO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFESOR`
--

LOCK TABLES `PROFESOR` WRITE;
/*!40000 ALTER TABLE `PROFESOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROFESOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROGRAMA`
--

DROP TABLE IF EXISTS `PROGRAMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROGRAMA` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `anio` year(4) NOT NULL,
  `anioCarrera` enum('1','2','3','4','5') NOT NULL,
  `horasTeoria` tinyint(4) NOT NULL,
  `horasPractica` tinyint(4) NOT NULL,
  `horasOtros` tinyint(4) DEFAULT NULL,
  `regimenCursada` enum('A','1','2','O') NOT NULL,
  `observacionesHoras` text,
  `observacionesCursada` text NOT NULL,
  `docentesTeoria` text NOT NULL,
  `docentesPractica` text NOT NULL,
  `fundamentacion` text NOT NULL,
  `objetivosGenerales` text NOT NULL,
  `organizacionContenidos` text NOT NULL,
  `criteriosEvaluacion` text NOT NULL,
  `metodologiaPresencial` text NOT NULL,
  `regularizacionPresencial` text NOT NULL,
  `aprobacionPresencial` text NOT NULL,
  `metodologiaSATEP` text NOT NULL,
  `regularizacionSATEP` text NOT NULL,
  `aprobacionSATEP` text NOT NULL,
  `metodologiaLibre` text NOT NULL,
  `aprobacionLibre` text NOT NULL,
  `ubicacion` enum('SA','DPTO') DEFAULT NULL,
  `ASIGNATURA_codAsignatura` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PROGRAMA_ASIGNATURA_idx` (`ASIGNATURA_codAsignatura`),
  CONSTRAINT `fk_PROGRAMA_ASIGNATURA` FOREIGN KEY (`ASIGNATURA_codAsignatura`) REFERENCES `ASIGNATURA` (`codAsignatura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROGRAMA`
--

LOCK TABLES `PROGRAMA` WRITE;
/*!40000 ALTER TABLE `PROGRAMA` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROGRAMA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGISTRO_NOTIFICACION`
--

DROP TABLE IF EXISTS `REGISTRO_NOTIFICACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REGISTRO_NOTIFICACION` (
  `id` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `observaciones` text,
  `PROFESOR_id` int(10) unsigned NOT NULL,
  `PROGRAMA_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_REGISTRO_NOTIFICACION_PROFESOR_idx` (`PROFESOR_id`),
  KEY `fk_REGISTRO_NOTIFICACION_PROGRAMA_idx` (`PROGRAMA_id`),
  CONSTRAINT `fk_REGISTRO_NOTIFICACION_PROFESOR` FOREIGN KEY (`PROFESOR_id`) REFERENCES `PROFESOR` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_REGISTRO_NOTIFICACION_PROGRAMA` FOREIGN KEY (`PROGRAMA_id`) REFERENCES `PROGRAMA` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGISTRO_NOTIFICACION`
--

LOCK TABLES `REGISTRO_NOTIFICACION` WRITE;
/*!40000 ALTER TABLE `REGISTRO_NOTIFICACION` DISABLE KEYS */;
/*!40000 ALTER TABLE `REGISTRO_NOTIFICACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SE_COMPONE_DE`
--

DROP TABLE IF EXISTS `SE_COMPONE_DE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SE_COMPONE_DE` (
  `MESA_EXAMEN_codMesa` int(10) unsigned NOT NULL,
  `CARRERA_codCarrera` int(10) unsigned NOT NULL,
  KEY `fk_SE_COMPONE_DE_CARRERA_idx` (`CARRERA_codCarrera`),
  KEY `fk_SE_COMPONE_DE_MESA_EXAMEN_idx` (`MESA_EXAMEN_codMesa`),
  CONSTRAINT `fk_SE_COMPONE_DE_CARRERA` FOREIGN KEY (`CARRERA_codCarrera`) REFERENCES `CARRERA` (`codCarrera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_SE_COMPONE_DE_MESA_EXAMEN` FOREIGN KEY (`MESA_EXAMEN_codMesa`) REFERENCES `MESA_EXAMEN` (`codMesa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SE_COMPONE_DE`
--

LOCK TABLES `SE_COMPONE_DE` WRITE;
/*!40000 ALTER TABLE `SE_COMPONE_DE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SE_COMPONE_DE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPO_LICENCIA`
--

DROP TABLE IF EXISTS `TIPO_LICENCIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPO_LICENCIA` (
  `nombre` int(10) unsigned NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `LICENCIA_id` int(10) unsigned NOT NULL,
  KEY `fk_TIPO_LICENCIA_LICENCIA_idx` (`LICENCIA_id`),
  CONSTRAINT `fk_TIPO_LICENCIA_LICENCIA` FOREIGN KEY (`LICENCIA_id`) REFERENCES `LICENCIA` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPO_LICENCIA`
--

LOCK TABLES `TIPO_LICENCIA` WRITE;
/*!40000 ALTER TABLE `TIPO_LICENCIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPO_LICENCIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRIBUNAL`
--

DROP TABLE IF EXISTS `TRIBUNAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRIBUNAL` (
  `id` int(10) unsigned NOT NULL,
  `PROFESOR_id` int(10) unsigned NOT NULL,
  `PROFESOR_id1` int(10) unsigned NOT NULL,
  `PROFESOR_id2` int(10) unsigned DEFAULT NULL,
  `PROFESOR_id3` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TRIBUNAL_PROFESOR1_idx` (`PROFESOR_id`),
  KEY `fk_TRIBUNAL_PROFESOR2_idx` (`PROFESOR_id1`),
  KEY `fk_TRIBUNAL_PROFESOR3_idx` (`PROFESOR_id2`),
  KEY `fk_TRIBUNAL_PROFESOR4_idx` (`PROFESOR_id3`),
  CONSTRAINT `fk_TRIBUNAL_PROFESOR1` FOREIGN KEY (`PROFESOR_id`) REFERENCES `PROFESOR` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TRIBUNAL_PROFESOR2` FOREIGN KEY (`PROFESOR_id1`) REFERENCES `PROFESOR` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TRIBUNAL_PROFESOR3` FOREIGN KEY (`PROFESOR_id2`) REFERENCES `PROFESOR` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_TRIBUNAL_PROFESOR4` FOREIGN KEY (`PROFESOR_id3`) REFERENCES `PROFESOR` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRIBUNAL`
--

LOCK TABLES `TRIBUNAL` WRITE;
/*!40000 ALTER TABLE `TRIBUNAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRIBUNAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bdProgramas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-22 19:00:03
