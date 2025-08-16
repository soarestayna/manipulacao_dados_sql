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
