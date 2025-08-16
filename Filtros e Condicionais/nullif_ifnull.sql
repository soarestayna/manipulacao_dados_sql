-- NULL E NOT NULL

select * from cliente;

select *
from cliente
where info_adicionais is null;

select *
from cliente
where info_adicionais is not null;

select *
from cliente
where limite_credito > 5000 and (info_adicionais is null or id_produto is null);

select nome, limite_credito, ifnull(limite_credito, 0)
from cliente;

select nome, info_adicionais, ifnull(info_adicionais, 'Nada Consta') as info_adicionais_tratada 
from cliente;

select nome, info_adicionais, nullif(info_adicionais, 'Inativo') as info_adicionais_tratada
from cliente;

select nome, info_adicionais, nullif(info_adicionais, ' ') as info_adicionais_tratada
from cliente;

select nome, info_adicionais, ifnull(nullif(info_adicionais, ' '), 'Nada Consta') as info_adicionais_tratada 
from cliente;

select nome, 
coalesce(limite_credito, id_produto, 'Cadastro_nulo')
from cliente;

select nome, info_adicionais,
coalesce(info_adicionais, 'Não consta') as info
from cliente;

/* IFNULL - SIGNIFICA SE NO CAMPO DA COLUNA LIMITE_CREDITO ESTIVER VAZIO (NULL) retorne 'Nada Consta'
NULLIF - SIGNIFICA SE NO CAMPO DA COLUNA LIMITE_CREDITO ESTIVER ESCRITO 'Inativo' retorne NULL 
COALESCE - SE as colunas que eu solicitei estiverei nulas vai retornar 'Cadastro_nulo' */


-- Tratar dados em branco

select '       remover espaços     ', trim('       remover espaços     '); -- remove todos os espaços dentro da pesquisa

select nome, info_adicionais
from cliente
where info_adicionais <> trim(info_adicionais);

select *
from cliente
where nullif(trim(info_adicionais), ' ') IS NULL;

select *
from cliente
where nullif(info_adicionais, ' ') IS NULL;