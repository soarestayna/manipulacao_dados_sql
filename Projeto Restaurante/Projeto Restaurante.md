# Projeto de Banco de Dados - Restaurante



###### Este projeto foi desenvolvido durante meu aprendizado em SQL no Curso de Análise de Dados - EBAC, 

###### com o objetivo de aplicar conceitos fundamentais e avançados de manipulação e análise de dados 

###### em um cenário fictício: a gestão de um restaurante.





#### Objetivo do Projeto:



###### O propósito foi simular o dia a dia de um Analista de Dados em um restaurante, 

###### criando e manipulando dados para gerar informações úteis, sempre utilizando 

###### boas práticas de organização, performance e legibilidade no código SQL.





###### Estrutura do Banco de Dados



O banco de dados criado se chama restaurante e possui as seguintes tabelas principais:



* *funcionarios* - Que contém as informações sobre os funcionários como nome, CPF, cargo, salário.
* *clientes* - Com as informações do cadastro de clientes, incluindo dados pessoais(nessa case são fictícios).
* *produtos* - Contém o catálogo de produtos do restaurante (nome, categoria, preço).
* *info\_produtos* - Contém os ingredientes e fornecedores de cada produto.
* *pedidos* - Que contém os registros dos pedidos realizados, relacionando clientes, funcionários e produtos.



###### Principais Operações Realizadas

Durante o desenvolvimento do projeto, pratiquei diferentes categorias de comandos SQL:



* **Criação e Estrutura (DDL)**

\- Criação das tabelas com chaves primárias e estrangeiras.

\- Definição de tipos de dados, restrições e integridade referencial.



* **Manipulação de Dados (DML)**

\- Inserção de dados fictícios em todas as tabelas.

\- Atualização de salários, cargos e status de pedidos.

\- Exclusão de registros específicos.



* **Consultas de Dados (DQL)**

\- Seleções simples com *SELECT \* FROM*.

\- Filtros com *WHERE, BETWEEN, LIKE, IN*.

\- Ordenações com *ORDER BY* e paginação com *LIMIT*.

\- Consultas com operadores lógicos com *AND, OR, NOT*.

\- Funções de agregação com *COUNT, SUM, AVG, MAX, MIN*.

\- Agrupamentos com *GROUP BY* e *HAVING*.



* **Relações entre Tabelas (JOINs e Subconsultas)**

*- INNER JOIN, LEFT JOIN* e *RIGHT JOIN* para unir dados entre tabelas,

\- Subconsultas para filtrar resultados mais complexos.

\- Consultas envolvendo múltiplas tabelas: clientes, pedidos, produtos e funcionários.



* **Views**

\- Criação da view resumo\_pedido, unindo informações de pedidos, clientes, funcionários e produtos.

\- Atualização da view com campo calculado de total do pedido.



* **Criação de funções personalizadas**

\- BuscaIngredientesProduto → retorna os ingredientes de um produto a partir do seu ID.

\- mediaPedido → compara o valor de um pedido com a média geral de todos os pedidos.



##### 

###### Exemplos de Problemas Resolvidos



* Quais produtos custam mais de R$30,00?
* Quais clientes nasceram antes de 1985?
* Quais pedidos estão pendentes e quais já foram concluídos?
* Quais são os 5 produtos mais caros do restaurante?
* Qual cliente fez apenas um pedido?
* Qual é o total gasto por cada cliente?
* Qual é o preço médio dos produtos por categoria?



###### Insights Gerados



* Identificação de clientes mais ativos.
* Produtos mais vendidos e os mais caros.
* Pedidos cancelados ou incompletos.
* Relação entre funcionários e número de pedidos atendidos.
* Fornecedores com maior diversidade de produtos.





##### Conclusão



###### O Projeto Restaurante consolidou meu aprendizado em SQL, permitindo praticar desde os fundamentos até recursos mais avançados como views, funções e joins complexos. 

###### Ele simula de forma prática os desafios enfrentados por um Analista de Dados, unindo organização, performance e clareza no código.

