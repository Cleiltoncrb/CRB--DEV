// ########################################--SETAR O BANCO QUE QUER UTILIZAR--##############################################################################
USE DB_MYSQL;


// ########################################--CREATE TABELA CLIENTE--##############################################################################
CREATE TABLE tbCliente (
    cpf VARCHAR(11),
    nome VARCHAR(100),
    endereco1 VARCHAR(150),
    endereco2 VARCHAR(150),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    cep VARCHAR(8),
    idade SMALLINT,
    sexo VARCHAR(1),
    limite_credito FLOAT,
    primeira_compra BIT(1),
    volume_compra SMALLINT,
    data_nascimento date
);

// #############################--INCLUIR CHAVE PRIMARIA EM UMA TABELA QUE JÁ EXISTE--#############################################
ALTER TABLE tbcliente ADD PRIMARY KEY (cpf);

// #############################--INSERIR UMA NOVA COLUNA NA TABELA CLIENTE--#############################################
ALTER TABLE tbcliente ADD COLUMN (DATA_NASCIMENTO DATE);
ALTER TABLE tbcliente ADD COLUMN (VOLUME_COMPRA SMALLINT);


// #############################--INSERIR DADOS NA TABELA CLIENTE--#############################################
INSERT INTO tbcliente (
CPF, NOME, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, ESTADO, CEP, IDADE, SEXO, LIMITE_CREDITO, VOLUME_COMPRA, PRIMEIRA_COMPRA, DATA_NASCIMENTO) 
VALUES (
'00388934505', 
'João da Silva', 
'Rua projetada A número 10', 
'', 
'Vila Roman', 
'CARATINGA', 
'AM', 
'2222222', 
30, 
'M', 
10000.00, 
2000, 
0, 
'1989-10-05');



SELECT 
    *
FROM
    tbcliente;


