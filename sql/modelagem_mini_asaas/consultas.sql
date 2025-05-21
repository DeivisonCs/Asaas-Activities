USE mini_asaas;

SELECT * FROM billing_ticket;
SELECT * FROM customer_account;
SELECT * FROM bill_status;

-- -------------------------------- Cadastro de Cobrança --------------------------------

INSERT INTO billing_ticket (billing_ticket_id, reciever_account_number, payer_internal_account, amount, due_date, description, bill_status_id)
VALUE (51, '7453', '6897', 56.12, '2025-06-20', 'Pagamento corrente do serviço prestado', 1);

-- Pagador de outro banco
INSERT INTO payer_account (payer_account_number, cpf_cnpj, bank_name) VALUES
('EXT3124', '413414124', 'Nubranco');

INSERT INTO billing_ticket (billing_ticket_id, reciever_account_number, payer_external_account, amount, due_date, description, bill_status_id)
VALUE (57, '4812', 'EXT3124', 419.31, '2025-05-29', 'Compra de Ticket', 1);


-- -------------------------------- Atualização de Cobrança --------------------------------
-- Atualizando cobrança para 'Pago'
UPDATE billing_ticket
SET bill_status_id = 2
WHERE billing_ticket_id = 51;

-- Atualizando cobrança para 'Vencido'
UPDATE billing_ticket
SET bill_status_id = 3
WHERE billing_ticket_id = 57;


-- -------------------------------- Deleção de Cobrança --------------------------------
/* 
!!! Via de regra, um registro de cobrança não deve ser apagado, 
 apenas alterado seus status, mas caso queira...*/
 DELETE  FROM billing_ticket
 WHERE billing_ticket_id = 57;
