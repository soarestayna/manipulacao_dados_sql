-- Agregação

use loja_informatica;

select * from cliente limit 20;
select * from produto limit 20;
select * from pedido limit 20;

select count(*) from pedido;
select count(quantidade) from pedido;
select count(id_pedido) from pedido;
select count(distinct id_cliente) from pedido; -- Conta somente os registros únicos 

select sum(quantidade) from pedido;
select avg(quantidade) from pedido; -- média

select max(preco) from produto;
select min(preco) from produto;

select var_pop(preco) from produto; -- Variância populacional = variance() para toda a coluna
select variance(preco) from produto; -- mesmo resultado
select var_samp(preco) from produto; -- variância amostral para uma parte dos seus dados

select stddev(preco) from produto; -- Desvio Padrão = STDDEV_POP(); Desvio Padrão Amostral = STDDEV_SAMP

select group_concat(quantidade) from pedido;
select group_concat(distinct quantidade) from pedido;

select nome,preco, rank() over (order by preco desc) as Ranking_preco from produto;
select nome,preco, row_number() over (order by preco desc) as Ranking_preco from produto;
select nome,preco, dense_rank() over (order by preco desc) as Ranking_preco from produto;
select distinct nome,preco, dense_rank() over (order by preco desc) as Ranking_preco from produto;

-- Agrupando resultados

select * from cliente limit 20;
select * from produto limit 20;
select * from pedido limit 20;

select sum(preco) as preco_total from produto;
select sum(preco) as preco_total from produto group by categoria;
select categoria, sum(preco) as preco_total from produto group by categoria;
select categoria, nome, sum(preco) as preco_total from produto group by categoria, nome order by categoria, nome;

select categoria, avg(preco) as media_preco from produto group by categoria;
select categoria, round(avg(preco),2) as media_preco from produto group by categoria order by categoria;

select
	distinct nome,
    preco, 
    dense_rank() over (order by preco desc) as Ranking_preco 
    from produto; -- troca categoria

select
	categoria,
    sum(preco) as preco_total,
    rank() over (order by sum(preco) desc) as Ranking_preco 
from 
	produto
group by 
	categoria;
    

-- Filtrando Agregações

select * from cliente limit 20;
select * from produto limit 20;
select * from pedido limit 20;

select categoria, count(*) from produto group by categoria;
select categoria, count(*) from produto group by categoria having count(*) > 10;

select categoria, count(*) from produto where categoria <> 'AcessÃ³rios' group by categoria;
select categoria, count(*) from produto where categoria <> 'AcessÃ³rios' group by categoria having count(*) > 10; -- essa forma é melhor

select categoria, count(*) from produto group by categoria having count(*) > 10 and categoria <> 'AcessÃ³rios';

-- Resolução de problema:
-- Identificar quais produtos foram vendidos mais de uma vez com erro (quantidade = 0)

select * from pedido where quantidade is null;

select 
	id_produto, 
	count(id_produto) 
from 
	pedido 
where 
	quantidade is null 
group by 
	id_produto 
having 
	count(id_produto) > 1;