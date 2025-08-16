-- Agregações 

-- Preparação do BD

create database loja_informatica;

use loja_informatica;

create table if not exists cliente(
	id_cliente int primary key,
    nome varchar(200),
    email varchar(100),
    cidade varchar(200)
    );
    
create table if not exists produto(
	id_produto int primary key,
    nome varchar(200),
    categoria varchar(100),
    preco decimal(10,2)
    );
    
    create table if not exists pedido(
		id_pedido int primary key,
        id_cliente int,
        id_produto int,
        quantidade int,
        data date,
		foreign key (id_produto) references produto(id_produto),
        foreign key (id_cliente) references cliente(id_cliente)
    );
    
select * from backup_cliente limit 10;
select * from backup_pedido limit 10;
select * from backup_produto limit 10;

desc backup_pedido;
alter table backup_pedido change ï»¿id_pedido ID_Pedido varchar(100);

insert into cliente select * from backup_cliente;
insert into produto select * from backup_produto;
insert into pedido select id_pedido, id_cliente, id_produto, quantidade, str_to_date(data, '%d-%m-%Y') from backup_pedido;

desc backup_pedido;
alter table backup_pedido change id_Pedido id_pedido int;
alter table backup_pedido modify id_pedido int primary key;

select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 20;
desc pedido;