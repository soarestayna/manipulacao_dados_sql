/* Deletando Dados*/

use informatica;

select * from cliente;

-- Deletar um registro
delete from cliente  
where  id_cliente = 4;

-- Deletar registro com múltiplas condições
delete from cliente
where cadastro_ativo = FALSE and limite_credito <= 2000;

-- Deletar todos os registros
#delete from cliente;
#ou
#truncate table cliente; -- é irreversivél

SET SQL_SAFE_UPDATES = 1;