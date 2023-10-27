-- TP12C2023 K3521 DATABASERS 7

USE GD2C2023
GO

-- 1. INICIALIZACI�N
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
IF OBJECT_ID('DATABASERS.LOCALIDAD','U') IS NOT NULL DROP TABLE DATABASERS.LOCALIDAD
IF OBJECT_ID('DATABASERS.PROVINCIA','U') IS NOT NULL DROP TABLE DATABASERS.PROVINCIA
IF OBJECT_ID('DATABASERS.ANUNCIO','U') IS NOT NULL DROP TABLE DATABASERS.ANUNCIO
IF OBJECT_ID('DATABASERS.ESTADO_ANUNCIO','U') IS NOT NULL DROP TABLE DATABASERS.ESTADO_ANUNCIO
IF OBJECT_ID('DATABASERS.TIPO_OPERACION','U') IS NOT NULL DROP TABLE DATABASERS.TIPO_OPERACION
IF OBJECT_ID('DATABASERS.AGENTE','U') IS NOT NULL DROP TABLE DATABASERS.AGENTE
IF OBJECT_ID('DATABASERS.SUCURSAL','U') IS NOT NULL DROP TABLE DATABASERS.SUCURSAL
IF OBJECT_ID('DATABASERS.TIPO_PERIODO','U') IS NOT NULL DROP TABLE DATABASERS.TIPO_PERIODO
    --ernes
IF OBJECT_ID('DATABASERS.PAGO_VENTA','U') IS NOT NULL DROP TABLE DATABASERS.PAGO_VENTA
IF OBJECT_ID('DATABASERS.VENTA','U') IS NOT NULL DROP TABLE DATABASERS.VENTA
IF OBJECT_ID('DATABASERS.COMPRADOR','U') IS NOT NULL DROP TABLE DATABASERS.COMPRADOR
IF OBJECT_ID('DATABASERS.PERSONA','U') IS NOT NULL DROP TABLE DATABASERS.PERSONA
IF OBJECT_ID('DATABASERS.MEDIO_PAGO','U') IS NOT NULL DROP TABLE DATABASERS.MEDIO_PAGO
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
IF OBJECT_ID('DATABASERS.MIGRAR_LOCALIDAD','P') IS NOT NULL DROP TABLE DATABASERS.LOCALIDAD 
IF OBJECT_ID('DATABASERS.MIGRAR_PROVINCIA','P') IS NOT NULL DROP TABLE DATABASERS.PROVINCIA
IF OBJECT_ID('DATABASERS.ANUNCIO','P') IS NOT NULL DROP TABLE DATABASERS.ANUNCIO
IF OBJECT_ID('DATABASERS.ESTADO_ANUNCIO','P') IS NOT NULL DROP TABLE DATABASERS.ESTADO_ANUNCIO
IF OBJECT_ID('DATABASERS.TIPO_OPERACION','P') IS NOT NULL DROP TABLE DATABASERS.TIPO_OPERACION
IF OBJECT_ID('DATABASERS.AGENTE','P') IS NOT NULL DROP TABLE DATABASERS.AGENTE
IF OBJECT_ID('DATABASERS.SUCURSAL','P') IS NOT NULL DROP TABLE DATABASERS.SUCURSAL
IF OBJECT_ID('DATABASERS.TIPO_PERIODO','P') IS NOT NULL DROP TABLE DATABASERS.TIPO_PERIODO
--ernes
IF OBJECT_ID('DATABASERS.MIGRAR_PAGO_VENTA','P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_PAGO_VENTA
IF OBJECT_ID('DATABASERS.MIGRAR_VENTA','P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_VENTA
IF OBJECT_ID('DATABASERS.MIGRAR_COMPRADOR','P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_COMPRADOR
IF OBJECT_ID('DATABASERS.MIGRAR_PERSONA','P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_PERSONA
IF OBJECT_ID('DATABASERS.MIGRAR_MEDIO_PAGO','P') IS NOT NULL DROP TABLE DATABASERS.MIGRAR_MEDIO_PAGO

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
	ALQUILER_CODIGO NUMERIC(18,0) NOT NULL,
	ALQUILER_ANUNCIO NUMERIC (18,2) NULL,
	ALQUILER_INQUILINO NUMERIC (20,0) NULL,
	ALQUILER_ESTADO NUMERIC (2,0) NULL,
	ALQUILER_FECHA_INICIO DATETIME NULL,
	ALQUILER_FECHA_FIN DATETIME NULL,
	ALQUILER_CANT_PERIODOS NUMERIC (18,0) NULL,
	ALQUILER_DEPOSITO NUMERIC (18,2) NULL,
	ALQUILER_COMISION NUMERIC (18,2) NULL,
	ALQUILER_GASTOS_AVERIGUA NUMERIC (18,2) NULL,
	PRIMARY KEY(ALQUILER_CODIGO)
)
GO

CREATE TABLE DETALLE(
	DETALLE_CODIGO NUMERIC(18,0) NOT NULL,
	DETALLE_ALQUILER NUMERIC(18,0) NULL,
	DETALLE_ALQ_NRO_PERIODO_INI NUMERIC(18,0) NULL,
	DETALLE_ALQ_NRO_PERIODO_FIN NUMERIC(18,0) NULL,
	DETALLE_ALQ_PRECIO NUMERIC(18,2) NULL,
	PRIMARY KEY(DETALLE_CODIGO)
)
GO

CREATE TABLE ESTADO_ALQUILER(
	ESTADO_ALQUILER_CODIGO NUMERIC(2,0) NOT NULL,
	ESTADO_ALQUILER_NOMBRE NVARCHAR(100) NULL,
	PRIMARY KEY (ESTADO_ALQUILER_CODIGO)
)
GO

CREATE TABLE INQUILINO(
	INQUILINO_ALQUILER NUMERIC(18,0) NOT NULL,
	INQUILINO_PERSONA NUMERIC(20,0) NOT NULL,
	PRIMARY KEY(INQUILINO_ALQUILER,INQUILINO_PERSONA)
)
GO

CREATE TABLE BARRIO(
	BARRIO_CODIGO NUMERIC(3,0) NOT NULL,
	BARRIO_DETALLE NVARCHAR(100) NULL,
	BARRIO_LOCALIDAD NUMERIC(3,0) NULL,
	PRIMARY KEY(BARRIO_CODIGO)
)
GO

CREATE TABLE LOCALIDAD(
	LOCALIDAD_CODIGO NUMERIC(3,0) NOT NULL,
	LOCALIDAD_DETALLE NVARCHAR(100) NULL,
	LOCALIDAD_PROVINCIA NUMERIC (3,0) NULL,
	PRIMARY KEY(LOCALIDAD_CODIGO)
)
GO

CREATE TABLE PROVINCIA(
	PROVINCIA_CODIGO NUMERIC(3,0) NOT NULL,
	PROVINCIA_DETALLE NVARCHAR(100) NULL,
	PRIMARY KEY(PROVINCIA_CODIGO)

)
GO

CREATE TABLE PAGO_ALQUILER(
	PAGO_ALQUILER_CODIGO NUMERIC(18,0) NOT NULL,
	PAGO_ALQUILER_ALQUILER NUMERIC(18,2) NOT NULL,
	PAGO_ALQUILER_MEDIO_PAGO NVARCHAR(100) NULL,
	PAGO_ALQUILER_NRO_PERIODO NUMERIC(18,0) NULL,
	PAGO_ALQUILER_FECHA DATETIME NULL,
	PAGO_ALQUILER_IMPORTE NUMERIC(18,2) NULL,
	PAGO_ALQUILER_FECHA_VENCIMIENTO DATETIME NULL, 
	PAGO_ALQUILER_DESC  NVARCHAR(100) NULL,
	PAGO_ALQUILER_FEC_INI DATETIME NULL,
	PAGO_ALQUILER_FEC_FIN DATETIME NULL,
	PRIMARY KEY(PAGO_ALQUILER_CODIGO,PAGO_ALQUILER_ALQUILER)
)
GO


CREATE TABLE DATABASERS.ANUNCIO(
	ANUNCIO_CODIGO NUMERIC(19,0) IDENTITY PRIMARY KEY NOT NULL,
	ANUNCIO_INMUEBLE NUMERIC(18,0) NULL,
	ANUNCIO_FECHA_PUBLICACION DATETIME NULL,
	ANUNCIO_PRECIO_PUBLICADO NUMERIC(18,2) NULL,
	ANUNCIO_COSTO_ANUNCIO NUMERIC(18,2) NULL,
	ANUNCIO_FECHA_FINALIZACION DATETIME NULL,
	ANUNCIO_TIPO_OPERACION NVARCHAR(100) NULL,
	ANUNCIO_MONEDA NUMERIC(3,0) NULL,
	ANUNCIO_ESTADO NUMERIC(2,0) NULL,
	ANUNCIO_TIPO_PERIODO NUMERIC(2,0) NULL,
	ANUNCIO_AGENTE NUMERIC(18,0) NULL
)
GO


CREATE TABLE DATABASERS.ESTADO_ANUNCIO(
	ESTADO_ANUNCIO_CODIGO NUMERIC(2,0) IDENTITY PRIMARY KEY NOT NULL,
	ESTADO_ANUNCIO_DETALLE NVARCHAR(100) NULL
)
GO

CREATE TABLE DATABASERS.TIPO_OPERACION(
	TIPO_OPERACION_CODIGO NUMERIC(3,0) IDENTITY PRIMARY KEY NOT NULL,
	TIPO_OPERACION_DETALLE NVARCHAR(100) NULL
)
GO

CREATE TABLE DATABASERS.AGENTE(
	AGENTE_SUCURSAL NUMERIC(18,0) NOT NULL,
	AGENTE_PERSONA NUMERIC(20,0) NOT NULL,
	PRIMARY KEY (AGENTE_SUCURSAL, AGENTE_PERSONA)
)
GO

CREATE TABLE DATABASERS.TIPO_PERIODO(
	TIPO_PERIODO_CODIGO NUMERIC(2,0) IDENTITY PRIMARY KEY NOT NULL,
	TIPO_PERIODO_DETALLE NVARCHAR(100) NULL
)
GO

CREATE TABLE DATABASERS.SUCURSAL(
	SUCURSAL_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	SUCURSAL_NOMBRE NVARCHAR(100) NULL,
	SUCURSAL_DIRECCION NVARCHAR(100) NULL,
	SUCURSAL_BARRIO NUMERIC(3,0) NULL
)
GO

-------

CREATE TABLE INMUEBLE_X_CARACTERISTICA (
   IXC_INMUEBLE_CODIGO NUMERIC(18,0) NOT NULL,
   IXC_CARACTERISTICA_CODIGO NUMERIC(3,0) NOT NULL,
   PRIMARY KEY (IXC_INMUEBLE_CODIGO, IXC_CARACTERISTICA_CODIGO)
)
GO

--ernes
CREATE TABLE DATABASERS.PAGO_VENTA (
    PAGO_VENTA_CODIGO NUMERIC(18,0) NOT NULL,
    PAGO_VENTA_VENTA NUMERIC(18,0) NOT NULL,
    PAGO_VENTA_IMPORTE NUMERIC(18,2) NULL,
    PAGO_VENTA_MONEDA NUMERIC(3,0) NULL,
    PAGO_VENTA_COTIZACION NUMERIC(18,2) NULL,
    PAGO_VENTA_MEDIO_PAGO NUMERIC(2,0) NULL,
    PRIMARY KEY (PAGO_VENTA_CODIGO, PAGO_VENTA_VENTA)
)
GO

CREATE TABLE DATABASERS.VENTA (
	VENTA_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	VENTA_ANUNCIO NUMERIC(19,0) NULL,
	VENTA_COMPRADOR NUMERIC(20,0) NULL,
	VENTA_MONEDA NUMERIC(3,0) NULL,
	VENTA_FECHA DATETIME NULL,
	VENTA_PRECIO_VENTA NUMERIC(18,2) NULL,
	VENTA_COMISION NUMERIC(18,2) NULL
)
GO
CREATE TABLE DATABASERS.COMPRADOR (
	COMPRADOR_VENTA NUMERIC(18,0) NOT NULL,
	COMPRADOR_PERSONA NUMERIC(20,0) NOT NULL,
	PRIMARY KEY (COMPRADOR_VENTA, COMPRADOR_PERSONA)
)
GO

CREATE TABLE DATABASERS.PERSONA (
	PERSONA_CODIGO NUMERIC(20,0) IDENTITY PRIMARY KEY NOT NULL,
	PERSONA_NOMBRE NVARCHAR(100) NULL,
	PERSONA_APELLIDO NVARCHAR(100) NULL,
	PERSONA_DNI NUMERIC(18,0) NULL,
	PERSONA_FECHA_REGISTRO DATETIME NULL,
	PERSONA_TELEFONO NUMERIC(18,0) NULL,
	PERSONA_MAIL NVARCHAR(100) NULL,
	PERSONA_FECHA_NAC DATETIME NULL
)
GO
CREATE TABLE DATABASERS.MEDIO_PAGO (
	MEDIO_PAGO_CODIGO NUMERIC(2,0) IDENTITY PRIMARY KEY NOT NULL,
	MEDIO_PAGO_NOMBRE NVARCHAR(100) NULL
)
GO


-- 3. ADICI�N DE FK A LAS TABLAS

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

--FK ANUNCIO

ALTER TABLE DATABASERS.ANUNCIO
ADD FOREIGN KEY (ANUNCIO_INMUEBLE) REFERENCES DATABASERS.INMUEBLE(INMUEBLE_CODIGO);

ALTER TABLE DATABASERS.ANUNCIO
ADD FOREIGN KEY (ANUNCIO_TIPO_OPERACION) REFERENCES DATABASERS.TIPO_OPERACION(TIPO_OPERACION_CODIGO);

ALTER TABLE DATABASERS.ANUNCIO
ADD FOREIGN KEY (ANUNCIO_MONEDA) REFERENCES DATABASERS.MONEDA(MONEDA_CODIGO);

ALTER TABLE DATABASERS.ANUNCIO
ADD FOREIGN KEY (ANUNCIO_ESTADO) REFERENCES DATABASERS.ESTADO_ANUNCIO(ESTADO_ANUNCIO_CODIGO);

ALTER TABLE DATABASERS.ANUNCIO
ADD FOREIGN KEY (ANUNCIO_TIPO_PERIODO) REFERENCES DATABASERS.TIPO_PERIODO(TIPO_PERIODO_CODIGO);

ALTER TABLE DATABASERS.ANUNCIO
ADD FOREIGN KEY (ANUNCIO_AGENTE) REFERENCES DATABASERS.AGENTE(AGENTE_PERSONA);

--FK Sucursal
ALTER TABLE DATABASERS.SUCURSAL
ADD FOREIGN KEY (SUCURSAL_BARRIO) REFERENCES DATABASERS.BARRIO(BARRIO_CODIGO);

--FK AGENTE
ALTER TABLE DATABASERS.AGENTE
ADD FOREIGN KEY (AGENTE_SUCURSAL) REFERENCES DATABASERS.SUCURSAL(SUCURSAL_CODIGO);

ALTER TABLE DATABASERS.AGENTE
ADD FOREIGN KEY (AGENTE_PERSONA) REFERENCES DATABASERS.PERSONA(PERSONA_CODIGO);

--ernes
-- FK PAGO_VENTA
ALTER TABLE DATABASERS.PAGO_VENTA
ADD FOREIGN KEY (PAGO_VENTA_VENTA) REFERENCES DATABASERS.VENTA(VENTA_CODIGO);
ALTER TABLE DATABASERS.PAGO_VENTA
ADD FOREIGN KEY (PAGO_VENTA_MONEDA) REFERENCES DATABASERS.MONEDA(MONEDA_CODIGO);
ALTER TABLE DATABASERS.PAGO_VENTA
ADD FOREIGN KEY (PAGO_VENTA_MEDIO_PAGO) REFERENCES DATABASERS.MEDIO_PAGO(MEDIO_PAGO_CODIGO);

-- FK VENTA
ALTER TABLE DATABASERS.VENTA
ADD FOREIGN KEY (VENTA_ANUNCIO) REFERENCES DATABASERS.ANUNCIO(ANUNCIO_CODIGO);
ALTER TABLE DATABASERS.VENTA --todo: chequear!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ADD FOREIGN KEY (VENTA_COMPRADOR) REFERENCES DATABASERS.COMPRADOR(COMPRADOR_PERSONA);
ALTER TABLE DATABASERS.VENTA
ADD FOREIGN KEY (VENTA_MONEDA) REFERENCES DATABASERS.MONEDA(MONEDA_CODIGO);

-- FK COMPRADOR
ALTER TABLE DATABASERS.COMPRADOR
ADD FOREIGN KEY (COMPRADOR_VENTA) REFERENCES DATABASERS.VENTA(VENTA_CODIGO);
ALTER TABLE DATABASERS.COMPRADOR
ADD FOREIGN KEY (COMPRADOR_PERSONA) REFERENCES DATABASERS.PERSONA(PERSONA_CODIGO);

-- 4. MIGRACI�N DE TABLAS

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

--BRISA Inmueble: POR SI QUERES CHEQUEAR
CREATE PROCEDURE MIGRAR_INMUEBLE
AS
BEGIN
	INSERT INTO DATABASERS.INMUEBLE
	SELECT INMUEBLE_NOMBRE,INMUEBLE_DESCRIPCION,INMUEBLE_DIRECCION,INMUEBLE_SUPERFICIETOTAL,INMUEBLE_ANTIGUEDAD,INMUEBLE_EXPESAS FROM gd_esquema.Maestra WHERE INMUEBLE_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_INMUEBLE_BARRIO
AS
BEGIN
	INSERT INTO DATABASERS.BARRIO
	SELECT DISTINCT INMUEBLE_BARRIO FROM gd_esquema.Maestra WHERE INMUEBLE_BARRIO IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_INMUEBLE_LOCALIDAD
AS
BEGIN
	INSERT INTO DATABASERS.LOCALIDAD
	SELECT DISTINCT INMUEBLE_LOCALIDAD FROM gd_esquema.Maestra WHERE INMUEBLE_LOCALIDAD IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_INMUEBLE_PROVINCIA
AS
BEGIN
	INSERT INTO DATABASERS.PROVINCIA
	SELECT DISTINCT INMUEBLE_PROVINCIA FROM gd_esquema.Maestra WHERE INMUEBLE_PROVINCIA IS NOT NULL
END
GO


--Procedimientos de Anuncio

CREATE PROCEDURE MIGRAR_ANUNCIO
AS
BEGIN
	INSERT INTO DATABASERS.ANUNCIO
	SELECT ANUNCIO_FECHA_PUBLICACION,ANUNCIO_PRECIO_PUBLICADO,ANUNCIO_COSTO_ANUNCIO,ANUNCIO_FECHA_FINALIZACION FROM gd_esquema.Maestra WHERE ANUNCIO_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_ESTADO_ANUNCIO
AS
BEGIN
	INSERT INTO DATABASERS.ESTADO_ANUNCIO
	SELECT DISTINCT ANUNCIO_ESTADO FROM gd_esquema.Maestra WHERE ANUNCIO_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_TIPO_OPERACION_ANUNCIO
AS
BEGIN
	INSERT INTO DATABASERS.TIPO_OPERACION
	SELECT DISTINCT ANUNCIO_TIPO_OPERACION FROM gd_esquema.Maestra WHERE ANUNCIO_TIPO_OPERACION IS NOT NULL
END
GO

CREATE PROCEDURE MIGRAR_TIPO_PERIODO_ANUNCIO
AS
BEGIN
	INSERT INTO DATABASERS.TIPO_PERIODO
	SELECT DISTINCT ANUNCIO_TIPO_PERIODO FROM gd_esquema.Maestra WHERE ANUNCIO_TIPO_PERIODO IS NOT NULL
END
GO

--Procedimientos de Sucursal
CREATE PROCEDURE MIGRAR_SUCURSAL
AS
BEGIN
	INSERT INTO DATABASERS.SUCURSAL
	SELECT SUCURSAL_NOMBRE,SUCURSAL_DIRECCION,SUCURSAL_TELEFONO FROM gd_esquema.Maestra WHERE SUCURSAL_CODIGO IS NOT NULL
END
GO

--FALTA SUCURSAL PROVINCIA Y LOCALIDAD, SUCURSAL TIENE ES BARRIO



--Procedimientos de Agente


--ernes
--todo procedures 

CREATE PROCEDURE MIGRAR_PERSONA
AS
BEGIN
	INSERT INTO DATABASERS.PERSONA (PERSONA_DNI,PERSONA_NOMBRE,PERSONA_APELLIDO,PERSONA_FECHA_REGISTRO,PERSONA_TELEFONO,PERSONA_MAIL,PERSONA_FECHA_NAC)
	SELECT 
	DISTINCT INQUILINO_DNI,INQUILINO_NOMBRE, 
	INQUILINO_APELLIDO,  INQUILINO_FECHA_REGISTRO,
	INQUILINO_TELEFONO,
	INQUILINO_MAIL, INQUILINO_FECHA_NAC 
	FROM gd_esquema.Maestra m WHERE INQUILINO_DNI IS NOT NULL AND NOT EXISTS (
        SELECT *
        FROM DATABASERS.PERSONA p
        WHERE p.PERSONA_DNI = m.INQUILINO_DNI
    )

	INSERT INTO DATABASERS.PERSONA (PERSONA_DNI,PERSONA_NOMBRE,PERSONA_APELLIDO,PERSONA_FECHA_REGISTRO,PERSONA_TELEFONO,PERSONA_MAIL,PERSONA_FECHA_NAC)
	SELECT 
	DISTINCT COMPRADOR_DNI,COMPRADOR_NOMBRE, 
	COMPRADOR_APELLIDO,  COMPRADOR_FECHA_REGISTRO,
	COMPRADOR_TELEFONO,
	COMPRADOR_MAIL, COMPRADOR_FECHA_NAC 
	FROM gd_esquema.Maestra m WHERE COMPRADOR_DNI IS NOT NULL AND NOT EXISTS (
        SELECT *
        FROM DATABASERS.PERSONA p
        WHERE p.PERSONA_DNI = m.COMPRADOR_DNI
    )

	INSERT INTO DATABASERS.PERSONA (PERSONA_DNI,PERSONA_NOMBRE,PERSONA_APELLIDO,PERSONA_FECHA_REGISTRO,PERSONA_TELEFONO,PERSONA_MAIL,PERSONA_FECHA_NAC)
	SELECT 
	DISTINCT PROPIETARIO_DNI,PROPIETARIO_NOMBRE, 
	PROPIETARIO_APELLIDO,  PROPIETARIO_FECHA_REGISTRO,
	PROPIETARIO_TELEFONO,
	PROPIETARIO_MAIL, PROPIETARIO_FECHA_NAC 
	FROM gd_esquema.Maestra m WHERE PROPIETARIO_DNI IS NOT NULL AND  NOT EXISTS (
        SELECT *
        FROM DATABASERS.PERSONA p
        WHERE p.PERSONA_DNI = m.PROPIETARIO_DNI
    ) 
	
	INSERT INTO DATABASERS.PERSONA (PERSONA_DNI,PERSONA_NOMBRE,PERSONA_APELLIDO,PERSONA_FECHA_REGISTRO,PERSONA_TELEFONO,PERSONA_MAIL,PERSONA_FECHA_NAC)
	SELECT 
	DISTINCT AGENTE_DNI,AGENTE_NOMBRE, 
	AGENTE_APELLIDO,  AGENTE_FECHA_REGISTRO,
	AGENTE_TELEFONO,
	AGENTE_MAIL, AGENTE_FECHA_NAC 
	FROM gd_esquema.Maestra m WHERE AGENTE_DNI IS NOT NULL AND  NOT EXISTS (
        SELECT *
        FROM DATABASERS.PERSONA p
        WHERE p.PERSONA_DNI = m.AGENTE_DNI
    ) 

	
END
GO

CREATE PROCEDURE MIGRAR_VENTA
AS
BEGIN
	--SET IDENTITY_INSERT VENTA ON; o cambiar el tipo identity de la pk??????
	INSERT INTO DATABASERS.VENTA (VENTA_CODIGO,VENTA_MONEDA,VENTA_FECHA,VENTA_PRECIO_VENTA,VENTA_COMISION,VENTA_COMPRADOR, VENTA_ANUNCIO)
	SELECT DISTINCT VENTA_CODIGO,VENTA_MONEDA, VENTA_FECHA, VENTA_PRECIO_VENTA, VENTA_COMISION, 
	PERSONA_CODIGO AS VENTA_COMPRADOR, ANUNCIO_CODIGO AS VENTA_ANUNCIO
	FROM gd_esquema.Maestra 
	JOIN DATABASERS.PERSONA ON PERSONA_DNI = COMPRADOR_DNI
	WHERE VENTA_CODIGO IS NOT NULL

END
GO