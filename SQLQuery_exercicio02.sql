-- Criação do banco de dados chamado BANCO
CREATE DATABASE BANCO;

-- Garante que os próximos comandos serão executados dentro do banco BANCO
USE BANCO;

-- Criação da tabela Departamento
CREATE TABLE Departamento( 
    Numero INTEGER,            -- Identificador do departamento
    Nome VARCHAR(50),          -- Nome do departamento (até 50 caracteres)
    Local VARCHAR(20),         -- Localização do departamento (até 20 caracteres)
    Orcamento DECIMAL(12,2)    -- Orçamento do departamento com 2 casas decimais
);

-- Consulta para exibir todos os registros da tabela (inicialmente vazia)
SELECT * FROM Departamento;

-- Inserção de um novo departamento na tabela
INSERT INTO Departamento (Numero, Nome, Local, Orcamento) 
VALUES (70, 'Producao', 'Recife', 10000);

-- Consulta para exibir os registros da tabela após a inserção
SELECT * FROM Departamento;

-- Atualiza o nome de todos os departamentos para 'Pessoal'
UPDATE Departamento
SET Nome = 'Pessoal';

-- Exibe todos os registros da tabela após a atualização
SELECT * FROM Departamento;

-- Deleta todos os registros da tabela Departamento (cuidado: remove todos os dados!)
DELETE FROM Departamento;

-- Exibe todos os registros da tabela após a exclusão (ficará vazia)
SELECT * FROM Departamento;

-- Insere múltiplos registros na tabela Departamento
INSERT INTO Departamento (Numero, Nome, Local, Orcamento)
VALUES
(10, 'Producao', 'Recife', 15000),   -- Produção em Recife com orçamento de 15000
(20, 'Contabil', 'Olinda', 30000),   -- Contábil em Olinda com orçamento de 30000
(30, 'Contabil', 'Olinda', 40000),   -- Contábil em Olinda com orçamento de 40000
(40, 'Contabil', 'Recife', 50000);   -- Contábil em Recife com orçamento de 50000

-- Exibe os registros da tabela após a nova inserção
SELECT * FROM Departamento;

-- Atualiza os departamentos chamados 'Contabil' e com orçamento maior ou igual a 35000 para 'Estoque'
UPDATE Departamento
SET Nome = 'Estoque'
WHERE Nome = 'Contabil' AND Orcamento >= 35000;

-- Exibe os registros da tabela após a atualização
SELECT * FROM Departamento;

-- Deleta os departamentos localizados em 'Recife' ou com orçamento maior ou igual a 40000
DELETE FROM Departamento
WHERE Local = 'Recife' OR Orcamento >= 40000;

-- Exibe os registros da tabela após a exclusão
SELECT * FROM Departamento;
