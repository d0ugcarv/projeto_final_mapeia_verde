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
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contrato_id` int NOT NULL,
  `nome` varchar(48) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `descricao` varchar(96) NOT NULL,
  `area` varchar(48) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projeto_contrato1_idx` (`contrato_id`),
  CONSTRAINT `fk_projeto_contrato1` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`),
  CONSTRAINT `chk_projeto_datas` CHECK ((`data_fim` >= `data_inicio`))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,1,'Arborização do Centro','2026-01-15','2026-05-30','Mapeamento de árvores e áreas sombreadas','Centro, Rio de Janeiro'),(2,1,'Corredores Verdes Urbanos','2026-06-01','2026-12-15','Identificação de corredores de vegetação','Zona Norte, Rio de Janeiro'),(3,2,'Praças Sustentáveis','2026-06-10','2026-11-20','Inventário arbóreo de praças públicas','Zona Sul, Rio de Janeiro'),(4,3,'Árvores da Tijuca','2026-02-05','2026-04-30','Levantamento de árvores em vias urbanas','Tijuca, Rio de Janeiro'),(5,3,'Mapeamento de Sombra','2026-05-01','2026-07-20','Análise de cobertura de sombra urbana','Maracanã, Rio de Janeiro'),(6,4,'Monitoramento de Parques','2026-08-05','2026-12-15','Acompanhamento da saúde das árvores','Barra da Tijuca, Rio de Janeiro'),(7,5,'Inventário Arbóreo Metropolitano','2026-03-20','2026-08-30','Cadastro geográfico de árvores urbanas','Região Metropolitana do Rio'),(8,5,'Árvores e Clima','2026-09-01','2027-02-28','Avaliação da vegetação e do calor urbano','Rio de Janeiro'),(9,6,'Monitoramento de Áreas Verdes','2026-07-05','2026-12-20','Monitoramento periódico da vegetação','Niterói, RJ'),(10,7,'Requalificação Verde','2026-01-25','2026-06-30','Diagnóstico da arborização local','Flamengo, Rio de Janeiro'),(11,8,'Árvores Históricas','2025-02-05','2025-07-25','Inventário de árvores antigas','Centro, Rio de Janeiro'),(12,9,'Jardins Urbanos','2026-04-05','2026-08-25','Mapeamento de árvores em jardins','Barra da Tijuca, Rio de Janeiro'),(13,10,'Saúde da Arborização','2026-10-05','2027-03-30','Monitoramento da saúde vegetal','Recreio, Rio de Janeiro'),(14,11,'Arborização de Niterói','2026-01-10','2026-06-30','Cadastro de árvores em vias públicas','Centro, Niterói'),(15,11,'Sombra nas Escolas','2026-07-01','2026-12-20','Avaliação de sombra em áreas escolares','Niterói, RJ'),(16,12,'Praças de Niterói','2025-03-05','2025-11-30','Diagnóstico arbóreo de praças','Icaraí, Niterói'),(17,13,'Monitoramento Florestal Urbano','2026-05-15','2026-10-30','Acompanhamento de árvores urbanas','São Gonçalo, RJ'),(18,14,'Inventário de Espécies','2025-06-05','2025-11-20','Identificação de espécies arbóreas','Niterói, RJ'),(19,15,'Cidade Verde','2026-02-20','2026-07-30','Mapeamento da cobertura vegetal','Méier, Rio de Janeiro'),(20,16,'Redução de Ilhas de Calor','2026-09-05','2027-02-28','Análise de sombra e vegetação urbana','Zona Norte, Rio de Janeiro'),(21,17,'Paisagismo Sustentável','2026-03-05','2026-08-30','Levantamento de árvores e jardins','Recreio, Rio de Janeiro'),(22,17,'Corredores de Biodiversidade','2026-09-01','2027-02-20','Mapeamento de conexões verdes','Barra da Tijuca, Rio de Janeiro'),(23,18,'Diagnóstico de Jardins','2025-01-20','2025-07-10','Avaliação de vegetação ornamental','Jacarepaguá, Rio de Janeiro'),(24,19,'Arborização de São Gonçalo','2026-01-20','2026-06-30','Cadastro de árvores em vias públicas','Centro, São Gonçalo'),(25,19,'Monitoramento de Praças','2026-07-01','2026-12-15','Acompanhamento de árvores em praças','São Gonçalo, RJ'),(26,20,'Sombreamento Urbano','2025-04-05','2025-11-30','Estudo da cobertura de sombra','Alcântara, São Gonçalo'),(27,1,'Inventário de Árvores Viárias','2026-02-01','2026-04-30','Registro de árvores em ruas e avenidas','Copacabana, Rio de Janeiro'),(28,5,'Diagnóstico de Áreas Críticas','2026-04-01','2026-07-31','Identificação de áreas com pouca sombra','Duque de Caxias, RJ'),(29,11,'Gestão de Árvores de Risco','2026-02-01','2026-05-31','Identificação de árvores com risco potencial','São Francisco, Niterói'),(30,19,'Plano de Expansão Verde','2026-03-01','2026-09-30','Planejamento de novas áreas arborizadas','São Gonçalo, RJ');
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
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
