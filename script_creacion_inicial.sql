-- TP12C2023 K3521 DATABASERS 7

use GD2C2023
go

-- 1. Inicialización

-- Elimino esquema anterior
if (schema_id('DATABASERS') is not null)
	drop schema DATABASERS
go

-- Creo esquema DATABASERS
create schema DATABASERS authorization dbo
go

-- Elimino tablas anteriores
if object_id('DATABASERS.MONEDA', 'U') is not null drop table DATABASERS.MONEDA	
go

-- 2. Creacion de tablas

-- Creo tablas
create table DATABASERS.MONEDA
(
	MONEDA_CODIGO numeric(3,0) identity primary key not null,
	MONEDA_DETALLE varchar(100) null
)
go

select * from DATABASERS.MONEDA