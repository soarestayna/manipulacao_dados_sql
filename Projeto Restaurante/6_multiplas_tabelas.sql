use restaurante;

select * from clientes limit 10;
select * from funcionarios limit 10;
select * from pedidos limit 10;
select * from produtos limit 10;
select * from info_produtos limit 10;

select pr.id_produto, pr.nome_produto, pr.descriçao, info.ingredientes
from produtos pr
join info_produtos info on pr.id_produto = info.id_produto;

select pe.id_pedido, pe.produto, pe.data_pedido, c.nome_completo, c.email
from pedidos pe
join clientes c on c.id_cliente = pe.id_cliente;

select pe.id_pedido, pe.produto, pe.data_pedido, c.nome_completo, c.email, f.nome_completo
from pedidos pe 
join clientes c on c.id_cliente = pe.id_cliente
join funcionarios f on f.id_funcionario = pe.id_funcionario;

select pe.id_pedido, pe.produto, pe.data_pedido, c.nome_completo, c.email, f.nome_completo, pr.nome_produto, pr.preço
from pedidos pe
join clientes c on c.id_cliente = pe.id_cliente
join funcionarios f on f.id_funcionario = pe.id_funcionario
join produtos pr on pr.id_produto = pe.id_produto;


-- Selecionar o nome dos clientes com os pedidos com status ‘Pendente’ e exibir por ordem descendente de acordo com o id do pedido

select c.nome_completo, pe.status_pedido, pe.id_pedido
from clientes c
join pedidos pe on pe.id_cliente = c.id_cliente
where status_pedido = "Pendente"
order by pe.id_pedido desc;


-- Selecionar clientes sem pedidos

select c.nome_completo, pe.produto
from clientes c
left join pedidos pe on pe.id_cliente = c.id_cliente
where pe.produto is null;

-- Selecionar o nome do cliente e o total de pedidos cada cliente

select c.nome_completo, count(pe.produto) as total_pedido
from clientes c
join pedidos pe on c.id_cliente = pe.id_cliente
group by nome_completo
order by total_pedido desc;


-- Selecionar o preço total (quantidade*preco) de cada pedido

select c.nome_completo, sum(pe.produto * pe.preço) as soma_pedido
from clientes c
join pedidos pe on c.id_cliente = pe.id_cliente
group by nome_completo
order by soma_pedido desc;


	