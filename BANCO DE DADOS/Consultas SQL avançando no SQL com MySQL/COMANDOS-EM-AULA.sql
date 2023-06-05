

-- Ctrl + B para identar 

-- #######################-- TB_CLINTES --#############################################
SELECT * FROM tabela_de_clientes;
SELECT CPF, NOME FROM tabela_de_clientes;
SELECT CPF AS IDENTIFICADOR, NOME AS CLIENTE FROM tabela_de_clientes;

SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('Rio de Janeiro','São Paulo') AND IDADE >= 20;
SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('Rio de Janeiro','São Paulo') AND (IDADE >= 20 AND IDADE <= 22);



-- #######################-- TB_PRODUTOS --#############################################
SELECT * FROM tabela_de_produtos;
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Laranja';
SELECT * FROM tabela_de_produtos WHERE EMBALAGEM = 'pet';
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA = 19.50;
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA BETWEEN 19.50 AND 19.52;

SELECT * FROM tabela_de_produtos WHERE SABOR = 'manga' OR TAMANHO = '470 ml';
SELECT * FROM tabela_de_produtos WHERE SABOR = 'manga' AND TAMANHO = '470 ml';
SELECT * FROM tabela_de_produtos WHERE NOT (SABOR = 'manga' AND TAMANHO = '470 ml');
SELECT * FROM tabela_de_produtos WHERE NOT (SABOR = 'manga' OR TAMANHO = '470 ml');
SELECT * FROM tabela_de_produtos WHERE SABOR = 'manga' AND NOT(TAMANHO = '470 ml');
SELECT * FROM tabela_de_produtos WHERE SABOR = 'manga' OR NOT(TAMANHO = '470 ml');

SELECT * FROM tabela_de_produtos WHERE SABOR IN ('Laranja', 'Manga'); --  SÃO IGUAIS 
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Laranja' OR SABOR = 'Manga'; -- SÃO IGUAIS 


-- #######################-- LIKE --#############################################
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%';
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%' AND EMBALAGEM = 'PET';
SELECT * FROM tabela_de_clientes WHERE NOME LIKE '%Mattos%';


-- #######################-- DISTINCT --#############################################
SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos;
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos; -- DISTINCT ==> COMBINALÇOES QUE NÃO SE REPETEM 
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos WHERE SABOR = 'Laranja';
SELECT DISTINCT EMBALAGEM, TAMANHO, SABOR FROM tabela_de_produtos; 
SELECT DISTINCT * FROM tabela_de_clientes;

-- Quais são os bairros da cidade do Rio de Janeiro que possuem clientes?
SELECT DISTINCT BAIRRO FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro';


-- #######################-- LIMIT --#############################################
-- LIMITAR A CONSULTA 
SELECT * FROM tabela_de_produtos;
SELECT * FROM tabela_de_produtos LIMIT 2,3;
SELECT * FROM tabela_de_produtos LIMIT 0,2;

SELECT * FROM notas_fiscais  WHERE DATA_VENDA = '2017-01-01' limit 10;

-- #######################-- ORDER BY --#############################################
-- ORDENAR CONSULTA 
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA;
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC;
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO;
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO DESC;
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM, NOME_DO_PRODUTO;
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC;

-- Qual (ou quais) foi (foram) a(s) maior(es) venda(s) do produto “Linha Refrescante - 1 Litro - Morango/Limão”, em quantidade? (Obtenha este resultado usando 2 SQLs).
SELECT * FROM tabela_de_produtos WHERE nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limão';
SELECT * FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' ORDER BY QUANTIDADE DESC;


-- #######################-- Agrupando os resultados --#############################################
-- SUM: SOMA
-- MAX: MÁXIMO
-- MIN: MÍNIMO
-- AVG: MÉDIA
-- COUNT: CONTA OCORRÊNCIAS 
SELECT * FROM tabela_de_clientes;
SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) as LIMITE_TOTAL FROM tabela_de_clientes GROUP BY ESTADO;

SELECT EMBALAGEM, PRECO_DE_LISTA FROM tabela_de_produtos;
SELECT EMBALAGEM, PRECO_DE_LISTA FROM tabela_de_produtos WHERE EMBALAGEM = 'Garrafa' order by PRECO_DE_LISTA DESC ;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) as MAIOR_PRECO FROM tabela_de_produtos GROUP BY EMBALAGEM;

SELECT EMBALAGEM, COUNT(*) as CONTADOR FROM tabela_de_produtos GROUP BY EMBALAGEM;

SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) as LIMITE FROM tabela_de_clientes GROUP BY BAIRRO;
SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) as LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro' GROUP BY BAIRRO;
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) as LIMITE FROM tabela_de_clientes GROUP BY ESTADO, BAIRRO;
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) as LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro' GROUP BY ESTADO, BAIRRO;
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) as LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro' GROUP BY ESTADO, BAIRRO ORDER BY BAIRRO;

SELECT MAX(`QUANTIDADE`) as 'MAIOR QUANTIDADE' FROM itens_notas_fiscais WHERE `CODIGO_DO_PRODUTO` = '1101035' ;
SELECT COUNT(*) FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' AND QUANTIDADE = 99;


-- #######################-- HAVING --#############################################
-- CONDIÇÃO (FILTRO) QUE SE APLICA AO RESULTADO DE UMA AGREGAÇÃO;
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) as SOMA_LIMITE FROM tabela_de_clientes GROUP BY ESTADO;
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) as SOMA_LIMITE FROM tabela_de_clientes WHERE SOMA_LIMITE > 900000 GROUP BY ESTADO;
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) as SOMA_LIMITE FROM tabela_de_clientes GROUP BY ESTADO HAVING SUM(LIMITE_DE_CREDITO) > 900000;
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) as MAIOR_PRECO, MIN(PRECO_DE_LISTA) as MENOR_PRECO FROM tabela_de_produtos GROUP BY EMBALAGEM;
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) as MAIOR_PRECO, MIN(PRECO_DE_LISTA) as MENOR_PRECO FROM tabela_de_produtos GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80;
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) as MAIOR_PRECO, MIN(PRECO_DE_LISTA) as MENOR_PRECO FROM tabela_de_produtos GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80 AND MAX(PRECO_DE_LISTA) >= 5;

-- Quais foram os clientes que fizeram mais de 2000 compras em 2016?
SELECT CPF, COUNT(*) FROM notas_fiscais WHERE YEAR(DATA_VENDA) = 2016 GROUP BY CPF HAVING COUNT(*) > 2000;

-- #######################-- CASE --#############################################
SELECT * FROM tabela_de_produtos;

-- ----------------------------------------------------------
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE 
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO 
FROM tabela_de_produtos;

-- ----------------------------------------------------------
SELECT EMBALAGEM,
CASE 
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
GROUP BY EMBALAGEM, 
CASE 
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO' 
END;

-- ----------------------------------------------------------
SELECT EMBALAGEM,
CASE 
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
WHERE sabor = 'Manga'
GROUP BY EMBALAGEM, 
CASE 
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO' 
END 
ORDER BY EMBALAGEM;


-- Veja o ano de nascimento dos clientes e classifique-os como: Nascidos antes de 1990 são velhos, nascidos entre 1990 e 1995 são jovens e nascidos depois de 1995 são crianças. Liste o nome do cliente e esta classificação.
SELECT NOME,
CASE WHEN YEAR(data_de_nascimento) < 1990 THEN 'Velho'
WHEN YEAR(data_de_nascimento) >= 1990 AND
YEAR(data_de_nascimento) <= 1995 THEN 'Jovens' 
ELSE 'Crianças' 
END  AS "CLASSIFICAÇÃO POR IDADE"
FROM tabela_de_clientes;

-- #######################-- INNER JOINs --#############################################
SELECT * FROM tabela_de_vendedores;
SELECT * FROM notas_fiscais;

-- ----------------------------------------------------------
SELECT * FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA;

-- ----------------------------------------------------------
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM
tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;

-- ----------------------------------------------------------
SELECT * FROM itens_notas_fiscais NF
inner join tabela_de_produtos P
ON NF.CODIGO_DO_PRODUTO = P.CODIGO_DO_PRODUTO;

-- ----------------------------------------------------------
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM
tabela_de_vendedores A, notas_fiscais B
WHERE A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;

-- Obtenha o faturamento anual da empresa. Leve em consideração que o valor financeiro das vendas consiste em multiplicar a quantidade pelo preço.
SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);


-- #######################-- LEFT JOIN --#############################################
SELECT COUNT(*) FROM tabela_de_clientes;
SELECT CPF, COUNT(*) FROM notas_fiscais GROUP BY CPF;
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A INNER JOIN notas_fiscais B ON A.CPF = B.CPF;
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A LEFT JOIN notas_fiscais B ON A.CPF = B.CPF;

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM notas_fiscais B LEFT JOIN tabela_de_clientes A ON A.CPF = B.CPF;

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A LEFT JOIN notas_fiscais B ON A.CPF = B.CPF WHERE B.CPF IS NULL;
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A LEFT JOIN notas_fiscais B ON A.CPF = B.CPF WHERE B.CPF IS NULL AND YEAR(B.DATA_VENDA) = 2015;
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM notas_fiscais B RIGHT JOIN tabela_de_clientes A ON A.CPF = B.CPF;


-- #######################-- FULL e CROSS JOIN --#############################################
SELECT * FROM tabela_de_vendedores;
SELECT * FROM tabela_de_clientes;

SELECT * FROM tabela_de_vendedores INNER JOIN tabela_de_clientes ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- ----------------------------------------------------------
SELECT 	tabela_de_vendedores.BAIRRO,
		tabela_de_vendedores.NOME,
		tabela_de_clientes.BAIRRO,
		tabela_de_clientes.NOME  
FROM tabela_de_vendedores INNER JOIN tabela_de_clientes ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- ----------------------------------------------------------
SELECT 	tabela_de_vendedores.BAIRRO,
		tabela_de_vendedores.NOME,
        -- tabela_de_vendedores.DE_FERIAS,
        DE_FERIAS, -- PODE FICAR SEM O NOME DA TABELA POIS O SQL ENTENDE DE OND ELE É POIS ESSA COLUNA SÓ EXISTE NA TABELA DE VENDEDORES
		tabela_de_clientes.BAIRRO,
		tabela_de_clientes.NOME  
FROM tabela_de_vendedores INNER JOIN tabela_de_clientes ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- ----------------------------------------------------------
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- ----------------------------------------------------------
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- ----------------------------------------------------------
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores FULL JOIN tabela_de_clientes 
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- ----------------------------------------------------------
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, 
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME FROM tabela_de_vendedores, tabela_de_clientes; -- CROSS JOIN

-- ------------------------ UNIOR ----------------------------------
SELECT DISTINCT BAIRRO FROM tabela_de_clientes;
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;
SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' as TIPO FROM tabela_de_clientes UNION ALL SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;
SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' as TIPO FROM tabela_de_clientes UNION SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' as TIPO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' as TIPO_CLIENTE FROM tabela_de_clientes UNION SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' as TIPO_VENDEDOR FROM tabela_de_vendedores;
SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' as TIPO_CLIENTE, CPF AS CPF_MATRICULA FROM tabela_de_clientes UNION SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' as TIPO_VENDEDOR, MATRICULA  FROM tabela_de_vendedores;


SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION  -- PAR SIMULAR UM (FULL JOIN) NO MYSQL QUE NÃO SUPORTA O COMANDO FULL JOIN PODEMOS UTILIZAR O (LEFT E RIGT JOIN) COM (UNIO)
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;


-- --------------------SUBCONSULTAS--------------------------------------
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT * FROM tabela_de_clientes WHERE BAIRRO IN ('Tijuca','Jardins','Copacabana','Santo Amaro');

SELECT * FROM tabela_de_clientes WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) as PRECO_MAXIMO FROM tabela_de_produtos GROUP BY EMBALAGEM;

SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM (SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos GROUP BY EMBALAGEM) X WHERE X.PRECO_MAXIMO >= 10;


-- --------------- Relação entre HAVING e subconsulta -----------------------------


SELECT CPF, COUNT(*) FROM notas_fiscais WHERE YEAR(DATA_VENDA) = 2016 GROUP BY CPF HAVING COUNT(*) > 2000;

SELECT X.CPF, X.CONTADOR FROM (SELECT CPF, COUNT(*) AS CONTADOR FROM notas_fiscais WHERE YEAR(DATA_VENDA) = 2016 GROUP BY CPF) X WHERE X.CONTADOR > 2000;



select * from tabela_de_vendedores where PERCENTUAL_COMISSAO >= 0.11 or DATA_ADMISSAO > 2016;

select * from tabela_de_produtos;



-- 5 - Selecione os clientes que possuem sobrenome  Araujo, Silva ou Oliveira

select * from tabela_de_clientes;


SELECT * FROM tabela_de_clientes where NOME like '%Araujo%' or NOME like '%Silva%' or  NOME like '%Oliveira%';


SELECT *  FROM tabela_de_clientes WHERE SUBSTRING_INDEX(nome, ' ', -1) IN ('Araujo', 'Silva', 'Oliveira');
SELECT *  FROM tabela_de_clientes WHERE SUBSTRING_INDEX(nome, ' ', -1);






SELECT * FROM tabela_de_clientes;
SELECT CPF, COUNT(*) FROM notas_fiscais WHERE YEAR(DATA_VENDA) = 2016 GROUP BY CP;
SELECT ESTADO, COUNT(*) FROM tabela_de_clientes where cidad;


-- 1 - Retorne a quantidade de clientes por estado
SELECT ESTADO, count(*) FROM tabela_de_clientes WHERE `ESTADO` = 'SP' union
SELECT ESTADO, count(*) FROM tabela_de_clientes WHERE `ESTADO` = 'RJ';

-- 2 - Retorne a cidade que possui o maior limite de credito
SELECT CIDADE, MAX(LIMITE_DE_CREDITO) as MAIOR_LIMITE_CREDITO FROM tabela_de_clientes GROUP BY CIDADE;

-- 3 - Retorne os três produtos mais baratos ordenados por nome 
SELECT NOME_DO_PRODUTO, min(PRECO_DE_LISTA) as MENOR_PRECO  FROM tabela_de_produtos group by PRECO_DE_LISTA limit 3 ;

-- 4 - Quantidade de notas fiscais emitidas por matricula de vendedor
select * from notas_fiscais;

SELECT M.MATRICULA, COUNT(MATRICULA) AS QUANTIDADE_NF FROM
notas_fiscais M
WHERE M.MATRICULA GROUP BY M.MATRICULA;

-- 5 - Media dos preços dos produtos agrupados por embalagem
SELECT EMBALAGEM, avg(PRECO_DE_LISTA) as MAIOR_PRECO FROM tabela_de_produtos GROUP BY EMBALAGEM;

-- 6 - Retorne as embalagens e somatorio dos preço por embalagem cuja soma dos preços por embalagem seja menor que 100
select EMBALAGEM, sum(PRECO_DE_LISTA) AS SOMA_PRECOS FROM tabela_de_produtos GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 100;


SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A LEFT JOIN notas_fiscais B ON A.CPF = B.CPF WHERE B.CPF IS NULL;

select DISTINCT NOME_DO_PRODUTO, QUANTIDADE from itens_notas_fiscais F inner join tabela_de_produtos P where F.CODIGO_DO_PRODUTO = P.CODIGO_DO_PRODUTO order by NOME_DO_PRODUTO is null;

select p.* from tabela_de_produtos p left join itens_notas_fiscais NF on p.CODIGO_DO_PRODUTO = NF.CODIGO_DO_PRODUTO where NF.CODIGO_DO_PRODUTO is null;




-- 01 - Faça uma consulta que retorne apenas os produtos que NÃO foram vendidos.
select p.CODIGO_DO_PRODUTO, NF.CODIGO_DO_PRODUTO as COD_NF, p.NOME_DO_PRODUTO, p.SABOR, count(*) 
from tabela_de_produtos p 
left join itens_notas_fiscais NF 
on p.CODIGO_DO_PRODUTO = NF.CODIGO_DO_PRODUTO 
where NF.CODIGO_DO_PRODUTO is null;

-- 02
SELECT P.CODIGO_DO_PRODUTO, P.NOME_DO_PRODUTO, count(nf.CODIGO_DO_PRODUTO) as QUANTIDADE_PRODUTOS_VENDIDOS
FROM tabela_de_produtos P  
left join itens_notas_fiscais NF
ON P.CODIGO_DO_PRODUTO = NF.CODIGO_DO_PRODUTO
GROUP BY p.CODIGO_DO_PRODUTO, p.NOME_DO_PRODUTO 
order by QUANTIDADE desc;

-- 03 - Faça uma consulta que retorne o valor TOTAL da Nota Fiscal 100. Ela deve ter Numero da nota e uma coluna com o TOTAL
select NF.NUMERO AS NUMERO_NF, count(nf.NUMERO) AS QTD_TOTAL, sum(NF.PRECO) AS TOTAL_PRECO  FROM itens_notas_fiscais nf where NUMERO = '100';

select * FROM itens_notas_fiscais where NUMERO = '100';

-- 04 - Faça uma consulta que retorne: Numero da Nota Fiscal, Nome do produto, Quantidade do produto e o preço do produto. Retorne da nota fiscal 100;
select NF.NUMERO, P.NOME_DO_PRODUTO, count(P.CODIGO_DO_PRODUTO) AS QTD_PRODUTOS, P.PRECO_DE_LISTA 
FROM tabela_de_produtos P
left join itens_notas_fiscais NF
ON P.CODIGO_DO_PRODUTO = NF.CODIGO_DO_PRODUTO
where NUMERO = '100';

-- 5 - A partir do exercício 4, crie uma nova consulta com uma coluna que categorize o preço:
-- Até 10: Barato;
-- Maior que 10 e menor que 20 : Custo Benefício;
-- Maior que 20 : Caro, prcure no Shopee;

select * FROM itens_notas_fiscais where NUMERO = '100';

SELECT PRECO,
CASE 
    WHEN PRECO <= 10 THEN 'BARATO'
    WHEN PRECO > 10 AND PRECO < 20 THEN 'CUSTO BENEFICIO'
    ELSE 'CARO, PROCURE NA SHOPEE' 
    END AS CATEGORIA_DE_PRECO 
FROM itens_notas_fiscais
WHERE NUMERO = '100'
ORDER BY PRECO;




















