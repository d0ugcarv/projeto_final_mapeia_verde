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
-- Temporary view structure for view `vw_resumo_projetos`
--

DROP TABLE IF EXISTS `vw_resumo_projetos`;
/*!50001 DROP VIEW IF EXISTS `vw_resumo_projetos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_resumo_projetos` AS SELECT 
 1 AS `projeto_id`,
 1 AS `projeto`,
 1 AS `cliente`,
 1 AS `tipo_contrato`,
 1 AS `valor_contrato`,
 1 AS `data_inicio`,
 1 AS `data_fim`,
 1 AS `total_relatorios`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_resumo_projetos`
--

/*!50001 DROP VIEW IF EXISTS `vw_resumo_projetos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_resumo_projetos` AS select `p`.`id` AS `projeto_id`,`p`.`nome` AS `projeto`,`cl`.`nome` AS `cliente`,`c`.`tipo` AS `tipo_contrato`,`c`.`valor` AS `valor_contrato`,`p`.`data_inicio` AS `data_inicio`,`p`.`data_fim` AS `data_fim`,count(distinct `r`.`id`) AS `total_relatorios` from (((`projeto` `p` join `contrato` `c` on((`p`.`contrato_id` = `c`.`id`))) join `cliente` `cl` on((`c`.`cliente_cnpj` = `cl`.`cnpj`))) left join `relatorio` `r` on((`r`.`projeto_id` = `p`.`id`))) group by `p`.`id`,`p`.`nome`,`cl`.`nome`,`c`.`tipo`,`c`.`valor`,`p`.`data_inicio`,`p`.`data_fim` */;
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

-- Dump completed on 2026-10-21  4:56:13
