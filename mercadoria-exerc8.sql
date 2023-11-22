USE master

DROP DATABASE mercadoria

CREATE DATABASE mercadoria
GO
USE mercadoria
GO
CREATE TABLE cliente 
(
    codigo INT IDENTITY(1, 1) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone CHAR(13) NOT NULL,
    telefone_comercial CHAR(12) NULL
    PRIMARY KEY (codigo)
)
GO
CREATE TABLE tipo_mercadoria 
(
    codigo INT IDENTITY(10001, 1) NOT NULL,
    nome VARCHAR(50) NOT NULL
    PRIMARY KEY (codigo)
)
GO
CREATE TABLE corredores 
(
    codigo INT IDENTITY(101, 1) NOT NULL,
    tipo INT NULL,
    nome VARCHAR(50) NULL
    PRIMARY KEY (codigo)
    FOREIGN KEY (tipo) REFERENCES tipo_mercadoria(codigo)
)
GO
CREATE TABLE mercadoria 
(
    codigo INT IDENTITY (1001, 1) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    corredor INT NOT NULL,
    tipo INT NOT NULL,
    valor DECIMAL(7, 2) NOT NULL
    PRIMARY KEY (codigo)
    FOREIGN KEY (corredor) REFERENCES corredores(codigo),
    FOREIGN KEY (tipo) REFERENCES tipo_mercadoria(codigo)
)
GO
CREATE TABLE compra 
(
    nota_fiscal INT NOT NULL,
    codigo_cliente INT NOT NULL,
    valor DECIMAL(7, 2) NOT NULL
    PRIMARY KEY (nota_fiscal)
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo)
)

INSERT INTO cliente 
VALUES
('Luis Paulo', 'R. Xv de Novembro, 100', '45657878', NULL),
('Maria Fernanda', 'R. Anhaia, 1098', '27289098', '40040090'),
('Ana Claudia', 'Av. Voluntários da Pátria, 876', '21346548', NULL),
('Marcos Henrique', 'R. Pantojo, 76', '51425890', '30394540'),
('Emerson Souza', 'R. Pedro Álvares Cabral, 97', '44236545', '39389900'),
('Ricardo Santos', 'Trav. Hum, 10', '98789878', NULL)

INSERT INTO tipo_mercadoria 
VALUES
('Pães'),
('Frios'),
('Bolacha'),
('Clorados'),
('Frutas'),
('Esponjas'),
('Massas'),
('Molhos')

INSERT INTO corredores
VALUES
(10001, 'Padaria'),
(10002, 'Calçados'),
(10003, 'Biscoitos'),
(10004, 'Limpeza'),
(NULL, NULL),
(NULL, NULL),
(10007, 'Congelados')

INSERT INTO mercadoria
VALUES
('Pão de Forma', 101, 10001, 3.5),
('Presunto', 101, 10002, 2.0),
('Cream Cracker', 103, 10003, 4.5),
('Água Sanitária', 104, 10004, 6.5),
('Maçã', 105, 10005, 0.9),
('Palha de Aço', 106, 10006, 1.3),
('Lasanha', 107, 10007, 9.7)

INSERT INTO compra 
VALUES
(1234, 2, 200),
(2345, 4, 156),
(3456, 6, 354),
(4567, 3, 19)

--1) Valor da Compra de Luis Paulo.
SELECT c.valor
FROM compra c, cliente cl
WHERE c.codigo_cliente = cl.codigo 
	AND cl.nome LIKE 'Luis%'

--2) Valor da Compra de Marcos Henrique.
SELECT c.valor 
FROM compra c, cliente cl
WHERE c.codigo_cliente = cl.codigo 
	AND cl.nome LIKE 'Marcos%'

--3) Endereço e telefone do comprador de Nota Fiscal = 4567.
SELECT cl.endereco, cl.telefone 
FROM cliente cl, compra c
WHERE cl.codigo = c.codigo_cliente 
	AND c.nota_fiscal = 4567

--4) Valor da mercadoria cadastrada do tipo " Pães".
SELECT *
FROM mercadoria m, tipo_mercadoria tm
WHERE m.tipo = tm.codigo 
	AND tm.nome LIKE 'Pães'

--5) Nome do corredor onde está a Lasanha.
SELECT c.nome
FROM corredores c, mercadoria m 
WHERE m.corredor  = c.codigo 
	AND m.nome LIKE 'Lasanha'

--6) Nome do corredor onde estão os clorados.
SELECT c.nome 
FROM corredores c, tipo_mercadoria tm 
WHERE c.tipo = tm.codigo 
	AND tm.nome LIKE 'Clorados'