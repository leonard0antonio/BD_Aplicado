-- Cria um novo banco de dados chamado "BANCO"
CREATE DATABASE BANCO;
GO

-- Define o banco "BANCO" como o banco em uso
USE BANCO;

-- Altera o nome do banco de dados de "BANCO" para "Agenda"
ALTER DATABASE BANCO MODIFY NAME = Agenda;

-- Cria uma tabela chamada "PESSOAL" com uma única coluna:
-- OBSERVACAO: armazena um texto de até 200 caracteres
CREATE TABLE PESSOAL (
    OBSERVACAO VARCHAR(200)
);

-- Altera o tamanho da coluna OBSERVACAO de 200 para 150 caracteres
ALTER TABLE PESSOAL ALTER COLUMN OBSERVACAO VARCHAR(150);

-- Remove (exclui) completamente a tabela "PESSOAL" do banco de dados
DROP TABLE PESSOAL;

-- Tenta selecionar todos os registros da tabela "PESSOAL"
-- OBS: Este comando causará erro se executado após o DROP, pois a tabela não existirá mais
SELECT * FROM PESSOAL;
