--USE master;
--IF DB_ID('Exercicios') IS NOT NULL
--DROP DATABASE Exercicios;
--CREATE DATABASE Exercicios;
--GO
--USE Exercicios;
--CREATE TABLE Agenda(
--		Matricula INTEGER NOT NULL,
--		Nome VARCHAR(50) NOT NULL,
--		Nascimento DATE NOT NULL,
--		Sexo CHAR(1) NOT NULL,
--		Profissao VARCHAR(20) NOT NULL, 
--		Salario MONEY
--		);

INSERT INTO Agenda
( Matricula, Nome, Nascimento, Sexo, Profissao, Salario )
VALUES ( 1,'Maria Jose da Silva' ,'10/02/1980','F','Medico' ,1235.68 ),
( 2,'Jo?o Paulo dos Santos' ,'15/06/1982','M','Advogado' ,1546.50 ),
( 3,'Ana Maria das Neves' ,'05/08/1985','F','Engenheiro',2350.25 ),
( 4,'Silvana Maria Gon?alves','01/10/1988','F','Medico' ,NULL ),
( 5,'Ana Marisilva do Rego' ,'11/11/1983','F','Advogado' ,1500.00 ),
( 6,'Silva Santos Guedes' ,'02/03/1984','M','Engenheiro',1620.00 ),
( 7,'Carlos Jos? dos Santos' ,'06/04/1986','M','Medico' ,NULL ),
( 8,'Pedro Paulo Marques' ,'17/06/1986','M','Advogado' ,1600.00 ),
( 9,'Antonio Carlos da Silva','08/06/1986','M','Engenheiro',1930.00 );

--SELECT * FROM Agenda;
--SELECT DISTINCT Profissao
--FROM Agenda; 
--SELECT Nome, Profissao
--FROM Agenda; 
--SELECT Nome AS NOME, Profissao AS PROFISS?O 
--FROM Agenda;

--SELECT * FROM AGENDA WHERE Matricula IN (1,3,5,7);

--SELECT * FROM AGENDA WHERE  Nome LIKE 'silva %' OR/*pega o que come?a com silva*/
--							Nome LIKE '% silva' OR /*Onde houver silva no final*/
--							Nome LIKE '% silva %' /*pega o que tiver no meio*/

--							SELECT * FROM AGENDA WHERE ' '+nome+' ' LIKE '% SILVA %'; /*faz o mesmo que o de cima, por?m em uma uma linha (mais pratico)
							
 
--SELECT * FROM AGENDA WHERE salario  between 1500 and 2000; /*N?O CONFUNDIR COM MAIOR OU MENOR. EX: SE PEDIR MAIOR E MENOR, USAMOS >1500 AND <2000*/
--SELECT * FROM AGENDA WHERE salario NOT between 1500 and 2000; /*N?O CONFUNDIR COM MAIOR OU MENOR. EX: SE PEDIR MAIOR E MENOR, USAMOS >1500 AND <2000*/
--SELECT * FROM AGENDA ORDER BY NASCIMENTO;

--SELECT * FROM AGENDA WHERE salario IS NULL;

--SELECT * FROM AGENDA WHERE NOME LIKE '%rego%';

select Sexo, COUNT(*) AS 'Qtd.' From Agenda Group By Sexo; 
select Sexo, SUM(SALARIO) AS 'Qtd.' From Agenda Group By Sexo; /*Organizando as somas do Salario dos sexos*/


Select Profissao, Count(*) As 'Matricula.' From Agenda Group By Profissao, Sexo HAVING Sexo = 'M'; /*Esta agrupando  AS PROFISSOES E APENAS OS SEXO MASCULINOS*/ 

SELECT Profissao, Nome From Agenda Order By Profissao, Nome DESC;

SELECT TOP(3) Salario From Agenda Order By Salario Desc /*Seleciona os 3 maiores salarios em ordem decrescente*/

SELECT nome, salario From Agenda  Where salario = (SELECT MAX(SALARIO)
										FROM AGENDA);

SELECT nome, salario From Agenda  Where salario >= (SELECT AVG(SALARIO) 
										FROM AGENDA);  /*Seleciona os salarios que sao maior ou igual a media do salario*/

SELECT  nome, salario, sexo From Agenda  Where salario = (SELECT MAX(SALARIO) 
										FROM AGENDA);  /*Seleciona o maior salario/

SELECT TOP(1) Salario, nome from Agenda Order by salario;



SELECT  nome, salario 
From Agenda  
Where salario = (SELECT MAX(SALARIO) FROM AGENDA WHERE sexo = 'M') OR 
										salario = (SELECT MAX(SALARIO) FROM AGENDA WHERE sexo = 'F' );  /*Seleciona os maiores salarios masc e femininos da agenda*/


