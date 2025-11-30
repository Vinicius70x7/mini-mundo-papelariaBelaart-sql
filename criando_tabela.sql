-- 1. Criação do banco e seleção
CREATE DATABASE IF NOT EXISTS papelaria;
USE papelaria;

-- 2. Criação das tabelas
CREATE TABLE Categoria (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    idCategoria INT,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    tipo ENUM('Fisica','Juridica')
);

CREATE TABLE FormaPagamento (
    idForma INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50)
);

CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo ENUM('Vendedor','Gerente')
);

CREATE TABLE Venda (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    dataVenda DATE,
    idCliente INT,
    idFuncionario INT,
    idForma INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario),
    FOREIGN KEY (idForma) REFERENCES FormaPagamento(idForma)
);

CREATE TABLE ItemVenda (
    idVenda INT,
    idProduto INT,
    quantidade INT,
    precoUnit DECIMAL(10,2),
    PRIMARY KEY (idVenda, idProduto),
    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150)
);

CREATE TABLE Compra (
    idCompra INT PRIMARY KEY AUTO_INCREMENT,
    idFornecedor INT,
    dataCompra DATE,
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor)
);

CREATE TABLE ItemCompra (
    idCompra INT,
    idProduto INT,
    quantidade INT,
    custoUnit DECIMAL(10,2),
    PRIMARY KEY (idCompra, idProduto),
    FOREIGN KEY (idCompra) REFERENCES Compra(idCompra),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- 3. Inserção de dados exemplo
INSERT INTO Categoria (nome) VALUES
('Escolar'), ('Escritório'), ('Artesanato');

INSERT INTO Produto (nome, preco, idCategoria) VALUES
('Caderno Universitário', 15.90, 1),
('Caneta Azul', 2.50, 2),
('Tinta Guache', 12.00, 3);

INSERT INTO Cliente (nome, tipo) VALUES
('João da Silva', 'Fisica'),
('Mercado Bom Preço', 'Juridica');

INSERT INTO FormaPagamento (descricao) VALUES
('Dinheiro'), ('Cartão'), ('PIX');

INSERT INTO Funcionario (nome, cargo) VALUES
('Carlos Vendedor', 'Vendedor'),
('Mariana Gerente', 'Gerente');

INSERT INTO Venda (dataVenda, idCliente, idFuncionario, idForma) VALUES
('2023-10-01', 1, 1, 2),
('2023-10-02', 2, 1, 3);

INSERT INTO ItemVenda VALUES
(1, 1, 2, 15.90),
(1, 2, 3, 2.50),
(2, 3, 1, 12.00);

INSERT INTO Fornecedor (nome) VALUES
('Fornecedor Papelaria A'),
('Fornecedor Escolar B');

INSERT INTO Compra (idFornecedor, dataCompra) VALUES
(1, '2023-09-25'),
(2, '2023-09-20');

INSERT INTO ItemCompra VALUES
(1, 1, 50, 10.00),
(1, 2, 100, 1.50),
(2, 3, 20, 8.00);

-- 4. Consultas SELECT (exemplos)
-- a) Clientes e suas vendas
SELECT c.nome AS cliente, v.idVenda, v.dataVenda
FROM Venda v
JOIN Cliente c ON v.idCliente = c.idCliente;

-- b) Produtos mais caros
SELECT nome, preco
FROM Produto
ORDER BY preco DESC
LIMIT 5;

-- c) Itens vendidos em venda específica
SELECT p.nome, iv.quantidade, iv.precoUnit
FROM ItemVenda iv
JOIN Produto p ON iv.idProduto = p.idProduto
WHERE iv.idVenda = 1;

-- d) Compras de fornecedor e quantidade
SELECT f.nome AS fornecedor, c.dataCompra, ic.quantidade
FROM Compra c
JOIN Fornecedor f ON c.idFornecedor = f.idFornecedor
JOIN ItemCompra ic ON c.idCompra = ic.idCompra;

-- 5. Comandos UPDATE (exemplos)
UPDATE Produto
SET preco = 16.50
WHERE idProduto = 1;

UPDATE Cliente
SET nome = 'João de Souza'
WHERE idCliente = 1;

UPDATE Funcionario
SET cargo = 'Gerente'
WHERE idFuncionario = 1;

-- 6. Comandos DELETE (exemplos)
DELETE FROM ItemVenda
WHERE idVenda = 2 AND idProduto = 3;

DELETE FROM Venda
WHERE idVenda = 2;

DELETE FROM Cliente
WHERE idCliente = 2;
