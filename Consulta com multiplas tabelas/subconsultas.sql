-- SUBCONSULTAS/SUBQUERY

use loja_informatica;
select * from cliente limit 10;
select * from pedido limit 10;
select * from produto limit 20;

-- SUBCONSULTAS COM WHERE (o where é um filtro)

select nome
from cliente
where id_cliente in( select id_cliente from pedido); -- clientes que fizeram pedidos

select nome
from cliente
where id_cliente not in( select id_cliente from pedido); -- clientes que não fizeram pedidos

select distinct c.nome
from cliente c
join pedido p on c.id_cliente = p.id_cliente;
/* Dê preferencia para o join, pois ele terá um performance melhor do que uma subconsulta. */

select nome, email
from cliente
where id_cliente in ( select id_cliente from pedido where quantidade > 5);

-- SUBCONSULTAS SELECT (o select é um campo)

-- selecione(contando) a quantidade de pedidos por cliente
select nome,
	(select count(*) from pedido where pedido.id_cliente = cliente.id_cliente) as total_pedidos
from cliente;

select c.nome, c.email,
	(select sum(pe.quantidade * p.preco) -- somando a quantidade da tabela pedido com o preço da quantidade produto
    from pedido pe
    join produto p on pe.id_produto = p.id_produto -- como estou somando valores de tabelas diferentes, preciso usar o join para integralas 
    where pe.id_cliente = c.id_cliente) as total_pedido -- esse é um campo com valor total dos pedidos feito por clientes da tabela cliente
from cliente c 
order by total_pedido desc;

-- SUBCONSULTAS HAVING ( o having é uma condição/filtragem em cima de alguma agregação)
select categoria, avg(preco) as media_preco
from produto
group by categoria
having avg(preco) > (select avg(preco) from produto);
/* selecione categoria e média de preço dos produtos da tabela produto,
agrupe por categoria (é necessário, pois foi feito um cálculo), depois
filtre a média de preço de produtos que sejam maiores que a média de preço dos produtos*/
-- Nessa filtragem dá para usar o conceito 80/20, pois está visualizando os produtos que mais vendem, que tem um lucro maior.

-- SUBCONSULTAS FROM (from é a tabela)
select c.nome, pedidos_agregados.total_pedidos, pedidos_agregados.soma_quantidade
from cliente c
join (
		select id_cliente, count(*) as total_pedidos, sum(quantidade) as soma_quantidade
        from pedido
        group by id_cliente
) as pedidos_agregados on c.id_cliente = pedidos_agregados.id_cliente;
-- nessa consulta foi criada uma tabela modificada usando o campo id_cliente e contando e somando os pedidos


-- SUBCONSULTAS ORDER BY (só impacta na ordem dos dados)
select c.nome, c.email
from cliente c
order by (
			select sum(pe.quantidade * pr.preco)
            from pedido pe join produto pr on pe.id_produto = pr.id_produto
            where pe.id_cliente = c.id_cliente
)desc;
-- Nessa consulta, foi feito uma ordenação para encontrar os cliente que mais gastam nesse banco de dados

