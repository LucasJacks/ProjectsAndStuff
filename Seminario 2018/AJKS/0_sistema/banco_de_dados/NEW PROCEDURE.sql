CREATE  PROCEDURE ADICIONAR_E_PASSAGEIRO_new(
		  IN pIDVIAGENS INT ,
		  IN pCIDADE VARCHAR(25) ,
		  IN pDATAHORAINICIO DATETIME ,
		  IN pDATAHORAFINAL DATETIME ,
		  IN pCOR VARCHAR(15) ,
		  IN pCEP CHAR(9) ,
		  IN pRUA VARCHAR(30),
		  IN pNUMERO VARCHAR(8) ,
		  IN pBAIRRO VARCHAR(25) ,
		  IN pESTADO CHAR(2) ,
		  IN pDESCRICAO VARCHAR(200),
		  IN pID_MOTORISTA INT,
		  IN pID_VIATURA INT,
		  IN pIDPASSAGEIRO INT,
		  IN pID_DADOSPESSOAS INT,
		  IN pID_VIAGEM INT
		   
		)
	BEGIN
		IF EXISTS (SELECT * FROM VIAGENS WHERE ID_VIATURA = pID_VIATURA AND  pDATAHORAINICIO BETWEEN DATAHORAINICIO AND DATAHORAFINAL )
    THEN 
        SELECT 'Viatura indisponível na data/hora selecionada.' AS 'Error';
    ELSE
        IF EXISTS (SELECT * FROM VIAGENS WHERE ID_MOTORISTA = pID_MOTORISTA AND  pDATAHORAINICIO BETWEEN DATAHORAINICIO AND DATAHORAFINAL )
        THEN 
            SELECT 'Motorista indisponível na data/hora selecionada.' AS 'Error';
        ELSE
		IF EXISTS (SELECT * FROM PASSAGEIRO WHERE ID_DADOSPESSOAS = pID_DADOSPESSOAS  AND  ID_VIAGEM = pID_VIAGEM)
		THEN
          	  SELECT 'Pessoa indisponível na data/hora selecionada.' AS 'Error';

          	 ELSE
        IF EXISTS (SELECT PP.IDVIAGEM,
        				  V.CIDADE
        			FROM VIAGENS V
        			INNER JOIN PASAGEIRO PP
        			ON pID_VIAGEM = PP.IDVIAGENS AND pCIDADE != V.CIDADE)
                 THEN 
            SELECT 'A cidade escolhida é diferente da já cadastrada no sistema' AS 'Error';


        	ELSE
          	  INSERT INTO VIAGENS 
          	  (IDVIAGENS, CIDADE, DATAHORAINICIO, DATAHORAFINAL, COR, CEP, RUA, NUMERO, BAIRRO, ESTADO, DESCRICAO,  ID_MOTORISTA, ID_VIATURA)
                VALUES (NULL,pCIDADE, pDATAHORAINICIO, pDATAHORAFINAL, pCOR, pCEP, pRUA, pNUMERO, pBAIRRO, pESTADO, pDESCRICAO, pID_MOTORISTA, pID_VIATURA);
                          	  INSERT INTO PASSAGEIRO (IDPASSAGEIRO, ID_DADOSPESSOAS, ID_VIAGEM)
                VALUES (NULL, pID_DADOSPESSOAS, pID_VIAGEM);
        END IF;
    END IF;
    		END IF;
    		END IF;
END$

/* preciso tirar a restrição d euma viatura nao poder ser cadsastrada na mesma viagem , pois poderemos
levar dois passageiros */