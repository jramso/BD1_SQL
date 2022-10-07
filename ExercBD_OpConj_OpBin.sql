-- Active: 1664398445942@@127.0.0.1@5433@jiyrzzup@public

-- Exercicio: União, Intersecção, Subtração e Produto Cartesiano.
-- 1)

-- a)
SELECT nome as "Nome do empregado" 
FROM empregado;

-- b)
SELECT nome_dependente as "Nomes do dependentes" 
FROM dependente;
-- c)
(SELECT nome as "Nomes" 
FROM empregado)
UNION
(SELECT nome_dependente 
FROM dependente)ORDER BY "Nomes";

-- 2)

(SELECT rg FROM empregado as e)
INTERSECT
(SELECT rg_responsavel FROM dependente) ORDER BY rg;

-- 3)
(SELECT numero FROM departamento)
EXCEPT
(SELECT numero_depto FROM departamento_projeto);

-- 4)

SELECT e.rg as "RG", e.nome as "Nome do Funcionario", p.nome as "Nome do projeto" 
from empregado as e, projeto as p;

/*
 Exercícios - junção
*/
-- 1)
SELECT * FROM departamento_projeto as dp 
INNER JOIN projeto as pj 
on(dp.numero_projeto=pj.numero) 
ORDER BY pj.nome;

-- 2)
SELECT emp.nome AS "Nome do Empregado",  pj.nome AS "Nome do projeto"
FROM empregado as emp 
INNER JOIN empregado_projeto AS ep 
ON(emp.rg=ep.rg_empregado)
INNER JOIN projeto as pj
On(pj.numero=ep.numero_projeto);

-- 3)

SELECT emp.nome AS "Funcionario",  pj.nome AS "Projeto", ep.horas AS "Horas trabalhadas"
FROM empregado as emp 
INNER JOIN empregado_projeto AS ep 
ON(emp.rg=ep.rg_empregado)
INNER JOIN projeto as pj
On(pj.numero=ep.numero_projeto);

-- 4)

SELECT dep.codigo as "ID", emp.nome as "Empregado", dep.nome_dependente as "Dependente", dep.relacao as "Relacionamento"
FROM dependente AS dep
INNER JOIN empregado as emp
ON(dep.rg_responsavel=emp.rg)
ORDER BY emp.nome;

-- 5)

SELECT emp.nome,Cast(hs.dat_ini_sal as Date),Cast(hs.data_fim_sal as date),hs.salario
FROM empregado AS emp
INNER JOIN historico_salario As hs
on(emp.rg=hs.rg);

-- 6)

SELECT emp.nome AS "Funcionario",  pj.nome AS "Projeto", ep.horas AS "Horas trabalhadas"
FROM empregado as emp 
INNER JOIN empregado_projeto AS ep 
ON(emp.rg=ep.rg_empregado)
INNER JOIN projeto as pj
On(pj.numero=ep.numero_projeto) where pj.nome='Financeiro';


-- 7)
SELECT emp.*,hs.*, dep.nome
FROM empregado AS emp
INNER JOIN historico_salario As hs
on(emp.rg=hs.rg)
INNER JOIN departamento as dep
on(emp.depto=dep.numero);

-- 8)
SELECT emp.*,Cast(hs.dat_ini_sal as Date)as "data inicial",Cast(hs.data_fim_sal as date) as "data final",hs.salario as "valor do salario"
,dep.nome as "departamento"
FROM empregado AS emp
INNER JOIN historico_salario As hs
on(emp.rg=hs.rg)
INNER JOIN departamento as dep
on(emp.depto=dep.numero) 
WHERE hs.salario>2500
ORDER by hs.salario DESC;

-- 9)
-- sem histórico do luiz em historico_salario
SELECT emp.*,Cast(hs.dat_ini_sal as Date)as "data inicial",Cast(hs.data_fim_sal as date) as "data final",hs.salario as "valor do salario"
,dep.nome as "departamento", pj.nome as "Projetos"
FROM empregado AS emp
INNER JOIN historico_salario As hs
on(emp.rg=hs.rg)
INNER JOIN departamento as dep
on(emp.depto=dep.numero)
INNER join departamento_projeto as dpj
on(dpj.numero_depto=dep.numero)
inner join projeto as pj
ON(pj.numero=dpj.numero_projeto)
WHERE hs.salario>2000
ORDER by hs.salario DESC;

-- 10)
SELECT emp.nome,Cast(hs.dat_ini_sal as Date)as "data inicial",Cast(hs.data_fim_sal as date) as "data final",hs.salario as "valor do salario"
,dep.nome as "departamento", pj.nome as "Projetos"
FROM empregado AS emp
INNER JOIN dependente as d 
ON(d.rg_responsavel=emp.rg)
INNER JOIN historico_salario As hs
on(emp.rg=hs.rg)
INNER JOIN departamento as dep
on(emp.depto=dep.numero)
INNER join departamento_projeto as dpj
on(dpj.numero_depto=dep.numero)
inner join projeto as pj
ON(pj.numero=dpj.numero_projeto)
WHERE hs.salario>2000 AND hs.salario<400 and d.sexo='F' 
ORDER by hs.salario DESC;
