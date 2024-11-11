use estcaso4_cc1m;

INSERT INTO alunos (alunos_id, alunos_nome, alunos_datanasc, alunos_rua, alunos_numrua, alunos_bairro, alunos_cidade, alunos_estado, alunos_uf, alunos_cep, alunos_modalidpref)
VALUES
(1, 'João Silva', '2000-01-15', 'Rua A', 123, 'Bairro X', 'Cidade Y', 'Estado Z', 'SP', '12345-678', 'Matemática'),
(2, 'Maria Souza', '1998-03-25', 'Rua B', 456, 'Bairro Y', 'Cidade X', 'Estado W', 'RJ', '23456-789', 'Física'),
(3, 'Carlos Costa', '2002-07-05', 'Rua C', 789, 'Bairro Z', 'Cidade W', 'Estado X', 'MG', '34567-890', 'Química'),
(4, 'Ana Pereira', '1995-05-10', 'Rua D', 101, 'Bairro A', 'Cidade V', 'Estado Y', 'SP', '45678-901', 'Biologia'),
(5, 'Lucas Martins', '2001-11-20', 'Rua E', 202, 'Bairro B', 'Cidade U', 'Estado Z', 'MG', '56789-012', 'Geografia');
UPDATE alunos
SET alunos_bairro = 'Bairro A'
WHERE alunos_id = 1;
UPDATE alunos
SET alunos_estado = 'SP'
WHERE alunos_id = 2;
DELETE FROM alunos
WHERE alunos_id = 5;

INSERT INTO instrutores (instrutores_id, instrutores_nome)
VALUES
(1, 'Carlos Costa'),
(2, 'Ana Pereira'),
(3, 'Pedro Almeida'),
(4, 'Luciana Souza'),
(5, 'Rafael Lima');
UPDATE instrutores
SET instrutores_nome = 'Carlos Silva'
WHERE instrutores_id = 1;
UPDATE instrutores
SET instrutores_nome = 'Ana Souza'
WHERE instrutores_id = 2;
DELETE FROM instrutores
WHERE instrutores_id = 5;

INSERT INTO modalidades (modalidades_id, modalidades_nome)
VALUES
(1, 'Pilates'),
(2, 'Yoga'),
(3, 'Jiu-Jitsu'),
(4, 'Karate'),
(5, 'Musculação');
UPDATE modalidades
SET modalidades_nome = 'Pilates Avançado'
WHERE modalidades_id = 1;
UPDATE modalidades
SET modalidades_nome = 'Yoga Para Iniciantes'
WHERE modalidades_id = 2;
DELETE FROM modalidades
WHERE modalidades_id = 5;

INSERT INTO instrutores_modalidades (inmo_instrutores, inmo_modalidades)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
UPDATE instrutores_modalidades
SET inmo_modalidades = 2
WHERE inmo_instrutores = 1;
UPDATE instrutores_modalidades
SET inmo_instrutores = 2
WHERE inmo_modalidades = 1;
DELETE FROM instrutores_modalidades
WHERE inmo_instrutores = 5;

INSERT INTO pagamentos (pagamentos_id, pagamentos_data, pagamentos_valor, pagamentos_status, pagamentos_alunos)
VALUES
(1, '2024-11-01', 200.00, 'pendente', 1),
(2, '2024-11-05', 150.00, 'concluído', 2),
(3, '2024-11-10', 180.00, 'em espera', 3),
(4, '2024-11-12', 250.00, 'pendente', 4),
(5, '2024-11-15', 220.00, 'concluído', 1);
UPDATE pagamentos
SET pagamentos_status = 'concluído'
WHERE pagamentos_id = 1;
UPDATE pagamentos
SET pagamentos_valor = 180.00
WHERE pagamentos_id = 2;
DELETE FROM pagamentos
WHERE pagamentos_id = 5;

INSERT INTO planos_de_treinamento (plantrein_id, plantrein_alunos, plantrein_inmo_instrutores, plantrein_inmo_modalidades)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 1, 2, 5);
UPDATE planos_de_treinamento
SET plantrein_inmo_modalidades = 3
WHERE plantrein_id = 1;
UPDATE planos_de_treinamento
SET plantrein_inmo_instrutores = 4
WHERE plantrein_id = 2;
DELETE FROM planos_de_treinamento
WHERE plantrein_id = 5;

INSERT INTO aulas (aulas_id, aulas_horario, aulas_capacidade, aulas_inmo_instrutores, aulas_inmo_modalidades)
VALUES
(1, '09:00:00', 20, 1, 1),
(2, '14:00:00', 25, 2, 2),
(3, '16:00:00', 30, 3, 3),
(4, '18:00:00', 35, 4, 4),
(5, '20:00:00', 40, 5, 5);
UPDATE aulas
SET aulas_capacidade = 30
WHERE aulas_id = 2;
UPDATE aulas
SET aulas_horario = '08:00:00'
WHERE aulas_id = 1;
DELETE FROM aulas
WHERE aulas_id = 5;

INSERT INTO aulas_alunos (aual_aulas, aual_alunos)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);
UPDATE aulas_alunos
SET aual_alunos = 2
WHERE aual_aulas = 1;
UPDATE aulas_alunos
SET aual_alunos = 4
WHERE aual_aulas = 2;
DELETE FROM aulas_alunos
WHERE aual_aulas = 3;
