CREATE DATABASE IF NOT EXISTS mini_asaas;

USE mini_asaas;
DROP TABLE IF EXISTS billing_ticket;
DROP TABLE IF EXISTS payer_account;
DROP TABLE IF EXISTS customer_account;
DROP TABLE IF EXISTS account_type_benefit;
DROP TABLE IF EXISTS account_benefit;
DROP TABLE IF EXISTS account_type;
DROP TABLE IF EXISTS account_status;
DROP TABLE IF EXISTS bill_status;
DROP TABLE IF EXISTS customer;


-- Tabela de clientes
CREATE TABLE IF NOT EXISTS customer (
    customer_id INT PRIMARY KEY,
    cpf_cnpj VARCHAR(15) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

-- Tabela de status das contas
CREATE TABLE IF NOT EXISTS account_status (
    account_status_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Tabela de tipos de contas
CREATE TABLE IF NOT EXISTS account_type (
    account_type_id INT PRIMARY KEY,
    type VARCHAR(50) NOT NULL
);

-- Tabela de benefícios
CREATE TABLE IF NOT EXISTS account_benefit (
    account_benefit_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100)
);

-- Relação N:N entre tipos de conta e benefícios
CREATE TABLE IF NOT EXISTS account_type_benefit (
    account_type_id INT NOT NULL,
    account_benefit_id INT NOT NULL,
    PRIMARY KEY (account_type_id, account_benefit_id),
    FOREIGN KEY (account_type_id) REFERENCES account_type(account_type_id),
    FOREIGN KEY (account_benefit_id) REFERENCES account_benefit(account_benefit_id)
);

-- Tabela de contas dos clientes
CREATE TABLE IF NOT EXISTS customer_account (
    account_number VARCHAR(15) PRIMARY KEY,
    customer_id INT NOT NULL,
    account_balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    account_credit_limit DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    account_status_id INT NOT NULL,
    account_type_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (account_status_id) REFERENCES account_status(account_status_id),
    FOREIGN KEY (account_type_id) REFERENCES account_type(account_type_id)
);

-- Tabela de contas externas (pagadores externos)
CREATE TABLE IF NOT EXISTS payer_account (
    payer_account_number VARCHAR(15) PRIMARY KEY,
    cpf_cnpj VARCHAR(15) NOT NULL,
    bank_name VARCHAR(50) NOT NULL
);

-- Status do boleto
CREATE TABLE IF NOT EXISTS bill_status (
    bill_status_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Tabela de boletos
CREATE TABLE IF NOT EXISTS billing_ticket (
    billing_ticket_id INT PRIMARY KEY,
    reciever_account_number VARCHAR(15) NOT NULL,
    payer_internal_account VARCHAR(15), -- Deve ser nulo caso o pagador seja de outro banco
    payer_external_account VARCHAR(15), -- Deve ser nulo caso o pagador seja do próprio banco
    amount DECIMAL(15, 2) NOT NULL DEFAULT 0.0,
    due_date DATE NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    bill_status_id INT NOT NULL,
    FOREIGN KEY (reciever_account_number) REFERENCES customer_account(account_number),
    FOREIGN KEY (payer_internal_account) REFERENCES customer_account(account_number),
    FOREIGN KEY (payer_external_account) REFERENCES payer_account(payer_account_number),
    FOREIGN KEY (bill_status_id) REFERENCES bill_status(bill_status_id),
    CHECK (
        (payer_internal_account IS NOT NULL AND payer_external_account IS NULL) OR
        (payer_internal_account IS NULL AND payer_external_account IS NOT NULL)
    )
);
