---- Cria??o do banco de dados chamado BANCO
--CREATE DATABASE BANCO;

---- Garante que os pr?ximos comandos ser?o executados dentro do banco BANCO
--USE BANCO;

---- Cria??o da tabela Departamento
--CREATE TABLE Departamento( 
--    Numero INTEGER,            -- Identificador do departamento
--    Nome VARCHAR(50),          -- Nome do departamento (at? 50 caracteres)
--    Local VARCHAR(20),         -- Localiza??o do departamento (at? 20 caracteres)
--    Orcamento DECIMAL(12,2)    -- Or?amento do departamento com 2 casas decimais
--);

---- Consulta para exibir todos os registros da tabela (inicialmente vazia)
--SELECT * FROM Departamento;

---- Inser??o de um novo departamento na tabela
--INSERT INTO Departamento (Numero, Nome, Local, Orcamento) 
--VALUES (70, 'Producao', 'Recife', 10000);

-- Consulta para exibir os registros da tabela ap?s a inser??o
--SELECT * FROM Departamento;

-- Atualiza o nome de todos os departamentos para 'Pessoal'
--UPDATE Departamento
--SET Nome = 'Pessoal';

---- Exibe todos os registros da tabela ap?s a atualiza??o
--SELECT * FROM Departamento;

---- Deleta todos os registros da tabela Departamento (cuidado: remove todos os dados!)
--DELETE FROM Departamento;

---- Exibe todos os registros da tabela ap?s a exclus?o (ficar? vazia)
--SELECT * FROM Departamento;

---- Insere m?ltiplos registros na tabela Departamento
--INSERT INTO Departamento (Numero, Nome, Local, Orcamento)
--VALUES
--(10, 'Produ??o', 'Recife', 15000),   -- Produ??o em Recife com or?amento de 15000
--(20, 'Cont?bil', 'Olinda', 30000),   -- Cont?bil em Olinda com or?amento de 30000
--(30, 'Cont?bil', 'Olinda', 40000),   -- Cont?bil em Olinda com or?amento de 40000
--(40, 'Cont?bil', 'Recife', 50000);   -- Cont?bil em Recife com or?amento de 50000

---- Exibe os registros da tabela ap?s a nova inser??o
--SELECT * FROM Departamento;

---- Atualiza os departamentos chamados 'Cont?bil' e com or?amento maior ou igual a 35000 para 'Estoque'
--UPDATE Departamento
--SET Nome = 'Estoque'
--WHERE Nome = 'Cont?bil' AND Orcamento >= 35000;

---- Exibe os registros da tabela ap?s a atualiza??o
--SELECT * FROM Departamento;

---- Deleta os departamentos localizados em 'Recife' ou com or?amento maior ou igual a 40000
--DELETE FROM Departamento
--WHERE Local = 'Recife' OR Orcamento >= 40000;

---- Exibe os registros da tabela ap?s a exclus?o
--SELECT * FROM Departamento;
