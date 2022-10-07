-- Active: 1664398445942@@127.0.0.1@5433@jiyrzzup@public

-- INSERTS
insert into projeto values
(5,'Financeiro','São Paulo'),
(10,'Motor','Rio Claro'),
(12,'Prédio Inovação','Serra'),
(20,'Prédio Central','Campinas'),
(25,'Águas Limpas','Vitória');

insert into empregado values
(1010,'João Luiz',11111,1,null,6000.00,'2011-05-01'),
(2020,'Fernanda',22222,1,1010,5500.00,'2008-12-01'),
(3030,'Ricardo',33333,2,2020,2300.00,'2009-08-01'),
(4040,'Jorge',44444,2,3030,3200.00,'2010-10-01'),
(5050,'Renata',55555,2,3030,1300.00,'2012-02-01'),
(6060,'Luiz Renato',66666,3,2020,3000.00,'2012-05-01'),
(7070,'Luiz Fernando',77777,3,6060,2000.00,'2008-08-01'),
(8080,'João Antonio',88888,1,2020,3950.00,'2010-07-01');

insert into departamento values
(1,'Contabilidade',1010),
(2,'Engenharia Civil',3030),
(3,'Engenharia Mecânica',2020),
(4,'Industrial',null);
-- ALTER NECESSARIO
alter table departamento ADD CONSTRAINT FK_empregado FOREIGN KEY (rg_gerente) REFERENCES empregado(rg);
alter table empregado_projeto ADD COLUMN horas INTEGER;

insert into empregado_projeto values
(1,2020,5,10),
(2,2020,10,25),
(3,3030,5,35),
(4,4040,20,35),
(5,5050,20,35),
(6,8080,5,70);

insert into departamento_projeto VALUES
(1,2,5),
(2,3,10),
(3,2,20);

insert into dependente VALUES
(1,1010,'Jorge','1986-12-27','Filho','M'),
(2,1010,'Luiz','1979-11-18','Filho','M'),
(3,2020,'Fernanda Carla','1969-02-14','Cônjuge','F'),
(4,2020,'Ângelo','1995-02-10','Filho','M'),
(5,3030,'André','1990-05-01','Filho','M'),
(6,8080,'Ana Maria','1980-06-30','Cônjuge','F'),
(7,8080,'Karla Cristina','1999-08-25','Filha','F');

insert into historico_salario VALUES
(1010,'2010-01-01','2010-11-30',2000.00),
(1010,'2010-12-01','2011-04-30',4000.00),
(2020,'2007-05-01','2007-12-31',2500.00),
(2020,'2008-01-01','2010-11-30',4000.00),
(4040,'2008-08-01','2009-10-31',1500.00),
(4040,'2009-11-01','2010-09-30',2500.00),
(4040,'2010-10-01','2012-10-31',3500.00),
(7070,'2008-01-01','2008-07-31',1000.00);

-- Exercícios de seleção
-- 1)
SELECT * 
from projeto;
-- 2)
SELECT nome,localizacao,numero 
from projeto;
-- 3)
SELECT * 
from projeto 
where localizacao='Vitória'; 
-- 4)
SELECT nome, numero
FROM projeto
WHERE localizacao='Vitória';
--5)
SELECT *
FROM projeto
WHERE numero>10;
--6)
SELECT *
FROM empregado
WHERE salario>3000;
--7)
SELECT *
FROM empregado
WHERE rg_supervisor='1010';
--8)
SELECT *
FROM empregado
WHERE rg_supervisor='1010';
--9)
SELECT *
FROM historico_salario
WHERE rg='4040';
--10)
SELECT *
FROM empregado
WHERE rg_supervisor<'2020';
--11)
SELECT *
FROM projeto
WHERE numero>='10';
--12)
SELECT rg,nome
FROM empregado
WHERE rg_supervisor<='2020';
--13)
SELECT *
FROM empregado
WHERE rg_supervisor IS NULL;
--14)
SELECT *
FROM empregado
WHERE rg_supervisor IS NOT NULL;
--15)
SELECT *
FROM empregado
WHERE depto!=2;
--16)
SELECT nome,cpf
FROM empregado
WHERE depto=2;
--17)
SELECT nome,cpf
FROM empregado
WHERE depto=1;
--18)
SELECT nome
FROM empregado
WHERE salario>5500;
--19)
SELECT nome,salario
FROM empregado
WHERE salario>3500;
--20)
SELECT *
FROM empregado
WHERE dat_inic_sal>'2012-02-01';
--21)
SELECT nome
FROM empregado
WHERE dat_inic_sal>='2012-05-01';
--22)
SELECT cpf
FROM empregado
WHERE dat_inic_sal>='2012-05-01';
--23)
SELECT *
FROM dependente
WHERE nascimento>'1990-06-01';
--24)
SELECT nome_dependente,sexo
FROM dependente
WHERE relacao='Filho';


-- Exercícios de Manipulação: inclusão, alteração e exclusão
--1
CREATE TABLE departamento_projeto2
AS SELECT * from departamento_projeto;

CREATE Table projeto2
as select * from projeto;

create table empregado2
as select * from empregado;

create table departamento2
as select * from departamento;

--2)
-- PROJETO2
--a),b)
INSERT into projeto2 VALUES
(50,'Ginásio de Esportes','Serra'),
(51,'Teatro','Vitória');
--c)
UPDATE projeto2 SET nome='Aguas Claras'
WHERE numero=25;
--d)
UPDATE projeto2 SET nome='Águas Limpas '
WHERE numero=25;
--e)
UPDATE projeto2 SET localizacao='Serra'
WHERE numero=10;
--f)
DELETE FROM projeto2
WHERE numero=50;

-- DEPARTAMENTO_PROJETO2

--a)

DELETE FROM departamento_projeto2;

--b)
insert into departamento_projeto2
SELECT * from departamento_projeto;
-- TABELAS_CRIADAS ANTERIORMENTE:
-- a)
drop table DEPARTAMENTO_PROJETO2, PROJETO2, EMPREGADO2, DEPARTAMENTO2;
--FIM SQL.