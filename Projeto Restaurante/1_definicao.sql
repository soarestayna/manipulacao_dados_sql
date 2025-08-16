/* Projeto Restaurante do módulo 10*/

create database Restaurante;

use Restaurante;
create table funcionarios(
id_funcionario int auto_increment primary key,
nome_completo varchar(255) not null,
cpf varchar(14) unique,
data_nascimento date,
endereço varchar(255),
telefone varchar(15),
email varchar(100) unique,
cargo varchar(100),
salario decimal(10,2),
data_admissao date
);

create table clientes(
id_cliente int auto_increment primary key,
nome_completo varchar(255),
cpf varchar(14) unique,
data_nascimento date,
endereço varchar(255),
telefone varchar(15) unique,
email varchar(100) unique,
data_cadastro date
);

create table produtos(
id_produto int auto_increment primary key,
nome_produto varchar(255),
descriçao text,
preço decimal(10,2),
categoria varchar(100)
)
comment='Exemplos de categoria do produto: bebida, entrada, prato principal, sobremesa';

create table pedidos(
id_pedido int auto_increment primary key,
id_cliente int,
id_funcionario int,
id_produto int,
produto int,
preço decimal(10,2),
data_pedido date,
status_pedido varchar(50),
foreign key(id_cliente) references clientes(id_cliente),
foreign key(id_funcionario) references funcionarios(id_funcionario),
foreign key(id_produto) references produtos(id_produto)
)
comment='Status: Concluído, pendente, cancelado';

create table info_produtos(
id_info int auto_increment primary key,
id_produto int,
ingredientes text,
fornecedor varchar(255),
foreign key(id_produto) references produtos(id_produto)
);




