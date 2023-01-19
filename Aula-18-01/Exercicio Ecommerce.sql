-- comando de criação de banco de dados
CREATE DATABASE ecommerce;

-- comando que seleciona o banco de dados que vamos trabalhar
USE ecommerce ;

-- comando de criação de tabelas
CREATE TABLE produtos(
-- define a coluna com nome id, que aceitará dados do tipo BIGINT e será auto incrementada pelo sql
	id BIGINT auto_increment,
    
    -- define a coluna com nome nome, que aceitará dados do tipo varchar e poderá armazenar até 255 caracteres(letras e numeros)
    nome VARCHAR(255),
    
    -- define a coluna com nome preco, que aceitará dados do tipo decimal, armazenando até oito numeros contendo dois numeros após a virgula
    preco DECIMAL(8,2),
    
    -- define a coluna com nome quantidade, que aceitará dados do tipo inteiro(numeros inteiros)
    quantidade INT,
    marca VARCHAR(255),
    
    -- define que a coluna que vai ser identificada como chave primaria da tabela será a coluna de id criada anteriormente
	PRIMARY KEY(id)
);

-- comando para inserir valores dentro da tabela de produtos nos campos de nome, preco, quantidade e marca, serão atribuidos os valores que estão dentro dos parenteses de values
INSERT INTO produtos(nome,preco,quantidade,marca)

-- valores que serão inseridos na ordem declarada acima 
VALUES("Camiseta",19.90,5,"Lacote");

INSERT INTO produtos(nome,preco,quantidade,marca)
VALUES("Calça",300.90,10,"Kelvin Cleiton");

INSERT INTO produtos(nome,preco,quantidade,marca)
VALUES("Tênis",35.90,2,"Adidos");

INSERT INTO produtos(nome,preco,quantidade,marca)
VALUES("Meia",100,2,"Naique");

INSERT INTO produtos(nome,preco,quantidade,marca)
VALUES("Boné",1035.90,5,"Pumba");

-- select que retorna todos os dados da tabela
SELECT * FROM produtos;

-- select que retorne apenas os produtos de valor inferior a 500

SELECT * FROM produtos WHERE preco < 500;

-- select que retorne apenas os produtos de valor maior que 500

SELECT * FROM produtos WHERE preco > 500;

-- atualiza um dado da tabela de produtos, onde o id for igual ao indicado

UPDATE produtos
SET nome = "Camiseta"
WHERE id=1;


-- BÔNUS
-- função que deleta um determinado dado de uma tabela
DELETE FROM produtos WHERE id=1;

-- comando que desativa o 'modo seguro' do mysql permitindo que seja executado update e delete
SET SQL_SAFE_UPDATES =0;

