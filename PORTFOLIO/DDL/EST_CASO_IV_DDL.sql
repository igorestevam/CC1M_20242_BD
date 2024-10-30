create schema ESTCASO4_CC1M;
use ESTCASO4_CC1M;

create table if not exists tabela_drop_IV(
tabtes_cod int primary key,
tabtes_nome varchar(50) not null
);

drop table if exists tabela_drop_IV;

create table if not exists alunos(
alunos_id int primary key,
alunos_nome varchar(50) not null,
alunos_datanasc date not null,
alunos_rua varchar(30) not null,
alunos_numrua int,
alunos_bairro varchar(30) not null,
alunos_cidade varchar(30) not null,
alunos_estado varchar(30) not null,
alunos_uf char(2) not null,
alunos_cep varchar(10) not null,
alunos_modalidpref varchar(20) not null
);

alter table alunos add alunos_email int;
alter table alunos modify column alunos_email varchar(50);
alter table alunos change column alunos_email alunos_enderecoemail varchar(50);
alter table alunos drop column alunos_enderecoemail;

create table if not exists instrutores(
instrutores_id int primary key,
instrutores_nome varchar(45) not null
);

alter table instrutores add instrutores_telefone char(20);
alter table instrutores modify column instrutores_telefone text;
alter table instrutores change column instrutores_telefone instrutores_tel text;
alter table instrutores drop column instrutores_tel;

create table if not exists modalidades(
modalidades_id int primary key,
modalidades_nome varchar(45) not null
);

alter table modalidades add modalidades_tempo decimal(10,2);
alter table modalidades modify column modalidades_tempo time;
alter table modalidades change column modalidades_tempo modalidades_duracao time;
alter table modalidades drop column modalidades_duracao;

create table if not exists instrutores_modalidades(
inmo_instrutores int not null,
inmo_modalidades int not null,
primary key(inmo_instrutores, inmo_modalidades),
constraint inmo_fk_instrutores foreign key(inmo_instrutores)
references instrutores(instrutores_id),
constraint inmo_fk_modalidades foreign key(inmo_modalidades)
references modalidades(modalidades_id)
);

alter table instrutores_modalidades add inmo_conclusao text;
alter table instrutores_modalidades modify column inmo_conclusao date;
alter table instrutores_modalidades change column inmo_conclusao inmo_termino date;
alter table instrutores_modalidades drop column inmo_termino;

create table if not exists pagamentos(
pagamentos_id int primary key,
pagamentos_data date not null,
pagamentos_valor decimal(10,2) not null,
pagamentos_status enum ('pendente', 'concluído', 'em espera'),
pagamentos_alunos int not null,
constraint pag_fk_alunos foreign key(pagamentos_alunos)
references alunos(alunos_id)
);

alter table pagamentos add pagamentos_parcela datetime;
alter table pagamentos modify column pagamentos_parcela blob;
alter table pagamentos change column pagamentos_parcela pagamentos_parc blob;
alter table pagamentos drop column pagamentos_parc;

create table if not exists planos_de_treinamento(
plantrein_id int primary key,
plantrein_alunos int not null,
plantrein_inmo_instrutores int not null,
plantrein_inmo_modalidades int not null,
constraint pltr_fk_alunos foreign key(plantrein_alunos)
references alunos(alunos_id),
constraint pltr_fk_inmo_instrutores foreign key(plantrein_inmo_instrutores)
references instrutores_modalidades(inmo_instrutores),
constraint pltr_fk_inmo_modalidades foreign key(plantrein_inmo_modalidades)
references instrutores_modalidades(inmo_modalidades)
);

alter table planos_de_treinamento add plantrein_nome int;
alter table planos_de_treinamento modify column plantrein_nome char(10);
alter table planos_de_treinamento change column plantrein_nome plantrein_nomenclatura char(10);
alter table planos_de_treinamento drop column plantrein_nomenclatura;

create table if not exists aulas(
aulas_id int primary key,
aulas_horario time not null,
aulas_capacidade int not null,
aulas_inmo_instrutores int not null,
aulas_inmo_modalidades int not null,
constraint aulas_fk_inmo_instrutores foreign key(aulas_inmo_instrutores)
references instrutores_modalidades(inmo_instrutores),
constraint aulas_fk_inmo_modalidades foreign key(aulas_inmo_modalidades)
references instrutores_modalidades(inmo_modalidades)
);

alter table aulas add aulas_cadeiras text;
alter table aulas modify column aulas_cadeiras int;
alter table aulas change column aulas_cadeiras aulas_carteiras int;
alter table aulas drop column aulas_carteiras;

create table if not exists aulas_alunos(
aual_aulas int not null,
aual_alunos int not null,
primary key(aual_aulas, aual_alunos),
constraint aual_fk_aulas foreign key(aual_aulas)
references aulas(aulas_id),
constraint aual_fk_alunos foreign key(aual_alunos)
references alunos(alunos_id)
);

alter table aulas_alunos add aual_mesas blob;
alter table aulas_alunos modify column aual_mesas varchar(10);
alter table aulas_alunos change column aual_mesas aual_bancos varchar(10);
alter table aulas_alunos drop column aual_bancos;
