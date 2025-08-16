/*Aula 2 */

use informatica;
drop table cliente;

create table if not exists cliente(
id_cliente int auto_increment primary key, /* pode se usar o auto_increment para adicionar automaticamente, não recomendado para grande volume de dados.*/
nome varchar(250) not null,
email varchar(100),
data_nascimento date,
limite_credito decimal(10,2),
info_adicionais text,
cadastro_ativo boolean default true,
id_produto int,
unique (email)
/*foreign key(id_produto) references produto (id_produto) posso usar esse comando para fazer referencia de uma tabela para outra*/
)
comment='Tabela para Clientes de Informatica';

-- Selecionar Tabela
select * from cliente;

-- Inserir 1 registro
insert into	cliente (nome, email, data_nascimento, limite_credito) values
					('Tayna', 'tayna@email.com','1996-07-08', 8000.00);
                    
-- Inserir multiplos registros
insert into cliente (nome, email, data_nascimento, limite_credito) values
					('Nicolle', 'nicolle@email.com', '2015-07-03', 100.00),
                    ('Rodrigo', 'rodrigo@email.com', '1986-10-28', 10000.00);
                    
-- Inserindo registos sem espeficicar os campos
insert into cliente values (null, 'Gilson', 'gilson@email.com', '1975-09-18', 30000, null, true, 1);