use estcaso5_cc1m;

INSERT INTO clientes (clientes_cpf, clientes_nome, clientes_datanasc, clientes_rua, clientes_numrua, clientes_bairro, clientes_cidade, clientes_uf, clientes_pais, clientes_cep, clientes_status)
VALUES
(123456789, 'Carlos Oliveira', '1980-10-10', 'Rua A', 123, 'Bairro X', 'Cidade Y', 'SP', 'Brasil', '12345-678', 'Pendente'),
(987654321, 'Fernanda Santos', '1990-02-25', 'Rua B', 456, 'Bairro Y', 'Cidade X', 'RJ', 'Brasil', '23456-789', 'Concluído'),
(111223344, 'Lucas Pereira', '1995-05-15', 'Rua C', 789, 'Bairro Z', 'Cidade W', 'MG', 'Brasil', '34567-890', 'Em espera'),
(555667788, 'Ana Lima', '2000-07-30', 'Rua D', 101, 'Bairro A', 'Cidade V', 'SP', 'Brasil', '45678-901', 'Pendente'),
(444556677, 'Juliana Costa', '1985-12-05', 'Rua E', 202, 'Bairro B', 'Cidade U', 'MG', 'Brasil', '56789-012', 'Concluído');
UPDATE clientes
SET clientes_bairro = 'Bairro A'
WHERE clientes_cpf = 123456789;
UPDATE clientes
SET clientes_status = 'Concluído'
WHERE clientes_cpf = 987654321;
DELETE FROM clientes
WHERE clientes_cpf = 444556677;

INSERT INTO produtos (produtos_cod, produtos_categoria, produtos_preco, produtos_quantidade)
VALUES
(1, 'Eletrônicos', 1000.00, 50),
(2, 'Roupas', 150.00, 200),
(3, 'Alimentos', 50.00, 500),
(4, 'Beleza', 80.00, 120),
(5, 'Livros', 30.00, 300);
UPDATE produtos
SET produtos_quantidade = 60
WHERE produtos_cod = 1;
UPDATE produtos
SET produtos_preco = 120.00
WHERE produtos_cod = 2;
DELETE FROM produtos
WHERE produtos_cod = 5;

INSERT INTO fornecedores (fornecedores_cnpj, fornecedores_contato, fornecedores_nome)
VALUES
(12345678, 'João Silva', 'Fornecedor A'),
(98765432, 'Maria Souza', 'Fornecedor B'),
(11223344, 'Carlos Lima', 'Fornecedor C'),
(22334455, 'Ana Costa', 'Fornecedor D'),
(33445566, 'Lucas Oliveira', 'Fornecedor E');
UPDATE fornecedores
SET fornecedores_contato = 'Carlos Souza'
WHERE fornecedores_cnpj = 12345678000190;
UPDATE fornecedores
SET fornecedores_nome = 'Fornecedor X'
WHERE fornecedores_cnpj = 98765432000180;
DELETE FROM fornecedores
WHERE fornecedores_cnpj = 33445566000150;

INSERT INTO vendas (vendas_cod, vendas_clientes)
VALUES
(1, 123456789),
(2, 987654321),
(3, 111223344),
(4, 555667788),
(5, 444556677);
UPDATE vendas
SET vendas_clientes = 987654321
WHERE vendas_cod = 1;
UPDATE vendas
SET vendas_clientes = 123456789
WHERE vendas_cod = 2;
DELETE FROM vendas
WHERE vendas_cod = 5;

INSERT INTO pagamentos (pagamentos_cod, pagamentos_data, pagamentos_valor, pagamentos_status, pagamentos_forma, pagamentos_vendas)
VALUES
(1, '2024-11-01', 200.00, 'Pendente', 'Cartão', 1),
(2, '2024-11-05', 150.00, 'Concluído', 'Boleto', 2),
(3, '2024-11-10', 180.00, 'Em espera', 'Dinheiro', 3),
(4, '2024-11-12', 250.00, 'Pendente', 'Cartão', 4),
(5, '2024-11-15', 220.00, 'Concluído', 'Boleto', 1);
UPDATE pagamentos
SET pagamentos_status = 'Concluído'
WHERE pagamentos_cod = 1;
UPDATE pagamentos
SET pagamentos_valor = 180.00
WHERE pagamentos_cod = 2;
DELETE FROM pagamentos
WHERE pagamentos_cod = 5;

INSERT INTO fornecedores_produtos (fp_fornecedores, fp_produtos)
VALUES
(12345678, 1),
(98765432, 2),
(11223344, 3),
(22334455, 4),
(33445565, 5);
UPDATE fornecedores_produtos
SET fp_produtos = 4
WHERE fp_fornecedores = 12345678000190;
UPDATE fornecedores_produtos
SET fp_fornecedores = 22334455000160
WHERE fp_produtos = 2;
DELETE FROM fornecedores_produtos
WHERE fp_fornecedores = 33445566000150;

INSERT INTO produtos_vendas (pv_quantidade, pv_valorvenda, pv_produtos, pv_vendas)
VALUES
(10, 1000.00, 1, 1),
(5, 150.00, 2, 2),
(20, 50.00, 3, 3),
(15, 80.00, 4, 4),
(10, 30.00, 5, 5);
UPDATE produtos_vendas
SET pv_quantidade = 12
WHERE pv_produtos = 1;
UPDATE produtos_vendas
SET pv_valorvenda = 140.00
WHERE pv_produtos = 2;
DELETE FROM produtos_vendas
WHERE pv_produtos = 5;
