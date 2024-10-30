CREATE SCHEMA ESTCASO2_CC1M;
USE ESTCASO2_CC1M;

CREATE TABLE IF NOT EXISTS TABELA_DROP_II(
TABTES_COD INT PRIMARY KEY,
TABTES_NOME VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS TABELA_DROP_II;

CREATE TABLE IF NOT EXISTS PASSAGEIROS(
PASS_CPF INT PRIMARY KEY,
PASS_NOME VARCHAR(50) NOT NULL,
PASS_TELEFONE INT NOT NULL,
PASS_ENDERECO VARCHAR(50) NOT NULL
);

ALTER TABLE PASSAGEIROS ADD PASS_EMAIL CHAR(23);
ALTER TABLE PASSAGEIROS MODIFY COLUMN PASS_EMAIL VARCHAR(30);
ALTER TABLE PASSAGEIROS CHANGE COLUMN PASS_EMAIL PASS_ENDERECOEMAIL VARCHAR(30);
ALTER TABLE PASSAGEIROS DROP COLUMN PASS_ENDERECOEMAIL;

CREATE TABLE IF NOT EXISTS AERONAVES (
AERON_PREFIXO INT PRIMARY KEY,
AERON_MODELO VARCHAR (20) NOT NULL,
AERON_ANOFABR INT NOT NULL,
AERON_FABRICANTE VARCHAR(20) NOT NULL,
AERON_CAPACIDADE INT NOT NULL,
AERON_AUTONOMIA INT NOT NULL
);

ALTER TABLE AERONAVES ADD AERON_COR INT;
ALTER TABLE AERONAVES MODIFY COLUMN AERON_COR TEXT;
ALTER TABLE AERONAVES CHANGE COLUMN AERON_COR AERON_TEXTURA TEXT;
ALTER TABLE AERONAVES DROP COLUMN AERON_TEXTURA;

CREATE TABLE IF NOT EXISTS AEROPORTOS (
AEROP_COD INT PRIMARY KEY,
AEROP_NOME VARCHAR(30) NOT NULL,
AEROP_CIDADE VARCHAR(30) NOT NULL,
AEROP_PAIS VARCHAR(30) NOT NULL,
AEROP_LATITUDE DECIMAL(10,8) NOT NULL,
AEROP_LONGITUDE DECIMAL(10,8) NOT NULL
);

ALTER TABLE AEROPORTOS ADD AEROP_LOCAL TEXT;
ALTER TABLE AEROPORTOS MODIFY COLUMN AEROP_LOCAL TIME;
ALTER TABLE AEROPORTOS CHANGE COLUMN AEROP_LOCAL AEROP_LOCALIDADE TIME;
ALTER TABLE AEROPORTOS DROP COLUMN AEROP_LOCALIDADE;

CREATE TABLE IF NOT EXISTS VOOS (
VOOS_ID INT PRIMARY KEY,
VOOS_DATA DATE NOT NULL,
VOOS_HORA TIME NOT NULL,
VOOS_AERONAVES INT NOT NULL,
VOOS_AEROPORTOS INT NOT NULL,
CONSTRAINT FK_AERONAVES FOREIGN KEY (VOOS_AERONAVES)
REFERENCES AERONAVES(AERON_PREFIXO),
CONSTRAINT FK_AEROPORTOS FOREIGN KEY (VOOS_AEROPORTOS)
REFERENCES AEROPORTOS(AEROP_COD)
);

ALTER TABLE VOOS ADD VOOS_HISTORICO CHAR(10);
ALTER TABLE VOOS MODIFY COLUMN VOOS_HISTORICO DATE;
ALTER TABLE VOOS CHANGE COLUMN VOOS_HISTORICO VOOS_HIST DATE;
ALTER TABLE VOOS DROP COLUMN VOOS_HIST;

CREATE TABLE IF NOT EXISTS FUNCIONARIOS(
FUNC_ID INT PRIMARY KEY,
FUNC_NOME VARCHAR(50) NOT NULL,
FUNC_DATANASC DATE NOT NULL,
FUNC_ENDERECO VARCHAR(50) NOT NULL,
FUNC_CPF INT NOT NULL,
FUNC_FUNCAO VARCHAR(20) NOT NULL
);

ALTER TABLE FUNCIONARIOS ADD FUNC_EMAIL TEXT;
ALTER TABLE FUNCIONARIOS MODIFY COLUMN FUNC_EMAIL VARCHAR(15);
ALTER TABLE FUNCIONARIOS CHANGE COLUMN FUNC_EMAIL FUNC_ENDERECOEMAIL VARCHAR(15);
ALTER TABLE FUNCIONARIOS DROP COLUMN FUNC_ENDERECOEMAIL;

CREATE TABLE IF NOT EXISTS RESERVAS(
RES_COD INT PRIMARY KEY,
RES_VOOS INT NOT NULL,
RES_PASS INT NOT NULL,
CONSTRAINT FK_VOOS FOREIGN KEY (RES_VOOS)
REFERENCES VOOS(VOOS_ID),
CONSTRAINT FK_PASSAGEIROS FOREIGN KEY (RES_PASS)
REFERENCES PASSAGEIROS(PASS_CPF)
);

ALTER TABLE RESERVAS ADD RES_NUM INT;
ALTER TABLE RESERVAS MODIFY COLUMN RES_NUM TEXT;
ALTER TABLE RESERVAS CHANGE COLUMN RES_NUM RES_NUMERO TEXT;
ALTER TABLE RESERVAS DROP COLUMN RES_NUMERO;

CREATE TABLE IF NOT EXISTS EQUIPES(
FCVO_FUNCIONARIOS INT,
FCVO_VOOS INT,
PRIMARY KEY(FCVO_FUNCIONARIOS, FCVO_VOOS),
CONSTRAINT FCVO_FK_FUNCIONARIOS FOREIGN KEY(FCVO_FUNCIONARIOS)
REFERENCES FUNCIONARIOS(FUNC_ID),
CONSTRAINT FCVO_FK_VOOS FOREIGN KEY(FCVO_VOOS)
REFERENCES VOOS(VOOS_ID)
);

ALTER TABLE EQUIPES ADD FCVO_COD CHAR(3);
ALTER TABLE EQUIPES MODIFY COLUMN FCVO_COD INT;
ALTER TABLE EQUIPES CHANGE COLUMN FCVO_COD FCVO_CODIGO INT;
ALTER TABLE EQUIPES DROP COLUMN FCVO_CODIGO;
