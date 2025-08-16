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

use informatica;

select * from cliente;

-- Atualizar um campo
update cliente
set email = 'tayna_novo@email.com'
where id_cliente = 1;

-- Atualizar multiplos campos
update cliente
set data_nascimento = '2005-07-03' , limite_credito = 5000
where id_cliente = 2;

-- Atualizar com operadores Matemáticos
update cliente
set limite_credito = limite_credito + 700
where id_cliente = 3;

insert into cliente (nome, data_nascimento, limite_credito) values
					('Simone', '1972-09-28', 1000);
                    
-- Atualizar com condições complexas
-- Esses comandos vão fazer com que o cadastro se torne inativo se o cliente tiver nascido antes ou até 1975 e tenha limite inferior ou até 1000
update cliente
set cadastro_ativo = FALSE
where limite_credito <= 1000 and data_nascimento <= '1975-01-01';

-- O MySQL dará erro informando que esse comando pode fazer grandes alterações no banco de dados
-- Para reverter esse aviso, você pode colocar o comando abaixo

SET SQL_SAFE_UPDATES = 0;

-- Atualizar todos os registros de uma coluna
update cliente
set info_adicionais = 'Revisão de Cadastro';