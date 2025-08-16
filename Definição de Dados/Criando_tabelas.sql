/*Aula 2 */

use informatica;

create table if not exists cliente(
id_cliente int primary key, /* pode se usar o auto_increment para adicionar automaticamente, não recomendado para grande volume de dados.*/
nome varchar(250) not null,
email varchar(100),
data_nascimento date,
limite_crédito decimal(10,2),
info_diferecial text,
cadastro_ativo boolean default 1,
id_produto int,
unique (email)
)
comment='Tabela para Clientes de Informatica';
/*foreign key(id_produto) references produto (id_produto) posso usar esse comando para fazer referencia de uma tabela para outra*/