USE mini_asaas;

INSERT INTO customer (customer_id, cpf_cnpj, first_name, last_name) VALUES
(1, '12345678901', 'João', 'Silva'),
(2, '23456789012', 'Maria', 'Oliveira'),
(3, '34567890123', 'Carlos', 'Souza');

INSERT INTO account_status (account_status_id, name) VALUES
(1, 'Ativa'),
(2, 'Inativa'),
(3, 'Encerrada'),
(4, 'Bloqueada'),
(5, 'Suspensa'),
(6, 'Em análise');

INSERT INTO account_type (account_type_id, type) VALUES
(1, 'Conta Corrente'),
(2, 'Conta Poupança'),
(3, 'Conta Salário');

INSERT INTO account_benefit (account_benefit_id, name, description) VALUES
(1, 'Cartão de Crédito', 'Cartão com limite de até R$ 2.000'),
(2, 'Cheque Especial', 'Limite emergencial na conta'),
(3, 'Aplicações', 'Permite investimentos automáticos');

INSERT INTO account_type_benefit (account_type_id, account_benefit_id) VALUES
(1, 1), -- Conta Corrente → Cartão de Crédito
(1, 2), -- Conta Corrente → Cheque Especial
(2, 3), -- Conta Poupança → Aplicações
(3, 1); -- Conta Salário → Cartão de Crédito

INSERT INTO customer_account (account_number, customer_id, account_balance, account_credit_limit, account_status_id, account_type_id) VALUES
('4812', 1, 1500.00, 500.00, 1, 1),
('6897', 2, 2300.00, 300.00, 1, 2),
('7453', 3, 500.00, 0.00, 2, 3);

INSERT INTO payer_account (payer_account_number, cpf_cnpj, bank_name) VALUES
('EXT001', '98765432100', 'Banco do Brasil'),
('EXT002', '87654321099', 'Bradesco');

INSERT INTO bill_status (bill_status_id, name) VALUES
(1, 'Em aberto'),
(2, 'Pago'),
(3, 'Vencido');

-- Pagador interno (Maria para João)
INSERT INTO billing_ticket (
	billing_ticket_id,
    reciever_account_number,
    payer_internal_account,
    payer_external_account,
    due_date,
    description,
    bill_status_id,
    amount
) VALUES
(1, '4812', '6897', NULL, '2025-06-15', 'Pagamento de serviço', 1, 250.00);

-- Pagador externo (Carlos recebe de conta externa)
INSERT INTO billing_ticket (
	billing_ticket_id,
    reciever_account_number,
    payer_internal_account,
    payer_external_account,
    due_date,
    description,
    bill_status_id,
    amount
) VALUES
(2, '7453', NULL, 'EXT001', '2025-06-10', 'Depósito externo', 2, 500.00);
