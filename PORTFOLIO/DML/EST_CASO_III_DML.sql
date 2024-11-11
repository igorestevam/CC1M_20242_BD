use estcaso3_cc1m;

INSERT INTO clientes (clientes_id, clientes_cnpj, clientes_razsoc, clientes_ramoativ, clientes_datacadast, clientes_pessoacontato)
VALUES 
(1, '12.345.678/0001-99', 'Empresa A Ltda', 'Comércio de Eletrônicos', '2024-01-01', 'Carlos Silva'),
(2, '98.765.432/0001-10', 'Empresa B S.A.', 'Consultoria', '2024-02-15', 'Maria Oliveira'),
(3, '11.222.333/0001-44', 'Indústria X', 'Fabricante de Móveis', '2024-03-10', 'José Santos'),
(4, '22.334.455/0001-55', 'Loja Y', 'Varejo de Roupas', '2024-04-22', 'Ana Souza'),
(5, '33.445.566/0001-66', 'Distribuidora Z', 'Distribuição de Alimentos', '2024-05-05', 'Paulo Rocha');
UPDATE clientes
SET clientes_ramoativ = 'Comércio de Informática', clientes_pessoacontato = 'Roberta Silva'
WHERE clientes_id = 1;
UPDATE clientes
SET clientes_pessoacontato = 'Carlos Souza', clientes_datacadast = '2024-06-01'
WHERE clientes_id = 2;
DELETE FROM clientes
WHERE clientes_id = 5;

INSERT INTO empregados (empreg_matricula, empreg_nome, empreg_qualificacoes, empreg_salario, empreg_dataemissao)
VALUES
(101, 'Ricardo Almeida', 'Graduado em Engenharia', 3500.00, '2023-06-01'),
(102, 'Laura Costa', 'Mestrado em Administração', 4500.00, '2023-07-15'),
(103, 'Felipe Lima', 'Técnico em Informática', 2500.00, '2023-08-20'),
(104, 'Fernanda Oliveira', 'Graduada em Contabilidade', 4000.00, '2023-09-30'),
(105, 'Gabriel Silva', 'Mestre em Direito', 5500.00, '2023-10-05');
UPDATE empregados
SET empreg_salario = 3800.00, empreg_dataemissao = '2023-06-15'
WHERE empreg_matricula = 101;
UPDATE empregados
SET empreg_qualificacoes = 'Mestrado em Psicologia', empreg_nome = 'Laura Martins'
WHERE empreg_matricula = 102;
DELETE FROM empregados
WHERE empreg_matricula = 103;

INSERT INTO fornecedores (fornec_cnpj, fornec_razsoc, fornec_pessoacontato)
VALUES
('12.345.678/0001-99', 'Fornecedor A Ltda', 'Luiza Martins'),
('23.456.789/0001-88', 'Fornecedor B S.A.', 'Eduardo Ferreira'),
('34.567.890/0001-77', 'Fornecedor C Ltda', 'Renata Costa'),
('45.678.901/0001-66', 'Fornecedor D S.A.', 'Ricardo Almeida'),
('56.789.012/0001-55', 'Fornecedor E Ltda', 'Paula Souza');
UPDATE fornecedores
SET fornec_razsoc = 'Fornecedor X Ltda', fornec_pessoacontato = 'Mariana Pereira'
WHERE fornec_cnpj = '12.345.678/0001-99';
UPDATE fornecedores
SET fornec_pessoacontato = 'João Silva'
WHERE fornec_cnpj = '23.456.789/0001-88';
DELETE FROM fornecedores
WHERE fornec_cnpj = '45.678.901/0001-66';

INSERT INTO telefones (tel_numero, tel_clientes, tel_empregados, tel_fornecedores)
VALUES
('11-2345-6789', 1, 101, '12.345.678/0001-99'),
('11-9876-5432', 2, 102, '23.456.789/0001-88'),
('11-3456-7890', 3, 103, '34.567.890/0001-77'),
('11-8765-4321', 4, 104, '45.678.901/0001-66'),
('11-5678-1234', 5, 105, '56.789.012/0001-55');
UPDATE telefones
SET tel_numero = '11-2345-1234'
WHERE tel_clientes = 1 AND tel_empregados = 101;
UPDATE telefones
SET tel_numero = '11-9876-4321'
WHERE tel_fornecedores = '34.567.890/0001-77' AND tel_clientes = 3;
DELETE FROM telefones
WHERE tel_clientes = 2 AND tel_empregados = 102;

INSERT INTO produtos (prod_id, prod_nome, prod_cor, prod_dimensoes, prod_peso, prod_preco, prod_tempfabr, prod_desenhoproduto, prod_horasmaodeobra)
VALUES
(1, 'Smartphone X', 'Preto', '15 x 7 x 0.8 cm', 0.2, 1500.00, '02:00:00', null, '00:30:00'),
(2, 'Laptop Y', 'Prata', '35 x 24 x 2 cm', 1.5, 3500.00, '03:00:00', null, '01:00:00'),
(3, 'Cadeira Z', 'Azul', '50 x 50 x 90 cm', 5.0, 500.00, '04:00:00', null, '02:00:00'),
(4, 'Monitor W', 'Preto', '50 x 30 x 5 cm', 4.0, 1200.00, '02:30:00', null, '01:30:00'),
(5, 'Teclado Q', 'Branco', '45 x 20 x 2 cm', 0.7, 200.00, '01:00:00', null, '00:45:00');
UPDATE produtos
SET prod_preco = 1600.00, prod_cor = 'Cinza'
WHERE prod_id = 1;
UPDATE produtos
SET prod_nome = 'Monitor Ultra HD', prod_dimensoes = '60 x 40 x 5 cm'
WHERE prod_id = 3;
DELETE FROM produtos
WHERE prod_id = 4;

INSERT INTO tipos_de_componentes (tiposcomp_id, tiposcomp_nome)
VALUES
(1, 'Elétrico'),
(2, 'Mecânico'),
(3, 'Eletrônico'),
(4, 'Hidráulico'),
(5, 'Estrutural');
UPDATE tipos_de_componentes
SET tiposcomp_nome = 'Eletromecânico'
WHERE tiposcomp_id = 2;
UPDATE tipos_de_componentes
SET tiposcomp_nome = 'Eletrônica Avançada'
WHERE tiposcomp_id = 3;
DELETE FROM tipos_de_componentes
WHERE tiposcomp_id = 5;

INSERT INTO componentes (componentes_id, componentes_nome, componentes_quantestoque, componentes_precounit, componentes_unidade, componentes_tiposcomp)
VALUES
(1, 'Resistor', 1000, 0.50, 'un', 1),
(2, 'Parafuso', 5000, 0.10, 'un', 2),
(3, 'Transistor', 2000, 1.20, 'un', 3),
(4, 'Pistão', 300, 10.00, 'un', 4),
(5, 'Estrutura de Ferro', 50, 100.00, 'm²', 5);
UPDATE componentes
SET componentes_quantestoque = 1200, componentes_precounit = 0.55
WHERE componentes_id = 1;
UPDATE componentes
SET componentes_nome = 'Parafuso de Alta Resistência', componentes_precounit = 0.15
WHERE componentes_id = 2;
DELETE FROM componentes
WHERE componentes_id = 5;

INSERT INTO registro_de_suprimentos (rs_quantidade, rs_datanecessidade, rs_componentes)
VALUES
(500, '2024-11-15', 1),
(1000, '2024-11-18', 2),
(1500, '2024-11-20', 3),
(300, '2024-11-22', 4),
(50, '2024-11-25', 5);
UPDATE registro_de_suprimentos
SET rs_quantidade = 600
WHERE rs_componentes = 1;
UPDATE registro_de_suprimentos
SET rs_datanecessidade = '2024-11-30'
WHERE rs_componentes = 2;
DELETE FROM registro_de_suprimentos
WHERE rs_componentes = 5;

INSERT INTO maquinas (maquinas_id, maquinas_tempodevida, maquinas_datacompra, maquinas_datafimgarantia)
VALUES
(1, '2025-12-31', '2024-01-01', '2027-01-01'),
(2, '2026-06-15', '2024-03-10', '2027-03-10'),
(3, '2027-08-20', '2024-06-01', '2028-06-01'),
(4, '2026-05-10', '2024-09-15', '2027-09-15'),
(5, '2027-01-01', '2024-12-10', '2028-12-10');
UPDATE maquinas
SET maquinas_tempodevida = '2027-12-31'
WHERE maquinas_id = 1;
UPDATE maquinas
SET maquinas_datafimgarantia = '2028-03-01'
WHERE maquinas_id = 2;
DELETE FROM maquinas
WHERE maquinas_id = 5;

INSERT INTO registro_de_manutencao (rm_data, rm_descricao, rm_maquinas)
VALUES
('2024-10-15', 'Troca de peça do motor', 1),
('2024-09-20', 'Manutenção hidráulica', 2),
('2024-08-25', 'Ajuste de controle eletrônico', 3),
('2024-07-10', 'Reparo no sistema de refrigeração', 4),
('2024-06-30', 'Troca de óleo e filtro', 5);
UPDATE registro_de_manutencao
SET rm_descricao = 'Troca de peça crítica no motor'
WHERE rm_maquinas = 1;
UPDATE registro_de_manutencao
SET rm_data = '2024-09-01'
WHERE rm_maquinas = 2;
DELETE FROM registro_de_manutencao
WHERE rm_maquinas = 5;

INSERT INTO recursos_especificos (re_quantnecess, re_unidade, re_tempodeuso, re_horasmaodebora, re_produtos, re_componentes, re_maquinas)
VALUES
(100, 'un', '2024-12-31', '02:00:00', 1, 1, 1),
(200, 'un', '2024-11-30', '03:00:00', 2, 2, 2),
(150, 'un', '2024-11-25', '01:30:00', 3, 3, 3),
(50, 'm²', '2024-10-15', '02:30:00', 4, 4, 4),
(10, 'un', '2024-12-01', '00:45:00', 5, 5, 5);
UPDATE recursos_especificos
SET re_quantnecess = 120, re_horasmaodebora = '02:15:00'
WHERE re_produtos = 1 AND re_componentes = 1 AND re_maquinas = 1;
UPDATE recursos_especificos
SET re_unidade = 'kg', re_tempodeuso = '2025-01-01'
WHERE re_produtos = 2 AND re_componentes = 2 AND re_maquinas = 2;
DELETE FROM recursos_especificos
WHERE re_produtos = 5 AND re_componentes = 5 AND re_maquinas = 5;

INSERT INTO cargos (cargos_id, cargos_nome)
VALUES
(1, 'Gerente'),
(2, 'Supervisor'),
(3, 'Assistente'),
(4, 'Estagiário'),
(5, 'Coordenador');
UPDATE cargos
SET cargos_nome = 'Gerente Sênior'
WHERE cargos_id = 1;
UPDATE cargos
SET cargos_nome = 'Supervisor de Equipe'
WHERE cargos_id = 2;
DELETE FROM cargos
WHERE cargos_id = 5;

INSERT INTO funcoes (funcoes_id, funcoes_nome)
VALUES
(1, 'Analista'),
(2, 'Programador'),
(3, 'Tester'),
(4, 'Designer'),
(5, 'Gerente de Projetos');
UPDATE funcoes
SET funcoes_nome = 'Analista Sênior'
WHERE funcoes_id = 1;
UPDATE funcoes
SET funcoes_nome = 'Programador Fullstack'
WHERE funcoes_id = 2;
DELETE FROM funcoes
WHERE funcoes_id = 5;

INSERT INTO encomendas (encomendas_id, encomendas_datainclusao, encomendas_clientes)
VALUES
(1, '2024-11-01 10:00:00', 1),
(2, '2024-11-02 12:00:00', 2),
(3, '2024-11-03 14:00:00', 3),
(4, '2024-11-04 16:00:00', 4),
(5, '2024-11-05 18:00:00', 5);
UPDATE encomendas
SET encomendas_datainclusao = '2024-11-10 09:00:00'
WHERE encomendas_id = 1;
UPDATE encomendas
SET encomendas_clientes = 3
WHERE encomendas_id = 2;
DELETE FROM encomendas
WHERE encomendas_id = 5;

INSERT INTO pagamentos (pag_valordesc, pag_valorliq, pag_quantparcelas, pag_idformapagamento, pag_encomendas, pag_clientes)
VALUES
(100.00, 90.00, 3, 1, 1, 1),
(200.00, 180.00, 2, 2, 2, 2),
(150.00, 135.00, 5, 3, 3, 3),
(50.00, 45.00, 1, 4, 4, 4),
(75.00, 67.50, 2, 5, 5, 5);
UPDATE pagamentos
SET pag_quantparcelas = 4
WHERE pag_encomendas = 1 AND pag_clientes = 1;
UPDATE pagamentos
SET pag_valorliq = 190.00
WHERE pag_encomendas = 2 AND pag_clientes = 2;
DELETE FROM pagamentos
WHERE pag_encomendas = 5 AND pag_clientes = 5;

INSERT INTO tipos_de_endereco (tiposend_id, tiposend_nome, tiposend_clientes, tiposend_empreg, tiposend_fornec)
VALUES
(1, 'Residencial', 1, 101, '12345678901'),
(2, 'Comercial', 2, 102, '23456789012'),
(3, 'Industrial', 3, 103, '34567890123'),
(4, 'Logístico', 4, 104, '45678901234'),
(5, 'Cultural', 5, 105, '56789012345');
UPDATE tipos_de_endereco
SET tiposend_nome = 'Residencial de Alto Padrão'
WHERE tiposend_id = 1;
UPDATE tipos_de_endereco
SET tiposend_nome = 'Comercial de Médio Porte'
WHERE tiposend_id = 2;
DELETE FROM tipos_de_endereco
WHERE tiposend_id = 5;

INSERT INTO enderecos (enderecos_numero, enderecos_rua, enderecos_numrua, enderecos_complemento, enderecos_cep, enderecos_bairro, enderecos_cidade, enderecos_uf, enderecos_pais, enderecos_tiposend)
VALUES
('123', 'Rua A', 10, 'Apto 101', '12345-678', 'Centro', 'São Paulo', 'SP', 'Brasil', 1),
('456', 'Rua B', 20, 'Sala 202', '23456-789', 'Vila Nova', 'Rio de Janeiro', 'RJ', 'Brasil', 2),
('789', 'Rua C', 30, 'Galpão 301', '34567-890', 'Zona Norte', 'Fortaleza', 'CE', 'Brasil', 3),
('101', 'Rua D', 40, 'Pavilhão 402', '45678-901', 'Vila Industrial', 'Curitiba', 'PR', 'Brasil', 4),
('202', 'Rua E', 50, 'Centro Cultural', '56789-012', 'Centro', 'Belo Horizonte', 'MG', 'Brasil', 5);
UPDATE enderecos
SET enderecos_complemento = 'Apto 202'
WHERE enderecos_numero = '123';
UPDATE enderecos
SET enderecos_bairro = 'Zona Sul'
WHERE enderecos_numero = '456';
DELETE FROM enderecos
WHERE enderecos_numero = '202';

INSERT INTO empregados_produtos (empr_empregados, empr_produtos)
VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105);
UPDATE empregados_produtos
SET empr_produtos = 106
WHERE empr_empregados = 1;
UPDATE empregados_produtos
SET empr_produtos = 107
WHERE empr_empregados = 2;
DELETE FROM empregados_produtos
WHERE empr_empregados = 5;

INSERT INTO fornecedores_componentes (frcp_fornecedores, frcp_componentes)
VALUES
('12345678901', 1),
('23456789012', 2),
('34567890123', 3),
('45678901234', 4),
('56789012345', 5);
UPDATE fornecedores_componentes
SET frcp_componentes = 6
WHERE frcp_fornecedores = '12345678901';
UPDATE fornecedores_componentes
SET frcp_fornecedores = '23456789013'
WHERE frcp_componentes = 2;
DELETE FROM fornecedores_componentes
WHERE frcp_fornecedores = '56789012345';

INSERT INTO encomendas_produtos (enpr_encomendas, enpr_produtos)
VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105);
UPDATE encomendas_produtos
SET enpr_produtos = 106
WHERE enpr_encomendas = 1;
UPDATE encomendas_produtos
SET enpr_produtos = 107
WHERE enpr_encomendas = 2;
DELETE FROM encomendas_produtos
WHERE enpr_encomendas = 5;

INSERT INTO cargos_funcoes (cgfc_cargos, cgfc_funcoes, cgfc_empregados)
VALUES
(1, 1, 101),
(2, 2, 102),
(3, 3, 103),
(4, 4, 104),
(5, 5, 105);
UPDATE cargos_funcoes
SET cgfc_funcoes = 6
WHERE cgfc_cargos = 1;
UPDATE cargos_funcoes
SET cgfc_cargos = 2
WHERE cgfc_empregados = 102;
DELETE FROM cargos_funcoes
WHERE cgfc_empregados = 105;
