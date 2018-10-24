CREATE DATABASE  IF NOT EXISTS `bdMesas_Programas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bdMesas_Programas`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: bdMesas_Programas
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
  `idProfesor` varchar(15) NOT NULL,
  PRIMARY KEY (`codAsignatura`),
  KEY `fk_ASIGNATURA_PROFESOR_idx` (`idProfesor`),
  CONSTRAINT `fk_ASIGNATURA_PROFESOR` FOREIGN KEY (`idProfesor`) REFERENCES `PROFESOR` (`id`) ON UPDATE CASCADE
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
-- Table structure for table `CARRERA_MESA_EXAMEN`
--

DROP TABLE IF EXISTS `CARRERA_MESA_EXAMEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CARRERA_MESA_EXAMEN` (
  `codCarrera` int(10) unsigned NOT NULL,
  `codMesa` int(10) unsigned NOT NULL,
  KEY `fk_CARRERA_has_MESA_EXAMEN_MESA_EXAMEN_idx` (`codMesa`),
  KEY `fk_CARRERA_has_MESA_EXAMEN_CARRERA_idx` (`codCarrera`),
  CONSTRAINT `fk_CARRERA_has_MESA_EXAMEN_CARRERA` FOREIGN KEY (`codCarrera`) REFERENCES `CARRERA` (`codCarrera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CARRERA_has_MESA_EXAMEN_MESA_EXAMEN` FOREIGN KEY (`codMesa`) REFERENCES `MESA_EXAMEN` (`codMesa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARRERA_MESA_EXAMEN`
--

LOCK TABLES `CARRERA_MESA_EXAMEN` WRITE;
/*!40000 ALTER TABLE `CARRERA_MESA_EXAMEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `CARRERA_MESA_EXAMEN` ENABLE KEYS */;
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
  CONSTRAINT `fk_CORRELATIVAD_ASIGNATURA1` FOREIGN KEY (`codAsignatura`) REFERENCES `ASIGNATURA` (`codAsignatura`) ON UPDATE CASCADE,
  CONSTRAINT `fk_CORRELATIVAD_ASIGNATURA2` FOREIGN KEY (`codAsignatura_Correlatividad`) REFERENCES `ASIGNATURA` (`codAsignatura`) ON UPDATE CASCADE
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dia` varchar(45) NOT NULL,
  `mes` varchar(45) NOT NULL,
  `año` varchar(45) NOT NULL,
  `indice` int(2) unsigned NOT NULL,
  `LLAMADO_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fechaInicio` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `idProfesor` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LICENCIA_PROFESOR_idx` (`idProfesor`),
  CONSTRAINT `fk_LICENCIA_PROFESOR` FOREIGN KEY (`idProfesor`) REFERENCES `PROFESOR` (`id`) ON UPDATE CASCADE
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
-- Table structure for table `LLAMADO_MESA_EXAMEN`
--

DROP TABLE IF EXISTS `LLAMADO_MESA_EXAMEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LLAMADO_MESA_EXAMEN` (
  `idLlamado` int(10) unsigned NOT NULL,
  `codMesa` int(10) unsigned NOT NULL,
  `hora` time(5) NOT NULL,
  `dia` int(2) unsigned NOT NULL,
  `fechaUnica` date DEFAULT NULL,
  KEY `fk_LLAMADO_has_MESA_EXAMEN_MESA_EXAMEN_idx` (`codMesa`),
  KEY `fk_LLAMADO_has_MESA_EXAMEN_LLAMADO_idx` (`idLlamado`),
  CONSTRAINT `fk_LLAMADO_has_MESA_EXAMEN_LLAMADO` FOREIGN KEY (`idLlamado`) REFERENCES `LLAMADO` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_LLAMADO_has_MESA_EXAMEN_MESA_EXAMEN` FOREIGN KEY (`codMesa`) REFERENCES `MESA_EXAMEN` (`codMesa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LLAMADO_MESA_EXAMEN`
--

LOCK TABLES `LLAMADO_MESA_EXAMEN` WRITE;
/*!40000 ALTER TABLE `LLAMADO_MESA_EXAMEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `LLAMADO_MESA_EXAMEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MESA_EXAMEN`
--

DROP TABLE IF EXISTS `MESA_EXAMEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MESA_EXAMEN` (
  `codMesa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` enum('todoTiempo','general','extraordinaria') NOT NULL,
  `idTribunal` int(10) unsigned NOT NULL,
  `codAsignatura` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codMesa`),
  KEY `fk_MESA_EXAMEN_TRIBUNAL_idx` (`idTribunal`),
  KEY `fk_MESA_EXAMEN_ASIGNATURA_idx` (`codAsignatura`),
  CONSTRAINT `fk_MESA_EXAMEN_ASIGNATURA` FOREIGN KEY (`codAsignatura`) REFERENCES `ASIGNATURA` (`codAsignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MESA_EXAMEN_TRIBUNAL` FOREIGN KEY (`idTribunal`) REFERENCES `TRIBUNAL` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `codCarrera` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codPlan`),
  KEY `fk_PLAN_CARRERA_idx` (`codCarrera`),
  CONSTRAINT `fk_PLAN_CARRERA` FOREIGN KEY (`codCarrera`) REFERENCES `CARRERA` (`codCarrera`) ON UPDATE CASCADE
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
  `codPlan` varchar(10) NOT NULL,
  `codAsignatura` int(10) unsigned NOT NULL,
  KEY `fk_PLAN_ASIGNATURA_ASIGNATURA_idx` (`codAsignatura`),
  KEY `fk_PLAN_ASIGNATURA_PLAN_idx` (`codPlan`),
  CONSTRAINT `fk_PLAN_ASIGNATURA` FOREIGN KEY (`codAsignatura`) REFERENCES `ASIGNATURA` (`codAsignatura`) ON UPDATE CASCADE,
  CONSTRAINT `fk_PLAN_ASIGNATURA_PLAN` FOREIGN KEY (`codPlan`) REFERENCES `PLAN` (`codPlan`) ON UPDATE CASCADE
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
  `id` varchar(15) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `idDepartemento` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_PROFESOR_DEPARTAMENTO_idx` (`idDepartemento`),
  CONSTRAINT `fk_PROFESOR_DEPARTAMENTO` FOREIGN KEY (`idDepartemento`) REFERENCES `DEPARTAMENTO` (`id`) ON UPDATE CASCADE
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
  `codAsignatura` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PROGRAMA_ASIGNATURA_idx` (`codAsignatura`),
  CONSTRAINT `fk_PROGRAMA_ASIGNATURA` FOREIGN KEY (`codAsignatura`) REFERENCES `ASIGNATURA` (`codAsignatura`) ON UPDATE CASCADE
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `observaciones` text,
  `idProfesor` varchar(15) NOT NULL,
  `idPrograma` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_REGISTRO_NOTIFICACION_PROFESOR_idx` (`idProfesor`),
  KEY `fk_REGISTRO_NOTIFICACION_PROGRAMA_idx` (`idPrograma`),
  CONSTRAINT `fk_REGISTRO_NOTIFICACION_PROFESOR` FOREIGN KEY (`idProfesor`) REFERENCES `PROFESOR` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_REGISTRO_NOTIFICACION_PROGRAMA` FOREIGN KEY (`idPrograma`) REFERENCES `PROGRAMA` (`id`) ON UPDATE CASCADE
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
-- Table structure for table `TIPO_LICENCIA`
--

DROP TABLE IF EXISTS `TIPO_LICENCIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPO_LICENCIA` (
  `nombre` varchar(100) NOT NULL,
  `descripción` varchar(100) DEFAULT NULL,
  `idLicencia` int(10) unsigned NOT NULL,
  KEY `fk_TIPO_LICENCIA_LICENCIA_idx` (`idLicencia`),
  CONSTRAINT `fk_TIPO_LICENCIA_LICENCIA` FOREIGN KEY (`idLicencia`) REFERENCES `LICENCIA` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presidente` varchar(15) NOT NULL,
  `vocal` varchar(15) NOT NULL,
  `vocal1` varchar(15) DEFAULT NULL,
  `suplente` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TRIBUNAL_PROFESOR1_idx` (`presidente`),
  KEY `fk_TRIBUNAL_PROFESOR2_idx` (`vocal`),
  KEY `fk_TRIBUNAL_PROFESOR3_idx` (`vocal1`),
  KEY `fk_TRIBUNAL_PROFESOR4_idx` (`suplente`),
  CONSTRAINT `fk_TRIBUNAL_PROFESOR1` FOREIGN KEY (`presidente`) REFERENCES `PROFESOR` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TRIBUNAL_PROFESOR2` FOREIGN KEY (`vocal`) REFERENCES `PROFESOR` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TRIBUNAL_PROFESOR3` FOREIGN KEY (`vocal1`) REFERENCES `PROFESOR` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_TRIBUNAL_PROFESOR4` FOREIGN KEY (`suplente`) REFERENCES `PROFESOR` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
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
-- Dumping routines for database 'bdMesas_Programas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-24 18:02:57
