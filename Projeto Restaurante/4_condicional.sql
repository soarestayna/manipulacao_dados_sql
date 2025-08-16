
use restaurante;

-- Selecione todos os pedidos que do id funcionário igual a 4 e status é igual a ‘Pendente’
select * from pedidos
where id_funcionario = 4 and status_pedido = 'Pendente';

-- Selecione todos os pedidos que o status não é igual a ‘Concluído'
select * from pedidos
where status_pedido != 'Concluído';

-- Selecione os pedidos que contenham os id produtos: 1, 3, 5, 7 ou 8
select * from pedidos
where id_produto in(1,3,5,7,8);

-- Selecione os clientes que começam com a letra c
select * from clientes
where nome_completo like 'C%';

-- Selecione as informações de produtos que contenham nos ingredientes ‘carne’ ou ‘frango’
select * from info_produtos
where ingredientes like '%carne%' or ingredientes like '%frango%';

-- Selecione os produtos com o preço entre 20 a 30
select * from produtos
where preço between 20 and 30;

-- Atualizar id pedido 6 da tabela pedidos para status = NULL
select * from pedidos;

update pedidos 
set status_pedido = null
where id_pedido = 6; 

-- Selecione os pedidos com status nulos
select * 
from pedidos
where status_pedido is null;

-- Selecionar o id pedido e o status da tabela pedidos, porém para todos os status nulos, mostrar 'Cancelado'
select id_pedido, status_pedido, ifnull(status_pedido, 'Cancelado') as status_pedido_atualizado from pedidos;

/* Selecione o nome, cargo, salário dos funcionários e adicione um campo chamado media_salario, 
que irá mostrar ‘Acima da média’, para o salário > 3000, senão 'Abaixo da média' */

select * from funcionarios;

select nome_completo, cargo, salario, if(salario > 3000, 'Acima da média', 'Abaixo da média') as media_salario
from funcionarios
order by media_salario desc;
