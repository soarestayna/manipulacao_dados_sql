use loja_informatica;

select * from cliente limit 10;
select * from pedido limit 10;
select * from produto limit 20;

-- Procedimento armazenado para listar todos os clientes
create procedure Listarclientes()
	select * from cliente;
    
-- Chamar procedimentos
call Listarclientes();


-- Procedimento armazenado para inserir um novo dado
-- Utilizando o procedimento posso utiliza um conjunto de comandos

delimiter // 
-- estou inserindo um novo delimitador, pois precisarei utilizar ; no código abaixo
create procedure Adicionarpedido(
		in pedidoID int, 
        in clienteID int, 
        in produtoID int, 
        in qtd int, 
        in datapedido date
)
begin 
-- estou informando o inicio do meu código
	insert into pedido(id_pedido, id_cliente, id_produto, quantidade, data) 
    values (pedidoID, clienteID, produtoID, qtd, datapedido);
    insert into backup_pedido(id_pedido, ID_Cliente, ID_Produto, Quantidade, Data) 
    values (pedidoID, clienteID, produtoID, qtd, datapedido);
end // 
-- estou informando o fim do código 
delimiter ; 
-- Voltei para o delimitador ;

Call Adicionarpedido(201, 1, 2, 10, '2024-03-01');

select * from pedido where id_pedido = 201;
select * from backup_pedido where id_pedido = 201;


-- Procedimento armazenado para visualizar novos preços sem alterar a tabela produto e visualizar a quantidade de registros
-- Pode usar esse comando quando ficar uma promoção dos produtos e nesse caso os preços serão alterados por um tempo determinado

delimiter //
create procedure Promocaoprodutos (
	in desconto float,
    out total_produtos int
)
begin
	declare fator_desconto float;
    set fator_desconto = ( 1 - (desconto/100));
    -- declarei a variável é tipo float, float pois o desconto pode ficar com valor quebrado
    -- e fiz o set, informei que essa variável será aquela conta
    
    select count(*) into total_produtos
    from produto;
    
    select id_produto, nome, preco as preco_original, 
		   round(preco * fator_desconto, 2) as preco_com_desconto
	from produto;
end //
delimiter ;

call Promocaoprodutos (5, @total_produtos); -- Quando é uma variável de saída, obrigatoriamente você precisa colocar o @
select @total_produtos as total_produtos_alterados;

-- Mostrar todos os procedimento (que você criou)
show procedure status;

-- Deletar procedimentos
drop procedure if exists Adicionarpedido;




