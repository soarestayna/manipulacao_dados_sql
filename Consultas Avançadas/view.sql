use loja_informatica;

select * from cliente limit 10;
select * from pedido limit 10;
select * from produto limit 20;

-- Criando view para simplificar ou restringir informações da tabela
create view cliente_simples as
select id_cliente, nome, email
from cliente;

-- Consultar View
select * from cliente_simples;

-- Visualizar a estrutura da View

-- Com o desc a estrutura será a mesma e não terá como saber que é uma view
desc cliente_simples;
desc cliente;

-- Com o show create dá para verificar se é uma tabela ou uma view
show create table cliente_simples;
show create table cliente;

/* A manipulação dos dados com view é igual a das tabelas*/

-- Atualizar a View
create or replace view cliente_simples as
select id_cliente, nome, cidade
from cliente;

select * from cliente_simples limit 10;

-- Deletar View

drop view cliente_simples;

-- View para calcular o total de pedidos feitos por cada cliente
create view cliente_pedido_total as
select c.nome, count(pe.id_pedido) as total_pedido
from cliente c
left join pedido pe on pe.id_cliente = c.id_cliente
group by c.nome;

select * from cliente_pedido_total;
select * from cliente_pedido_total where total_pedido > 20;


-- View para listar detalhes do cliente e total gasto
create view cliente_total_gasto as
select c.nome, c.email, sum(pr.preco * pe.quantidade) as total_gasto
from cliente c
join pedido pe on c.id_cliente = pe.id_cliente
join produto pr on pr.id_produto = pe.id_produto
group by c.nome, c.email;

select * from cliente_total_gasto where total_gasto > 50000;

-- Se na view não constar campos que unam tabelas não será possível realizar joins
-- Views são utilizadas para diminuir a complexidade das analises
-- Criar resumos de analises
-- Ocultar dados pessoas, filtrar dados que são relevantes

