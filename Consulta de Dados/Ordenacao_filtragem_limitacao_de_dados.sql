use informatica;

-- Filtrar por campo numérico
select nome, limite_credito 
from cliente
where limite_credito > 5000;

-- Filtrar por campo texto
select nome, limite_credito 
from cliente
where nome = 'João';

select nome, limite_credito 
from cliente
where nome like 'Jo%';

-- Filtrar por campo boleano
select nome, email 
from cliente 
where cadastro_ativo = True; -- 0 = False, 1 = True

-- Filtrar por campo de data
select nome, data_nascimento
from cliente
where data_nascimento > '1990-01-01'; -- AAAA-MM-DD

select nome, data_nascimento
from cliente
where year(data_nascimento) > 1990 ; -- year, month, day

select * from cliente;


-- Ordenação

-- Ordenar por ordem ascendente 
select nome from cliente order by nome; -- De forma ascendente, posso colocar asc depois da coluna também
select nome from cliente order by nome desc; -- De forma descrescente

-- Ordenar por ordem decrescente 
select nome, data_nascimento 
from cliente
order by data_nascimento desc;

-- Ordenar por mais de um campo
select nome, limite_credito
from cliente
order by limite_credito desc, nome asc;

-- Limitação

-- Selecionar um registro (Boa Prática)
select * from cliente limit 1;

-- Selecionar os 3 cliente com mais limite de crédito
select nome, limite_credito
from cliente
order by limite_credito desc limit 3;

-- Pular os 3 primeiros registros e selecionar os 2 próximos
select nome
from cliente
order by nome limit 2 offset 3;