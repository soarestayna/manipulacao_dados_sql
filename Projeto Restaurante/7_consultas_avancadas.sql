-- Projeto 

use restaurante;

-- Crie uma view chamada resumo_pedido

create view resumo_pedido as
	select 
		c.nome_completo as cliente,
        c.email,
        pe.id_pedido,
        pe.produto as quantidade,
        pe.data_pedido,
        fun.nome_completo as funcionario,
        pr.nome_produto as produto,
        pr.preço
	from 
		clientes c
    join pedidos pe on c.id_cliente = pe.id_cliente
    join produtos pr on pe.id_produto = pr.id_produto
    join funcionarios fun on pe.id_funcionario = fun.id_funcionario;
    
    select * from resumo_pedido;
    drop view resumo_pedido;
    -- Selecione o id do pedido, nome do cliente e o total de cada pedido da view resumo_pedido
    
    select 
		id_pedido,
		cliente,
        sum(quantidade * preço) as total_vendas
	from 
		resumo_pedido
    group by
		id_pedido, 
        cliente
	order by
		total_vendas desc;
        
-- Atualiza o view resumo pedido, adicionando campo total

create or replace view resumo_pedido as
	select 
		c.nome_completo as cliente,
        c.email,
        pe.id_pedido,
        pe.produto as quantidade,
        pe.data_pedido,
        fun.nome_completo as funcionario,
        pr.nome_produto as produto,
        pr.preço,
        sum(pe.produto * pr.preço) as total_vendas
	from 
		clientes c
    join pedidos pe on c.id_cliente = pe.id_cliente
    join produtos pr on pe.id_produto = pr.id_produto
    join funcionarios fun on pe.id_funcionario = fun.id_funcionario
	group by id_pedido;
    
select * from resumo_pedido;
    
-- Repita a consulta da questão 3, utilizando o campo total adicionado

select 
	id_pedido,
    cliente,
    total_vendas
from
	resumo_pedido
order by
	total_vendas desc;
    
-- Repita a consulta da pergunta anterior, com uso do EXPLAIN para verificar e compreender o JOIN que está oculto na nossa query
explain
select 
	id_pedido,
    cliente,
    total_vendas
from
	resumo_pedido
order by
	total_vendas desc;
    
/* Crie uma função chamada ‘BuscaIngredientesProduto’, que irá retornar os ingredientes da tabela 
info produtos, quando passar o id de produto como argumento (entrada) da função.*/

delimiter //
create function BuscarIngredientesProduto(produtoID int)
returns varchar(200)
reads sql data
begin
	declare
		BuscarIngredientes varchar(200);
    select 
		ingredientes
    into
		BuscarIngredientes
    from
		info_produtos
    where
		id_info = produtoID;
    return 
		BuscarIngredientes;
end //
delimiter ;

select BuscarIngredientesProduto(10);

/* Crie uma função chamada ‘mediaPedido’ que irá retornar uma mensagem dizendo que o total do pedido é acima, 
abaixo ou igual a média de todos os pedidos, quando passar o id do pedido como argumento da função */

delimiter //

create function MediaPedido(pedidoID int)
returns varchar(100)
reads sql data
begin

  declare 
	TotalPedido decimal(10, 2);
  declare 
	MediaTotal decimal(10, 2);
  declare 
	DesempenhoPedido varchar(100);
  select coalesce(
	sum(pe.produto * pr.preço), 0)
  into 
	TotalPedido
  from 
	pedidos pe
  join 
	produtos pr on pe.id_produto = pr.id_produto
  where 
	pe.id_pedido = pedidoID;

  select avg(sub.total) into MediaTotal
  from (
    select 
		sum(p.produto * pr.preço) as total
    from 
		pedidos p
    join 
		produtos pr on p.id_produto = pr.id_produto
    group by 
		p.id_pedido
  ) as sub;

  set DesempenhoPedido = case
    when TotalPedido = MediaTotal then 'Igual à média dos pedidos'
    when TotalPedido < MediaTotal then 'Abaixo da média dos pedidos'
    else 'Acima da média dos pedidos'
  end;

  return DesempenhoPedido;
end //

delimiter ;

select 
	id_pedido, 
	MediaPedido(id_pedido) as Desempenho 
from 
	pedidos;

select MediaPedido(5);
select MediaPedido(6);
    
    
    
