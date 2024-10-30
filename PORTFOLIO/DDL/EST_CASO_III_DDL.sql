create schema ESTCASO3_CC1M;
use ESTCASO3_CC1M;

create table if not exists tabela_drop_III(
tabtes_cod int primary key,
tabtes_nome varchar(50) not null
);

drop table if exists tabela_drop_III;

create table if not exists clientes(
clientes_id int primary key,
clientes_cnpj varchar (20) not null,
clientes_razsoc varchar(50) not null,
clientes_ramoativ varchar(50) not null,
clientes_datacadast date not null,
clientes_pessoacontato varchar(50) not null
);

alter table clientes add clientes_email int;
alter table clientes modify column clientes_email text;
alter table clientes change column clientes_email clientes_enderecoemail text;
alter table clientes drop column clientes_enderecoemail;

create table if not exists empregados(
empreg_matricula int primary key,
empreg_nome varchar(50) not null,
empreg_qualificacoes varchar(100),
empreg_salario decimal(10,2) not null,
empreg_dataemissao date not null
);

alter table empregados add empreg_numero text;
alter table empregados modify column empreg_numero date;
alter table empregados change column empreg_numero empreg_num date;
alter table empregados drop column empreg_num;

create table if not exists fornecedores(
fornec_cnpj varchar(20) primary key,
fornec_razsoc varchar(50) not null,
fornec_pessoacontato varchar(50) not null
);

alter table fornecedores add fornec_contato int;
alter table fornecedores modify column fornec_contato time;
alter table fornecedores change column fornec_contato fornec_ctt time;
alter table fornecedores drop column fornec_ctt;

create table if not exists telefones(
tel_numero varchar(20) not null,
tel_clientes int not null,
tel_empregados int not null,
tel_fornecedores varchar(20) not null,
primary key(tel_clientes, tel_empregados, tel_fornecedores),
constraint tel_fk_clientes foreign key(tel_clientes)
references clientes(clientes_id),
constraint tel_fk_empregados foreign key(tel_empregados)
references empregados(empreg_matricula),
constraint tel_fk_fornecedores foreign key(tel_fornecedores)
references fornecedores(fornec_cnpj)
);

alter table telefones add tel_chip char(20);
alter table telefones modify column tel_chip blob;
alter table telefones change column tel_chip tel_cartoes blob;
alter table telefones drop column tel_cartoes;

create table if not exists produtos(
prod_id int primary key,
prod_nome varchar(50) not null,
prod_cor varchar(20) not null,
prod_dimensoes varchar(20) not null,
prod_peso decimal(10,2) not null,
prod_preco decimal(10,2) not null,
prod_tempfabr time not null,
prod_desenhoproduto blob,
prod_horasmaodeobra time not null
);

alter table produtos add prod_formato text;
alter table produtos modify column prod_formato date;
alter table produtos change column prod_formato prod_forma date;
alter table produtos drop column prod_forma;

create table if not exists tipos_de_componentes(
tiposcomp_id int primary key,
tiposcomp_nome varchar(50) not null
);

alter table tipos_de_componentes add tiposcomp_historico char(40);
alter table tipos_de_componentes modify column tiposcomp_historico varchar(20);
alter table tipos_de_componentes change column tiposcomp_historico tiposcomp_hist varchar(20);
alter table tipos_de_componentes drop column tiposcomp_hist;

create table if not exists componentes(
componentes_id int primary key,
componentes_nome varchar(50) not null,
componentes_quantestoque int,
componentes_precounit decimal(10,2) not null,
componentes_unidade varchar(5) not null,
componentes_tiposcomp int not null,
constraint fk_tipos_de_componentes foreign key(componentes_tiposcomp)
references tipos_de_componentes(tiposcomp_id)
);

alter table componentes add componentes_tipos int;
alter table componentes modify column componentes_tipos datetime;
alter table componentes change column componentes_tipos componentes_tipagem datetime;
alter table componentes drop column componentes_tipagem;

create table if not exists registro_de_suprimentos(
rs_quantidade int,
rs_datanecessidade date not null,
rs_componentes int primary key,
constraint rs_fk_componentes foreign key(rs_componentes)
references componentes(componentes_id)
);

alter table registro_de_suprimentos add rs_lista varchar(50);
alter table registro_de_suprimentos modify column rs_lista text;
alter table registro_de_suprimentos change column rs_lista rs_listadereg text;
alter table registro_de_suprimentos drop column rs_listadereg;

create table if not exists maquinas(
maquinas_id int primary key,
maquinas_tempodevida date not null,
maquinas_datacompra date not null,
maquinas_datafimgarantia date not null
);

alter table maquinas add maquinas_qualidade text;
alter table maquinas modify column maquinas_qualidade int;
alter table maquinas change column maquinas_qualidade maquinas_quali int;
alter table maquinas drop column maquinas_quali;

create table if not exists registro_de_manutencao(
rm_data date not null,
rm_descricao text not null,
rm_maquinas int not null,
constraint rm_fk_maquinas foreign key(rm_maquinas)
references maquinas(maquinas_id)
);

alter table registro_de_manutencao add rm_feito blob;
alter table registro_de_manutencao modify column rm_feito char(1);
alter table registro_de_manutencao change column rm_feito rm_naofeito char(1);
alter table registro_de_manutencao drop column rm_naofeito;

create table if not exists recursos_especificos(
re_quantnecess int not null,
re_unidade varchar(5) not null,
re_tempodeuso date not null,
re_horasmaodebora time not null,
re_produtos int not null,
re_componentes int not null,
re_maquinas int not null,
primary key(re_produtos, re_componentes, re_maquinas),
constraint re_fk_produtos foreign key(re_produtos)
references produtos(prod_id),
constraint re_fk_componentes foreign key(re_componentes)
references componentes(componentes_id),
constraint re_fk_maquinas foreign key(re_maquinas)
references maquinas(maquinas_id)
);

alter table recursos_especificos add re_cor text;
alter table recursos_especificos modify column re_cor decimal(10,2);
alter table recursos_especificos change column re_cor re_textura decimal(10,2);
alter table recursos_especificos drop column re_textura;

create table if not exists cargos(
cargos_id int primary key,
cargos_nome varchar(50) not null
);

alter table cargos add cargos_quantidade varchar(10);
alter table cargos modify column cargos_quantidade char(20);
alter table cargos change column cargos_quantidade cargos_quant char(20);
alter table cargos drop column cargos_quant;

create table if not exists funcoes(
funcoes_id int primary key,
funcoes_nome varchar(50) not null
);

alter table funcoes add funcoes_quantidade text;
alter table funcoes modify column funcoes_quantidade int;
alter table funcoes change column funcoes_quantidade funcoes_quant int;
alter table funcoes drop column funcoes_quant;

create table if not exists encomendas(
encomendas_id int primary key,
encomendas_datainclusao datetime not null,
encomendas_clientes int not null,
constraint enc_fk_clientes foreign key(encomendas_clientes)
references clientes(clientes_id)
);

alter table encomendas add encomendas_tamanho time;
alter table encomendas modify column encomendas_tamanho date;
alter table encomendas change column encomendas_tamanho encomendas_tam date;
alter table encomendas drop column encomendas_tam;

create table if not exists pagamentos(
pag_valordesc decimal(10,2),
pag_valorliq decimal(10,2) not null,
pag_quantparcelas int not null,
pag_idformapagamento int not null,
pag_encomendas int not null,
pag_clientes int not null,
primary key(pag_encomendas, pag_clientes),
constraint pag_fk_encomendas foreign key(pag_encomendas)
references encomendas(encomendas_id),
constraint pag_fk_clientes foreign key(pag_clientes)
references clientes(clientes_id)
);

alter table pagamentos add pag_paginst text;
alter table pagamentos modify column pag_paginst int;
alter table pagamentos change column pag_paginst pag_pix int;
alter table pagamentos drop column pag_pix;

create table if not exists tipos_de_endereco(
tiposend_id int primary key,
tiposend_nome varchar(50) not null,
tiposend_clientes int not null,
tiposend_empreg int not null,
tiposend_fornec varchar(20) not null,
constraint fk_clientes foreign key(tiposend_clientes)
references clientes(clientes_id),
constraint fk_empregados foreign key(tiposend_empreg)
references empregados(empreg_matricula),
constraint fk_fornec foreign key(tiposend_fornec)
references fornecedores(fornec_cnpj)
);

alter table tipos_de_endereco add tiposend_historico char(20);
alter table tipos_de_endereco modify column tiposend_historico varchar(20);
alter table tipos_de_endereco change column tiposend_historico tiposend_hist varchar(20);
alter table tipos_de_endereco drop column tiposend_hist;

create table if not exists enderecos(
enderecos_numero varchar(20) not null,
enderecos_rua varchar(20) not null,
enderecos_numrua int,
enderecos_complemento text,
enderecos_cep varchar(10) not null,
enderecos_bairro varchar(50) not null,
enderecos_cidade varchar(50) not null,
enderecos_uf char(2) not null,
enderecos_pais varchar(30),
enderecos_tiposend int primary key,
constraint fk_tipos_de_endereco foreign key(enderecos_tiposend)
references tipos_de_endereco(tiposend_id)
);

alter table enderecos add enderecos_variedades decimal(10,2);
alter table enderecos modify column enderecos_variedades int;
alter table enderecos change column enderecos_variedades enderecos_var int;
alter table enderecos drop column enderecos_var;

create table if not exists empregados_produtos(
empr_empregados int not null,
empr_produtos int not null,
primary key(empr_empregados, empr_produtos),
constraint empr_fk_empregados foreign key(empr_empregados)
references empregados(empreg_matricula),
constraint empr_fk_produtos foreign key(empr_produtos)
references produtos(prod_id)
);

alter table empregados_produtos add empr_quantidade datetime;
alter table empregados_produtos modify column empr_quantidade time;
alter table empregados_produtos change column empr_quantidade empr_quant time;
alter table empregados_produtos drop column empr_quant;

create table if not exists fornecedores_componentes(
frcp_fornecedores varchar(20) not null,
frcp_componentes int not null,
primary key(frcp_fornecedores, frcp_componentes),
constraint frcp_fk_fornecedores foreign key(frcp_fornecedores)
references fornecedores(fornec_cnpj),
constraint frcp_fk_componentes foreign key(frcp_componentes)
references componentes(componentes_id)
);

alter table fornecedores_componentes add frcp_quantidade blob;
alter table fornecedores_componentes modify column frcp_quantidade date;
alter table fornecedores_componentes change column frcp_quantidade frcp_quant date;
alter table fornecedores_componentes drop column frcp_quant;

create table if not exists encomendas_produtos(
enpr_encomendas int not null,
enpr_produtos int not null,
primary key(enpr_encomendas, enpr_produtos),
constraint enpr_fk_encomendas foreign key(enpr_encomendas)
references encomendas(encomendas_id),
constraint enpr_fk_produtos foreign key(enpr_produtos)
references produtos(prod_id)
);

alter table encomendas_produtos add enpr_recentes int;
alter table encomendas_produtos modify column enpr_recentes varchar(10);
alter table encomendas_produtos change column enpr_recentes enpr_ultimos varchar(10);
alter table encomendas_produtos drop column enpr_ultimos;

create table if not exists cargos_funcoes(
cgfc_cargos int not null,
cgfc_funcoes int not null,
cgfc_empregados int not null,
primary key(cgfc_cargos, cgfc_funcoes),
constraint cgfc_fk_cargos foreign key(cgfc_cargos)
references cargos(cargos_id),
constraint cgfc_fk_funcoes foreign key(cgfc_funcoes)
references funcoes(funcoes_id),
constraint cgfc_fk_empregados foreign key(cgfc_empregados)
references empregados(empreg_matricula)
);

alter table cargos_funcoes add cgfc_tipos char(20);
alter table cargos_funcoes modify column cgfc_tipos decimal(10,2);
alter table cargos_funcoes change column cgfc_tipos cgfc_tipagem decimal(10,2);
alter table cargos_funcoes drop column cgfc_tipagem;
