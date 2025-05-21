SELECT p.sabor, YEAR(nf.data_venda) AS ano, SUM(inf.quantidade) AS total_vendido
FROM tabela_de_produtos p
INNER JOIN itens_notas_fiscais inf
	ON(inf.codigo_do_produto = p.codigo_do_produto)
INNER JOIN notas_fiscais nf
	ON(inf.numero = nf.numero)
WHERE YEAR(nf.data_venda) = 2016
GROUP BY p.sabor, ano
Order BY total_vendido DESC;

-- -------------------- Rank por Total Vendido ------------------

SELECT venda_sabor.sabor, venda_sabor.ano, venda_sabor.total_vendido, (venda_sabor.total_vendido/venda_total.total_vendido)*100 AS participacao
FROM
	(SELECT p.sabor, YEAR(nf.data_venda) AS ano, SUM(inf.quantidade) AS total_vendido
	FROM tabela_de_produtos p
	INNER JOIN itens_notas_fiscais inf
		ON(inf.codigo_do_produto = p.codigo_do_produto)
	INNER JOIN notas_fiscais nf
		ON(inf.numero = nf.numero)
	WHERE YEAR(nf.data_venda) = 2016
	GROUP BY p.sabor, ano) AS venda_sabor
INNER JOIN
	(SELECT YEAR(nf.data_venda) AS ano, SUM(inf.quantidade) AS total_vendido
	FROM tabela_de_produtos p
	INNER JOIN itens_notas_fiscais inf
		ON(inf.codigo_do_produto = p.codigo_do_produto)
	INNER JOIN notas_fiscais nf
		ON(inf.numero = nf.numero)
	WHERE YEAR(nf.data_venda) = 2016
    GROUP BY ano) AS venda_total
ON (venda_sabor.ano = venda_total.ano)
ORDER BY venda_sabor.total_vendido DESC;

-- ---------------- ou -----------------------

SELECT 
	p.sabor, 
	YEAR(nf.data_venda) AS ano, 
    SUM(inf.quantidade) AS total_vendido,
    (SUM(inf.quantidade) / (
		SELECT SUM(inf.quantidade)
		FROM itens_notas_fiscais inf
		INNER JOIN notas_fiscais nf
			ON(inf.numero = nf.numero)
		WHERE YEAR(nf.data_venda) = 2016
	)) *100 AS participacao
FROM tabela_de_produtos p
INNER JOIN itens_notas_fiscais inf
	ON(inf.codigo_do_produto = p.codigo_do_produto)
INNER JOIN notas_fiscais nf
	ON(inf.numero = nf.numero)
WHERE YEAR(nf.data_venda) = 2016
GROUP BY p.sabor, ano
Order BY total_vendido DESC;


-- --------------------- Rank por Tamanho ----------------------

SELECT p.tamanho, YEAR(nf.data_venda) AS ano, SUM(inf.quantidade) AS total_vendido
FROM tabela_de_produtos p
INNER JOIN itens_notas_fiscais inf
	ON(inf.codigo_do_produto = p.codigo_do_produto)
INNER JOIN notas_fiscais nf
	ON(inf.numero = nf.numero)
WHERE YEAR(nf.data_venda) = 2016
GROUP BY p.tamanho, ano
Order BY total_vendido DESC;


SELECT venda_sabor.tamanho, venda_sabor.ano, venda_sabor.total_vendido, (venda_sabor.total_vendido/venda_total.total_vendido)*100 AS participacao
FROM
	(SELECT p.tamanho, YEAR(nf.data_venda) AS ano, SUM(inf.quantidade) AS total_vendido
	FROM tabela_de_produtos p
	INNER JOIN itens_notas_fiscais inf
		ON(inf.codigo_do_produto = p.codigo_do_produto)
	INNER JOIN notas_fiscais nf
		ON(inf.numero = nf.numero)
	WHERE YEAR(nf.data_venda) = 2016
	GROUP BY p.tamanho, ano) AS venda_sabor
INNER JOIN
	(SELECT YEAR(nf.data_venda) AS ano, SUM(inf.quantidade) AS total_vendido
	FROM tabela_de_produtos p
	INNER JOIN itens_notas_fiscais inf
		ON(inf.codigo_do_produto = p.codigo_do_produto)
	INNER JOIN notas_fiscais nf
		ON(inf.numero = nf.numero)
	WHERE YEAR(nf.data_venda) = 2016
    GROUP BY ano) AS venda_total
ON (venda_sabor.ano = venda_total.ano)
ORDER BY venda_sabor.total_vendido DESC;