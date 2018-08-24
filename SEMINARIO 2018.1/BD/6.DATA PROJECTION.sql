USE AJKS$
/******  PROJEÇÃO DADOSPESSOAS ******/
SELECT
	NOME,
	EMAIL,
	DATANASCIMENTO AS "DATA DE NASCIMENTO",
	SEXO,
	CPF,
	CELULAR,
	RUA,
	NUMERO,
	BAIRRO,
	CIDADE,
	ESTADO,
	CEP
FROM DADOSPESSOAS;

/******  PROJEÇÃO MOTORISTA ******/
SELECT
	NOME,
	NUMEROREGISTRO AS "REGISTRO CNH",
	VALIDADE AS "VALIDADE CNH"
FROM DADOSPESSOAS
INNER JOIN MOTORISTA
ON IDDADOSPESSOAS = ID_DADOSPESSOAS;

/******  PROJEÇÃO ADMIN ******/
SELECT
	IDADMIN AS "CÓDIGO",
	NOME
FROM DADOSPESSOAS
INNER JOIN MAIN_ADMIN
ON IDDADOSPESSOAS = ID_DADOSPESSOAS;

/******  PROJEÇÃO VIATURA ******/
SELECT
	IDVIATURA AS "CÓDIGO",
	MARCA,
	MODELO,
	COR,
	TIPOVEICULO,
	PASSAGEIROS AS "QUANTIDADE DE PASSAGEIROS",
	ANOFABRICACAO AS "ANO DE FABRICAÇÃO",
	PLACA,
	RENAVAN AS "RENAVAM"
FROM VIATURA;

/******  PROJEÇÃO VIAGENS ******/
SELECT
	V.CIDADE,
	V.RUA,
	V.NUMERO,
	V.BAIRRO,
	V.ESTADO,
	V.DATAHORAINICIO AS "DATA E HORA DE SAÍDA",
	V.DATAHORAFINAL AS "DATA E HORA DE RETORNO",
	/*V.ID_MOTORISTA AS "MOTORISTA",*/
	Z.MODELO AS "VEICULO",
	Z.COR AS "COR VEICULO",
	Z.PASSAGEIROS AS "CAPACIDADE",
	/*P.ID_DADOSPESSOAS AS "PASSAGEIRO",*/
	D.NOME AS "NOME PASSAGEIRO",
	Y.NOME AS "NOME MOTORISTA"
FROM VIAGENS V
INNER JOIN PASSAGEIRO P
ON V.IDVIAGENS = P.ID_VIAGEM
INNER JOIN DADOSPESSOAS D
ON P.ID_DADOSPESSOAS = D.IDDADOSPESSOAS
INNER JOIN DADOSPESSOAS Y
ON V.ID_MOTORISTA = Y.IDDADOSPESSOAS
INNER JOIN VIATURA Z
ON V.ID_VIATURA = Z.IDVIATURA
/*WHERE V.CIDADE = ""*/
;