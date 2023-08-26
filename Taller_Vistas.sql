-- MySQL dump 10.13  Distrib 8.0.32, for macos13.0 (x86_64)
--
-- Host: localhost    Database: VISTAS
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `Partes`
--

DROP TABLE IF EXISTS `Partes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Partes` (
  `NumeroParte` int NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Peso` decimal(10,2) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NumeroParte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Partes`
--

LOCK TABLES `Partes` WRITE;
/*!40000 ALTER TABLE `Partes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Partes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `partesporciudad`
--

DROP TABLE IF EXISTS `partesporciudad`;
/*!50001 DROP VIEW IF EXISTS `partesporciudad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `partesporciudad` AS SELECT 
 1 AS `Parte`,
 1 AS `Ciudad`,
 1 AS `CantidadUtilizada`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `partesporproveedor`
--

DROP TABLE IF EXISTS `partesporproveedor`;
/*!50001 DROP VIEW IF EXISTS `partesporproveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `partesporproveedor` AS SELECT 
 1 AS `Parte`,
 1 AS `Proveedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pesototalporproveedor`
--

DROP TABLE IF EXISTS `pesototalporproveedor`;
/*!50001 DROP VIEW IF EXISTS `pesototalporproveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pesototalporproveedor` AS SELECT 
 1 AS `Proveedor`,
 1 AS `PesoTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `preciototalporciudad`
--

DROP TABLE IF EXISTS `preciototalporciudad`;
/*!50001 DROP VIEW IF EXISTS `preciototalporciudad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `preciototalporciudad` AS SELECT 
 1 AS `Ciudad`,
 1 AS `PrecioTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedores` (
  `Id` int NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taller`
--

DROP TABLE IF EXISTS `Taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Taller` (
  `MovimientoId` int NOT NULL,
  `ProveedorId` int DEFAULT NULL,
  `ParteNumeroParte` int DEFAULT NULL,
  `CantidadUtilizada` int DEFAULT NULL,
  PRIMARY KEY (`MovimientoId`),
  KEY `ProveedorId` (`ProveedorId`),
  KEY `ParteNumeroParte` (`ParteNumeroParte`),
  CONSTRAINT `taller_ibfk_1` FOREIGN KEY (`ProveedorId`) REFERENCES `Proveedores` (`Id`),
  CONSTRAINT `taller_ibfk_2` FOREIGN KEY (`ParteNumeroParte`) REFERENCES `Partes` (`NumeroParte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taller`
--

LOCK TABLES `Taller` WRITE;
/*!40000 ALTER TABLE `Taller` DISABLE KEYS */;
/*!40000 ALTER TABLE `Taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `totalpartesporproveedor`
--

DROP TABLE IF EXISTS `totalpartesporproveedor`;
/*!50001 DROP VIEW IF EXISTS `totalpartesporproveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `totalpartesporproveedor` AS SELECT 
 1 AS `Proveedor`,
 1 AS `TotalPartes`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `partesporciudad`
--

/*!50001 DROP VIEW IF EXISTS `partesporciudad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `partesporciudad` AS select `p`.`Nombre` AS `Parte`,`p`.`Ciudad` AS `Ciudad`,`t`.`CantidadUtilizada` AS `CantidadUtilizada` from (`partes` `p` join `taller` `t` on((`p`.`NumeroParte` = `t`.`ParteNumeroParte`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `partesporproveedor`
--

/*!50001 DROP VIEW IF EXISTS `partesporproveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `partesporproveedor` AS select `p`.`Nombre` AS `Parte`,`pr`.`Nombre` AS `Proveedor` from ((`partes` `p` join `taller` `t` on((`p`.`NumeroParte` = `t`.`ParteNumeroParte`))) join `proveedores` `pr` on((`t`.`ProveedorId` = `pr`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pesototalporproveedor`
--

/*!50001 DROP VIEW IF EXISTS `pesototalporproveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pesototalporproveedor` AS select `pr`.`Nombre` AS `Proveedor`,sum((`p`.`Peso` * `t`.`CantidadUtilizada`)) AS `PesoTotal` from ((`proveedores` `pr` join `taller` `t` on((`pr`.`Id` = `t`.`ProveedorId`))) join `partes` `p` on((`t`.`ParteNumeroParte` = `p`.`NumeroParte`))) group by `pr`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `preciototalporciudad`
--

/*!50001 DROP VIEW IF EXISTS `preciototalporciudad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `preciototalporciudad` AS select `p`.`Ciudad` AS `Ciudad`,sum((`p`.`Precio` * `t`.`CantidadUtilizada`)) AS `PrecioTotal` from (`partes` `p` join `taller` `t` on((`p`.`NumeroParte` = `t`.`ParteNumeroParte`))) group by `p`.`Ciudad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalpartesporproveedor`
--

/*!50001 DROP VIEW IF EXISTS `totalpartesporproveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalpartesporproveedor` AS select `pr`.`Nombre` AS `Proveedor`,count(`t`.`ParteNumeroParte`) AS `TotalPartes` from (`proveedores` `pr` left join `taller` `t` on((`pr`.`Id` = `t`.`ProveedorId`))) group by `pr`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-26 17:35:56
