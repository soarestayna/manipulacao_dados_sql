/* Boas praticas

Para melhorar o código há três pilares essenciais:

- Manutenção do Código
O código que estou fazendo outra pessoa vai conseguir mexer nele ou até eu mesma vou conseguir entende ele no futuro?

- Performance do Código
O código está tendo uma boa performance, está rodando rápido, está funcionando de forma adequada?

- Legibilidade do Código
Quando as pessoas pegarem a sua consulta, elas vão conseguir entender?

Mantenha o cógido legivél, bem estruturado, simples e com observações se necessário.*/

use loja_informatica;

-- Utilizar Alias simples e fácil de entender

select 
	pe.id_pedido, 
    c.nome as nome_cliente, 
    pr.nome as nome_produto, 
    round(coalesce(pe.quantidade * pr.preco, 0),2) as valor_total
from cliente c
join pedido pe on pe.id_cliente = c.id_cliente
join produto pr on pr.id_produto = pe.id_produto;

-- Evitar o uso do SELECT*

select nome, email from cliente;
select
	c.nome,
    c.email
from
	cliente c;
    
-- Usar EXPLAIN para otimizar consultas e indices
-- O explain, explica a visualização do código, nela você pode verificar qual código performa melhor.

explain
select c.nome, c.email,
	(select sum(pe.quantidade * pr.preco)
     from pedido pe
     join produto pr on pe.id_produto = pr.id_produto
     where pe.id_cliente = c.id_cliente) as total_pedido
from 
	cliente c
order by 
	total_pedido desc;
/* dá para verfifcar o seu tipo de seleção, no caso acima, os tipos são primário(tabela cliente)
e subquery(dá tabela pedido e produto), se o dado é parcionado, tipo, no primeiro é ALL, pois ele está
fazendo uma busca em todos os dados, está buscando o ref(a referência da tabela pedido, o índice), e 
eq_ref que são índices únicos da minha consulta. 
Mostra também as chaves, mostra a referencia das tabelas cliente são está buscando referencia em nenhuma, 
pois não tem join nela, a tabela pedido está buscando referência na tabela cliente e a tabela
produto está buscando referência na tabela pedido.
lê as linhas, mostra os filtros, como não tem filtro ele está lendo 100% das linhas e extras.
quando tiver subquery no tipo de tabela é melhor evitar o código*/

explain
select 
	c.nome, 
    c.email,
    sum(pe.quantidade * pr.preco) as total_vendas
from 
	cliente c
join
	pedido pe
on 
	pe.id_cliente = c.id_cliente
join
	produto pr
on
	pr.id_produto = pe.id_produto
group by
	c.id_cliente, 
    c.nome,
    c.email
order by
	total_vendas desc;
    
create index idx_pedido_produto on pedido(id_produto); -- criação de índice
drop index idx_pedido_produto on pedido; -- deletar índice

-- Evitar funções em colunas de where
select * from pedido where month(data) = 1; -- Ineficiente
select * from pedido where data between '2023-01-01' and '2023-01-31'; -- Eficiente

-- Uso de transações para garantir a integridade e confiabilidade dos dados(mais utilizado em Engenharia de Dados)

-- Iniciar transação 
start transaction;

insert into 
	cliente (id_cliente, nome, email, cidade)
values
	(101, 'Rodrigo Augusto', 'rodrigo.augusto@email.com', 'São José dos Campos');
insert into
	pedido (id_pedido, id_cliente, id_produto, quantidade, data)
values 
	(203, 101, 7, 3, '2023-11-27');
    
-- Confirmar as operações
commit;
-- Reverter as operações
rollback;

select * from cliente where id_cliente = '101';
select * from pedido where id_pedido = '203';
	
-- Inserir dados com o transaction é útil, pois caso algum dado esteja errado é possível reverter com o rollback. 
-- Depois que inserir os dados, use o commit para confirmar, após confirmar não será mais possível reverter com o rollback

