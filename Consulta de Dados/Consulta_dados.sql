/* Consultando de Dados*/

use informatica;

desc cliente;

truncate cliente;

insert into cliente values
( null, 'Marcos',   'marcos@email.com', '1991-01-05', 8000.00, null, True, 2),
(null, 'Carol', 'carol@email.com', '1998-02-26', 5500, null, True, 1),
(null, 'Ana', 'ana@email.com', '1980-05-28', 10000.00, 'Revisão de Cadastro', True, 1),
(null, 'João', 'joao@email.com', '1995-10-14', 5500, 'Inativo', False, null),
(null, 'Thiago', 'thiago@email.com', '2001-08-20', 4600, null, True, 1);

-- Selecionar todas as colunas de uma tabela
select * from cliente;

-- Selecionar colunas específicas
select nome, email from cliente;

-- Criar tabela a partir de seleção de dados (Backup*)
create table backup_cliente as select * from cliente;

desc cliente;
desc backup_cliente;

-- Inserir registros a partir da seleção de dados ()
truncate backup_cliente;
select * from backup_cliente;
insert into backup_cliente select * from cliente;
select * from backup_cliente;

select * from cliente;
