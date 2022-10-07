-- Active: 1664398445942@@127.0.0.1@5433@jiyrzzup@public
-- Exercicio: União, Intersecção, Subtração e Produto Cartesiano.
-- 1)

-- a)
SELECT nome as "Nome do empregado" FROM empregado;

-- b)
SELECT nome_dependente as "Nomes do dependentes" FROM dependente;
-- c)
(SELECT nome AS "Nomes" FROM empregado)UNION(SELECT nome_dependente FROM dependente);

