/* Total comprado por cada cliente por mês */
SELECT n.cpf, DATE_FORMAT(n.data_venda, '%Y-%m') AS mes, SUM(i.quantidade) AS total_comprado
FROM notas_fiscais n
INNER JOIN itens_notas_fiscais i
	ON(i.numero = n.numero)
GROUP BY mes, n.cpf;

SELECT c.nome, tc.mes,
CASE 
	WHEN tc.total_comprado > c.volume_de_compra THEN 'Quantidade Excedida'
    ELSE 'Dentro do Limite'
END AS status_de_compra
FROM (
	SELECT n.cpf, DATE_FORMAT(n.data_venda, '%Y-%m') AS mes, SUM(i.quantidade) AS total_comprado
	FROM notas_fiscais n
	INNER JOIN itens_notas_fiscais i
		ON(i.numero = n.numero)
	GROUP BY mes, n.cpf
) tc
INNER JOIN tabela_de_clientes AS c
	ON(c.cpf = tc.cpf)
WHERE tc.cpf = c.cpf;

SELECT c.nome, tc.mes, c.volume_de_compra - tc.total_comprado AS total_comprado
FROM (
	SELECT n.cpf, DATE_FORMAT(n.data_venda, '%Y-%m') AS mes, SUM(i.quantidade) AS total_comprado
	FROM notas_fiscais n
	INNER JOIN itens_notas_fiscais i
		ON(i.numero = n.numero)
	GROUP BY mes, n.cpf
) tc
INNER JOIN tabela_de_clientes AS c
	ON(c.cpf = tc.cpf)
WHERE tc.cpf = c.cpf;



SELECT c.nome, tc.mes, c.volume_de_compra, tc.total_comprado,
CASE 
	WHEN tc.total_comprado > c.volume_de_compra THEN 'Quantidade Excedida'
    ELSE 'Dentro do Limite'
END AS status_de_compra,
ROUND(((c.volume_de_compra/tc.total_comprado) -1) * 100, 2) AS percentual_excedido
FROM (
	SELECT n.cpf, DATE_FORMAT(n.data_venda, '%Y-%m') AS mes, SUM(i.quantidade) AS total_comprado
	FROM notas_fiscais n
	INNER JOIN itens_notas_fiscais i
		ON(i.numero = n.numero)
	GROUP BY mes, n.cpf
) tc
INNER JOIN tabela_de_clientes AS c
	ON(c.cpf = tc.cpf)
WHERE tc.cpf = c.cpf
HAVING status_de_compra = 'Quantidade Excedida'
ORDER BY mes;