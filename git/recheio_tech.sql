CREATE DATABASE  IF NOT EXISTS `recheio_tech` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recheio_tech`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: recheio_tech
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `salario_max` varchar(45) DEFAULT NULL,
  `salario_min` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_produto`
--

DROP TABLE IF EXISTS `catalogo_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_produto` (
  `id_catalogo_produto` int NOT NULL,
  PRIMARY KEY (`id_catalogo_produto`),
  UNIQUE KEY `id_catalogo_produto_UNIQUE` (`id_catalogo_produto`),
  CONSTRAINT `fk_catalogo_produto_idx` FOREIGN KEY (`id_catalogo_produto`) REFERENCES `fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_produto`
--

LOCK TABLES `catalogo_produto` WRITE;
/*!40000 ALTER TABLE `catalogo_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogo_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `tipos_categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `nascimento` varchar(45) NOT NULL,
  `cpf` char(11) NOT NULL,
  `idade` datetime NOT NULL,
  `email` varchar(45) NOT NULL,
  `pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente_UNIQUE` (`id_cliente`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nascimento_UNIQUE` (`nascimento`),
  CONSTRAINT `fk_cliente_pais_idx` FOREIGN KEY (`id_cliente`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continente`
--

DROP TABLE IF EXISTS `continente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `continente` (
  `id_continente` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_continente`),
  UNIQUE KEY `id_continente_UNIQUE` (`id_continente`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continente`
--

LOCK TABLES `continente` WRITE;
/*!40000 ALTER TABLE `continente` DISABLE KEYS */;
/*!40000 ALTER TABLE `continente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_cliente`
--

DROP TABLE IF EXISTS `endereco_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_cliente` (
  `id_endereco` int NOT NULL,
  `cep` char(9) NOT NULL,
  `nome_da_rua` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `logradouro` varchar(20) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) NOT NULL,
  `tipo_logradouro` varchar(45) NOT NULL,
  PRIMARY KEY (`id_endereco`),
  UNIQUE KEY `id_endereco_cliente_UNIQUE` (`id_endereco`),
  CONSTRAINT `fk_endereco_cliente_idx` FOREIGN KEY (`id_endereco`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_cliente`
--

LOCK TABLES `endereco_cliente` WRITE;
/*!40000 ALTER TABLE `endereco_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_local`
--

DROP TABLE IF EXISTS `endereco_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_local` (
  `id_endereco_local` int NOT NULL,
  `cep` char(9) NOT NULL,
  `nome_da_rua` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `logradouro` varchar(20) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) NOT NULL,
  `tipo_logradouro` varchar(45) NOT NULL,
  PRIMARY KEY (`id_endereco_local`),
  UNIQUE KEY `id_endereco_local_UNIQUE` (`id_endereco_local`),
  CONSTRAINT `fk_endereco_local_local1` FOREIGN KEY (`id_endereco_local`) REFERENCES `local` (`id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_local`
--

LOCK TABLES `endereco_local` WRITE;
/*!40000 ALTER TABLE `endereco_local` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_estoque` int NOT NULL,
  `quantidade` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estoque`),
  UNIQUE KEY `quantidade_UNIQUE` (`quantidade`),
  CONSTRAINT `fk_gerente_estoque_idx` FOREIGN KEY (`id_estoque`) REFERENCES `gerente` (`id_gerente`),
  CONSTRAINT `fk_produto_estoque_idx` FOREIGN KEY (`id_estoque`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pgto`
--

DROP TABLE IF EXISTS `forma_pgto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pgto` (
  `id_forma_pgto` int NOT NULL,
  `credito` varchar(45) NOT NULL,
  `debito` varchar(45) NOT NULL,
  `pix` varchar(45) NOT NULL,
  PRIMARY KEY (`id_forma_pgto`),
  UNIQUE KEY `id_forma_pgto_UNIQUE` (`id_forma_pgto`),
  CONSTRAINT `fk_forma_pgto_pedido_idx` FOREIGN KEY (`id_forma_pgto`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pgto`
--

LOCK TABLES `forma_pgto` WRITE;
/*!40000 ALTER TABLE `forma_pgto` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma_pgto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `id_fornecedor_UNIQUE` (`id_fornecedor`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id_funcionario` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cpf` char(11) NOT NULL,
  `salario` double NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `id_funcionario_UNIQUE` (`id_funcionario`),
  CONSTRAINT `fk_funcionario_pais_idx` FOREIGN KEY (`id_funcionario`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerente`
--

DROP TABLE IF EXISTS `gerente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerente` (
  `id_gerente` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `salario` varchar(45) NOT NULL,
  `cpf` char(11) NOT NULL,
  PRIMARY KEY (`id_gerente`),
  UNIQUE KEY `id_gerente_UNIQUE` (`id_gerente`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  CONSTRAINT `fk_gerente_fornecedor_idx` FOREIGN KEY (`id_gerente`) REFERENCES `fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerente`
--

LOCK TABLES `gerente` WRITE;
/*!40000 ALTER TABLE `gerente` DISABLE KEYS */;
/*!40000 ALTER TABLE `gerente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_de_emprego`
--

DROP TABLE IF EXISTS `historico_de_emprego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_de_emprego` (
  `id_historico_de_emprego` int NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  PRIMARY KEY (`id_historico_de_emprego`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_de_emprego`
--

LOCK TABLES `historico_de_emprego` WRITE;
/*!40000 ALTER TABLE `historico_de_emprego` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_de_emprego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_de_vendas`
--

DROP TABLE IF EXISTS `item_de_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_de_vendas` (
  `id_item_de_vendas` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco` float NOT NULL,
  `subtotal` float DEFAULT NULL,
  `item_de_vendascol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_item_de_vendas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_de_vendas`
--

LOCK TABLES `item_de_vendas` WRITE;
/*!40000 ALTER TABLE `item_de_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_de_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local` (
  `id_local` int NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `hora_abertura` date NOT NULL,
  `hora_fechamento` date NOT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacao`
--

DROP TABLE IF EXISTS `localizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizacao` (
  `id_localizacao` int NOT NULL,
  `nome_produto` varchar(45) NOT NULL,
  `descricao_produto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_localizacao`),
  UNIQUE KEY `id_localizacao_UNIQUE` (`id_localizacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacao`
--

LOCK TABLES `localizacao` WRITE;
/*!40000 ALTER TABLE `localizacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `localizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loja`
--

DROP TABLE IF EXISTS `loja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loja` (
  `id_loja` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_loja`),
  CONSTRAINT `fk_loja_local_idx` FOREIGN KEY (`id_loja`) REFERENCES `local` (`id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loja`
--

LOCK TABLES `loja` WRITE;
/*!40000 ALTER TABLE `loja` DISABLE KEYS */;
/*!40000 ALTER TABLE `loja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modo_de_envio`
--

DROP TABLE IF EXISTS `modo_de_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modo_de_envio` (
  `id_modo_de_envio` int NOT NULL,
  `sedex` varchar(45) NOT NULL,
  PRIMARY KEY (`id_modo_de_envio`),
  CONSTRAINT `fk_modo_de_envio_pedido_idx` FOREIGN KEY (`id_modo_de_envio`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modo_de_envio`
--

LOCK TABLES `modo_de_envio` WRITE;
/*!40000 ALTER TABLE `modo_de_envio` DISABLE KEYS */;
/*!40000 ALTER TABLE `modo_de_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moeda`
--

DROP TABLE IF EXISTS `moeda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moeda` (
  `id_moeda` int NOT NULL,
  `moeda_nome` varchar(45) NOT NULL,
  `moeda_simbolo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_moeda`),
  UNIQUE KEY `id_moeda_UNIQUE` (`id_moeda`),
  UNIQUE KEY `moeda_nome_UNIQUE` (`moeda_nome`),
  UNIQUE KEY `moeda_simbolo_UNIQUE` (`moeda_simbolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moeda`
--

LOCK TABLES `moeda` WRITE;
/*!40000 ALTER TABLE `moeda` DISABLE KEYS */;
/*!40000 ALTER TABLE `moeda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id_pais` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `nacionalidade` varchar(45) NOT NULL,
  `idioma` varchar(45) NOT NULL,
  `pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pais`),
  UNIQUE KEY `id_pais_UNIQUE` (`id_pais`),
  UNIQUE KEY `nacionalidade_UNIQUE` (`nacionalidade`),
  CONSTRAINT `fk_pais_continente_idx` FOREIGN KEY (`id_pais`) REFERENCES `continente` (`id_continente`),
  CONSTRAINT `fk_pais_localizacao_idx` FOREIGN KEY (`id_pais`) REFERENCES `localizacao` (`id_localizacao`),
  CONSTRAINT `fk_pais_moeda_idx` FOREIGN KEY (`id_pais`) REFERENCES `moeda` (`id_moeda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `valor_total` float NOT NULL,
  `frete` float NOT NULL,
  `cod_promocional` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `id_pedido_UNIQUE` (`id_pedido`),
  CONSTRAINT `fk_pedido_local_idx` FOREIGN KEY (`id_pedido`) REFERENCES `local` (`id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL,
  `status` varchar(45) NOT NULL,
  `fornecedor` varchar(45) NOT NULL,
  `uri` varchar(45) NOT NULL,
  `peso` float NOT NULL,
  `preco_minimo` float NOT NULL,
  `esta_disponivel` varchar(45) NOT NULL,
  `preco_padrao` float NOT NULL,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `id_produto_UNIQUE` (`id_produto`),
  UNIQUE KEY `id_categoria_UNIQUE` (`categoria`),
  CONSTRAINT `fk_categoria_produto_idx` FOREIGN KEY (`id_produto`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_fornecedor_produto_idx` FOREIGN KEY (`id_produto`) REFERENCES `fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_salgadeiro_produto_idx` FOREIGN KEY (`id_produto`) REFERENCES `salgadeiro` (`id_salgadeiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salgadeiro`
--

DROP TABLE IF EXISTS `salgadeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salgadeiro` (
  `id_salgadeiro` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `idade` varchar(45) NOT NULL,
  `cpf` int NOT NULL,
  PRIMARY KEY (`id_salgadeiro`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salgadeiro`
--

LOCK TABLES `salgadeiro` WRITE;
/*!40000 ALTER TABLE `salgadeiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `salgadeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema`
--

DROP TABLE IF EXISTS `sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sistema` (
  `id_sistema` int NOT NULL,
  PRIMARY KEY (`id_sistema`),
  UNIQUE KEY `id_sistema_UNIQUE` (`id_sistema`),
  CONSTRAINT `fk_sistema_cliente_idx` FOREIGN KEY (`id_sistema`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema`
--

LOCK TABLES `sistema` WRITE;
/*!40000 ALTER TABLE `sistema` DISABLE KEYS */;
/*!40000 ALTER TABLE `sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor_marketing`
--

DROP TABLE IF EXISTS `vendedor_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor_marketing` (
  `id_vendedor_marketing` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `cpf` char(11) NOT NULL,
  `telefone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `idade` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `nascimento` datetime NOT NULL,
  PRIMARY KEY (`id_vendedor_marketing`),
  UNIQUE KEY `id_vendedor_marketing_UNIQUE` (`id_vendedor_marketing`),
  UNIQUE KEY `nascimento_UNIQUE` (`nascimento`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  CONSTRAINT `fk_vendedor_marketin_pedido_idx` FOREIGN KEY (`id_vendedor_marketing`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `fk_vendedor_marketing_sistema_idx` FOREIGN KEY (`id_vendedor_marketing`) REFERENCES `sistema` (`id_sistema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_marketing`
--

LOCK TABLES `vendedor_marketing` WRITE;
/*!40000 ALTER TABLE `vendedor_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'recheio_tech'
--

--
-- Dumping routines for database 'recheio_tech'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26 15:01:11
