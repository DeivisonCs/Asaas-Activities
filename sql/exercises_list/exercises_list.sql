USE asaasdevelopment;

-- SELECT * FROM payment;
-- SELECT * FROM customer_account;
-- SELECT * FROM customer WHERE name is not null ORDER BY name;
-- SELECT * FROM customer_register_status;

-- 1. Select de cobranças (payment) com valor maior que R$ 1.000,00
SELECT * FROM payment
WHERE value > 1000;

-- 2. Soma dos valores de cobranças recebidas com a data de criação maior que 2020, 
-- agrupadas por tipo de cobrança (billing_type)
SELECT p.billing_type, SUM(p.value) FROM payment p
WHERE YEAR(date_created) > 2020
GROUP BY p.billing_type;

-- 3. Lista de 20 pagadores (customer_account) com valores recebidos maiores que R$ 1.000,00
SELECT ca.id, ca.name, ca.email, ca.person_type, SUM(p.value) AS total_value FROM customer_account ca
INNER JOIN payment p
	ON(p.customer_account_id = ca.id)
WHERE p.value > 1000
GROUP BY ca.id, ca.name, ca.email, ca.person_type
LIMIT 20;

-- 4. Primeiro nome dos clientes (customer) com análise geral aprovada (customer_regiter_status),
-- ordenado por data de aprovação
SELECT 
	c.id,
    rs.date_created,
    CASE
		WHEN INSTR(c.name, ' ') > 0 THEN SUBSTR(c.name, 1, INSTR(c.name, ' '))
        ELSE c.name
	END AS first_name,
    rs.general_approval 
FROM customer c
INNER JOIN customer_register_status rs
	ON(c.id = rs.customer_id)
WHERE general_approval = 'APPROVED' AND name IS NOT NULL
ORDER BY rs.date_created;