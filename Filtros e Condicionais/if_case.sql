-- IF e CASE
use informatica;
select * from cliente;

select nome, limite_credito, if(limite_credito > 6000, 'Alto', 'Baixo') as categoria_limite
from cliente
order by limite_credito desc;

select 
	nome, limite_credito,
	case
		when limite_credito > 6000 
		then 'Alto'
        else 'Baixo'
	end as categoria_limite
from cliente;

select id_cliente, nome, limite_credito,if(limite_credito > 9000, 'Premium',if(limite_credito between 5000 and 9000, 'Gold', 
'Silver')) as categoria_limite
from cliente;

select  id_cliente, nome, limite_credito,
	case
		when limite_credito > 9000 then 'Premium'
        when limite_credito between 5000 and 9000 then 'Gold'
        else 'Silver'
	end as categoria_cliente
from cliente
order by limite_credito desc;

select * from cliente;