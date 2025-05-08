-- Define o contexto para o banco de dados padrão
USE master;

-- Verifica se o banco de dados "Exercicios" já existe, e se existir, remove ele
IF DB_ID('Exercicios') IS NOT NULL
    DROP DATABASE Exercicios;

-- Cria o banco de dados "Exercicios"
CREATE DATABASE Exercicios;
GO

-- Define o banco "Exercicios" como o banco atual
USE Exercicios;

-- Cria a tabela "Agenda" com as colunas especificadas
CREATE TABLE Agenda (
    Matricula INTEGER NOT NULL,         -- Identificador único do registro
    Nome VARCHAR(50) NOT NULL,          -- Nome da pessoa
    Nascimento DATE NOT NULL,           -- Data de nascimento
    Sexo CHAR(1) NOT NULL,              -- Sexo (M ou F)
    Profissao VARCHAR(20) NOT NULL,     -- Profissão da pessoa
    Salario MONEY                       -- Salário da pessoa (pode ser NULL)
);

-- Insere diversos registros na tabela Agenda
INSERT INTO Agenda
( Matricula, Nome, Nascimento, Sexo, Profissao, Salario )
VALUES 
( 1,'Maria Jose da Silva' ,'10/02/1980','F','Medico' ,1235.68 ),
( 2,'João Paulo dos Santos' ,'15/06/1982','M','Advogado' ,1546.50 ),
( 3,'Ana Maria das Neves' ,'05/08/1985','F','Engenheiro',2350.25 ),
( 4,'Silvana Maria Gonçalves','01/10/1988','F','Medico' ,NULL ),
( 5,'Ana Marisilva do Rego' ,'11/11/1983','F','Advogado' ,1500.00 ),
( 6,'Silva Santos Guedes' ,'02/03/1984','M','Engenheiro',1620.00 ),
( 7,'Carlos José dos Santos' ,'06/04/1986','M','Medico' ,NULL ),
( 8,'Pedro Paulo Marques' ,'17/06/1986','M','Advogado' ,1600.00 ),
( 9,'Antonio Carlos da Silva','08/06/1986','M','Engenheiro',1930.00 );

-- Consulta todos os registros da tabela
SELECT * FROM Agenda;

-- Seleciona todas as profissões distintas
SELECT DISTINCT Profissao FROM Agenda;

-- Lista nome e profissão de todos os registros
SELECT Nome, Profissao FROM Agenda;

-- Mesmo resultado que o anterior, mas com alias (apelidos) nas colunas
SELECT Nome AS NOME, Profissao AS PROFISSÃO FROM Agenda;

-- Filtra registros com matrículas específicas
SELECT * FROM Agenda WHERE Matricula IN (1, 3, 5, 7);

-- Filtra registros onde o nome começa, termina ou contém "silva"
SELECT * FROM Agenda 
WHERE Nome LIKE 'silva %' 
   OR Nome LIKE '% silva' 
   OR Nome LIKE '% silva %';

-- Outra forma mais prática para buscar nomes que contêm 'silva'
SELECT * FROM Agenda 
WHERE ' ' + Nome + ' ' LIKE '% SILVA %';

-- Seleciona registros com salário entre 1500 e 2000
SELECT * FROM Agenda WHERE Salario BETWEEN 1500 AND 2000;

-- Seleciona registros com salário fora do intervalo entre 1500 e 2000
SELECT * FROM Agenda WHERE Salario NOT BETWEEN 1500 AND 2000;

-- Ordena os registros por data de nascimento (do mais antigo ao mais recente)
SELECT * FROM Agenda ORDER BY Nascimento;

-- Seleciona registros onde o salário está ausente (NULL)
SELECT * FROM Agenda WHERE Salario IS NULL;

-- Busca nomes que contêm a palavra "rego"
SELECT * FROM Agenda WHERE Nome LIKE '%rego%';

-- Conta a quantidade de pessoas por sexo
SELECT Sexo, COUNT(*) AS 'Qtd.' 
FROM Agenda 
GROUP BY Sexo;

-- Soma os salários por sexo
SELECT Sexo, SUM(Salario) AS 'Qtd.' 
FROM Agenda 
GROUP BY Sexo;

-- Conta quantos homens há por profissão
SELECT Profissao, COUNT(*) AS 'Matricula.' 
FROM Agenda 
GROUP BY Profissao, Sexo 
HAVING Sexo = 'M';

-- Ordena os registros por profissão (ascendente) e nome (descendente)
SELECT Profissao, Nome 
FROM Agenda 
ORDER BY Profissao, Nome DESC;

-- Seleciona os 3 maiores salários
SELECT TOP(3) Salario 
FROM Agenda 
ORDER BY Salario DESC;

-- Seleciona o(s) nome(s) com maior salário
SELECT Nome, Salario 
FROM Agenda  
WHERE Salario = (SELECT MAX(Salario) FROM Agenda);

-- Seleciona pessoas com salário maior ou igual à média
SELECT Nome, Salario 
FROM Agenda  
WHERE Salario >= (SELECT AVG(Salario) FROM Agenda);

-- Seleciona nome, salário e sexo da(s) pessoa(s) com maior salário
SELECT Nome, Salario, Sexo 
FROM Agenda  
WHERE Salario = (SELECT MAX(Salario) FROM Agenda);

-- Seleciona o maior salário (e o nome correspondente)
SELECT TOP(1) Salario, Nome 
FROM Agenda 
ORDER BY Salario DESC;

-- Seleciona os nomes e salários com os maiores valores por sexo
SELECT Nome, Salario 
FROM Agenda  
WHERE Salario = (SELECT MAX(Salario) FROM Agenda WHERE Sexo = 'M') 
   OR Salario = (SELECT MAX(Salario) FROM Agenda WHERE Sexo = 'F');
