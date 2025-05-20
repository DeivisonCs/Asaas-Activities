# Exercícios SQL

## Modelagem Mini Asaas
Sistema de gerenciamento de cobranças

- Permitir cadastrar, remover e atualizar cobranças
- Uma cobrança precisa ter um valor, descrição, data de vencimento, um pagador, e um "dono"
- Essa entrega precisa conter um diagrama com a modelagem desse esquema, e os scripts SQL para criação das tabelas e seus relacionamentos.

- Select de cobranças (payment) com valor maior que R$ 1.000,00
- Soma dos valores de cobranças recebidas com a data de criação maior que 2020, agrupadas por tipo de cobrança (billing_type)
- Lista de 20 pagadores (customer_account) com valores recebidos maiores que R$ 1.000,00
- Primeiro nome dos clientes (customer) com análise geral aprovada (customer_regiter_status), ordenado por data de aprovação