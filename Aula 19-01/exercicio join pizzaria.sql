CREATE DATABASE db_pizzariadozeh;

USE db_pizzariadozeh;

CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
    nome_categoria VARCHAR(255),
    tamanho CHAR,
    
    PRIMARY KEY(id)
);

CREATE TABLE tb_pizzas(
	id BIGINT AUTO_INCREMENT,
	sabor VARCHAR(255), 
    valor INT, 
    acompanhamento VARCHAR(255),
    borda_recheada boolean,
    
    -- campo dentro da tabela de pizzas que vai receber a chave estrangeira que virá da tabela de categorias
    categoria_id BIGINT,
    
    PRIMARY KEY(id),
    
    -- criação da chave estrangeira refenciando a coluna de categoria_id da tabela de pizzas, com a coluna de id da tabela de categorias 
    FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id)
);


-- inserção dos valores da tabela de categoria 
INSERT INTO tb_categoria(nome_categoria,tamanho)
VALUES("Salgada","B");

INSERT INTO tb_categoria(nome_categoria,tamanho)
VALUES("Salgada","M");

INSERT INTO tb_categoria(nome_categoria,tamanho)
VALUES("Salgada","G");

INSERT INTO tb_categoria(nome_categoria,tamanho)
VALUES("Doce","B");

INSERT INTO tb_categoria(nome_categoria,tamanho)
VALUES("Doce","M");

INSERT INTO tb_categoria(nome_categoria,tamanho)
VALUES("Doce","G");

INSERT INTO tb_categoria(nome_categoria,tamanho)
VALUES("Vegetariana","B");

INSERT INTO tb_categoria(nome_categoria,tamanho)
VALUES("Vegetariana","M");

INSERT INTO tb_categoria(nome_categoria,tamanho)
VALUES("Vegetariana","G");

-- consulta de todos os dados da tabela de categoria
SELECT * FROM tb_categoria;

-- inserção dos dados da tabela de pizzas
INSERT INTO tb_pizzas(sabor, valor, acompanhamento, borda_recheada, categoria_id)
VALUES("Mussarela",70,"Refrigerante de Guaraná",false,1);

INSERT INTO tb_pizzas(sabor, valor, acompanhamento, borda_recheada, categoria_id)
VALUES("Calabresa",50,"Suco",true,2);

INSERT INTO tb_pizzas(sabor, valor, acompanhamento, borda_recheada, categoria_id)
VALUES("Toscana",45,"Vinho",true,3);

INSERT INTO tb_pizzas(sabor, valor, acompanhamento, borda_recheada, categoria_id)
VALUES("Gorgonzola",85,"Agua com Gás",false,3);

INSERT INTO tb_pizzas(sabor, valor, acompanhamento, borda_recheada, categoria_id)
VALUES("MM's",50,"Refrigerante de Soda",true,4);

INSERT INTO tb_pizzas(sabor, valor, acompanhamento, borda_recheada, categoria_id)
VALUES("Prestígio",70,"Coca Cola 500",true,5);

INSERT INTO tb_pizzas(sabor, valor, acompanhamento, borda_recheada, categoria_id)
VALUES("Romeu e Julieta",75,"Coca Cola 2L",true,6);

INSERT INTO tb_pizzas(sabor, valor, acompanhamento, borda_recheada, categoria_id)
VALUES("Abobrinha",50,"Suco",true,7);

INSERT INTO tb_pizzas(sabor, valor, acompanhamento, borda_recheada, categoria_id)
VALUES("Brócolis com Queijo",80,"Fanta Uva",true,8);

INSERT INTO tb_pizzas(sabor, valor, acompanhamento, borda_recheada, categoria_id)
VALUES("Escarola",80,"Vinho",true,9);

-- consulta de todos os dados da tabela de pizza
SELECT * FROM tb_pizzas;

-- consulta dos dados da tabela de pizza onde o valor da pizza for maior que 45 reais
SELECT * FROM tb_pizzas WHERE valor > 45;

-- maneira 1
-- consulte todos os dados da tabela de pizzas onde os valores estejam entre 50 e 100 reais
SELECT * FROM tb_pizzas WHERE valor > 50 AND valor < 100;

-- maneira 2
SELECT *
FROM tb_pizzas
WHERE valor BETWEEN 50 AND 100;

-- Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome
SELECT * FROM tb_pizzas
WHERE sabor LIKE "%M%";

-- faça um select usando INNER JOIN para trazer todos os dados da tabela de pizzas e de categorias, onde na tabela de pizzas no campo de categoria_id for igual aos dados na tabela de categorias no campo de id
-- SELECT * FROM tb pizzas significa a nossa consulta 
SELECT * FROM tb_pizzas 

-- INNER JOIN tb_categoria significa que além de trazer os dados da tabela de pizzas vamos unir os dados da tabela de categorias também
INNER JOIN tb_categoria

-- ON significa que eu vou trazer somente os dados que estiverem relacionados, onde na coluna de categoria_id tiver um id igual a coluna id da tabela de categoria
ON tb_categoria.id = tb_pizzas.categoria_id;

SELECT * FROM tb_pizzas 
INNER JOIN tb_categoria
ON tb_categoria.id = tb_pizzas.categoria_id

-- além do join aqui faremos uma CONDIÇÃO, para trazer os dados da tabela pizza, junto com os dados da tabela de categoria SOMENTE onde o nome da categoria for igual a doce
WHERE nome_categoria LIKE "%doce%";


-- CONSULTA BONUS
SELECT * FROM tb_pizzas 
INNER JOIN tb_categoria
ON tb_pizzas.categoria_id = tb_categoria.id

-- aqui a condição diz para trazer somente os dados da tabela de pizza com os dados da tabela de categoria se o ID da categoria for igual ao numero indicado
WHERE tb_categoria.id = 3;