use informatica;

show create table cliente;

describe cliente;

-- Alterações básicas de adição e remoção de coluna

ALTER TABLE cliente ADD COLUMN endereço VARCHAR(255);
ALTER TABLE cliente ADD cidade VARCHAR(255);
ALTER TABLE cliente DROP endereço;
ALTER TABLE cliente ADD UNIQUE (email);

-- Alterações de coluna existente

ALTER TABLE cliente MODIFY nome VARCHAR(150);  -- alterar o tipo
ALTER TABLE cliente CHANGE nome nome_completo VARCHAR(100);  -- alterar o nome e também o tipo
ALTER TABLE cliente ALTER cidade SET DEFAULT 'Não informado'; -- adicionar alguma coisa na estrutura

-- Alterações de Dados [CUIDADO!]
-- Só pode ter uma chave primaria

ALTER TABLE cliente MODIFY id_cliente INT;
ALTER TABLE cliente DROP PRIMARY KEY;
ALTER TABLE cliente ADD PRIMARY KEY (id_cliente);

CREATE TABLE produto (id_produto INT PRIMARY KEY);
ALTER TABLE cliente ADD FOREIGN KEY (id_produto) REFERENCES produto(id_produto);

-- Renomear Tabela

#ALTER TABLE cliente RENAME TO cliente_antigos;

-- Exclusão de Tabela

#DROP TABLE cliente_antigos; #Não utilizar
DROP TABLE IF EXISTS cliente_antigos;
