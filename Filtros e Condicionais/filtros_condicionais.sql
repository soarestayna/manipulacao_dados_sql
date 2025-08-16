/* Filtros condicionais */

use informatica;

-- AND, OR e NOT

select * from cliente;

select * from cliente
where cadastro_ativo = True and limite_credito < 6000;

select * from cliente
where not cadastro_ativo = True and limite_credito < 6000;

select * from cliente
where cadastro_ativo = True or limite_credito > 6000;

select * from cliente
where limite_credito > 6000 and year(data_nascimento) > 1980;

select * from cliente
where cadastro_ativo = True or limite_credito > 6000 and year(data_nascimento) > 1980; -- Testar ( ) dessa forma o SQL vai testar primeiro a condição da função AND

select * from cliente
where (cadastro_ativo = True or limite_credito > 6000) and year(data_nascimento) > 1980; -- Dessa forma o SQL vai primeiro testar o que esta primeiro dentro dos parenteses

select * from cliente
where not limite_credito > 6000;