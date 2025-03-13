create database BANCO;
go
use BANCO;

alter database BANCO MODIFY NAME = Agenda;

create table PESSOAL(
		OBSERVACAO varchar(200)
);

ALTER TABLE PESSOAL ALTER COLUMN OBSERVACAO VARCHAR(150);


DROP table PESSOAL;


Select * from Pessoal

