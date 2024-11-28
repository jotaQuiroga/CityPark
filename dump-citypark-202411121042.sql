-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: citypark
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `acudiente`
--

DROP TABLE IF EXISTS `acudiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acudiente` (
  `id_acudiente` int NOT NULL AUTO_INCREMENT,
  `apellido_acu` varchar(255) DEFAULT NULL,
  `cedula_acu` varchar(255) DEFAULT NULL,
  `correo_elec_acu` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre_acu` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `id_usu_acu` int DEFAULT NULL,
  PRIMARY KEY (`id_acudiente`),
  KEY `FK51nea54yw5gg2n0v5n83sqlsg` (`id_usu_acu`),
  CONSTRAINT `FK51nea54yw5gg2n0v5n83sqlsg` FOREIGN KEY (`id_usu_acu`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atraccion`
--

DROP TABLE IF EXISTS `atraccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atraccion` (
  `id_atraccion` int NOT NULL AUTO_INCREMENT,
  `clasificacion` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `mantenimiento` bit(1) DEFAULT NULL,
  `nombre_atrac` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_atraccion`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atraccion_condicionuso_map`
--

DROP TABLE IF EXISTS `atraccion_condicionuso_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atraccion_condicionuso_map` (
  `id_cond_uso` int NOT NULL,
  `id_atrac` int NOT NULL,
  PRIMARY KEY (`id_cond_uso`,`id_atrac`),
  KEY `FK9mls9f0ljsjy14jkwybitbb6n` (`id_atrac`),
  CONSTRAINT `FK9mls9f0ljsjy14jkwybitbb6n` FOREIGN KEY (`id_atrac`) REFERENCES `atraccion` (`id_atraccion`),
  CONSTRAINT `FKjlb5qxbv5ij91tr8rlcirrd5y` FOREIGN KEY (`id_cond_uso`) REFERENCES `condicionuso` (`id_condicion_uso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(255) DEFAULT NULL,
  `salario` int DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `condicionuso`
--

DROP TABLE IF EXISTS `condicionuso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condicionuso` (
  `id_condicion_uso` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_condicion_uso`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `cedula` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `id_emple_cargo` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `FK5lyccanh1srbuv8wc1qbur1nb` (`id_emple_cargo`),
  CONSTRAINT `FK5lyccanh1srbuv8wc1qbur1nb` FOREIGN KEY (`id_emple_cargo`) REFERENCES `cargo` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tri1` BEFORE INSERT ON `empleado` FOR EACH ROW BEGIN

    IF position('@' in NEW.correo_electronico) = 0 THEN

        SIGNAL SQLSTATE '45000' 

        SET MESSAGE_TEXT = 'NO ES UN CORREO VALIDO';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estacion`
--

DROP TABLE IF EXISTS `estacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacion` (
  `id_estacion` int NOT NULL AUTO_INCREMENT,
  `nombre_estacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tiquete`
--

DROP TABLE IF EXISTS `tiquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiquete` (
  `id_tiquete` int NOT NULL AUTO_INCREMENT,
  `tipo_tiquete` varchar(255) DEFAULT NULL,
  `id_atrac_tiq` int DEFAULT NULL,
  `id_emp_tiq` int DEFAULT NULL,
  `id_est_tiq` int DEFAULT NULL,
  `id_usu_tiq` int DEFAULT NULL,
  PRIMARY KEY (`id_tiquete`),
  UNIQUE KEY `UK_qrqapbvdcat8qb3qova66gjpk` (`id_atrac_tiq`),
  UNIQUE KEY `UK_393fh5avi3lw39xtadi4mfiee` (`id_emp_tiq`),
  UNIQUE KEY `UK_ekadbd52slinjwubk6ut3qkib` (`id_est_tiq`),
  UNIQUE KEY `UK_pv8nsapcvf14mhnodjnjw1hi2` (`id_usu_tiq`),
  CONSTRAINT `FK44i6qnldbds04r86350a85ao8` FOREIGN KEY (`id_emp_tiq`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `FK6x5ltai8p3c6riouvmggooocn` FOREIGN KEY (`id_atrac_tiq`) REFERENCES `atraccion` (`id_atraccion`),
  CONSTRAINT `FKfg6t9593i605xl6tuictx9iiq` FOREIGN KEY (`id_est_tiq`) REFERENCES `estacion` (`id_estacion`),
  CONSTRAINT `FKseunc44x5nbt73rei2ib82ehg` FOREIGN KEY (`id_usu_tiq`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `cedula` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `estatura` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `numero_visitas` int DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'citypark'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 10:42:45
