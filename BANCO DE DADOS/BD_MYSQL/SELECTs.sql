//###################--TBCLIENTE--###########################################
SELECT * FROM tbcliente;
SELECT CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA FROM tbcliente;
SELECT CPF, NOME FROM tbcliente;
SELECT CPF, NOME FROM tbcliente LIMIT 5;
SELECT CPF AS CPF_CLIENTE, NOME AS NOME_CLIENTE FROM tbcliente;
SELECT NOME, CPF, SEXO, IDADE, DATA_NASCIMENTO FROM tbcliente;
SELECT * FROM tbcliente where CIDADE = 'Rio de Janeiro';
SELECT * FROM tbcliente WHERE IDADE = 22;
SELECT * FROM tbcliente WHERE IDADE >= 22;
SELECT * FROM tbcliente WHERE IDADE <= 22;
SELECT * FROM tbcliente WHERE IDADE <> 22;
SELECT * FROM tbcliente WHERE NOME > 'Érica Carvalho';
SELECT * FROM tbcliente WHERE DATA_NASCIMENTO = '1995-01-13';
SELECT * FROM tbcliente WHERE DATA_NASCIMENTO >= '1995-01-13';
SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) = '1995-01-13';
SELECT * FROM tbcliente WHERE month(DATA_NASCIMENTO) = 10;
SELECT * FROM tbcliente WHERE IDADE >= 18 AND IDADE <= 22;
SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009; 
SELECT * FROM tbcliente WHERE IDADE >= 18 AND IDADE <= 22 AND SEXO = 'M';
SELECT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins';
SELECT * FROM tbcliente WHERE BAIRRO = 'JARDINS' AND ESTADO = 'SP';
SELECT * FROM tbcliente WHERE (IDADE >= 18 AND IDADE <= 22 AND SEXO = 'M') OR (CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins');

//###################--TBPRODUTO--###########################################
SELECT * FROM tbproduto WHERE PRODUTO = '544931';
SELECT * FROM tbproduto WHERE SABOR = 'Cítricos';
UPDATE tbproduto SET SABOR = 'Cítricos' WHERE SABOR = 'Limão';


//###########################################################################





