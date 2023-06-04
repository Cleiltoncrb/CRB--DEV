
// ########################################--SETAR O BANCO QUE QUER UTILIZAR--##############################################################################
USE db_mysql;


// ########################################--CREATE TABELA PRDUTO--##############################################################################

CREATE TABLE `db_mysql`.`tbproduto` (
    `produto` VARCHAR(20) NULL,
    `nome` VARCHAR(150) NULL,
    `embalagem` VARCHAR(50) NULL,
    `tamanho` VARCHAR(50) NULL,
    `sabor` VARCHAR(50) NULL,
    `preco_lista` FLOAT NULL
);

// ########################################--INSERT--##############################################################################
INSERT INTO tbproduto (
PRODUTO,  NOME, EMBALAGEM, TAMANHO, SABOR,
PRECO_LISTA) VALUES (
'1040107', 'Light - 350 ml - Melancia',
'Lata', '350 ml', 'Melancia', 4.56);
   
INSERT INTO tbproduto (
PRODUTO,  NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES (
'1037797', 'Clean - 2 Litros - Laranja','PET', '2 Litros', 'Laranja', 16.01
);

INSERT INTO tbproduto (
PRODUTO,  NOME, EMBALAGEM, TAMANHO, SABOR,
PRECO_LISTA) VALUES (
'1000889', 
'Sabor da Montanha - 700 ml - Uva',
'Garrafa', 
'700 ml', 
'Uva', 
6.31);
  
INSERT INTO tbproduto (
PRODUTO,  NOME, EMBALAGEM, TAMANHO, SABOR,
PRECO_LISTA) VALUES (
'1004327', 
'Videira do Campo - 1,5 Litros - Melancia',
'PET', 
'1,5 Litros', 
'Melancia', 
19.51);  

INSERT INTO tbproduto (
PRODUTO,  NOME, EMBALAGEM, TAMANHO, SABOR,
PRECO_LISTA) VALUES
('544931', 'Frescor do Verão - 350 ml - Limão', 'PET', '350 ml','Limão',3.20);

INSERT INTO tbproduto (
PRODUTO,  NOME, EMBALAGEM, TAMANHO, SABOR,
PRECO_LISTA) VALUES
('1078680', 'Frescor do Verão - 470 ml - Manga', 'Lata', '470 ml','Manga',5.18);

 // ########################################--UPDATE--############################################################################## 
UPDATE tbproduto SET EMBALAGEM = 'Lata', PRECO_LISTA = 2.46
WHERE PRODUTO = '544931';

UPDATE tbproduto 
SET 
    EMBALAGEM = 'Garrafa'
WHERE
    PRODUTO = '1078680';

SELECT 
    *
FROM
    tbproduto;

INSERT INTO tbproduto (
PRODUTO,  NOME, EMBALAGEM, TAMANHO, SABOR,
PRECO_LISTA) VALUES (
'1040107', 'Light - 350 ml - Melância',
'Lata', '350 ml', 'Melância', 4.56);
  
  // ########################################--DELETE--##############################################################################
  DELETE FROM tbproduto 
WHERE
    produto = 1040107;
DELETE FROM tbproduto 
WHERE
    produto = 1004327;
  
  // #############################--INCLUIR CHAVE PRIMARIA EM UMA TABELA QUE JÁ EXISTE--#############################################
  ALTER TABLE tbproduto ADD PRIMARY KEY (produto);
  
  
  
  
  
  
  
  
  
  