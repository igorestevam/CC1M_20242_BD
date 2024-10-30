create schema ESTCASO5_CC1M;
use ESTCASO5_CC1M;

create table if not exists tabela_drop_V(
tabtes_cod int primary key,
tabtes_nome varchar(50) not null
);

drop table if exists tabela_drop_V;

create table if not exists clientes(
clientes_cpf int primary key,
clientes_nome varchar(50) not null,
clientes_datanasc date not null,
clientes_rua varchar(50) not null,
clientes_numrua int,
clientes_bairro varchar(50) not null,
clientes_cidade varchar(50) not null,
clientes_uf char(2) not null,
clientes_pais varchar(30) not null,
clientes_cep varchar(10) not null,
clientes_status enum('Pendente', 'Concluído', 'Em espera') not null
);

alter table clientes add clientes_email text;
alter table clientes modify column clientes_email varchar(20);
alter table clientes change column clientes_email clientes_enderecoemail varchar(20);
alter table clientes drop column clientes_enderecoemail;

create table if not exists produtos(
produtos_cod int primary key,
produtos_categoria varchar(30) not null,
produtos_preco decimal(10,2) not null,
produtos_quantidade int
);

alter table produtos add produtos_cor char(10);
alter table produtos modify column produtos_cor blob;
alter table produtos change column produtos_cor produtos_textura blob;
alter table produtos drop column produtos_textura;

create table if not exists fornecedores(
fornecedores_cnpj int primary key,
fornecedores_contato varchar(20) not null,
fornecedores_nome varchar(20) not null
);

alter table fornecedores add fornecedores_telefone decimal(10,2);
alter table fornecedores modify column fornecedores_telefone time;
alter table fornecedores change column fornecedores_telefone fornecedores_tel time;
alter table fornecedores drop column fornecedores_tel;

create table if not exists vendas(
vendas_cod int primary key,
vendas_clientes int not null,
constraint fk_ven_clientes foreign key(vendas_clientes)
references clientes(clientes_cpf)
);

alter table vendas add vendas_quantidade varchar(10);
alter table vendas modify column vendas_quantidade int;
alter table vendas change column vendas_quantidade vendas_quant int;
alter table vendas drop column vendas_quant;

create table if not exists pagamentos(
pagamentos_cod int primary key,
pagamentos_data date not null,
pagamentos_valor decimal(10,2) not null,
pagamentos_status enum ('Pendente', 'Concluído', 'Em espera') not null,
pagamentos_forma varchar(15) not null,
pagamentos_vendas int not null,
constraint fk_pg_vendas foreign key(pagamentos_vendas)
references vendas(vendas_cod)
);

alter table pagamentos add pagamentos_validade text;
alter table pagamentos modify column pagamentos_validade date;
alter table pagamentos change column pagamentos_validade pagamentos_val date;
alter table pagamentos drop column pagamentos_val;

create table if not exists fornecedores_produtos(
fp_fornecedores int not null,
fp_produtos int not null,
primary key(fp_fornecedores, fp_produtos),
constraint fk_fp_fornecedores foreign key(fp_fornecedores)
references fornecedores(fornecedores_cnpj),
constraint fk_fp_produtos foreign key(fp_produtos)
references produtos(produtos_cod)
);

alter table fornecedores_produtos add fp_nome varchar(10);
alter table fornecedores_produtos modify column fp_nome datetime;
alter table fornecedores_produtos change column fp_nome fp_titulo datetime;
alter table fornecedores_produtos drop column fp_titulo;

create table if not exists produtos_vendas(
pv_quantidade int not null,
pv_valorvenda decimal(10,2) not null,
pv_produtos int not null,
pv_vendas int not null,
primary key(pv_produtos, pv_vendas),
constraint fk_pv_produtos foreign key(pv_produtos)
references produtos(produtos_cod),
constraint fk_pv_vendas foreign key(pv_vendas)
references vendas(vendas_cod)
);

alter table produtos_vendas add pv_historico int;
alter table produtos_vendas modify column pv_historico blob;
alter table produtos_vendas change column pv_historico pv_hist blob;
alter table produtos_vendas drop column pv_hist;
