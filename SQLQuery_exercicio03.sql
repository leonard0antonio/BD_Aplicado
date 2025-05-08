-- Cria o banco de dados "Banco"
CREATE DATABASE Banco;
GO

-- Usa o banco de dados "Banco"
USE Banco;

-- Renomeia o banco de dados "Banco" para "Agenda"
ALTER DATABASE BANCO MODIFY NAME = Agenda;

-- Cria a tabela "PESSOAL"
CREATE TABLE PESSOAL(
    MATRICULA INTEGER,
    NOME VARCHAR(50),
    NASCIMENTO DATE,
    SEXO CHAR(1),
    SALARIO MONEY
);

-- Adiciona a coluna "OBSERVACAO" à tabela "PESSOAL"
ALTER TABLE PESSOAL ADD OBSERVACAO VARCHAR(200);

-- Altera o tamanho da coluna "OBSERVACAO"
ALTER TABLE PESSOAL ALTER COLUMN OBSERVACAO VARCHAR(150);

-- Remove a coluna "OBSERVACAO"
ALTER TABLE PESSOAL DROP COLUMN OBSERVACAO;

-- Exclui a tabela "PESSOAL"
DROP TABLE PESSOAL;

-- Cria um índice no campo "Nome" da tabela "PESSOAL"
CREATE INDEX in_ClienteAlfa ON PESSOAL(Nome);

-- Insere um registro com os dados de Miguel
INSERT INTO PESSOAL (Nome, Nascimento, Sexo)
VALUES ('Miguel', '2005-05-06', 'M');

-- Visualiza os dados da tabela "PESSOAL"
SELECT * FROM PESSOAL;

-- Insere outro registro
INSERT INTO PESSOAL (Nome, Nascimento, Sexo)
VALUES ('Miguel', '2005-05-06', 'M');

-- Visualiza os dados novamente
SELECT * FROM PESSOAL;

-- Insere registro de Jose
INSERT INTO PESSOAL (Nome, Nascimento, Sexo)
VALUES ('Jose', '2005-05-06', 'M');

-- Visualiza os dados
SELECT * FROM PESSOAL;

-- Insere registro de Jair
INSERT INTO PESSOAL (Nome, Nascimento, Sexo)
VALUES ('Jair', '2005-05-06', 'M');

-- Visualiza os dados
SELECT * FROM PESSOAL;

-- Atualiza salário para 2000 onde for NULL (corrigido com IS NULL)
UPDATE PESSOAL SET Salario = 2000 WHERE SALARIO IS NULL;

-- Deleta os registros com nome 'PAGAMENTO'
DELETE FROM PESSOAL WHERE NOME = 'PAGAMENTO';
