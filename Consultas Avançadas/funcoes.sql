use loja_informatica;

select * from cliente limit 10;
select * from pedido limit 10;
select * from produto limit 20;

-- Função para retornar o nome de um cliente com base no seu ID

delimiter //
create function BuscarClienteNome(idcliente int) -- criar função com uma variável inteira 
returns varchar(200) -- retornar um varchar (nesse caso o nome)
reads sql data -- vai fazer só a leitura dos dados
begin 
	declare nomeCliente varchar(200);
    select nome into nomeCliente from cliente where id_cliente = idcliente;
    return nomeCliente;
    -- é necessário declarar a variável, caso contrário resultará em erro
end //
delimiter ;

-- Usar a função em uma consulta

select BuscarClienteNome(76); -- nesse caso não é necessário colocar from tabela, pois essa função já faz parte da tabela

-- Função para calcular o total de vendas de um produto

delimiter //
create function TotalVendas(produtoID int)
returns decimal(10, 2)
reads sql data
begin
	declare total decimal(10, 2);
    select sum(preco * quantidade) into total
    from pedido
    join produto on produto.id_produto = pedido.id_produto
    where produto.id_produto = produtoID;
    return total;
end //
delimiter ;

select nome, TotalVendas(id_produto) as total_vendas from produto;


-- Função para classificar o desempenho de vendas de um produto

delimiter //
create function ClassificacaoDesempenhoVendas(produtoID int)
returns varchar(100)
reads sql data
begin
	declare totalvendas decimal(10, 2);
    declare desempenho varchar(100);
    
    select coalesce(sum(preco * quantidade), 0) into totalvendas
    from produto
    left join pedido on produto.id_produto = pedido.id_produto
    where produto.id_produto = produtoID;
    
    set desempenho =
		case
			when totalvendas = 0 then 'Sem Vendas'
			when totalvendas <= 1000 then 'Baixo'
			when totalvendas <= 5000 then 'Médio'
			else 'Alto'
		end;
    return desempenho;

end //
delimiter ;
-- coalesce é para mostrar valores nulos, nesse caso está mostrando valores nulos como 0
select nome, ClassificacaoDesempenhoVendas(id_produto) as desempenho_vendas from produto;


-- Função para calcular desconto em cima de um valor de produto

delimiter //
create function CalcularDesconto(valor decimal(10, 2), percentualDesconto decimal(5, 2))
returns decimal(10, 2)
no sql
begin
	declare resultado decimal(10, 2);
    set resultado = valor - (valor *(percentualDesconto / 100));
    return resultado;
end //
delimiter ;

select CalcularDesconto(150.00, 5) as ValorcomDesconto;

-- Mostrar todas as funções
show function status;

-- Deletar função

drop function CalcularDesconto;
    
    