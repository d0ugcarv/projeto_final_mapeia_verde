-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mapeia_verde
--
-- Projeto Final — Mapeia Verde
-- 
-- Objetivo:
-- Armazenar e gerenciar informações relacionadas
-- à operação da Mapeia Verde, especializada no 
-- mapeamento e monitoramento de árvores 
-- urbanas, contemplando dados sobre clientes, 
-- contratos, projetos, levantamentos, árvores, 
-- registros de árvores, vistorias, monitoramentos 
-- e relatórios técnicos.
--  
-- Autor: Douglas Cavalcanti de Carvalho
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mapeia_verde` ;
USE `mapeia_verde` ;

-- -----------------------------------------------------
-- Table `mapeia_verde`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapeia_verde`.`cliente` (
  `cnpj` CHAR(14) NOT NULL,
  `nome` VARCHAR(48) NOT NULL,
  `tipo` ENUM('Órgão Público', 'Empresa', 'Consultoria', 'Organização') NOT NULL,
  `email` VARCHAR(48) NOT NULL,
  `telefone` CHAR(14) NOT NULL,
  `endereco` VARCHAR(48) NOT NULL,
  PRIMARY KEY (`cnpj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mapeia_verde`.`contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapeia_verde`.`contrato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_cnpj` CHAR(14) NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `tipo` ENUM('Pontual', 'Recorrente', 'Monitoramento') NOT NULL,
  `status` ENUM('Ativo', 'Inativo') NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contrato_cliente_idx` (`cliente_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_contrato_cliente`
    FOREIGN KEY (`cliente_cnpj`)
    REFERENCES `mapeia_verde`.`cliente` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `chk_contrato_datas`
	CHECK (`data_fim` IS NULL OR `data_fim` >= `data_inicio`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mapeia_verde`.`projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapeia_verde`.`projeto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contrato_id` INT NOT NULL,
  `nome` VARCHAR(48) NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE NOT NULL,
  `descricao` VARCHAR(96) NOT NULL,
  `area` VARCHAR(48) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_projeto_contrato1_idx` (`contrato_id` ASC) VISIBLE,
  CONSTRAINT `fk_projeto_contrato1`
    FOREIGN KEY (`contrato_id`)
    REFERENCES `mapeia_verde`.`contrato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `chk_projeto_datas`
	CHECK (`data_fim` >= `data_inicio`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mapeia_verde`.`levantamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapeia_verde`.`levantamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `projeto_id` INT NOT NULL,
  `data` DATE NOT NULL,
  `responsavel` VARCHAR(48) NOT NULL,
  `tipo` ENUM('Inicial', 'Atualização') NOT NULL,
  `observacoes` VARCHAR(96) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_levantamento_projeto1_idx` (`projeto_id` ASC) VISIBLE,
  CONSTRAINT `fk_levantamento_projeto1`
    FOREIGN KEY (`projeto_id`)
    REFERENCES `mapeia_verde`.`projeto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Coleta inicial ou atualização geral de um território.';


-- -----------------------------------------------------
-- Table `mapeia_verde`.`arvore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapeia_verde`.`arvore` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `especie` VARCHAR(48) NOT NULL,
  `nome_popular` VARCHAR(48) NOT NULL,
  `latitude` DECIMAL(9,6) NOT NULL,
  `longitude` DECIMAL(9,6) NOT NULL,
  `data_cadastro` DATE NOT NULL,
  `status` ENUM('Ativa', 'Removida', 'Inativa') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mapeia_verde`.`registro_arvore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapeia_verde`.`registro_arvore` (
  `levantamento_id` INT NOT NULL,
  `arvore_id` INT NOT NULL,
  `altura` DECIMAL(5,2) NOT NULL,
  `diametro` DECIMAL(6,2) NOT NULL,
  `condicao` ENUM('Boa', 'Regular', 'Ruim') NOT NULL,
  `cobertura_sombra` DECIMAL(4,2) NOT NULL,
  `observacoes` VARCHAR(96) NULL,
  INDEX `fk_registro_arvore_levantamento1_idx` (`levantamento_id` ASC) VISIBLE,
  INDEX `fk_registro_arvore_arvore1_idx` (`arvore_id` ASC) VISIBLE,
  PRIMARY KEY (`levantamento_id`, `arvore_id`),
  CONSTRAINT `fk_registro_arvore_levantamento1`
    FOREIGN KEY (`levantamento_id`)
    REFERENCES `mapeia_verde`.`levantamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_arvore_arvore1`
    FOREIGN KEY (`arvore_id`)
    REFERENCES `mapeia_verde`.`arvore` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `chk_registro_arvore_sombra`
	CHECK (`cobertura_sombra` BETWEEN 0 AND 100),
  CONSTRAINT `chk_registro_arvore_altura`
	CHECK (`altura` >= 0),
  CONSTRAINT `chk_registro_arvore_diametro`
	CHECK (`diametro` >= 0)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mapeia_verde`.`relatorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapeia_verde`.`relatorio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `projeto_id` INT NOT NULL,
  `tipo` VARCHAR(48) NOT NULL,
  `data_emissao` DATE NOT NULL,
  `arquivo` VARCHAR(48) NOT NULL,
  `responsavel` VARCHAR(48) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_relatorio_projeto1_idx` (`projeto_id` ASC) VISIBLE,
  CONSTRAINT `fk_relatorio_projeto1`
    FOREIGN KEY (`projeto_id`)
    REFERENCES `mapeia_verde`.`projeto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mapeia_verde`.`vistoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapeia_verde`.`vistoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `projeto_id` INT NOT NULL,
  `data` DATE NOT NULL,
  `responsavel` VARCHAR(48) NOT NULL,
  `tipo` ENUM('Rotina', 'Emergencial', 'Preventiva') NOT NULL,
  `observacoes` VARCHAR(96) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vistoria_projeto1_idx` (`projeto_id` ASC) VISIBLE,
  CONSTRAINT `fk_vistoria_projeto1`
    FOREIGN KEY (`projeto_id`)
    REFERENCES `mapeia_verde`.`projeto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Avaliação técnica específica.';


-- -----------------------------------------------------
-- Table `mapeia_verde`.`vistoria_arvore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapeia_verde`.`vistoria_arvore` (
  `vistoria_id` INT NOT NULL,
  `arvore_id` INT NOT NULL,
  `estado_saude` ENUM('Saudável', 'Regular', 'Ruim', 'Crítico') NOT NULL,
  `risco` ENUM('Baixo', 'Médio', 'Alto') NOT NULL,
  `necessidade_manejo` ENUM('Nenhuma', 'Poda', 'Tratamento', 'Remoção') NOT NULL,
  `observacoes` VARCHAR(96) NULL,
  PRIMARY KEY (`vistoria_id`, `arvore_id`),
  INDEX `fk_vistoria_has_arvore_arvore1_idx` (`arvore_id` ASC) VISIBLE,
  INDEX `fk_vistoria_has_arvore_vistoria1_idx` (`vistoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_vistoria_has_arvore_vistoria1`
    FOREIGN KEY (`vistoria_id`)
    REFERENCES `mapeia_verde`.`vistoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vistoria_has_arvore_arvore1`
    FOREIGN KEY (`arvore_id`)
    REFERENCES `mapeia_verde`.`arvore` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mapeia_verde`.`monitoramento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapeia_verde`.`monitoramento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `arvore_id` INT NOT NULL,
  `data` DATE NOT NULL,
  `estado_saude` ENUM('Saudável', 'Regular', 'Ruim', 'Crítico') NOT NULL,
  `altura` DECIMAL(5,2) NOT NULL,
  `diametro` DECIMAL(6,2) NOT NULL,
  `cobertura_sombra` DECIMAL(4,2) NOT NULL,
  `observacoes` VARCHAR(96) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_monitoramento_arvore1_idx` (`arvore_id` ASC) VISIBLE,
  CONSTRAINT `fk_monitoramento_arvore1`
    FOREIGN KEY (`arvore_id`)
    REFERENCES `mapeia_verde`.`arvore` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `chk_monitoramento_cobertura_sombra`
	CHECK (`cobertura_sombra` BETWEEN 0 AND 100),
  CONSTRAINT `chk_monitoramento_altura`
	CHECK (`altura` >= 0),
  CONSTRAINT `chk_monitoramento_diametro`
	CHECK (`diametro` >= 0)
)
ENGINE = InnoDB
COMMENT = 'Acompanhamento periódico da árvore ao longo do tempo.';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

