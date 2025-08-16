use restaurante;

-- Calcule a quantidade de pedidos
select count(*) from pedidos;

-- Calcule a quantidade de clientes únicos que realizaram pedidos
select count(distinct id_cliente) as Clientes from pedidos;

-- Calcule a média de preço dos produtos
select round(avg(preço), 2) as Media_preco from produtos;

-- Calcule o mínimo e máximo do preço dos produtos

select max(preço) from produtos; 
select min(preço) from produtos; 

-- Selecione o nome e o preço do produto e faça um rank dos 5 produtos mais caros
select nome_produto, preço, rank() over (order by preço desc) as ranking_preco from produtos limit 5;

-- Selecione a média dos preços dos produtos agrupados por categoria

select categoria, round(avg(preço), 2) as media_preco from produtos group by categoria;

-- Selecionar o fornecedor e a quantidade de produtos que vieram daquele fornecedor da informações de produtos
select fornecedor, count(ingredientes) as qtd_produtos from info_produtos group by fornecedor;

-- Selecionar os fornecedores que possuem mais de um produto cadastrado
select fornecedor, count(ingredientes) as qtd_produtos from info_produtos group by fornecedor having count(ingredientes) > 1;

-- Selecionar os clientes que realizaram apenas 1 pedido
select * from pedidos;
select id_cliente, count(id_pedido) from pedidos group by id_cliente having count(id_pedido) = 1;