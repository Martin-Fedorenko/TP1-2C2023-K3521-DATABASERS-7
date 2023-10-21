-- TP12C2023 K3521 DATABASERS 7

USE GD2C2023
GO

-- 1. INICIALIZACIÓN
/*
-- ELIMINO ESQUEMA ANTERIOR (NO SE PUEDE CORRER ESTO SI HAY TABLAS CREADAS)
IF (SCHEMA_ID('DATABASERS') IS NOT NULL)
	DROP SCHEMA DATABASERS
GO

-- CREO ESQUEMA DATABASERS
CREATE SCHEMA DATABASERS AUTHORIZATION DBO
GO
*/

-- ELIMINO TABLAS ANTERIORES
IF OBJECT_ID('DATABASERS.MONEDA', 'U') IS NOT NULL DROP TABLE DATABASERS.MONEDA
IF OBJECT_ID('DATABASERS.TIPO_INMUEBLE', 'U') IS NOT NULL DROP TABLE DATABASERS.TIPO_INMUEBLE	
IF OBJECT_ID('DATABASERS.ESTADO_INMUEBLE', 'U') IS NOT NULL DROP TABLE DATABASERS.ESTADO_INMUEBLE	
IF OBJECT_ID('DATABASERS.CANT_AMBIENTES_INMUEBLE', 'U') IS NOT NULL DROP TABLE DATABASERS.CANT_AMBIENTES_INMUEBLE	
IF OBJECT_ID('DATABASERS.DISPOSICION_INMUEBLE', 'U') IS NOT NULL DROP TABLE DATABASERS.DISPOSICION_INMUEBLE	
IF OBJECT_ID('DATABASERS.ORIENTACION_INMUEBLE', 'U') IS NOT NULL DROP TABLE DATABASERS.ORIENTACION_INMUEBLE	
IF OBJECT_ID('DATABASERS.CARACTERISTICA_INMUEBLE', 'U') IS NOT NULL DROP TABLE DATABASERS.CARACTERISTICA_INMUEBLE	
IF OBJECT_ID('DATABASERS.INMUEBLE_X_CARACTERISTICA', 'U') IS NOT NULL DROP TABLE DATABASERS.INMUEBLE_X_CARACTERISTICA	
IF OBJECT_ID('DATABASERS.INMUEBLE', 'U') IS NOT NULL DROP TABLE DATABASERS.INMUEBLE
IF OBJECT_ID('DATABASERS.PROPIETARIO', 'U') IS NOT NULL DROP TABLE DATABASERS.PROPIETARIO	
IF OBJECT_ID('DATABASERS.ALQUILER','U') IS NOT NULL DROP TABLE DATABASERS.ALQUILER
IF OBJECT_ID('DATABASERS.ESTADO_ALQUILER','U') IS NOT NULL DROP TABLE DATABASERS.ESTADO_ALQUILER
IF OBJECT_ID('DATABASERS.DETALLE','U') IS NOT NULL DROP TABLE DATABASERS.DETALLE
IF OBJECT_ID('DATABASERS.PAGO_ALQUILER','U') IS NOT NULL DROP TABLE DATABASERS.PAGO_ALQUILER 
IF OBJECT_ID('DATABASERS.INQUILINO','U') IS NOT NULL DROP TABLE DATABASERS.INQUILINO
IF OBJECT_ID('DATABASERS.BARRIO','U') IS NOT NULL DROP TABLE DATABASERS.BARRIO
IF OBJECT_ID('DATABASERS.LOCALIDAD','U') IS NOT NULL DROP DATABASERS.LOCALIDAD 
IF OBJECT_ID('DATABASERS.PROVINCIA','U') IS NOT NULL DROP DATABASERS.PROVINCIA 
GO

-- ELIMINO PROCEDIMIENTOS ANTERIORES
IF OBJECT_ID('DATABASERS.MIGRAR_MONEDA', 'P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_MONEDA
IF OBJECT_ID('DATABASERS.MIGRAR_TIPO_INMUEBLE', 'P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_TIPO_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_ESTADO_INMUEBLE', 'P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_ESTADO_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_CANT_AMBIENTES_INMUEBLE', 'P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_CANT_AMBIENTES_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_DISPOSICION_INMUEBLE', 'P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_DISPOSICION_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_ORIENTACION_INMUEBLE', 'P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_ORIENTACION_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_CARACTERISTICA_INMUEBLE', 'P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_CARACTERISTICA_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_INMUEBLE_X_CARACTERISTICA', 'P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_INMUEBLE_X_CARACTERISTICA	
IF OBJECT_ID('DATABASERS.MIGRAR_INMUEBLE', 'P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_PROPIETARIO', 'P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_PROPIETARIO	
IF OBJECT_ID('DATABASERS.MIGRAR_ALQUILER','P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_ALQUILER
IF OBJECT_ID('DATABASERS.MIGRAR_ESTADO_ALQUILER','P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_ESTADO_ALQUILER
IF OBJECT_ID('DATABASERS.MIGRAR_DETALLE','P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_DETALLE
IF OBJECT_ID('DATABASERS.MIGRAR_PAGO_ALQUILER','P') IS NOT NULL DROP TABLE DATABASERS.PAGO_ALQUILER 
IF OBJECT_ID('DATABASERS.MIGRAR_INQUILINO','P') IS NOT NULL DROP TABLE DATABASERS.INQUILINO
IF OBJECT_ID('DATABASERS.MIGRAR_BARRIO','P') IS NOT NULL DROP TABLE DATABASERS.BARRIO
IF OBJECT_ID('DATABASERS.MIGRAR_LOCALIDAD','P') IS NOT NULL DROP DATABASERS.LOCALIDAD 
IF OBJECT_ID('DATABASERS.MIGRAR_PROVINCIA','P') IS NOT NULL DROP DATABASERS.PROVINCIA 
-- 2. CREACION DE TABLAS

-- CREO TABLAS
CREATE TABLE DATABASERS.MONEDA
(
	MONEDA_CODIGO NUMERIC(3,0) IDENTITY PRIMARY KEY NOT NULL,
	MONEDA_DETALLE NVARCHAR(100) NULL
)
GO

CREATE TABLE DATABASERS.TIPO_INMUEBLE
(
	TIPO_INMUEBLE_CODIGO NUMERIC(3,0) IDENTITY PRIMARY KEY NOT NULL,
	TIPO_INMUEBLE_DETALLE NVARCHAR(100) NULL
)
GO

CREATE TABLE DATABASERS.ESTADO_INMUEBLE
(
	ESTADO_INMUEBLE_CODIGO NUMERIC(3,0) IDENTITY PRIMARY KEY NOT NULL,
	ESTADO_INMUEBLE_DETALLE NVARCHAR(100) NULL
)
GO

CREATE TABLE DATABASERS.CANT_AMBIENTES_INMUEBLE
(
	CANT_AMBIENTES_INMUEBLE_CODIGO NUMERIC(3,0) IDENTITY PRIMARY KEY NOT NULL,
	CANT_AMBIENTES_INMUEBLE_DETALLE NVARCHAR(100) NULL
)
GO

CREATE TABLE DATABASERS.DISPOSICION_INMUEBLE
(
	DISPOSICION_INMUEBLE_CODIGO NUMERIC(3,0) IDENTITY PRIMARY KEY NOT NULL,
	DISPOSICION_INMUEBLE_DETALLE NVARCHAR(100) NULL
)
GO

CREATE TABLE DATABASERS.ORIENTACION_INMUEBLE
(
	ORIENTACION_INMUEBLE_CODIGO NUMERIC(3,0) IDENTITY PRIMARY KEY NOT NULL,
	ORIENTACION_INMUEBLE_DETALLE NVARCHAR(100) NULL
)
GO

CREATE TABLE DATABASERS.CARACTERISTICA_INMUEBLE
(
	CARACTERISTICA_INMUEBLE_CODIGO NUMERIC(3,0) IDENTITY PRIMARY KEY NOT NULL,
	CARACTERISTICA_INMUEBLE_DETALLE NVARCHAR(100) NULL
)
GO

CREATE TABLE INMUEBLE_X_CARACTERISTICA (
   IXC_INMUEBLE_CODIGO NUMERIC(18,0) NOT NULL,
   IXC_CARACTERISTICA_CODIGO NUMERIC(3,0) NOT NULL,
   PRIMARY KEY (IXC_INMUEBLE_CODIGO, IXC_CARACTERISTICA_CODIGO)
)
GO

CREATE TABLE INMUEBLE (
	INMUEBLE_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	INMUEBLE_NOMBRE NVARCHAR(100) NULL,
	INMUEBLE_ANTIGUEDAD NUMERIC(18,0) NULL,
	INMUEBLE_EXPENSAS NUMERIC(18,2) NULL,
	INMUEBLE_CANT_AMBIENTES NUMERIC(3,0) NULL, --FK
	INMUEBLE_ORIENTACION NUMERIC(3,0) NULL, --FK
	INMUEBLE_DISPOSICION NUMERIC(3,0) NULL, --FK
	INMUEBLE_DESCRIPCION NVARCHAR(100) NULL,
	INMUEBLE_SUPERFICIETOTAL NUMERIC(18,2) NULL,
	INMUEBLE_TIPO_INMUEBLE NUMERIC(3,0) NULL, --FK
	INMUEBLE_BARRIO NUMERIC(3,0) NULL, --FK
	INMUEBLE_DIRECCION NVARCHAR(100) NULL,
	INMUEBLE_ESTADO NUMERIC(3,0) NULL --FK
)
GO

CREATE TABLE PROPIETARIO(
	PROPIETARIO_INMUEBLE NUMERIC(18,0) NOT NULL,
	PROPIETARIO_PERSONA NUMERIC(20,0) NOT NULL,
	PRIMARY KEY (PROPIETARIO_INMUEBLE, PROPIETARIO_PERSONA)
)
GO

CREATE TABLE ALQUILER(
	ALQUILER_CODIGO NUMERIC(18,0) NOT NULL
	ALQUILER_ANUNCIO NUMERIC (18,2) NULL
	ALQUILER_INQUILINO NUMERIC (20,0) NULL
	ALQUILER_ESTADO NUMERIC (2,0) NULL
	ALQUILER_FECHA_INICIO DATETIME NULL
	ALQUILER_FECHA_FIN DATETIME NULL
	ALQUILER_CANT_PERIODOS NUMERIC (18,0) NULL
	ALQUILER_DEPOSITO NUMERIC (18,2) NULL
	ALQUILER_COMISION NUMERIC (18,2) NULL
	ALQUILER_GASTOS_AVERIGUA NUMERIC (18,2) NULL
	PRIMARY KEY(ALQUILER_CODIGO)
)
GO

CREATE TABLE DETALLE(
	DETALLE_CODIGO NUMERIC(18,0) NOT NULL
	DETALLE_ALQUILER NUMERIC(18,0) NULL
	DETALLE_ALQ_NRO_PERIODO_INI NUMERIC(18,0) NULL
	DETALLE_ALQ_NRO_PERIODO_FIN NUMERIC(18,0) NULL
	DETALLE_ALQ_PRECIO NUMERIC(18,2) NULL
	PRIMARY KEY(DETALLE_CODIGO)
)
GO

CREATE TABLE ESTADO_ALQUILER(
	ESTADO_ALQUILER_CODIGO NUMERIC(2,0) NOT NULL
	ESTADO_ALQUILER_NOMBRE NVARCHAR(100) NULL
	PRIMARY KEY (ESTADO_ALQUILER_CODIGO)
)
GO

CREATE TABLE INQUILINO(
	INQUILINO_ALQUILER NUMERIC(18,0) NOT NULL
	INQUILINO_PERSONA NUMERIC(20,0) NOT NULL
	PRIMARY KEY(INQUILINO_ALQILER,INQUILINO_PERSONA)
)
GO

CREATE TABLE BARRIO(
	BARRIO_CODIGO NUMERIC(3,0) NOT NULL
	BARRIO_DETALLE NVARCHAR(100) NULL
	BARRIO_LOCALIDAD NUMERIC(3,0) NULL
	PRIMARY KEY(BARRIO_CODIGO)
)
GO

CREATE TABLE LOCALIDAD(
	LOCALIDAD_CODIGO NUMERIC(3,0) NOT NULL
	LOCALIDAD_DETALLE NVARCHAR(100) NULL
	LOCALIDAD_PROVINCIA NUMERIC (3,0) NULL
	PRIMARY KEY(LOCALIDAD_CODIGO)
)
GO

CREATE TABLE PROVINCIA(
	PROVINCIA_CODIGO NUMERIC(3,0) NOT NULL
	PROVINCIA_DETALLE NVARCHAR 100 NULL
	PRIMARY KEY(PROVINCIA_CODIGO)

)
GO

CREATE TABLE PAGO_ALQUILER(
	PAGO_ALQUILER_CODIGO NUMERIC(18,0) NOT NULL
	PAGO_ALQUILER_ALQUILER NUMERIC(18,2) NULL
	PAGO_ALQUILER_MEDIO_PAGO NVARCHAR 100 NULL
	PAGO_ALQUILER_NRO_PERIODO NUMERIC(18,0) NULL
	PAGO_ALQUILER_FECHA DATETIME NULL
	PAGO_ALQUILER_IMPORTE NUMERIC(18,2) NULL
	PAGO_ALQUILER_FECHA_VENCIMIENTO DATETIME NULL 
	PAGO_ALQUILER_DESC  NVARCHAR 100 NULL
	PAGO_ALQUILER_FEC_INI DATETIME NULL
	PAGO_ALQUILER_FEC_FIN DATETIME NULL
	PRIMARY KEY(PAGO_ALQUILER_CODIGO,PAGO_ALQUILER_ALQUILER)
)
GO

-------

CREATE TABLE INMUEBLE_X_CARACTERISTICA (
   IXC_INMUEBLE_CODIGO NUMERIC(18,0) NOT NULL,
   IXC_CARACTERISTICA_CODIGO NUMERIC(3,0) NOT NULL,
   PRIMARY KEY (INMUEBLE_CODIGO, CARACTERISTICA_CODIGO)
)
GO


-- 3. ADICIÓN DE FK A LAS TABLAS

-- FK INMUEBLE
ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_CANT_AMBIENTES) REFERENCES DATABASERS.CANT_AMBIENTES(CANT_AMBIENTES_CODIGO);

ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_ORIENTACION) REFERENCES DATABASERS.ORIENTACION(ORIENTACION_CODIGO);

ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_DISPOSICION) REFERENCES DATABASERS.DISPOSICION(DISPOSICION_CODIGO);

ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_TIPO_INMUEBLE) REFERENCES DATABASERS.TIPO_INMUEBLE(TIPO_INMUEBLE_CODIGO);

ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_BARRIO) REFERENCES DATABASERS.BARRIO(BARRIO_CODIGO);

ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_ESTADO) REFERENCES DATABASERS.ESTADO(ESTADO_CODIGO);

-- FK INMUEBLE X CARACTERISTICA

ALTER TABLE DATABASERS.INMUEBLE_X_CARACTERISTICA
ADD FOREIGN KEY (IXC_INMUEBLE_CODIGO) REFERENCES DATABASERS.INMUEBLE(INMUEBLE_CODIGO);

ALTER TABLE DATABASERS.INMUEBLE_X_CARACTERISTICA
ADD FOREIGN KEY (IXC_CARACTERISTICA_CODIGO) REFERENCES DATABASERS.CARACTERISTICA_INMUEBLE(CARACTERISTICA_INMUEBLE_CODIGO);

-- FK PROPIETARIO

ALTER TABLE DATABASERS.PROPIETARIO
ADD FOREIGN KEY (PROPIETARIO_INMUEBLE) REFERENCES DATABASERS.INMUEBLE(INMUEBLE_CODIGO);

ALTER TABLE DATABASERS.PROPIETARIO
ADD FOREIGN KEY (PROPIETARIO_PERSONA) REFERENCES DATABASERS.PERSONA(PERSONA_CODIGO);

-- 4. MIGRACIÓN DE TABLAS

-- PROCEDIMIENTOS

CREATE PROCEDURE MIGRAR_MONEDA
AS
BEGIN
	INSERT INTO DATABASERS.MONEDA
	SELECT DISTINCT ANUNCIO_MONEDA FROM gd_esquema.Maestra WHERE ANUNCIO_MONEDA IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_TIPO_INMUEBLE
AS
BEGIN
	INSERT INTO DATABASERS.TIPO_INMUEBLE
	SELECT DISTINCT INMUEBLE_TIPO_INMUEBLE FROM gd_esquema.Maestra WHERE INMUEBLE_TIPO_INMUEBLE IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_ESTADO_INMUEBLE
AS
BEGIN
	INSERT INTO DATABASERS.ESTADO_INMUEBLE
	SELECT DISTINCT INMUEBLE_ESTADO FROM gd_esquema.Maestra WHERE INMUEBLE_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_CANT_AMBIENTES_INMUEBLE
AS
BEGIN
	INSERT INTO DATABASERS.CANT_AMBIENTES_INMUEBLE
	SELECT DISTINCT INMUEBLE_CANT_AMBIENTES FROM gd_esquema.Maestra WHERE INMUEBLE_CANT_AMBIENTES IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_DISPOSICION_INMUEBLE
AS
BEGIN
	INSERT INTO DATABASERS.DISPOSICION_INMUEBLE
	SELECT DISTINCT INMUEBLE_DISPOSICION FROM gd_esquema.Maestra WHERE INMUEBLE_DISPOSICION IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_ORIENTACION_INMUEBLE
AS
BEGIN
	INSERT INTO DATABASERS.ORIENTACION_INMUEBLE
	SELECT DISTINCT INMUEBLE_ORIENTACION FROM gd_esquema.Maestra WHERE INMUEBLE_ORIENTACION IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_CARACTERISTICA_INMUEBLE
AS
BEGIN
	
	INSERT INTO DATABASERS.CARACTERISTICA_INMUEBLE (CARACTERISTICA_INMUEBLE_DETALLE)
	VALUES('WIFI'),
		('CABLE'),
		('CALEFACCION'),
		('GAS')
END
GO



SELECT DISTINCT INMUEBLE_CARACTERISTICA_CABLE FROM gd_esquema.Maestra

select column_name from information_schema.columns where table_schema = 'gd_esquema' and table_name = 'Maestra'

