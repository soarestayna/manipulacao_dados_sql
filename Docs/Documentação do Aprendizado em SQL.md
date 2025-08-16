# Documentação do Aprendizado em SQL

# 

##### Linguagem de Dados



###### No SQL existem cinco categorias principais:

* **DDL**(Data Definition Language) - é usada para criar e organizar a estrutura do banco de dados.
* **DML**(Data Manipulation Language) - usado para inserir, atualizar e apagar dados.
* **DCL**(Data Control Language) - serve para controlar permissões e acessos.
* **DTL**(Data Transaction Language) - serve para lidar com transações, como salvar ou desfazer mudanças.



##### Estrutura e Criação de Tabelas



###### Antes de inserir os dados, vou precisar de uma estrutura:

* Definir dos tipos de dados, como texto, números, datas, entre outros.
* Usei restrições como *PRIMARY KEY* e *NOT NULL* para dar integridade aos dados.
* Criei tabelas com *CREATE TABLE*.



##### Refinamento e Manipulação de Tabelas



###### Nem sempre a tabela vem pronta, para ajeitar usei:

* *ALTER TABLE* para adicionar ou remover colunas.
* Renomeei tabelas e defini valores padrão.





##### Inserção de Dados



###### Com *INSERT INTO* comecei a alimentar as tabelas:

* Comecei a inserção de um registro por vez.
* Depois aprendi a inserção de múltiplos registros, o que trouxe mais eficiência.



##### Atualização de Dados



###### Comando *UPDATE* serve para alterar informações já cadastradas:

* Atualizei campos específicos.
* Fiz mudanças condicionais com *WHERE*.



##### Deleção de Dados



###### Remover dados de forma consciente:

* *DELETE FROM* - remover registros selecionados.
* *TRUNCATE* - Limpa a tabela inteira.
* **OBS: É importante fazer backups antes de deletar.**



##### Comando SELECT



* *SELECT \* -* serve para buscar todos os dados de uma tabela.
* *SELECT colunas -* para buscar apenas algumas colunas e não a tabela toda.
* *SELECT INTO* - serve para criar backups.



##### Filtragem de Dados



* Filtragem de registros específicos.
* Combinação de condições com operadores lógicos *AND, OR,* e *NOT*.
* Utilizei parênteses para organizar as condições.



##### Ordenação e Limitação



* *ORDER BY* - serve para ordenar resultados, *ASC* de forma crescente e *DESC* de forma decrescente.
* *LIMIT* - para buscar só uma parte dos dados.



##### Operadores Especiais



* *IN* - busca por uma lista de valores.
* *BETWEEN* - seleciona intervalos.
* *LIKE* - busca por padrões em textos.



##### Tratamento de valores Nulos



* *IS NULL* e *IS NOT NULL* - para identificar valores nulos e não nulos.
* *IFNULL* e *NULLIF* - para substituir ou diferenciar valores.



##### Funções de Agregação



###### Dá para resumir dados usando:

* *COUNT -* usado para contar o número de linhas que correspondem a um critério especificado.
* *SUM -* usado para calcular a soma total de uma coluna numérica.
* *AVG -* usado para calcular o valor médio de uma coluna.
* *MAX -* usado para retornar o maior valor em uma coluna.
* *MIN -* usado para retornar o menor valor de uma coluna.



##### Agrupamento e Filtragem Avançada



* *GROUP BY -* serve para agrupar os dados.
* *WHERE -* serve para filtrar antes do agrupamento.
* *HAVING -* serve para filtrar depois do agrupamento.



##### Consultas entre Múltiplas Tabelas



* *INNER JOIN* -  Retorna apenas as linhas que possuem valores correspondentes em ambas as tabelas.
* *LEFT JOIN* - Retorna todas as linhas da tabela à esquerda  e as linhas correspondentes da tabela à direita. Se não houver correspondência na tabela à direita, os valores serão preenchidos com NULL.
* *RIGHT JOIN* - É o oposto do LEFT JOIN. Retorna todas as linhas da tabela à direita e as linhas correspondentes da tabela à esquerda. Se não houver correspondência na tabela à esquerda, os valores serão preenchidos com NULL.
* *FULL JOIN* - Retorna todas as linhas quando há uma correspondência em qualquer uma das tabelas. Se não houver correspondência em uma das tabelas, os valores serão preenchidos com NULL.
* *SELF JOIN* - Uma tabela é unida a ela mesma, como se fosse duas tabelas diferentes. Isso é útil para comparações dentro da mesma tabela, como encontrar relações hierárquicas ou dados que se repetem.
* *NATURAL JOIN* - A junção natural é uma forma simplificada de INNER JOIN que une as tabelas com base em colunas com o mesmo nome e tipo de dado.



##### Views



###### Views funcionam como consultas salvas:

* *CREATE VIEW* - para criar views.
* *CREATE OR REPLACE* - para atualização.
* *DROP VIEW* - para exclusão de views.
* **OBS: Se na view não constar campos que unam tabelas não será possível realizar joins.**



###### Como utilizar as Views:

* Views são utilizadas para diminuir a complexidade das analises.
* Criar resumos de analises.
* Ocultar dados pessoas, filtrar dados que são relevantes.



##### Procedimentos Armazenados



###### São procedimentos que automatizam tarefas, como:

* Encapsulam blocos de código SQL.
* Podem incluir transações e tratamento de erros.
* Uso de variáveis e parâmetros de entrada/saída.



##### Funções em SQL



* *CREATE FUNCTION* - serve para criar funções definidas pelo usuário, essas funções podem ser utilizadas para realizar operações específicas dentro de um banco de dados, tornando o código mais reutilizável e organizado.
* *SHOW FUNCTION STATUS* - mostra todas as funções.
* *DROP FUNCTION* - deleta a função.







*Essa documentação vai me ajudar a revisar e também compartilhar meu progresso com outras pessoas que estejam começando no SQL*

