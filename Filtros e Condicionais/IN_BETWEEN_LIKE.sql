use informatica;

-- IN 
select * from cliente;

select * 
from cliente
where id_cliente in(1, 2, 4, 6);

select *
from cliente
where year(data_nascimento) in (1991, 1995);

-- BETWEEN

select * 
from cliente
where data_nascimento between '1990-01-01' and '2000-12-31';

select *
from cliente
where year(data_nascimento) between 1990 and 2000;

select *
from cliente
where limite_credito between 6000 and 10000;

-- LIKE

select *
from cliente
where info_adicionais like 'revisão%';

select *
from cliente
where info_adicionais like '%cadastro'; -- Custoso computacional (em um sistema com muitos dados, essa forma de usar vai demorar mais a rodar)

select *
from cliente
where email like'%@%.com';

insert into cliente (nome, email, data_nascimento, info_adicionais) values
					( 'A', 'a@a.com', '1990-10-10', ' '); -- CADASTRO INCOERRENTE
                    
select * 
from cliente 
where email like '__%@__%.com'; -- USAR NOT 

select * 
from cliente 
where email like '___@email.com'; -- o _ simboliza a quantidade de caracteres de dever retornar

select * 
from cliente 
where email like '___%@email.com'; -- ___ pelo menos vai ter três letras e % pode ter mais

select * 
from cliente 
where email like '___@_mail.com' or email like '___@__mail.com'; 

select *
from cliente
where (nome like 'A%' or nome like 'B%' or nome like 'C%') and cadastro_ativo = True;


select * from cliente;