-- INNER JOIN 

use loja_informatica;

select * from cliente limit 20;
select * from pedido limit 20;
select * from produto limit 20;

-- inner join entre cliente e pedido

select cliente.nome, cliente.email, pedido.id_pedido -- é importante colocar o nome da tabela que você quer que corresponda a coluna que quer abrir
from cliente
inner join pedido
on cliente.id_cliente = pedido.id_cliente;

-- inner join entre pedido e produto

select pedido.id_pedido, produto.nome, produto.preco, pedido.quantidade
from pedido
join produto
on pedido.id_produto = produto.id_produto -- on é o campo que faz a ligação entre as tabelas
order by preco desc, pedido.quantidade desc;

-- inner join entre cliente, produto e pedido

select cliente.nome as cliente, produto.nome as produto, produto.preco, pedido.quantidade, pedido.data
from cliente
join pedido on cliente.id_cliente = pedido.id_cliente
join produto on produto.id_produto = pedido.id_produto;

-- abreviação para tabelas

select c.nome as cliente, p.nome as produto, p.preco, pe.quantidade,p.preco * pe.quantidade as valor_total,  pe.data
from cliente c
join pedido pe on c.id_cliente = pe.id_cliente
join produto p on p.id_produto = pe.id_produto;


select c.nome as cliente, p.nome as produto, p.preco, pe.quantidade,p.preco * pe.quantidade as valor_total,  pe.data
from cliente c
join pedido pe on c.id_cliente = pe.id_cliente
join produto p on p.id_produto = pe.id_produto
where p.preco > 1000
group by p.preco, p.nome, valor_total, c.nome, pe.quantidade, pe.data
order by valor_total desc;


-- OUTER JOIN

use loja_informatica;

select * from cliente limit 10;
select * from pedido limit 10;
select * from produto limit 20;

select c.nome, pe.id_pedido
from cliente c 
inner join pedido pe on c.id_cliente = pe.id_cliente; 
/* Foi relacionado a tabela cliente com a tabela pedido onde teria que haver uma coluna que fosse igual, nesse caso 
a coluna é a id_cliente que foi relacionado através da chave estrangeira (foreign key).*/

-- LEFT OUTER JOIN: Visualiza toda a tabela a esquerda (nesse caso a tabela cliente), incluindo aqueles sem pedidos (mesmo que a direita esteja nulo)
-- Left join é mais utilizado, pois é mais fácil entender que o que você quer visualizar vem primeiro na correspondência
select c.nome, pe.id_pedido
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente;

-- RIGHT OUTER JOIN: Visualiza toda a tabela a direita (nesse caso a tabela pedido), incluindo aqueles sem clientes
select c.nome, pe.id_pedido
from cliente c
right join pedido pe on c.id_cliente = pe.id_cliente;

-- LEFT OUTER JOIN: Visualizar clientes sem pedido

select c.* , pe.*-- com o * vai visualizar toda a tabela
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
where pe.id_pedido is null;

-- LEFT OUTER JOIN: Visualizar todos os pedidos, clientes e produtos, incluindo aqueles que estão nulos.
select c.nome, pe.id_pedido, p.nome as produto
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
left join produto p on pe.id_produto = p.id_produto;

-- Calcula o total gasto por cada cliente em seus pedidos
select c.nome, sum(p.preco * pe.quantidade) as total_gasto
from cliente c
join pedido pe on c.id_cliente = pe.id_cliente
join produto p on pe.id_produto = p.id_produto
group by c.nome;

-- Visualiza quais clientes não gastaram em seus pedidos (erro)
select c.nome, sum(p.preco * pe.quantidade) as total_gasto
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
left join produto p on pe.id_produto = p.id_produto
where p.preco is null
group by c.nome;

-- FULL JOIN

select c.nome, pe.id_pedido
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
where pe.id_pedido is null
union
select c.nome, pe.id_pedido
from cliente c
right join pedido pe on c.id_cliente = pe.id_cliente
where c.id_cliente is null;
/*No MYSQL a função FULL JOIN não funciona, por isso é necessário juntar as funções 
left e right join, para que seja possível ver essa união completa, no caso acima está 
sendo visto todos o pedidos e cliente que são nulos dentro das tabelas selecionadas, 
em baixo está sendo visto toda a */

select c.nome as clientes, p.nome as produtos, pe.quantidade
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
left join produto p on pe.id_produto = p.id_produto
union
select c.nome as clientes, p.nome as produtos, pe.quantidade
from cliente c
right join pedido pe on c.id_cliente = pe.id_cliente
right join produto p on pe.id_produto = p.id_produto;
-- Porém pode ser muito custoso esse tipo de operação dependendo da tabela.

-- NATURAL JOIN, não recomendado, pois ele faz uma união automatica, então vai excluir dados que são iguais
select *
from pedido
natural join produto;

-- SELF JOIN

-- Comparar clientes dentro da mesma cidade, excluindo comparações do mesmo cliente

select
	c1.nome as Cliente1,
    c2.nome as Cliente2,
    c1.cidade as Cidade_Comum
from
	cliente c1
join
	cliente c2 on c1.cidade = c2.cidade and c1.id_cliente != c2.id_cliente
order by
	c1.cidade, c1.nome, c2.nome;
