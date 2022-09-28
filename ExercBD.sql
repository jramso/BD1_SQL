-- Active: 1664398445942@@127.0.0.1@5433@jiyrzzup@public


CREATE TABLE PROJETO(
	numero integer PRIMARY KEY,
	nome varchar(100),
	localizacao varchar(150)
);

CREATE TABLE EMPREGADO(
	rg integer NOT NULL PRIMARY KEY,
	nome varchar(150),
	cpf varchar(15),
	depto varchar(150),
	rg_surpevisor varchar(10),
	salario float,
	dat_inic_sal date
	foreign key (rg_supervisor) referenceres
);


CREATE TABLE departamento
(
	numero integer NOT NULL,
	nome VARCHAR(150),
	rg_gerente INTEGER,
	PRIMARY KEY (numero)
);

CREATE TABLE DEPENDENTE(
	codigo integer,
	rg_responsavel varchar(10),
	nome_dependente  varchar(150),
	nascimento date,
	relacao varchar(50),
	sexo varchar(15)
);

CREATE TABLE Empregado_projeto(
	codigo integer NOT NULL PRIMARY KEY,
	rg_empregado varchar(10),
	numero_projeto integer,
	horas timestamp
);


CREATE TABLE Departamento_projeto(
	codigo integer NOT NULL PRIMARY KEY,
	numero_depto integer,
	numero_projeto INTEGER,
    Foreign Key (numero_depto) REFERENCES departamento(numero),
    Foreign Key (numero_projeto) REFERENCES projeto(numero)
);

CREATE TABLE Historico_salario(
	rg integer NOT NULL PRIMARY KEY,
	dat_ini_sal timestamp,
	data_fim_sal timestamp,
	salario float
);
