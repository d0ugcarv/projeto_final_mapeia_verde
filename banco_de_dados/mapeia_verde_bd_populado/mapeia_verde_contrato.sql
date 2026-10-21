-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: mapeia_verde
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.22.04.3

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
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_cnpj` char(14) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tipo` enum('Pontual','Recorrente','Monitoramento') NOT NULL,
  `status` enum('Ativo','Inativo') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contrato_cliente_idx` (`cliente_cnpj`),
  CONSTRAINT `fk_contrato_cliente` FOREIGN KEY (`cliente_cnpj`) REFERENCES `cliente` (`cnpj`),
  CONSTRAINT `chk_contrato_datas` CHECK (((`data_fim` is null) or (`data_fim` >= `data_inicio`)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,'12345678000195','2026-01-10','2026-12-31',85000.00,'Recorrente','Ativo'),(2,'12345678000195','2026-06-01','2026-11-30',22000.00,'Pontual','Ativo'),(3,'23456789000106','2026-02-01','2026-07-31',18500.00,'Pontual','Inativo'),(4,'23456789000106','2026-08-01',NULL,27000.00,'Monitoramento','Ativo'),(5,'34567890000117','2026-03-15',NULL,32000.00,'Monitoramento','Ativo'),(6,'34567890000117','2026-07-01','2027-06-30',41000.00,'Recorrente','Ativo'),(7,'45678901000128','2026-01-20','2026-10-20',24000.00,'Recorrente','Ativo'),(8,'45678901000128','2025-02-01','2025-08-01',15000.00,'Pontual','Inativo'),(9,'56789012000139','2026-04-01','2026-09-30',12500.00,'Pontual','Inativo'),(10,'56789012000139','2026-10-01',NULL,30000.00,'Monitoramento','Ativo'),(11,'67890123000140','2026-01-05','2026-12-31',67000.00,'Recorrente','Ativo'),(12,'67890123000140','2025-03-01','2025-12-31',48000.00,'Recorrente','Inativo'),(13,'78901234000151','2026-05-10',NULL,28000.00,'Monitoramento','Ativo'),(14,'78901234000151','2025-06-01','2025-11-30',17500.00,'Pontual','Inativo'),(15,'89012345000162','2026-02-15','2026-08-15',19500.00,'Pontual','Inativo'),(16,'89012345000162','2026-09-01',NULL,26000.00,'Monitoramento','Ativo'),(17,'90123456000173','2026-03-01','2027-02-28',36000.00,'Recorrente','Ativo'),(18,'90123456000173','2025-01-15','2025-07-15',21000.00,'Pontual','Inativo'),(19,'01234567000184','2026-01-15',NULL,54000.00,'Monitoramento','Ativo'),(20,'01234567000184','2025-04-01','2025-12-31',39000.00,'Recorrente','Inativo');
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-21  4:56:13
