CREATE DATABASE AJKS;

USE AJKS;

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
	ID_DADOSPESSOAS INT
);

CREATE TABLE MAIN_ADMIN (
	IDADMIN INT PRIMARY KEY AUTO_INCREMENT,
	SENHA VARCHAR(255) NOT NULL,
	ID_DADOSPESSOAS INT
);

CREATE TABLE VIATURA (
	IDVIATURA INT PRIMARY KEY AUTO_INCREMENT,
	TIPOVEICULO VARCHAR(45) NOT NULL,
	MARCA VARCHAR(25) NOT NULL,
	MODELO VARCHAR(25) NOT NULL,
	COR VARCHAR(25) NOT NULL,
	ANOFABRICACAO CHAR(4) NOT NULL,
	PLACA CHAR(8) UNIQUE NOT NULL,
	RENAVAN CHAR(11) UNIQUE NOT NULL,
	PASSAGEIROS INT NOT NULL
);

CREATE TABLE VIAGENS (
	IDVIAGENS INT PRIMARY KEY AUTO_INCREMENT,
	CIDADE VARCHAR(25) NOT NULL,
	DATAHORAINICIO DATETIME NOT NULL,
	DATAHORAFINAL DATETIME NOT NULL,
	COR VARCHAR(15) NOT NULL,
	CEP CHAR(9) NOT NULL,
	RUA VARCHAR(30) NOT NULL,
	NUMERO VARCHAR(8) NOT NULL,
	BAIRRO VARCHAR(25) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	DESCRICAO VARCHAR(200),
	/*ID_DADOSPESSOAS INT,*/
	ID_MOTORISTA INT,
	ID_VIATURA INT
);

CREATE TABLE PASSAGEIRO (
	IDPASSAGEIRO INT  PRIMARY KEY AUTO_INCREMENT,
	ID_DADOSPESSOAS INT ,
	ID_VIAGEM INT
);


*************************************
/* PROJEÇÃO ESTRUTURA MAIN DATABASE*/
*************************************

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| ajks               |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> USE AJKS;
Database changed
mysql> SHOW TABLES;
+----------------+
| Tables_in_ajks |
+----------------+
| admin          |
| dadospessoas   |
| motorista      |
| passageiro     |
| viagens        |
| viatura        |
+----------------+
6 rows in set (0.00 sec)

mysql> DESC ADMIN;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| IDADMIN         | int(11)     | NO   | PRI | NULL    | auto_increment |
| SENHA           | varchar(12) | NO   |     | NULL    |                |
| ID_DADOSPESSOAS | int(11)     | YES  |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> DESC DADOSPESSOAS;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDDADOSPESSOAS | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME           | varchar(45) | NO   |     | NULL    |                |
| EMAIL          | varchar(45) | NO   | UNI | NULL    |                |
| DATANASCIMENTO | date        | NO   |     | NULL    |                |
| SEXO           | char(1)     | NO   |     | NULL    |                |
| CPF            | char(14)    | NO   | UNI | NULL    |                |
| CELULAR        | varchar(14) | NO   | UNI | NULL    |                |
| CEP            | char(9)     | NO   |     | NULL    |                |
| RUA            | varchar(30) | NO   |     | NULL    |                |
| NUMERO         | varchar(8)  | NO   |     | NULL    |                |
| BAIRRO         | varchar(25) | NO   |     | NULL    |                |
| CIDADE         | varchar(40) | NO   |     | NULL    |                |
| ESTADO         | char(2)     | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
13 rows in set (0.00 sec)

mysql> DESC MOTORISTA;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| IDMOTORISTA     | int(11)     | NO   | PRI | NULL    | auto_increment |
| NUMEROREGISTRO  | varchar(10) | NO   | UNI | NULL    |                |
| VALIDADE        | date        | NO   |     | NULL    |                |
| ID_DADOSPESSOAS | int(11)     | YES  |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> DESC PASSAGEIRO;
+-----------------+---------+------+-----+---------+----------------+
| Field           | Type    | Null | Key | Default | Extra          |
+-----------------+---------+------+-----+---------+----------------+
| IDPASSAGEIRO    | int(11) | NO   | PRI | NULL    | auto_increment |
| ID_DADOSPESSOAS | int(11) | YES  |     | NULL    |                |
| ID_VIAGEM       | int(11) | YES  |     | NULL    |                |
+-----------------+---------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> DESC VIAGENS;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| IDVIAGENS       | int(11)      | NO   | PRI | NULL    | auto_increment |
| CIDADE          | varchar(25)  | NO   |     | NULL    |                |
| DATAHORAINICIO  | datetime     | NO   |     | NULL    |                |
| DATAHORAFINAL   | datetime     | NO   |     | NULL    |                |
| COR             | varchar(15)  | NO   |     | NULL    |                |
| CEP             | char(9)      | NO   |     | NULL    |                |
| RUA             | varchar(30)  | NO   |     | NULL    |                |
| NUMERO          | varchar(8)   | NO   |     | NULL    |                |
| BAIRRO          | varchar(25)  | NO   |     | NULL    |                |
| ESTADO          | char(2)      | NO   |     | NULL    |                |
| DESCRICAO       | varchar(200) | YES  |     | NULL    |                |
| ID_DADOSPESSOAS | int(11)      | YES  |     | NULL    |                |
| ID_MOTORISTA    | int(11)      | YES  |     | NULL    |                |
| ID_VIATURA      | int(11)      | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
14 rows in set (0.00 sec)

mysql> DESC VIATURA;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| IDVIATURA     | int(11)     | NO   | PRI | NULL    | auto_increment |
| TIPOVEICULO   | varchar(45) | NO   |     | NULL    |                |
| MARCA         | varchar(25) | NO   |     | NULL    |                |
| MODELO        | varchar(25) | NO   |     | NULL    |                |
| COR           | varchar(25) | NO   |     | NULL    |                |
| ANOFABRICACAO | char(4)     | NO   |     | NULL    |                |
| PLACA         | char(8)     | NO   | UNI | NULL    |                |
| RENAVAN       | char(11)    | NO   | UNI | NULL    |                |
| PASSAGEIROS   | int(11)     | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
9 rows in set (0.00 sec)