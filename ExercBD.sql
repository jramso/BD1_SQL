-- Active: 1664398445942@@127.0.0.1@5433@jiyrzzup@public


drop table empregado;
drop table departamento_projeto;

drop table empregado;

CREATE TABLE PROJETO(
	numero integer PRIMARY KEY,
	nome varchar(100),
	localizacao varchar(150)
);
CREATE TABLE departamento(
	numero integer NOT NULL,
	nome VARCHAR(150),
	rg_gerente INTEGER UNIQUE,
	PRIMARY KEY (numero)
);
CREATE TABLE Departamento_projeto(
	codigo integer NOT NULL PRIMARY KEY,
	numero_depto integer,
	numero_projeto INTEGER,
    Foreign Key (numero_depto) REFERENCES departamento(numero),
    Foreign Key (numero_projeto) REFERENCES projeto(numero)
);
CREATE TABLE EMPREGADO(
	rg integer NOT NULL PRIMARY KEY,
	nome varchar(150),
	cpf varchar(15),
	depto integer,
	rg_supervisor INTEGER,
	salario float,
	dat_inic_sal date,
	foreign key (rg_supervisor) REFERENCES departamento(rg_gerente),
    Foreign Key (depto) REFERENCES departamento(numero)
);
CREATE TABLE Empregado_projeto(
	codigo integer NOT NULL PRIMARY KEY,
	rg_empregado INTEGER,
	numero_projeto integer,
	horas timestamp,
    FOREIGN Key (rg_empregado) REFERENCES empregado(rg),
    FOREIGN KEY (numero_projeto) REFERENCES projeto(numero)
);
CREATE TABLE DEPENDENTE(
	codigo integer,
	rg_responsavel INTEGER,
	nome_dependente  varchar(150),
	nascimento date,
	relacao varchar(50),
	sexo varchar(15),
    Foreign Key (rg_responsavel) REFERENCES empregado(rg)
);
CREATE TABLE Historico_salario(
	rg integer NOT NULL,
	dat_ini_sal timestamp,
	data_fim_sal timestamp,
	salario float,
    Foreign Key (rg) REFERENCES empregado(rg)
);
