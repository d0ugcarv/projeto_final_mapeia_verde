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
-- Table structure for table `levantamento`
--

DROP TABLE IF EXISTS `levantamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levantamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projeto_id` int NOT NULL,
  `data` date NOT NULL,
  `responsavel` varchar(48) NOT NULL,
  `tipo` enum('Inicial','Atualização') NOT NULL,
  `observacoes` varchar(96) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_levantamento_projeto1_idx` (`projeto_id`),
  CONSTRAINT `fk_levantamento_projeto1` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Coleta inicial ou atualização geral de um território.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levantamento`
--

LOCK TABLES `levantamento` WRITE;
/*!40000 ALTER TABLE `levantamento` DISABLE KEYS */;
INSERT INTO `levantamento` VALUES (1,1,'2026-01-20','Ana Souza','Inicial','Cadastro inicial das árvores do Centro'),(2,1,'2026-03-15','Carlos Lima','Atualização','Atualização das árvores cadastradas'),(3,2,'2026-06-05','Mariana Alves','Inicial','Mapeamento inicial dos corredores verdes'),(4,2,'2026-09-10','Pedro Costa','Atualização','Revisão dos corredores mapeados'),(5,3,'2026-06-15','Juliana Rocha','Inicial','Cadastro das árvores das praças'),(6,3,'2026-08-20','Lucas Martins','Atualização','Atualização dos dados das praças'),(7,4,'2026-02-10','Fernanda Alves','Inicial','Inventário arbóreo da Tijuca'),(8,4,'2026-04-15','Rafael Mendes','Atualização','Revisão do inventário da Tijuca'),(9,5,'2026-05-05','Beatriz Lima','Inicial','Medição inicial da cobertura de sombra'),(10,5,'2026-06-25','Gabriel Souza','Atualização','Atualização das áreas sombreadas'),(11,6,'2026-08-10','Camila Rocha','Inicial','Cadastro inicial das árvores dos parques'),(12,6,'2026-10-05','Diego Martins','Atualização','Revisão das árvores monitoradas'),(13,7,'2026-03-25','Amanda Costa','Inicial','Cadastro arbóreo metropolitano'),(14,7,'2026-06-20','Bruno Alves','Atualização','Complementação dos dados geográficos'),(15,8,'2026-09-10','Isabela Santos','Inicial','Levantamento de vegetação e clima'),(16,8,'2026-11-15','Thiago Lima','Atualização','Atualização dos indicadores ambientais'),(17,9,'2026-07-10','Larissa Mendes','Inicial','Cadastro das áreas verdes'),(18,9,'2026-10-15','Felipe Rocha','Atualização','Atualização das áreas monitoradas'),(19,10,'2026-02-01','Marcos Souza','Inicial','Diagnóstico inicial da arborização'),(20,10,'2026-05-20','Patricia Costa','Atualização','Revisão do diagnóstico arbóreo'),(21,11,'2025-02-10','Renata Alves','Inicial','Cadastro de árvores históricas'),(22,11,'2025-05-15','André Martins','Atualização','Revisão das árvores históricas'),(23,12,'2026-04-10','Sofia Lima','Inicial','Mapeamento inicial dos jardins'),(24,12,'2026-07-15','Eduardo Rocha','Atualização','Atualização dos jardins cadastrados'),(25,13,'2026-10-10','Bianca Souza','Inicial','Cadastro de árvores para monitoramento'),(26,13,'2026-12-10','Gustavo Alves','Atualização','Revisão das condições da arborização'),(27,14,'2026-01-15','Carolina Mendes','Inicial','Cadastro das árvores de Niterói'),(28,14,'2026-04-20','Vinicius Costa','Atualização','Atualização do inventário urbano'),(29,15,'2026-07-10','Leticia Martins','Inicial','Mapeamento de sombra nas escolas'),(30,15,'2026-10-01','Rodrigo Souza','Atualização','Revisão das áreas escolares'),(31,16,'2025-03-10','Daniela Rocha','Inicial','Cadastro arbóreo das praças'),(32,16,'2025-08-15','Marcelo Lima','Atualização','Atualização dos dados das praças'),(33,17,'2026-05-20','Aline Costa','Inicial','Cadastro da vegetação urbana'),(34,17,'2026-08-15','Leonardo Alves','Atualização','Revisão da vegetação monitorada'),(35,18,'2025-06-10','Priscila Mendes','Inicial','Identificação inicial das espécies'),(36,18,'2025-09-15','Henrique Rocha','Atualização','Atualização do inventário de espécies'),(37,19,'2026-02-25','Vanessa Souza','Inicial','Cadastro da cobertura vegetal'),(38,19,'2026-06-10','Ricardo Martins','Atualização','Revisão da cobertura vegetal'),(39,20,'2026-09-15','Claudia Lima','Inicial','Mapeamento de áreas com calor elevado'),(40,20,'2026-11-20','Samuel Costa','Atualização','Atualização das áreas críticas'),(41,21,'2026-03-10','Monica Alves','Inicial','Cadastro de árvores e jardins'),(42,21,'2026-06-15','Igor Souza','Atualização','Revisão do inventário paisagístico'),(43,22,'2026-09-10','Debora Rocha','Inicial','Mapeamento de conexões verdes'),(44,22,'2026-12-01','Alexandre Lima','Atualização','Atualização dos corredores verdes'),(45,23,'2025-02-01','Tatiana Costa','Inicial','Diagnóstico de vegetação ornamental'),(46,23,'2025-05-20','Roberto Mendes','Atualização','Revisão dos jardins avaliados'),(47,24,'2026-01-25','Elaine Martins','Inicial','Cadastro das árvores urbanas'),(48,24,'2026-04-15','Fábio Rocha','Atualização','Atualização do cadastro arbóreo'),(49,25,'2026-07-10','Adriana Souza','Inicial','Cadastro de árvores em praças'),(50,25,'2026-10-10','Marcelo Costa','Atualização','Revisão das árvores das praças'),(51,26,'2025-04-10','Luciana Alves','Inicial','Medição inicial da cobertura de sombra'),(52,27,'2026-02-10','Roberta Lima','Inicial','Cadastro de árvores em vias públicas'),(53,28,'2026-04-10','Sergio Martins','Inicial','Identificação de áreas com pouca sombra'),(54,29,'2026-02-10','Natalia Rocha','Inicial','Cadastro inicial de árvores de risco'),(55,30,'2026-03-10','Caio Mendes','Inicial','Levantamento de áreas para arborização');
/*!40000 ALTER TABLE `levantamento` ENABLE KEYS */;
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
