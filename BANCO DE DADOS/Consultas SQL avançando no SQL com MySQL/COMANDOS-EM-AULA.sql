

-- Ctrl + B para identar 
-- COMENTAR LINHA trl + /                   (a barra de divisão)

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


-- ----------------------------------------------------------------------------
-- Podemos simular o FULL JOIN, que não é suportado pelo MYSQL, usando o LEFT JOIN e RIGHT JOIN com UNION. Digite:
SELECT 
    tabela_de_vendedores.BAIRRO,
    tabela_de_vendedores.NOME,
    DE_FERIAS,
    tabela_de_clientes.BAIRRO,
    tabela_de_clientes.NOME
FROM
    tabela_de_vendedores
        LEFT JOIN
    tabela_de_clientes ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO 
UNION SELECT 
    tabela_de_vendedores.BAIRRO,
    tabela_de_vendedores.NOME,
    DE_FERIAS,
    tabela_de_clientes.BAIRRO,
    tabela_de_clientes.NOME
FROM
    tabela_de_vendedores
        RIGHT JOIN
    tabela_de_clientes ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;


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

-- 02 - Faça uma consulta que retorne os produtos (Codigo e Nome) e uma coluna com a quantidade de produtos vendidos. Ordene pela coluna de quantidade de forma decrescente.
SELECT P.CODIGO_DO_PRODUTO, P.NOME_DO_PRODUTO, count(nf.CODIGO_DO_PRODUTO) as QUANTIDADE_PRODUTOS_VENDIDOS
FROM tabela_de_produtos P  
left join itens_notas_fiscais NF
ON P.CODIGO_DO_PRODUTO = NF.CODIGO_DO_PRODUTO
GROUP BY p.CODIGO_DO_PRODUTO, p.NOME_DO_PRODUTO 
order by QUANTIDADE desc;

-- 03 - Faça uma consulta que retorne o valor TOTAL da Nota Fiscal 100. Ela deve ter Numero da nota e uma coluna com o TOTAL
select NF.NUMERO AS NUMERO_NF, count(nf.NUMERO) AS QTD_TOTAL, sum(NF.PRECO) AS TOTAL_PRECO  
FROM itens_notas_fiscais nf 
-- where NUMERO = 100
group by NUMERO;

select * FROM itens_notas_fiscais where NUMERO = '100';

-- 04 - Faça uma consulta que retorne: Numero da Nota Fiscal, Nome do produto, Quantidade do produto e o preço do produto. Retorne da nota fiscal 100;
select NF.NUMERO, P.NOME_DO_PRODUTO, count(P.CODIGO_DO_PRODUTO) AS QTD_PRODUTOS, P.PRECO_DE_LISTA 
FROM tabela_de_produtos P
inner join itens_notas_fiscais NF
ON P.CODIGO_DO_PRODUTO = NF.CODIGO_DO_PRODUTO
where nf.NUMERO = '100';

SELECT nf.NUMERO AS Numero_Nota, p.NOME_DO_PRODUTO AS Nome_Produto, nf.QUANTIDADE AS Quantidade, nf.PRECO AS Preco
FROM itens_notas_fiscais nf
INNER JOIN tabela_de_produtos p ON nf.CODIGO_DO_PRODUTO = p.CODIGO_DO_PRODUTO
WHERE nf.NUMERO = 100;

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



select A.numero, B.nome_do_produto, A.quantidade, A.preco,
case
    when A.preco < 10 then 'Barato'
    when A.preco >= 10 and A.preco < 20 then 'Custo Beneficio'
    when A.preco > 20 then ' Caro, procure na Shopee'
end as classificacao_preco
from itens_notas_fiscais A inner join tabela_de_produtos B
on a.codigo_do_produto = b.codigo_do_produto
where A.numero = 100;

-- -------------------- VIEW --------------------------------------

SELECT 
    EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO
FROM
    tabela_de_produtos
GROUP BY EMBALAGEM;

-- ----------------------------------------------------------------------------
SELECT 
    X.EMBALAGEM, X.MAIOR_PRECO
FROM
    vw_maiores_embalagens X
WHERE
    X.MAIOR_PRECO >= 10;

-- ----------------------------------------------------------------------------
SELECT 
    X.EMBALAGEM, X.MAIOR_PRECO
FROM
    vw_maiores_embalagens X
WHERE
    X.MAIOR_PRECO >= 10;

-- ----------------------------------------------------------------------------
SELECT 
    A.NOME_DO_PRODUTO,
    A.EMBALAGEM,
    A.PRECO_DE_LISTA,
    X.MAIOR_PRECO
FROM
    tabela_de_produtos A
INNER JOIN
    vw_maiores_embalagens X ON A.EMBALAGEM = X.EMBALAGEM;
    
-- ----------------------------------------------------------------------------
SELECT 
    A.NOME_DO_PRODUTO,
    A.EMBALAGEM,
    A.PRECO_DE_LISTA,
    X.MAIOR_PRECO,
    ((A.PRECO_DE_LISTA / X.MAIOR_PRECO) - 1) * 100 AS PERCENTUAL
FROM
    tabela_de_produtos A
        INNER JOIN
    vw_maiores_embalagens X ON A.EMBALAGEM = X.EMBALAGEM;


-- ------------------------- Funções de string ---------------------------------------------------
SELECT CONCAT("SQL ", "Tutorial ", "is ", "fun!") AS Concatena_String; 

SELECT LTRIM("     SQL Tutorial") AS TIRANDO_ESPACOS_DA_ESQUERDA_COM_LTRIM;

SELECT RTRIM("SQL Tutorial     ") AS TIRANDO_ESPACOS_DA_DIREITA_COM_RTRIM;

SELECT TRIM('    SQL Tutorial    ') AS TIRANDO_ESPACOS_DA_DIREITA_E_DIREITA_COM_TRIM;

SELECT LCASE("SQL Tutorial is FUN!"); --  transforma um texto minúsculas
SELECT LOWER("SQL Tutorial is FUN!"); --  transforma um texto minúsculas

SELECT UCASE("SQL Tutorial is FUN!"); --  transforma um texto maiúsculas
SELECT UPPER("SQL Tutorial is FUN!"); --  transforma um texto maiúsculas

SELECT SUBSTRING("SQL Tutorial", 5, 3) AS ExtractString; -- RESULTADO = Tut; retirar um pedaço de texto de dentro de uma string maior. 
SELECT SUBSTRING('OLÁ, TUDO BEM?', 6, 4) AS RESULTADO; -- RESULTADO = TUDO

SELECT LENGTH("SQL Tutorial") AS LengthOfString; -- retorna o tamanho de uma string:

SELECT CONCAT(NOME, ' (', CPF, ') ') AS RESULTADO FROM TABELA_DE_CLIENTES;

-- Faça uma consulta listando o nome do cliente e o endereço completo (Com rua, bairro, cidade e estado).
SELECT NOME, CONCAT(ENDERECO_1, ' ', BAIRRO, ' ', CIDADE, ' ', ESTADO) AS COMPLETO FROM tabela_de_clientes;


-- ------------------------- Funções de datas ---------------------------------------------------
SELECT ADDDATE("2017-06-15", INTERVAL 10 DAY);

SELECT ADDTIME("2017-06-15 09:34:21", "2");

SELECT CURDATE();

SELECT CURRENT_TIMESTAMP();

SELECT DATEDIFF("2017-06-25", "2017-06-15");

SELECT DAYNAME("2017-06-15");
SELECT MONTHNAME("2017-06-15");

SELECT DAY("2017-06-15");
SELECT MONTH("2017-06-15");

SELECT CURDATE();
SELECT CURRENT_TIME();
SELECT CURRENT_TIMESTAMP();

SELECT YEAR(CURRENT_TIMESTAMP());
SELECT MONTH(CURRENT_TIMESTAMP());
SELECT DAY(CURRENT_TIMESTAMP());

SELECT MONTHNAME(CURRENT_TIMESTAMP());

SELECT DATEDIFF(CURRENT_TIMESTAMP(), '2019-01-01') AS RESULTADO;


SELECT DATEDIFF(CURRENT_TIMESTAMP(), '2022-10-17') AS RESULTADO;

SELECT CURRENT_TIMESTAMP() AS DIA_HOJE, DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 5 DAY) AS RESULTADO;

SELECT DISTINCT DATA_VENDA FROM NOTAS_FISCAIS;
SELECT DISTINCT DATA_VENDA,
DAYNAME(DATA_VENDA) AS DIA, MONTHNAME(DATA_VENDA) AS MES, YEAR(DATA_VENDA) AS ANO FROM NOTAS_FISCAIS;


-- Crie uma consulta que mostre o nome e a idade atual dos clientes.
SELECT 
    NOME,
    TIMESTAMPDIFF(YEAR,
        DATA_DE_NASCIMENTO,
        CURDATE()) AS IDADE
FROM
    tabela_de_clientes;


-- -------------------------- Funções matemáticas --------------------------------------------------
SELECT (23+((25-2)/2)*45) AS RESULTADO;

SELECT CEILING(12.33333232323) AS RESULTADO;

SELECT ROUND(12.33333232323) AS RESULTADO;
SELECT ROUND(12.7777232323) AS RESULTADO;

SELECT FLOOR(12.7777232323) AS RESULTADO;

SELECT RAND() AS RESULTADO; 

SELECT NUMERO, QUANTIDADE, PRECO FROM ITENS_NOTAS_FISCAIS;

SELECT NUMERO, QUANTIDADE, PRECO, QUANTIDADE * PRECO AS FATURAMENTO FROM ITENS_NOTAS_FISCAIS;

 SELECT NUMERO, QUANTIDADE, PRECO, ROUND(QUANTIDADE * PRECO, 2) AS FATURAMENTO FROM ITENS_NOTAS_FISCAIS;


-- Na tabela de notas fiscais temos o valor do imposto. Já na tabela de itens temos a quantidade e o faturamento. Calcule o valor do imposto pago no ano de 2016 arredondando para o menor inteiro.
SELECT YEAR(DATA_VENDA) AS ANO_VENDAS, FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) AS VALOR_IMPOSTO
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);

-- ------------------------- Conversão de dados ---------------------------------------------------
SELECT CURRENT_TIMESTAMP() AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', CURRENT_TIMESTAMP()) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%Y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%m/%y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%d/%m/%Y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%W, %d/%m/%Y') ) AS RESULTADO;

SELECT CONCAT('O dia de hoje é: ', DATE_FORMAT(CURRENT_TIMESTAMP(),'%d/%m/%Y - %U') ) AS RESULTADO;

SELECT CONVERT(23.3, CHAR) AS RESULTADO;

SELECT SUBSTRING(CONVERT(23.3, CHAR),1,1) AS RESULTADO;

-- Queremos construir um SQL cujo resultado seja, para cada cliente:
-- 			“O cliente João da Silva faturou 120000 no ano de 2016”.
-- 			Somente para o ano de 2016.
SELECT 
    CONCAT('O cliente ',
            TC.NOME,
            ' faturou ',
            CAST(SUM(INF.QUANTIDADE * INF.preco) AS CHAR (20)),
            ' no ano ',
            CAST(YEAR(NF.DATA_VENDA) AS CHAR (20))) AS SENTENCA
FROM
    notas_fiscais NF
        INNER JOIN
    itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
        INNER JOIN
    tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE
    YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME , YEAR(DATA_VENDA);

-- ---------------------------------------------------------------------------------------------

SELECT * FROM ITENS_NOTAS_FISCAIS;
SELECT * FROM NOTAS_FISCAIS;

-- ---------------------------------------------------------------------------------------------
SELECT * FROM NOTAS_FISCAIS NF INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO;

-- ---------------------------------------------------------------------------------------------
SELECT NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO;

-- ---------------------------------------------------------------------------------------------
SELECT NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, INF.QUANTIDADE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO;

-- ---------------------------------------------------------------------------------------------
SELECT NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');

/* CONSULTA COM VENDAS DE CLIENTES POR MES */
SELECT * FROM TABELA_DE_CLIENTES TC;

-- ---------------------------------------------------------------------------------------------
SELECT TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA AS QUANTIDADE_LIMITE
FROM TABELA_DE_CLIENTES TC;

/* LIMITE DE COMPRA POR CLIENTE */
SELECT TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA AS QUANTIDADE_LIMITE
FROM TABELA_DE_CLIENTES TC;

-- ---------------------------------------------------------------------------------------------
SELECT 
    NF.CPF,
    TC.NOME,
    DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO,
    SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS,
    TC.VOLUME_DE_COMPRA AS QUANTIDADE_LIMITE
FROM
    NOTAS_FISCAIS NF
        INNER JOIN
    ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
        INNER JOIN
    TABELA_DE_CLIENTES TC ON TC.CPF = NF.CPF
GROUP BY NF.CPF , TC.NOME , DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');

-- ---------------------------------------------------------------------------------------------
SELECT 
    NF.CPF,
    TC.NOME,
    DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO,
    SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS,
    MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE
FROM
    NOTAS_FISCAIS NF
        INNER JOIN
    ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
        INNER JOIN
    TABELA_DE_CLIENTES TC ON TC.CPF = NF.CPF
GROUP BY NF.CPF , TC.NOME , DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');

-- ---------------------------------------------------------------------------------------------
SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS AS DIFERENCA
FROM (
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS , MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X;

-- ---------------------------------------------------------------------------------------------
SELECT 
    X.CPF,
    X.NOME,
    X.MES_ANO,
    X.QUANTIDADE_VENDAS,
    X.QUANTIDADE_LIMITE,
    X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS AS DIFERENCA,
    CASE
        WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
        ELSE 'VÁLIDA'
    END AS STATUS_VENDA
FROM
    (SELECT 
        NF.CPF,
            TC.NOME,
            DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO,
            SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS,
            MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE
    FROM
        NOTAS_FISCAIS NF
    INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
    INNER JOIN TABELA_DE_CLIENTES TC ON TC.CPF = NF.CPF
    GROUP BY NF.CPF , TC.NOME , DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X;

-- ---------------------------------------------------------------------------------------------
SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE 
    WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
    ELSE 'VÁLIDA' 
END AS STATUS_VENDA
FROM (
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS , 
MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X;


-- ---------------------------------------------------------------------------------------------
SELECT 
    X.CPF,
    X.NOME,
    X.MES_ANO,
    X.QUANTIDADE_VENDAS,
    X.QUANTIDADE_LIMITE,
    CASE
        WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
        ELSE 'VÁLIDA'
    END AS STATUS_VENDA,
    (1 - (X.QUANTIDADE_LIMITE / X.QUANTIDADE_VENDAS)) * 100 AS PERCENTUAL
FROM
    (SELECT 
        NF.CPF,
            TC.NOME,
            DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO,
            SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS,
            MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE
    FROM
        NOTAS_FISCAIS NF
    INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
    INNER JOIN TABELA_DE_CLIENTES TC ON TC.CPF = NF.CPF
    GROUP BY NF.CPF , TC.NOME , DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X
WHERE
    (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0;




-- ---------------------------------------------------------------------------------------------
-- 1 -  Faça duas consultas e use o Union. 
--         a - Retorne os produtos da embalagem PET
--         b - Retorne os produtos da embalagem Garrafa;

select * FROM tabela_de_produtos WHERE EMBALAGEM = 'PET'
UNION
select * FROM tabela_de_produtos WHERE EMBALAGEM = 'GARRAFA'
;


-- 2 - Faça duas consultas e use o Union. 
--         a - Retorne os produtos de valor menor que 15
--         b - Retorne os produtos da valor maior ou igual a 15;
--         c - Adicione uma coluna com valor fixo: BARATO e CARO para CATEGORIA de PREÇO

SELECT DISTINCT NOME_DO_PRODUTO, PRECO_DE_LISTA, 'BARATO' as CATEGORIA_PREÇO FROM tabela_de_produtos WHERE PRECO_DE_LISTA < 15
UNION
SELECT DISTINCT NOME_DO_PRODUTO, PRECO_DE_LISTA, 'CARO' as CATEGORIA_PREÇO FROM tabela_de_produtos WHERE PRECO_DE_LISTA >= 15 ;

-- 3 - Faça duas consultas e use union:
--         a - Retorne Nome e Matricula de vendedor dos vendedores que NÃO realizaram
--             vendas - NÃO use COUNT;
SELECT V.NOME, V.MATRICULA,'ZERO' AS QTD_VENDAS FROM tabela_de_vendedores V  
LEFT JOIN notas_fiscais NF
ON V.MATRICULA = NF.MATRICULA
WHERE DATA_VENDA IS NULL;

--         b - Crie uma coluna (Quantidade de Vendas) com o valor fixo 0 (ZERO) 
--             na primeira consulta;
SELECT DISTINCT V.NOME, V.MATRICULA, COUNT(NF.DATA_VENDA) AS QTD_VENDAS FROM tabela_de_vendedores V
LEFT JOIN notas_fiscais NF
ON V.MATRICULA = NF.MATRICULA ;
--         c - Retorne Nome, Matricula e Quantidade de Vendas dos vendedores que 
--             REALIZARAM     vendas.


SELECT 
    V.NOME, V.MATRICULA, 0 AS QUANTIDADE_DE_VENDAS
FROM
    tabela_de_vendedores V
        LEFT JOIN
    notas_fiscais F ON V.MATRICULA = F.MATRICULA
WHERE
    F.MATRICULA IS NULL 
UNION SELECT 
    V.NOME,
    V.MATRICULA,
    COUNT(F.MATRICULA) AS QUANTIDADE_DE_VENDAS
FROM
    tabela_de_vendedores v
        INNER JOIN
    notas_fiscais F ON V.MATRICULA = F.MATRICULA
GROUP BY V.NOME , V.MATRICULA;



SELECT DISTINCT V.NOME, V.MATRICULA,COUNT(NF.DATA_VENDA) AS QTD_VENDAS FROM tabela_de_vendedores V  
LEFT JOIN notas_fiscais NF
ON V.MATRICULA = NF.MATRICULA
-- WHERE NF.DATA_VENDA IS NULL
GROUP BY NF.DATA_VENDA;




SELECT * FROM tabela_de_vendedores;
SELECT * FROM tabela_de_vendedores WHERE MATRICULA = 00235;
SELECT * FROM notas_fiscais;


SELECT DISTINCT * FROM tabela_de_vendedores V
left JOIN notas_fiscais NF
ON V.MATRICULA = NF.MATRICULA
union
SELECT DISTINCT * FROM tabela_de_vendedores V
RIGHT JOIN notas_fiscais NF
ON V.MATRICULA = NF.MATRICULA;


-- -------------------------- Relatório de vendas por sabor -------------------------------------------------------------------
SELECT * FROM
TABELA_DE_PRODUTOS TP
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO;


SELECT * FROM
TABELA_DE_PRODUTOS TP
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO;


SELECT TP.SABOR, NF.DATA_VENDA, INF.QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO;


SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, INF.QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO;

SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA);

SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
ORDER BY SUM(INF.QUANTIDADE) DESC;

/* QUANTIDADE VENDIDA POR SABOR ANO 2016 */
SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
ORDER BY SUM(INF.QUANTIDADE) DESC;

/* QUANTIDADE TOTAL 2016*/
SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)
ORDER BY SUM(INF.QUANTIDADE) DESC;

/* QUANTIDADE VENDIDA POR SABOR ANO 2016 */
SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA);

/* QUANTIDADE TOTAL 2016*/
SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)
ORDER BY SUM(INF.QUANTIDADE) DESC;


/* QUANTIDADE VENDIDA POR SABOR ANO 2016 */
SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA);

/* QUANTIDADE TOTAL 2016*/
SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA);

(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR

(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL;

-- ---------------------------------------------------------------------------------------------
SELECT * FROM
(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR
INNER JOIN
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_SABOR.ANO = VENDA_TOTAL.ANO;

-- ---------------------------------------------------------------------------------------------
SELECT VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
(VENDA_SABOR.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2 AS PARTICIPACAO FROM 
(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR
INNER JOIN 
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_SABOR.ANO = VENDA_TOTAL.ANO;

-- ---------------------------------------------------------------------------------------------
SELECT VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
ROUND((VENDA_SABOR.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2) AS PARTICIPACAO FROM 
(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR
INNER JOIN 
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_SABOR.ANO = VENDA_TOTAL.ANO
ORDER BY VENDA_SABOR.QUANTIDADE DESC;

-- ---------------------------------------------------------------------------------------------

SELECT VENDA_TAMANHO.TAMANHO, VENDA_TAMANHO.ANO, VENDA_TAMANHO.QUANTIDADE,
ROUND((VENDA_TAMANHO.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2) AS PARTICIPACAO FROM 
(SELECT TP.TAMANHO, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.TAMANHO, YEAR(NF.DATA_VENDA)) AS VENDA_TAMANHO
INNER JOIN 
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_TAMANHO.ANO = VENDA_TOTAL.ANO
ORDER BY VENDA_TAMANHO.QUANTIDADE DESC;

-- ---------------------------------------------------------------------------------------------


-- ---------------------------------------------------------------------------------------------



-- ---------------------------------------------------------------------------------------------