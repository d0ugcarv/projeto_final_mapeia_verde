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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cnpj` char(14) NOT NULL,
  `nome` varchar(48) NOT NULL,
  `tipo` enum('Órgão Público','Empresa','Consultoria','Organização') NOT NULL,
  `email` varchar(48) NOT NULL,
  `telefone` char(14) NOT NULL,
  `endereco` varchar(48) NOT NULL,
  PRIMARY KEY (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('01234567000184','Prefeitura de São Gonçalo','Órgão Público','contato@saogoncalo.rj.gov.br','2137654321','Centro, São Gonçalo'),('11222333000181','Eco Rio Projetos','Consultoria','contato@ecorio.example','21999998888','Rio de Janeiro - RJ'),('12345678000195','Prefeitura do Rio','Órgão Público','contato@prefeitura.rj.gov.br','2123456789','Centro, Rio de Janeiro'),('23456789000106','Verde Urbano Ltda','Empresa','contato@verdeurbano.com.br','2198765432','Tijuca, Rio de Janeiro'),('34567890000117','Eco Consultoria','Consultoria','contato@ecoconsultoria.com.br','2134567890','Botafogo, Rio de Janeiro'),('45678901000128','Instituto Arvoredo','Organização','contato@arvoredo.org.br','2191234567','Flamengo, Rio de Janeiro'),('56789012000139','Jardins Sustentáveis','Empresa','contato@jardinsustentaveis.com.br','2129876543','Barra da Tijuca, Rio de Janeiro'),('67890123000140','Prefeitura de Niterói','Órgão Público','contato@niteroi.rj.gov.br','2131234567','Centro, Niterói'),('78901234000151','Floresta Consultoria','Consultoria','contato@florestaconsultoria.com.br','2192345678','Icaraí, Niterói'),('89012345000162','Instituto Cidade Verde','Organização','contato@cidadeverde.org.br','2127654321','Méier, Rio de Janeiro'),('90123456000173','Paisagem Viva Ltda','Empresa','contato@paisagemviva.com.br','2193456789','Recreio, Rio de Janeiro');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-21  4:56:12
