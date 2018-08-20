CREATE DATABASE EXEMPLO_CONSTRAINT;

USE EXEMPLO_CONSTRAINT;

CREATE TABLE DADOSPESSOAS(
	IDDADOSPESSOAS INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(45) NOT NULL,
	EMAIL VARCHAR(45) UNIQUE NOT NULL,
	DATANASCIMENTO DATE NOT NULL,
	SEXO CHAR(1) NOT NULL,
	CPF CHAR(14) UNIQUE NOT NULL,
	CELULAR VARCHAR(14) UNIQUE NOT NULL,
	CEP CHAR (9) NOT NULL,
	RUA VARCHAR(30) NOT NULL,
	NUMERO VARCHAR(8) NOT NULL,
	BAIRRO VARCHAR(25) NOT NULL,
	CIDADE VARCHAR(40) NOT NULL,
	ESTADO CHAR(2) NOT NULL
);

CREATE TABLE MOTORISTA (
	IDMOTORISTA INT PRIMARY KEY AUTO_INCREMENT,
	NUMEROREGISTRO VARCHAR(10) UNIQUE NOT NULL,
	VALIDADE DATE NOT NULL,
	ID_DADOSPESSOAS INT,
	FOREIGN KEY (ID_DADOSPESSOAS)
	REFERENCES DADOSPESSOAS(IDDADOSPESSOAS)
);

CREATE TABLE ADMIN(
	IDADMIN INT PRIMARY KEY AUTO_INCREMENT,
	SENHA VARCHAR(12) NOT NULL,
	ID_DADOSPESSOAS INT,
	FOREIGN KEY (ID_DADOSPESSOAS)
	REFERENCES DADOSPESSOAS(IDDADOSPESSOAS)
);

mysql> SHOW CREATE TABLE MOTORISTA;
+-----------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table     | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
+-----------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| MOTORISTA | CREATE TABLE `motorista` (
  `IDMOTORISTA` int(11) NOT NULL AUTO_INCREMENT,
  `NUMEROREGISTRO` varchar(10) NOT NULL,
  `VALIDADE` date NOT NULL,
  `ID_DADOSPESSOAS` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDMOTORISTA`),
  UNIQUE KEY `NUMEROREGISTRO` (`NUMEROREGISTRO`),
  KEY `ID_DADOSPESSOAS` (`ID_DADOSPESSOAS`),
  CONSTRAINT `motorista_ibfk_1` FOREIGN KEY (`ID_DADOSPESSOAS`) REFERENCES `dadospessoas` (`IDDADOSPESSOAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+-----------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SHOW CREATE TABLE ADMIN;
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                                                                                                                                        |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ADMIN | CREATE TABLE `admin` (
  `IDADMIN` int(11) NOT NULL AUTO_INCREMENT,
  `SENHA` varchar(12) NOT NULL,
  `ID_DADOSPESSOAS` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDADMIN`),
  KEY `ID_DADOSPESSOAS` (`ID_DADOSPESSOAS`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ID_DADOSPESSOAS`) REFERENCES `dadospessoas` (`IDDADOSPESSOAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)