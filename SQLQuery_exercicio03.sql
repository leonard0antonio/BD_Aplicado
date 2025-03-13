--CREATE DATABASE Banco;
--go
--USE Banco;
--ALTER DATABASE BANCO MODIFY NAME = Agenda;
--CREATE TABLE PESSOAL(
--			MATRICULA INTEGER,
--			NOME VARCHAR(50),
--			NASCIMENTO DATE,
--			SEXO CHAR(1),
--			SALARIO MONEY
--			);

--ALTER TABLE PESSOAL ADD OBSERVACAO VARCHAR(200);
--ALTER TABLE PESSOAL ALTER COLUMN OBSERVACAO VARCHAR(150);
--ALTER TABLE PESSOAL DROP COLUMN OBSERVACAO
--DROP TABLE PESSOAL

--CREATE INDEX in_ClienteAlfa on PESSOAL(Nome)

INSERT INTO PESSOAL
			 (Nome, Nascimento, Sexo)
VALUES
			('Miguel', '06-05-2005', 'M')
select * from Pessoal

--INSERT INTO PESSOAL
--			 (Nome, Nascimento, Sexo)
--VALUES
--			('Miguel', '06-05-2005', 'M')
--select * from Pessoal

--INSERT INTO PESSOAL
--			 (Nome, Nascimento, Sexo)
--VALUES
--			('Jose', '06-05-2005', 'M')
select * from Pessoal

--INSERT INTO PESSOAL
--			 (Nome, Nascimento, Sexo)
--VALUES
--			('Jair', '06-05-2005', 'M')	
--select * from Pessoal

UPDATE PESSOAL Set Salario = '2000' WHERE SALARIO = null

DELETE FROM PESSOAL WHERE NOME = 'PAGAMENTO'