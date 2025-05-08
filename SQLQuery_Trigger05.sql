-- Seleciona o banco de dados Master (banco principal do SQL Server)
USE Master;

-- Verifica se o banco de dados "Fred" já existe e o exclui, se for o caso
IF DB_ID('Fred') IS NOT NULL
   DROP DATABASE Fred;
---------------------------------------------------------------------------------

-- Cria o banco de dados chamado "Fred"
CREATE DATABASE Fred;
GO
---------------------------------------------------------------------------------

-- Seleciona o banco de dados "Fred" para as próximas operações
USE Fred;
---------------------------------------------------------------------------------

-- Cria a tabela "cadfun" (Cadastro de Funcionários) com os campos:
-- CODFUN: Código do funcionário
-- NOME: Nome completo
-- DEPTO: Código do departamento
-- FUNCAO: Função ou cargo do funcionário
-- SALARIO: Salário com duas casas decimais
CREATE TABLE cadfun (
    CODFUN  NUMERIC,
    NOME    VARCHAR(40),
    DEPTO   VARCHAR(2),
    FUNCAO  VARCHAR(20),
    SALARIO DECIMAL(10,2)
);
GO
---------------------------------------------------------------------------------

-- Insere registros de funcionários na tabela "cadfun"
INSERT INTO cadfun VALUES (1,  'CARLOS ALBERTO',   '3', 'VENDEDOR'   , 1530.00);
INSERT INTO cadfun VALUES (2,  'MARCOS HENRIQUE',  '2', 'GERENTE'    , 1985.75);   
INSERT INTO cadfun VALUES (3,  'APARECIDA SILVA',  '3', 'SECRETARIO' , 1200.50);   
INSERT INTO cadfun VALUES (4,  'SILVANA PACHECO',  '5', 'SUPERVISOR' , 1599.51);   
INSERT INTO cadfun VALUES (5,  'MARCELO SOUZA',    '3', 'ANALISTA'   , 2250.11);   
INSERT INTO cadfun VALUES (6,  'MARISILVA NEVES',  '2', 'SECRETARIO' , 1200.50);   
INSERT INTO cadfun VALUES (7,  'WILSON DE MACEDO', '3', 'PROGRAMADOR', 1050.00);   
INSERT INTO cadfun VALUES (8,  'AUGUSTO SOUZA',    '3', 'PROGRAMADOR', 1050.00);   
INSERT INTO cadfun VALUES (9,  'CARLOS BASTOS',    '5', 'VENDEDOR'   , 1530.00);
INSERT INTO cadfun VALUES (10, 'SILVA SANTOS',     '3', 'SUPERVISOR' , 1599.51);
INSERT INTO cadfun VALUES (11, 'ANA BASTOS',       '5', 'VENDEDOR'   , 1530.00);   
INSERT INTO cadfun VALUES (12, 'PAULO DA SILVA',   '2', 'VENDEDOR'   , 1530.00);   
---------------------------------------------------------------------------------

-- Seleciona todos os registros da tabela "cadfun"
SELECT * FROM cadfun;

-- Exemplo de inserção de um novo funcionário teste
INSERT INTO cadfun
VALUES (99, 'Teste', '99', 'Testador', 9999.99);

-- Atualiza o nome do funcionário de código 99
UPDATE cadfun
SET NOME = 'Novo Teste'
WHERE codfun = 99;

-- Exclui o funcionário de código 99
DELETE FROM cadfun
WHERE codfun = 99;

---------------------------------------------------------------------------------

-- Cria uma trigger que imprime uma mensagem após inserções na tabela "cadfun"
CREATE TRIGGER mensagemI
ON cadfun
FOR INSERT
AS
PRINT 'Registro(s) incluído(s) com sucesso!';

-- Cria uma trigger que imprime uma mensagem após atualizações na tabela "cadfun"
CREATE TRIGGER mensagemU
ON cadfun
FOR UPDATE
AS
PRINT 'Registro(s) alterado(s) com sucesso!';

-- Cria uma trigger que imprime uma mensagem após exclusões na tabela "cadfun"
CREATE TRIGGER mensagemD
ON cadfun
FOR DELETE
AS
PRINT 'Registro(s) excluído(s) com sucesso!';

---------------------------------------------------------------------------------

-- Cria ou altera uma trigger que lida com INSERT, UPDATE e DELETE ao mesmo tempo
-- Imprime mensagens diferentes dependendo da operação realizada
CREATE OR ALTER TRIGGER mensagem
ON cadfun
FOR INSERT, UPDATE, DELETE
AS
IF EXISTS(SELECT * FROM inserted)
    IF EXISTS(SELECT * FROM deleted)
        PRINT 'Registro alterado com sucesso!';
    ELSE
        PRINT 'Registro incluído com sucesso!';
ELSE
    PRINT 'Registro excluído com sucesso!';

---------------------------------------------------------------------------------

-- Cria ou altera uma trigger chamada "controle" que, ao deletar algo da tabela "cadfun",
-- insere o registro deletado na tabela "morto" (log de exclusões)
CREATE OR ALTER TRIGGER controle
ON cadfun
FOR DELETE
AS
INSERT INTO morto SELECT * FROM deleted;

-- Exclui o funcionário de código 11
DELETE FROM cadfun WHERE codfun = 11;

-- Seleciona os registros da tabela "morto"
SELECT * FROM morto;

-- Restaura o funcionário excluído da tabela "morto" de volta para "cadfun"
INSERT INTO cadfun SELECT * FROM morto;
