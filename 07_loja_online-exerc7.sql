CREATE DATABASE loja_online
GO
USE loja_online
GO
CREATE TABLE cliente
(
    rg CHAR(9) NOT NULL,
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    logradouro VARCHAR(50) NOT NULL,
    numero INT NOT NULL
    PRIMARY KEY (rg)
)
GO
CREATE TABLE pedido 
(
    nota_fiscal INT IDENTITY(1001, 1) NOT NULL,
    valor DECIMAL(7, 2) NOT NULL,
    data_pedido DATE NOT NULL,
    rg_cliente CHAR(9) NOT NULL
    PRIMARY KEY (nota_fiscal)
    FOREIGN KEY (rg_cliente) REFERENCES cliente(rg)
)
GO
CREATE TABLE fornecedor 
(
    codigo INT IDENTITY(1, 1) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    logradouro VARCHAR(50) NOT NULL,
    numero INT NULL,
    pais VARCHAR(50) NOT NULL,
    area VARCHAR(4) NOT NULL,
    telefone VARCHAR(20) NULL,
    cnpj CHAR(14) NULL,
    cidade VARCHAR(50) NULL,
    transporte VARCHAR(30) NULL,
    moeda VARCHAR(6) NOT NULL
    PRIMARY KEY (codigo)
)
GO
CREATE TABLE mercadoria 
(
    codigo INT IDENTITY(10, 1) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(7, 2) NOT NULL,
    qtd INT NOT NULL,
    cod_fornecedor INT NOT NULL
    PRIMARY KEY (codigo)
    FOREIGN KEY (cod_fornecedor) REFERENCES fornecedor(codigo)
)

INSERT INTO cliente
VALUES
('29531844', '34519878040', 'Luiz André', 'R. Astorga', 500),
('13514996x', '84984285630', 'Maria Luiza', 'R. Piauí', 174),
('121985541', '23354997310', 'Ana Barbara', 'Av. Jaceguai', 1141),
('23987746x', '43587669920', 'Marcos Alberto', 'R. Quinze', 22)

INSERT INTO pedido
VALUES
(754.00, '2018-04-01', '121985541'),
(350.00, '2018-04-02', '121985541'),
(30.00, '2018-04-02', '29531844'),
(1500.00, '2018-04-03', '13514996x')

INSERT INTO fornecedor 
VALUES
('Clone', 'Av. Nações Unidas', 12000, 'BR', 55, '1141487000', NULL, 'São Paulo', NULL, 'R$'),
('Logitech', '28th Street', 100, 'USA', 1, '2127695100', NULL, NULL, 'Avião', 'US$'),
('LG', 'Rod. Castello Branco', NULL, 'BR', 55, '0800664400', 4159978100001, 'Sorocaba', NULL, 'R$'),
('PcChips', 'Ponte da Amizade', NULL, 'PY', 595, NULL, NULL, NULL, 'Navio', 'US$')

INSERT INTO mercadoria
VALUES
('Mouse', 24.00, 30, 1),
('Teclado', 50.00, 20, 1),
('Cx. De Som', 30.00, 8, 2),
('Monitor 17', 350.00, 4, 3),
('Notebook', 1500.00, 7, 4)

--1) 10% de desconto no pedido 1003
SELECT valor * 0.90 AS valor_desconto
FROM pedido p 
WHERE p.nota_fiscal = 1003

--2) 5% de desconto em pedidos com valor maior de R$700,00
SELECT valor * 0.95
FROM pedido p 
WHERE valor > 700

--3) E atualizar aumento de 20% no valor de mercadorias com estoque menor de 10
SELECT preco * 1.20
FROM mercadoria
WHERE qtd < 10

--4) Data e valor dos pedidos do Luiz
SELECT CONVERT(VARCHAR, p.data_pedido, 103) AS data_pedido, p.valor, c.nome 
FROM pedido p, cliente c 
WHERE p.rg_cliente = c.rg 
	AND c.nome LIKE 'Luiz%'

--5) CPF, Nome e endereço concatenado do cliente de nota 1004
SELECT 
CONCAT
(
	SUBSTRING(c.cpf, 1, 3), '.', 
	SUBSTRING(c.cpf, 4, 3), '.', 
	SUBSTRING(c.cpf, 7, 3), '-', 
	SUBSTRING(c.cpf, 10, 2)
) AS cpf, 
c.nome, c.logradouro + ' ' + CAST(c.numero AS VARCHAR) AS endereco
FROM cliente c, pedido p 
WHERE p.rg_cliente = c.rg  
	AND p.nota_fiscal = 1004

--6) País e meio de transporte da Cx. De som
SELECT m.descricao, f.pais, f.transporte 
FROM mercadoria m, fornecedor f 
WHERE m.cod_fornecedor = f.codigo 
	AND m.descricao LIKE 'Cx. de som'

--7) Nome e Quantidade em estoque dos produtos fornecidos pela Clone
SELECT m.descricao, m.descricao, f.nome 
FROM mercadoria m, fornecedor f 
WHERE m.cod_fornecedor = f.codigo 
	AND f.nome LIKE 'Clone'

--8) Endereço concatenado e telefone dos fornecedores do monitor. 
--  (Telefone brasileiro (XX)XXXX-XXXX ou XXXX-XXXXXX (Se for 0800), Telefone Americano (XXX)XXX-XXXX)
SELECT 
CASE WHEN f.numero IS NULL
	THEN f.logradouro + ' ' + pais
ELSE f.logradouro + ' ' + CAST(f.numero AS VARCHAR) + ' ' + f.pais
END AS endereco,
CASE 
	WHEN f.area = 55 AND LEFT(f.telefone, 4) != 0800
	THEN CONCAT('(', SUBSTRING(f.telefone, 1, 2), ')', SUBSTRING(f.telefone, 3, 4), '-', SUBSTRING(f.telefone, 7, 4))
	WHEN LEFT(f.telefone, 4) = 0800
	THEN CONCAT(SUBSTRING(telefone, 1, 4), '-', SUBSTRING(telefone, 5, 6))
	WHEN f.area = 1
	THEN CONCAT('(', SUBSTRING(f.telefone, 1, 3), ')', SUBSTRING(f.telefone, 4, 3), '-', SUBSTRING(f.telefone, 7, 4))
	ELSE f.telefone
END AS telefone
FROM fornecedor f, mercadoria m 
WHERE m.cod_fornecedor = f.codigo 
	AND m.descricao LIKE 'Monitor%'

--9) Tipo de moeda que se compra o notebook
SELECT m.descricao, f.moeda 
FROM mercadoria m, fornecedor f 
WHERE m.cod_fornecedor = f.codigo 
	AND m.descricao LIKE 'Notebook'

--10) Considerando que hoje é 03/02/2019, há quantos dias foram feitos os pedidos e, 
--    criar uma coluna que escreva Pedido antigo para pedidos feitos há mais de 6 meses e pedido recente para os outros
SELECT DATEDIFF(DAY, data_pedido, '2019-02-03') AS dias_pedido,
CASE 
	WHEN DATEDIFF(MONTH, data_pedido, '2019-02-03') > 6
	THEN 'Pedido Antigo'
	ELSE 'Pedido Recente'
END AS pedido
FROM pedido p 

--11) Nome e Quantos pedidos foram feitos por cada cliente
SELECT c.nome, COUNT(p.nota_fiscal) AS qntd_pedido
FROM cliente c 
LEFT JOIN pedido p ON c.rg = p.rg_cliente 
GROUP BY c.nome

--12) RG,CPF,Nome e Endereço dos cliente cadastrados que Não Fizeram pedidos
SELECT 
CASE 
	WHEN LEN(c.rg) = 8
	THEN CONCAT(LEFT(c.rg, 1), '.', SUBSTRING(c.rg, 2, 3), '.', SUBSTRING(c.rg, 5, 3), '-', RIGHT(c.rg, 2))
	ELSE CONCAT(LEFT(c.rg, 2), '.', SUBSTRING(c.rg, 3, 3), '.', SUBSTRING(c.rg, 6, 3), '-', RIGHT(c.rg, 1))
END AS rg,
CONCAT
(
	SUBSTRING(c.cpf, 1, 3), '.', 
	SUBSTRING(c.cpf, 4, 3), '.', 
	SUBSTRING(c.cpf, 7, 3), '-', 
	SUBSTRING(c.cpf, 10, 2)
) AS cpf,
c.nome, CONCAT(c.logradouro, ' ', CAST(c.numero AS VARCHAR)) AS endereco 
FROM cliente c
LEFT JOIN pedido p ON c.rg = p.rg_cliente 
WHERE p.nota_fiscal IS NULL
