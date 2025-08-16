CREATE database	informatica;
USE	informatica;
create table clientes(
id int,
nome varchar(50)
);
show tables;
alter table clientes add data_nascimento date;

drop table clientes;