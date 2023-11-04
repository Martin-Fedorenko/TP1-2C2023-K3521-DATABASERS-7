-- TP12C2023 K3521 DATABASERS 7

-- EJECUTAR TODO DESDE ACÁ

USE GD2C2023
GO

-- 1. INICIALIZACIÓN

-- ELIMINO ESQUEMA ANTERIOR (NO SE PUEDE CORRER ESTO SI HAY TABLAS CREADAS)
IF (SCHEMA_ID('DATABASERS') IS NULL)
BEGIN
	EXECUTE('CREATE SCHEMA DATABASERS AUTHORIZATION DBO')
END
ELSE 
	PRINT('EL ESQUEMA "DATABASERS" YA ESTA CREADO')
GO

-- PROCEDIMIENTO PARA ELIMINAR TABLAS ANTERIORES
CREATE PROCEDURE DATABASERS.ELIMINAR_TABLAS
AS
BEGIN
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
IF OBJECT_ID('DATABASERS.PAGO_VENTA','U') IS NOT NULL DROP TABLE DATABASERS.PAGO_VENTA
IF OBJECT_ID('DATABASERS.VENTA','U') IS NOT NULL DROP TABLE DATABASERS.VENTA
IF OBJECT_ID('DATABASERS.COMPRADOR','U') IS NOT NULL DROP TABLE DATABASERS.COMPRADOR
IF OBJECT_ID('DATABASERS.PERSONA','U') IS NOT NULL DROP TABLE DATABASERS.PERSONA
IF OBJECT_ID('DATABASERS.MEDIO_PAGO','U') IS NOT NULL DROP TABLE DATABASERS.MEDIO_PAGO
END
GO

-- PROCEDIMIENTO PARA ELIMINAR PROCEDIMIENTOS ANTERIORES
CREATE PROCEDURE DATABASERS.ELIMINAR_PROCEDIMIENTOS
AS
BEGIN
IF OBJECT_ID('DATABASERS.MIGRAR_MONEDA', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_MONEDA
IF OBJECT_ID('DATABASERS.MIGRAR_TIPO_INMUEBLE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_TIPO_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_ESTADO_INMUEBLE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_ESTADO_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_CANT_AMBIENTES_INMUEBLE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_CANT_AMBIENTES_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_DISPOSICION_INMUEBLE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_DISPOSICION_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_ORIENTACION_INMUEBLE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_ORIENTACION_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_CARACTERISTICA_INMUEBLE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_CARACTERISTICA_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_INMUEBLE_X_CARACTERISTICA', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_INMUEBLE_X_CARACTERISTICA
IF OBJECT_ID('DATABASERS.MIGRAR_INMUEBLE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_INMUEBLE
IF OBJECT_ID('DATABASERS.MIGRAR_PROPIETARIO', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_PROPIETARIO	
IF OBJECT_ID('DATABASERS.MIGRAR_ALQUILER','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_ALQUILER
IF OBJECT_ID('DATABASERS.MIGRAR_ESTADO_ALQUILER','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_ESTADO_ALQUILER
IF OBJECT_ID('DATABASERS.MIGRAR_DETALLE','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_DETALLE
IF OBJECT_ID('DATABASERS.MIGRAR_PAGO_ALQUILER','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_PAGO_ALQUILER 
IF OBJECT_ID('DATABASERS.MIGRAR_INQUILINO','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_INQUILINO
IF OBJECT_ID('DATABASERS.MIGRAR_BARRIO','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BARRIO
IF OBJECT_ID('DATABASERS.MIGRAR_LOCALIDAD','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_LOCALIDAD 
IF OBJECT_ID('DATABASERS.MIGRAR_PROVINCIA','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_PROVINCIA
IF OBJECT_ID('DATABASERS.MIGRAR_ANUNCIO','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_ANUNCIO
IF OBJECT_ID('DATABASERS.MIGRAR_ESTADO_ANUNCIO','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_ESTADO_ANUNCIO
IF OBJECT_ID('DATABASERS.MIGRAR_TIPO_OPERACION','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_TIPO_OPERACION
IF OBJECT_ID('DATABASERS.MIGRAR_AGENTE','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_AGENTE
IF OBJECT_ID('DATABASERS.MIGRAR_SUCURSAL','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_SUCURSAL
IF OBJECT_ID('DATABASERS.MIGRAR_TIPO_PERIODO','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_TIPO_PERIODO
IF OBJECT_ID('DATABASERS.MIGRAR_PAGO_VENTA','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_PAGO_VENTA
IF OBJECT_ID('DATABASERS.MIGRAR_VENTA','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_VENTA
IF OBJECT_ID('DATABASERS.MIGRAR_COMPRADOR','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_COMPRADOR
IF OBJECT_ID('DATABASERS.MIGRAR_PERSONA','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_PERSONA
IF OBJECT_ID('DATABASERS.MIGRAR_TIPO_OPERACION_ANUNCIO','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_TIPO_OPERACION_ANUNCIO
IF OBJECT_ID('DATABASERS.MIGRAR_TIPO_PERIODO_ANUNCIO','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_TIPO_PERIODO_ANUNCIO
IF OBJECT_ID('DATABASERS.MIGRAR_MEDIO_PAGO','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_MEDIO_PAGO
IF OBJECT_ID('DATABASERS.MIGRAR_MAESTRA','P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_MAESTRA
END
GO

-- PROCEDIMIENTO PARA ELIMINAR CREAR TABLAS Y AGREGAR FK ANTERIORES
CREATE PROCEDURE DATABASERS.ELIMINAR_CREAR_TABLAS
AS
BEGIN
IF OBJECT_ID('DATABASERS.CREAR_TABLAS','P') IS NOT NULL DROP PROCEDURE DATABASERS.CREAR_TABLAS
IF OBJECT_ID('DATABASERS.AGREGAR_FK','P') IS NOT NULL DROP PROCEDURE DATABASERS.AGREGAR_FK
END
GO

-- 2. CREACION DE TABLAS

-- CREO TABLAS
CREATE PROCEDURE DATABASERS.CREAR_TABLAS
AS
BEGIN
CREATE TABLE DATABASERS.MONEDA
(
	MONEDA_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	MONEDA_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.TIPO_INMUEBLE
(
	TIPO_INMUEBLE_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	TIPO_INMUEBLE_DETALLE NVARCHAR(100) NULL,
)

CREATE TABLE DATABASERS.ESTADO_INMUEBLE
(
	ESTADO_INMUEBLE_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	ESTADO_INMUEBLE_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.CANT_AMBIENTES_INMUEBLE
(
	CANT_AMBIENTES_INMUEBLE_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	CANT_AMBIENTES_INMUEBLE_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.DISPOSICION_INMUEBLE
(
	DISPOSICION_INMUEBLE_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	DISPOSICION_INMUEBLE_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.ORIENTACION_INMUEBLE
(
	ORIENTACION_INMUEBLE_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	ORIENTACION_INMUEBLE_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.CARACTERISTICA_INMUEBLE
(
	CARACTERISTICA_INMUEBLE_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	CARACTERISTICA_INMUEBLE_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.INMUEBLE_X_CARACTERISTICA (
   IXC_INMUEBLE_CODIGO NUMERIC(18,0) NOT NULL,
   IXC_CARACTERISTICA_CODIGO NUMERIC(18,0) NOT NULL,
   PRIMARY KEY (IXC_INMUEBLE_CODIGO, IXC_CARACTERISTICA_CODIGO)
)

CREATE TABLE DATABASERS.INMUEBLE (
	INMUEBLE_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	INMUEBLE_NOMBRE NVARCHAR(100) NULL,
	INMUEBLE_ANTIGUEDAD NUMERIC(18,0) NULL,
	INMUEBLE_EXPENSAS NUMERIC(18,2) NULL,
	INMUEBLE_CANT_AMBIENTES NUMERIC(18,0) NULL, --FK
	INMUEBLE_ORIENTACION NUMERIC(18,0) NULL, --FK
	INMUEBLE_DISPOSICION NUMERIC(18,0) NULL, --FK
	INMUEBLE_DESCRIPCION NVARCHAR(100) NULL,
	INMUEBLE_SUPERFICIETOTAL NUMERIC(18,2) NULL,
	INMUEBLE_TIPO_INMUEBLE NUMERIC(18,0) NULL, --FK
	INMUEBLE_BARRIO NUMERIC(18,0) NULL, --FK
	INMUEBLE_DIRECCION NVARCHAR(100) NULL,
	INMUEBLE_ESTADO NUMERIC(18,0) NULL --FK
)

CREATE TABLE DATABASERS.PROPIETARIO(
	PROPIETARIO_INMUEBLE NUMERIC(18,0) NOT NULL,
	PROPIETARIO_PERSONA NUMERIC(20,0) NOT NULL,
	PRIMARY KEY (PROPIETARIO_INMUEBLE, PROPIETARIO_PERSONA)
)

CREATE TABLE DATABASERS.ALQUILER(
	ALQUILER_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	ALQUILER_ANUNCIO NUMERIC(19,0) NULL,
	ALQUILER_ESTADO NUMERIC (18,0) NULL,
	ALQUILER_FECHA_INICIO DATETIME NULL,
	ALQUILER_FECHA_FIN DATETIME NULL,
	ALQUILER_CANT_PERIODOS NUMERIC (18,0) NULL,
	ALQUILER_DEPOSITO NUMERIC (18,2) NULL,
	ALQUILER_COMISION NUMERIC (18,2) NULL,
	ALQUILER_GASTOS_AVERIGUA NUMERIC (18,2) NULL,
)

CREATE TABLE DATABASERS.DETALLE(
	DETALLE_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	DETALLE_ALQUILER NUMERIC(18,0) NULL,
	DETALLE_ALQ_NRO_PERIODO_INI NUMERIC(18,0) NULL,
	DETALLE_ALQ_NRO_PERIODO_FIN NUMERIC(18,0) NULL,
	DETALLE_ALQ_PRECIO NUMERIC(18,2) NULL,
)

CREATE TABLE DATABASERS.ESTADO_ALQUILER(
	ESTADO_ALQUILER_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	ESTADO_ALQUILER_NOMBRE NVARCHAR(100) NULL,
)

CREATE TABLE DATABASERS.INQUILINO(
	INQUILINO_ALQUILER NUMERIC(18,0) NOT NULL,
	INQUILINO_PERSONA NUMERIC(20,0) NOT NULL,
	PRIMARY KEY(INQUILINO_ALQUILER,INQUILINO_PERSONA)
)

CREATE TABLE DATABASERS.BARRIO(
	BARRIO_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY  NOT NULL,
	BARRIO_DETALLE NVARCHAR(100) NULL,
	BARRIO_LOCALIDAD NUMERIC(18,0) NULL,
)

CREATE TABLE DATABASERS.LOCALIDAD(
	LOCALIDAD_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY  NOT NULL,
	LOCALIDAD_DETALLE NVARCHAR(100) NULL,
	LOCALIDAD_PROVINCIA NUMERIC (18,0) NULL,
)

CREATE TABLE DATABASERS.PROVINCIA(
	PROVINCIA_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	PROVINCIA_DETALLE NVARCHAR(100) NULL,
)

CREATE TABLE DATABASERS.PAGO_ALQUILER(
	PAGO_ALQUILER_CODIGO NUMERIC(18,0) IDENTITY NOT NULL,
	PAGO_ALQUILER_ALQUILER NUMERIC(18,2) NOT NULL,
	PAGO_ALQUILER_MEDIO_PAGO NVARCHAR(100) NULL,
	PAGO_ALQUILER_NRO_PERIODO NUMERIC(18,0) NULL,
	PAGO_ALQUILER_FECHA DATETIME NULL,
	PAGO_ALQUILER_IMPORTE NUMERIC(18,2) NULL,
	PAGO_ALQUILER_FECHA_VENCIMIENTO DATETIME NULL, 
	PAGO_ALQUILER_DESC  NVARCHAR(100) NULL,
	PAGO_ALQUILER_FEC_INI DATETIME NULL,
	PAGO_ALQUILER_FEC_FIN DATETIME NULL,
	PRIMARY KEY (PAGO_ALQUILER_CODIGO,PAGO_ALQUILER_ALQUILER)
)

CREATE TABLE DATABASERS.ANUNCIO(
	ANUNCIO_CODIGO NUMERIC(19,0) IDENTITY PRIMARY KEY NOT NULL,
	ANUNCIO_INMUEBLE NUMERIC(18,0) NULL,
	ANUNCIO_FECHA_PUBLICACION DATETIME NULL,
	ANUNCIO_PRECIO_PUBLICADO NUMERIC(18,2) NULL,
	ANUNCIO_COSTO_ANUNCIO NUMERIC(18,2) NULL,
	ANUNCIO_FECHA_FINALIZACION DATETIME NULL,
	ANUNCIO_TIPO_OPERACION NUMERIC(18,0) NULL,
	ANUNCIO_MONEDA NUMERIC(18,0) NULL,
	ANUNCIO_ESTADO NUMERIC(18,0) NULL,
	ANUNCIO_TIPO_PERIODO NUMERIC(18,0) NULL,
	ANUNCIO_AGENTE NUMERIC(20,0) NULL,
	ANUNCIO_SUCURSAL NUMERIC(18,0) NULL
)

CREATE TABLE DATABASERS.ESTADO_ANUNCIO(
	ESTADO_ANUNCIO_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	ESTADO_ANUNCIO_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.TIPO_OPERACION(
	TIPO_OPERACION_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	TIPO_OPERACION_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.AGENTE(
	AGENTE_SUCURSAL NUMERIC(18,0) NOT NULL,
	AGENTE_PERSONA NUMERIC(20,0) NOT NULL,
	PRIMARY KEY (AGENTE_SUCURSAL, AGENTE_PERSONA)
)

CREATE TABLE DATABASERS.TIPO_PERIODO(
	TIPO_PERIODO_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	TIPO_PERIODO_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.SUCURSAL(
	SUCURSAL_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	SUCURSAL_NOMBRE NVARCHAR(100) NULL,
	SUCURSAL_DIRECCION NVARCHAR(100) NULL,
	SUCURSAL_LOCALIDAD NUMERIC(18,0) NULL,
	SUCURSAL_TELEFONO NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.PAGO_VENTA (
    PAGO_VENTA_CODIGO NUMERIC(18,0) IDENTITY NOT NULL,
    PAGO_VENTA_VENTA NUMERIC(18,0) NOT NULL,
    PAGO_VENTA_IMPORTE NUMERIC(18,2) NULL,
    PAGO_VENTA_MONEDA NUMERIC(18,0) NULL,
    PAGO_VENTA_COTIZACION NUMERIC(18,2) NULL,
    PAGO_VENTA_MEDIO_PAGO NUMERIC(18,0) NULL,
    PRIMARY KEY (PAGO_VENTA_CODIGO, PAGO_VENTA_VENTA)
)

CREATE TABLE DATABASERS.VENTA (
	VENTA_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	VENTA_ANUNCIO NUMERIC(19,0) NULL,
	VENTA_MONEDA NUMERIC(18,0) NULL,
	VENTA_FECHA DATETIME NULL,
	VENTA_PRECIO_VENTA NUMERIC(18,2) NULL,
	VENTA_COMISION NUMERIC(18,2) NULL
)

CREATE TABLE DATABASERS.COMPRADOR (
	COMPRADOR_VENTA NUMERIC(18,0) NOT NULL,
	COMPRADOR_PERSONA NUMERIC(20,0) NOT NULL,
	PRIMARY KEY (COMPRADOR_VENTA, COMPRADOR_PERSONA)
)

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

CREATE TABLE DATABASERS.MEDIO_PAGO (
	MEDIO_PAGO_CODIGO NUMERIC(18,0) IDENTITY PRIMARY KEY NOT NULL,
	MEDIO_PAGO_NOMBRE NVARCHAR(100) NULL
)
END
GO

-- 3. ADICIÓN DE FK A LAS TABLAS

CREATE PROCEDURE DATABASERS.AGREGAR_FK
AS
BEGIN

--FK ALQUILER 
ALTER TABLE DATABASERS.ALQUILER
ADD FOREIGN KEY (ALQUILER_ANUNCIO) REFERENCES DATABASERS.ANUNCIO(ANUNCIO_CODIGO);

ALTER TABLE DATABASERS.ALQUILER
ADD FOREIGN KEY (ALQUILER_ESTADO) REFERENCES DATABASERS.ESTADO_ALQUILER(ESTADO_ALQUILER_CODIGO);

-- FK INMUEBLE
ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_CANT_AMBIENTES) REFERENCES DATABASERS.CANT_AMBIENTES_INMUEBLE(CANT_AMBIENTES_INMUEBLE_CODIGO);

ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_ORIENTACION) REFERENCES DATABASERS.ORIENTACION_INMUEBLE(ORIENTACION_INMUEBLE_CODIGO);

ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_DISPOSICION) REFERENCES DATABASERS.DISPOSICION_INMUEBLE(DISPOSICION_INMUEBLE_CODIGO);

ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_TIPO_INMUEBLE) REFERENCES DATABASERS.TIPO_INMUEBLE(TIPO_INMUEBLE_CODIGO);

ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_BARRIO) REFERENCES DATABASERS.BARRIO(BARRIO_CODIGO);

ALTER TABLE DATABASERS.INMUEBLE
ADD FOREIGN KEY (INMUEBLE_ESTADO) REFERENCES DATABASERS.ESTADO_INMUEBLE(ESTADO_INMUEBLE_CODIGO);

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
ADD FOREIGN KEY (ANUNCIO_SUCURSAL, ANUNCIO_AGENTE) REFERENCES DATABASERS.AGENTE(AGENTE_SUCURSAL, AGENTE_PERSONA);

--FK SUCURSAL
ALTER TABLE DATABASERS.SUCURSAL
ADD FOREIGN KEY (SUCURSAL_LOCALIDAD) REFERENCES DATABASERS.LOCALIDAD(LOCALIDAD_CODIGO);

--FK AGENTE
ALTER TABLE DATABASERS.AGENTE
ADD FOREIGN KEY (AGENTE_SUCURSAL) REFERENCES DATABASERS.SUCURSAL(SUCURSAL_CODIGO);

ALTER TABLE DATABASERS.AGENTE
ADD FOREIGN KEY (AGENTE_PERSONA) REFERENCES DATABASERS.PERSONA(PERSONA_CODIGO);

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

ALTER TABLE DATABASERS.VENTA
ADD FOREIGN KEY (VENTA_MONEDA) REFERENCES DATABASERS.MONEDA(MONEDA_CODIGO);

-- FK COMPRADOR
ALTER TABLE DATABASERS.COMPRADOR
ADD FOREIGN KEY (COMPRADOR_VENTA) REFERENCES DATABASERS.VENTA(VENTA_CODIGO);

ALTER TABLE DATABASERS.COMPRADOR
ADD FOREIGN KEY (COMPRADOR_PERSONA) REFERENCES DATABASERS.PERSONA(PERSONA_CODIGO);

-- FK INQUILINO
ALTER TABLE DATABASERS.INQUILINO
ADD FOREIGN KEY (INQUILINO_ALQUILER) REFERENCES DATABASERS.ALQUILER(ALQUILER_CODIGO);

ALTER TABLE DATABASERS.INQUILINO
ADD FOREIGN KEY (INQUILINO_PERSONA) REFERENCES DATABASERS.PERSONA(PERSONA_CODIGO);

END
GO

-- 4. MIGRACIÓN DE TABLAS

-- PROCEDIMIENTOS

-- PROCEDIMIENTOS DE INMUEBLES Y RELACIONADOS
CREATE PROCEDURE DATABASERS.MIGRAR_TIPO_INMUEBLE --DONE
AS
BEGIN
	INSERT INTO DATABASERS.TIPO_INMUEBLE
	SELECT DISTINCT INMUEBLE_TIPO_INMUEBLE FROM gd_esquema.Maestra WHERE INMUEBLE_TIPO_INMUEBLE IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_ESTADO_INMUEBLE --DONE
AS
BEGIN
	INSERT INTO DATABASERS.ESTADO_INMUEBLE
	SELECT DISTINCT INMUEBLE_ESTADO FROM gd_esquema.Maestra WHERE INMUEBLE_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_CANT_AMBIENTES_INMUEBLE --DONE
AS
BEGIN
	INSERT INTO DATABASERS.CANT_AMBIENTES_INMUEBLE
	SELECT DISTINCT INMUEBLE_CANT_AMBIENTES FROM gd_esquema.Maestra WHERE INMUEBLE_CANT_AMBIENTES IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_DISPOSICION_INMUEBLE --DONE
AS
BEGIN
	INSERT INTO DATABASERS.DISPOSICION_INMUEBLE
	SELECT DISTINCT INMUEBLE_DISPOSICION FROM gd_esquema.Maestra WHERE INMUEBLE_DISPOSICION IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_ORIENTACION_INMUEBLE --DONE
AS
BEGIN
	INSERT INTO DATABASERS.ORIENTACION_INMUEBLE
	SELECT DISTINCT INMUEBLE_ORIENTACION FROM gd_esquema.Maestra WHERE INMUEBLE_ORIENTACION IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_CARACTERISTICA_INMUEBLE --DONE
AS
BEGIN
	
	INSERT INTO DATABASERS.CARACTERISTICA_INMUEBLE (CARACTERISTICA_INMUEBLE_DETALLE)
	VALUES('WIFI'),
		('CABLE'),
		('CALEFACCION'),
		('GAS')
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_INMUEBLE_X_CARACTERISTICA  --DONE
AS
BEGIN
	
	INSERT INTO DATABASERS.INMUEBLE_X_CARACTERISTICA

	SELECT DISTINCT INMUEBLE_CODIGO, CARACTERISTICA_INMUEBLE_CODIGO 
	FROM gd_esquema.Maestra
	JOIN DATABASERS.CARACTERISTICA_INMUEBLE ON INMUEBLE_CARACTERISTICA_WIFI = 1
	WHERE INMUEBLE_CODIGO IS NOT NULL AND CARACTERISTICA_INMUEBLE_CODIGO = 1

	UNION

	SELECT DISTINCT INMUEBLE_CODIGO, CARACTERISTICA_INMUEBLE_CODIGO 
	FROM gd_esquema.Maestra
	JOIN DATABASERS.CARACTERISTICA_INMUEBLE ON INMUEBLE_CARACTERISTICA_CABLE = 1
	WHERE INMUEBLE_CODIGO IS NOT NULL AND CARACTERISTICA_INMUEBLE_CODIGO = 2

	UNION

	SELECT DISTINCT INMUEBLE_CODIGO, CARACTERISTICA_INMUEBLE_CODIGO 
	FROM gd_esquema.Maestra
	JOIN DATABASERS.CARACTERISTICA_INMUEBLE ON INMUEBLE_CARACTERISTICA_CALEFACCION = 1
	WHERE INMUEBLE_CODIGO IS NOT NULL AND CARACTERISTICA_INMUEBLE_CODIGO = 3

	UNION

	SELECT DISTINCT INMUEBLE_CODIGO, CARACTERISTICA_INMUEBLE_CODIGO
	FROM gd_esquema.Maestra
	JOIN DATABASERS.CARACTERISTICA_INMUEBLE ON INMUEBLE_CARACTERISTICA_GAS = 1
	WHERE INMUEBLE_CODIGO IS NOT NULL AND CARACTERISTICA_INMUEBLE_CODIGO = 4
	
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_INMUEBLE --DONE
AS
BEGIN
	DECLARE @INMUEBLE_CODIGO NUMERIC(18,0)
	DECLARE @INMUEBLE_NOMBRE NVARCHAR(100)
	DECLARE @INMUEBLE_ANTIGUEDAD NUMERIC(18,0)
	DECLARE @INMUEBLE_EXPENSAS NUMERIC(18,2)
	DECLARE @INMUEBLE_CANT_AMBIENTES NUMERIC(18,0)
	DECLARE @INMUEBLE_ORIENTACION NUMERIC(18,0)
	DECLARE @INMUEBLE_DISPOSICION NUMERIC(18,0)
	DECLARE @INMUEBLE_DESCRIPCION NVARCHAR(100)
	DECLARE @INMUEBLE_SUPERFICIETOTAL NUMERIC(18,2)
	DECLARE @INMUEBLE_TIPO_INMUEBLE NUMERIC(18,0)
	DECLARE @INMUEBLE_DIRECCION NVARCHAR(100)
	DECLARE @INMUEBLE_ESTADO NUMERIC(18,0)
	DECLARE @INMUEBLE_BARRIO NVARCHAR(100)
	DECLARE @INMUEBLE_LOCALIDAD NVARCHAR(100)
	DECLARE @INMUEBLE_PROVINCIA NVARCHAR(100)
	DECLARE @BARRIO_DEFINITIVO NUMERIC(18,0)

	SET IDENTITY_INSERT DATABASERS.INMUEBLE ON

	DECLARE CURSOR_INMUEBLE CURSOR FOR  
	SELECT DISTINCT INMUEBLE_CODIGO, INMUEBLE_NOMBRE, INMUEBLE_ANTIGUEDAD, INMUEBLE_EXPESAS,
	CANT_AMBIENTES_INMUEBLE_CODIGO, ORIENTACION_INMUEBLE_CODIGO, DISPOSICION_INMUEBLE_CODIGO,
	INMUEBLE_DESCRIPCION, INMUEBLE_SUPERFICIETOTAL, TIPO_INMUEBLE_CODIGO, INMUEBLE_DIRECCION, 
	ESTADO_INMUEBLE_CODIGO, INMUEBLE_BARRIO, INMUEBLE_LOCALIDAD, INMUEBLE_PROVINCIA
	FROM gd_esquema.Maestra 
	JOIN DATABASERS.ORIENTACION_INMUEBLE ON INMUEBLE_ORIENTACION = ORIENTACION_INMUEBLE_DETALLE
	JOIN DATABASERS.DISPOSICION_INMUEBLE ON INMUEBLE_DISPOSICION = DISPOSICION_INMUEBLE_DETALLE
	JOIN DATABASERS.CANT_AMBIENTES_INMUEBLE ON INMUEBLE_CANT_AMBIENTES = CANT_AMBIENTES_INMUEBLE_DETALLE
	JOIN DATABASERS.TIPO_INMUEBLE ON INMUEBLE_TIPO_INMUEBLE = TIPO_INMUEBLE_DETALLE
	JOIN DATABASERS.ESTADO_INMUEBLE ON INMUEBLE_ESTADO = ESTADO_INMUEBLE_DETALLE

	OPEN CURSOR_INMUEBLE
	FETCH NEXT FROM CURSOR_INMUEBLE INTO @INMUEBLE_CODIGO, @INMUEBLE_NOMBRE, @INMUEBLE_ANTIGUEDAD, 
	@INMUEBLE_EXPENSAS, @INMUEBLE_CANT_AMBIENTES, @INMUEBLE_ORIENTACION, @INMUEBLE_DISPOSICION, 
	@INMUEBLE_DESCRIPCION, @INMUEBLE_SUPERFICIETOTAL, @INMUEBLE_TIPO_INMUEBLE, @INMUEBLE_DIRECCION, 
	@INMUEBLE_ESTADO, @INMUEBLE_BARRIO, @INMUEBLE_LOCALIDAD, @INMUEBLE_PROVINCIA
	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		SELECT @BARRIO_DEFINITIVO = BARRIO_CODIGO FROM DATABASERS.BARRIO 
		JOIN DATABASERS.LOCALIDAD ON BARRIO_LOCALIDAD = LOCALIDAD_CODIGO
		JOIN DATABASERS.PROVINCIA ON LOCALIDAD_PROVINCIA = PROVINCIA_CODIGO
		WHERE BARRIO_DETALLE = @INMUEBLE_BARRIO AND LOCALIDAD_DETALLE = @INMUEBLE_LOCALIDAD AND PROVINCIA_DETALLE = @INMUEBLE_PROVINCIA

		INSERT INTO DATABASERS.INMUEBLE (INMUEBLE_CODIGO, INMUEBLE_NOMBRE, INMUEBLE_ANTIGUEDAD,
		INMUEBLE_EXPENSAS, INMUEBLE_CANT_AMBIENTES, INMUEBLE_ORIENTACION, INMUEBLE_DISPOSICION,
		INMUEBLE_DESCRIPCION, INMUEBLE_SUPERFICIETOTAL, INMUEBLE_TIPO_INMUEBLE, INMUEBLE_DIRECCION,
		INMUEBLE_ESTADO, INMUEBLE_BARRIO)
		VALUES (@INMUEBLE_CODIGO, @INMUEBLE_NOMBRE, @INMUEBLE_ANTIGUEDAD, 
		@INMUEBLE_EXPENSAS, @INMUEBLE_CANT_AMBIENTES, @INMUEBLE_ORIENTACION, @INMUEBLE_DISPOSICION, 
		@INMUEBLE_DESCRIPCION, @INMUEBLE_SUPERFICIETOTAL, @INMUEBLE_TIPO_INMUEBLE, @INMUEBLE_DIRECCION, 
		@INMUEBLE_ESTADO, @BARRIO_DEFINITIVO)

		FETCH NEXT FROM CURSOR_INMUEBLE INTO @INMUEBLE_CODIGO, @INMUEBLE_NOMBRE, @INMUEBLE_ANTIGUEDAD, 
		@INMUEBLE_EXPENSAS, @INMUEBLE_CANT_AMBIENTES, @INMUEBLE_ORIENTACION, @INMUEBLE_DISPOSICION, 
		@INMUEBLE_DESCRIPCION, @INMUEBLE_SUPERFICIETOTAL, @INMUEBLE_TIPO_INMUEBLE, @INMUEBLE_DIRECCION, 
		@INMUEBLE_ESTADO, @INMUEBLE_BARRIO, @INMUEBLE_LOCALIDAD, @INMUEBLE_PROVINCIA
	END
	CLOSE CURSOR_INMUEBLE
	DEALLOCATE CURSOR_INMUEBLE

	SET IDENTITY_INSERT DATABASERS.INMUEBLE OFF;
END
GO

--PROCEDIMIENTOS DE ANUNCIOS
CREATE PROCEDURE DATABASERS.MIGRAR_ANUNCIO --DONE
AS
BEGIN
	DECLARE @ANUNCIO_CODIGO NUMERIC(19,0)
	DECLARE @ANUNCIO_INMUEBLE NUMERIC(18,0)
	DECLARE @ANUNCIO_FECHA_PUBLICACION DATETIME
	DECLARE @ANUNCIO_PRECIO_PUBLICADO NUMERIC(18,2)
	DECLARE @ANUNCIO_COSTO_ANUNCIO NUMERIC(18,2)
	DECLARE @ANUNCIO_FECHA_FINALIZACION DATETIME
	DECLARE @ANUNCIO_TIPO_OPERACION NUMERIC(18,0)
	DECLARE @ANUNCIO_MONEDA NUMERIC(18,0)
	DECLARE @ANUNCIO_ESTADO NUMERIC(18,0)
	DECLARE @ANUNCIO_TIPO_PERIODO NUMERIC(18,0)
	DECLARE @ANUNCIO_SUCURSAL NUMERIC(18,0)

	DECLARE @AGENTE_DNI NUMERIC(18,0)
	DECLARE @AGENTE_NOMBRE NVARCHAR(100)
	DECLARE @AGENTE_APELLIDO NVARCHAR(100)
	DECLARE @AGENTE_FECHA_REGISTRO DATETIME
	DECLARE @AGENTE_FECHA_NAC DATETIME
	DECLARE @AGENTE_MAIL NVARCHAR(100)
	DECLARE @AGENTE_TELEFONO NUMERIC(18,0)

	DECLARE @AGENTE_DEFINITIVO NUMERIC(20,0)

	SET IDENTITY_INSERT DATABASERS.ANUNCIO ON

	DECLARE CURSOR_ANUNCIO CURSOR FOR
	SELECT DISTINCT ANUNCIO_CODIGO, INMUEBLE_CODIGO, ANUNCIO_FECHA_PUBLICACION, ANUNCIO_PRECIO_PUBLICADO,
	ANUNCIO_COSTO_ANUNCIO, ANUNCIO_FECHA_FINALIZACION,TIPO_OPERACION_CODIGO, MONEDA_CODIGO,
	ESTADO_ANUNCIO_CODIGO, TIPO_PERIODO_CODIGO, SUCURSAL_CODIGO, AGENTE_DNI, AGENTE_NOMBRE,
	AGENTE_APELLIDO, AGENTE_FECHA_REGISTRO, AGENTE_FECHA_NAC, AGENTE_MAIL, AGENTE_TELEFONO
	FROM gd_esquema.Maestra
	JOIN DATABASERS.TIPO_OPERACION ON ANUNCIO_TIPO_OPERACION = TIPO_OPERACION_DETALLE
	JOIN DATABASERS.MONEDA ON ANUNCIO_MONEDA = MONEDA_DETALLE
	JOIN DATABASERS.ESTADO_ANUNCIO ON ANUNCIO_ESTADO = ESTADO_ANUNCIO_DETALLE
	JOIN DATABASERS.TIPO_PERIODO ON ANUNCIO_TIPO_PERIODO = TIPO_PERIODO_DETALLE
	WHERE INMUEBLE_CODIGO IS NOT NULL

	OPEN CURSOR_ANUNCIO
	FETCH NEXT FROM CURSOR_ANUNCIO INTO
	@ANUNCIO_CODIGO, @ANUNCIO_INMUEBLE, @ANUNCIO_FECHA_PUBLICACION, @ANUNCIO_PRECIO_PUBLICADO,
	@ANUNCIO_COSTO_ANUNCIO, @ANUNCIO_FECHA_FINALIZACION, @ANUNCIO_TIPO_OPERACION, @ANUNCIO_MONEDA,
	@ANUNCIO_ESTADO, @ANUNCIO_TIPO_PERIODO, @ANUNCIO_SUCURSAL, @AGENTE_DNI, @AGENTE_NOMBRE,
	@AGENTE_APELLIDO, @AGENTE_FECHA_REGISTRO, @AGENTE_FECHA_NAC, @AGENTE_MAIL, @AGENTE_TELEFONO

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @AGENTE_DEFINITIVO = AGENTE_PERSONA FROM DATABASERS.PERSONA JOIN DATABASERS.AGENTE ON PERSONA_CODIGO = AGENTE_PERSONA
		WHERE @AGENTE_DNI = PERSONA_DNI AND @AGENTE_NOMBRE = PERSONA_NOMBRE AND
		@AGENTE_APELLIDO = PERSONA_APELLIDO AND @AGENTE_FECHA_REGISTRO = PERSONA_FECHA_REGISTRO AND
		@AGENTE_FECHA_NAC = PERSONA_FECHA_NAC AND @AGENTE_MAIL = PERSONA_MAIL AND @AGENTE_TELEFONO = PERSONA_TELEFONO

		INSERT INTO DATABASERS.ANUNCIO (ANUNCIO_CODIGO, ANUNCIO_INMUEBLE, ANUNCIO_FECHA_PUBLICACION,
		ANUNCIO_PRECIO_PUBLICADO, ANUNCIO_COSTO_ANUNCIO, ANUNCIO_FECHA_FINALIZACION,
		ANUNCIO_TIPO_OPERACION, ANUNCIO_MONEDA, ANUNCIO_ESTADO, ANUNCIO_TIPO_PERIODO, ANUNCIO_SUCURSAL,
		ANUNCIO_AGENTE)
		VALUES (@ANUNCIO_CODIGO, @ANUNCIO_INMUEBLE, @ANUNCIO_FECHA_PUBLICACION, @ANUNCIO_PRECIO_PUBLICADO,
		@ANUNCIO_COSTO_ANUNCIO, @ANUNCIO_FECHA_FINALIZACION, @ANUNCIO_TIPO_OPERACION, @ANUNCIO_MONEDA,
		@ANUNCIO_ESTADO, @ANUNCIO_TIPO_PERIODO, @ANUNCIO_SUCURSAL, @AGENTE_DEFINITIVO)

		FETCH NEXT FROM CURSOR_ANUNCIO INTO
		@ANUNCIO_CODIGO, @ANUNCIO_INMUEBLE, @ANUNCIO_FECHA_PUBLICACION, @ANUNCIO_PRECIO_PUBLICADO,
		@ANUNCIO_COSTO_ANUNCIO, @ANUNCIO_FECHA_FINALIZACION, @ANUNCIO_TIPO_OPERACION, @ANUNCIO_MONEDA,
		@ANUNCIO_ESTADO, @ANUNCIO_TIPO_PERIODO, @ANUNCIO_SUCURSAL, @AGENTE_DNI, @AGENTE_NOMBRE,
		@AGENTE_APELLIDO, @AGENTE_FECHA_REGISTRO, @AGENTE_FECHA_NAC, @AGENTE_MAIL, @AGENTE_TELEFONO
	END
	CLOSE CURSOR_ANUNCIO
	DEALLOCATE CURSOR_ANUNCIO

	SET IDENTITY_INSERT DATABASERS.ANUNCIO OFF;

END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_ESTADO_ANUNCIO --DONE
AS
BEGIN
	INSERT INTO DATABASERS.ESTADO_ANUNCIO
	SELECT DISTINCT ANUNCIO_ESTADO FROM gd_esquema.Maestra WHERE ANUNCIO_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_TIPO_OPERACION_ANUNCIO --DONE
AS
BEGIN
	INSERT INTO DATABASERS.TIPO_OPERACION
	SELECT DISTINCT ANUNCIO_TIPO_OPERACION FROM gd_esquema.Maestra WHERE ANUNCIO_TIPO_OPERACION IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_TIPO_PERIODO_ANUNCIO --DONE
AS
BEGIN
	INSERT INTO DATABASERS.TIPO_PERIODO
	SELECT DISTINCT ANUNCIO_TIPO_PERIODO FROM gd_esquema.Maestra WHERE ANUNCIO_TIPO_PERIODO IS NOT NULL
END
GO

-- PROCEDIMIENTOS DE SUCURSALES
CREATE PROCEDURE DATABASERS.MIGRAR_SUCURSAL --DONE
AS
BEGIN
	SET IDENTITY_INSERT DATABASERS.SUCURSAL ON

	INSERT INTO DATABASERS.SUCURSAL (SUCURSAL_CODIGO, SUCURSAL_NOMBRE,SUCURSAL_DIRECCION, SUCURSAL_LOCALIDAD, SUCURSAL_TELEFONO)
	SELECT DISTINCT SUCURSAL_CODIGO, SUCURSAL_NOMBRE,SUCURSAL_DIRECCION, LOCALIDAD_CODIGO, SUCURSAL_TELEFONO
	FROM gd_esquema.Maestra 
	JOIN DATABASERS.LOCALIDAD ON SUCURSAL_LOCALIDAD = LOCALIDAD_DETALLE
	JOIN DATABASERS.PROVINCIA ON SUCURSAL_PROVINCIA = PROVINCIA_DETALLE
	WHERE SUCURSAL_CODIGO IS NOT NULL
	
	SET IDENTITY_INSERT DATABASERS.SUCURSAL OFF
END
GO

--PROCEDIMIENTOS DE ALQUILERES Y VENTAS
CREATE PROCEDURE DATABASERS.MIGRAR_ALQUILER --DONE
AS
BEGIN
	SET IDENTITY_INSERT DATABASERS.ALQUILER ON;
    INSERT INTO DATABASERS.ALQUILER (ALQUILER_CODIGO,ALQUILER_ANUNCIO, ALQUILER_ESTADO,ALQUILER_FECHA_INICIO,
    ALQUILER_FECHA_FIN, ALQUILER_CANT_PERIODOS,ALQUILER_DEPOSITO, ALQUILER_COMISION, ALQUILER_GASTOS_AVERIGUA)
    SELECT DISTINCT ALQUILER_CODIGO, ANUNCIO_CODIGO, ESTADO_ALQUILER_CODIGO,ALQUILER_FECHA_INICIO,ALQUILER_FECHA_FIN,ALQUILER_CANT_PERIODOS,ALQUILER_DEPOSITO,ALQUILER_COMISION,ALQUILER_GASTOS_AVERIGUA 
    FROM gd_esquema.Maestra
    JOIN DATABASERS.ESTADO_ALQUILER ON ESTADO_ALQUILER_NOMBRE=ALQUILER_ESTADO
	SET IDENTITY_INSERT DATABASERS.ALQUILER OFF;
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_ESTADO_ALQUILER --DONE
AS
BEGIN
	INSERT INTO DATABASERS.ESTADO_ALQUILER
	SELECT DISTINCT ALQUILER_ESTADO FROM gd_esquema.Maestra WHERE ALQUILER_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_DETALLE --DONE
AS 
BEGIN
	INSERT INTO DATABASERS.DETALLE
	SELECT DISTINCT ALQUILER_CODIGO, DETALLE_ALQ_NRO_PERIODO_INI, DETALLE_ALQ_NRO_PERIODO_FIN, DETALLE_ALQ_PRECIO FROM gd_esquema.Maestra WHERE ALQUILER_CODIGO IS NOT NULL AND DETALLE_ALQ_NRO_PERIODO_INI IS NOT NULL AND DETALLE_ALQ_NRO_PERIODO_FIN IS NOT NULL AND DETALLE_ALQ_PRECIO IS NOT NULL
END 
GO

CREATE PROCEDURE DATABASERS.MIGRAR_PAGO_ALQUILER --DONE
AS
BEGIN
	SET IDENTITY_INSERT DATABASERS.PAGO_ALQUILER ON

	INSERT INTO DATABASERS.PAGO_ALQUILER (PAGO_ALQUILER_CODIGO, PAGO_ALQUILER_ALQUILER, 
	PAGO_ALQUILER_MEDIO_PAGO, PAGO_ALQUILER_NRO_PERIODO, PAGO_ALQUILER_FECHA, 
	PAGO_ALQUILER_IMPORTE, PAGO_ALQUILER_FECHA_VENCIMIENTO, PAGO_ALQUILER_DESC, 
	PAGO_ALQUILER_FEC_INI, PAGO_ALQUILER_FEC_FIN )
	SELECT DISTINCT PAGO_ALQUILER_CODIGO, ALQUILER_CODIGO, MEDIO_PAGO_CODIGO, 
	PAGO_ALQUILER_NRO_PERIODO, PAGO_ALQUILER_FECHA, PAGO_ALQUILER_IMPORTE, 
	PAGO_ALQUILER_FECHA_VENCIMIENTO, PAGO_ALQUILER_DESC, PAGO_ALQUILER_FEC_INI, 
	PAGO_ALQUILER_FEC_FIN 
	FROM gd_esquema.Maestra
	JOIN DATABASERS.MEDIO_PAGO ON PAGO_ALQUILER_MEDIO_PAGO = MEDIO_PAGO_NOMBRE

	SET IDENTITY_INSERT DATABASERS.PAGO_ALQUILER OFF
END 
GO

CREATE PROCEDURE DATABASERS.MIGRAR_MEDIO_PAGO --DONE
AS 
BEGIN 
	INSERT INTO DATABASERS.MEDIO_PAGO
	SELECT DISTINCT PAGO_ALQUILER_MEDIO_PAGO FROM gd_esquema.Maestra WHERE PAGO_ALQUILER_MEDIO_PAGO IS NOT NULL
	UNION
	SELECT DISTINCT PAGO_VENTA_MEDIO_PAGO FROM gd_esquema.Maestra WHERE PAGO_VENTA_MEDIO_PAGO IS NOT NULL
END 
GO

CREATE PROCEDURE DATABASERS.MIGRAR_MONEDA --DONE
AS
BEGIN
	INSERT INTO DATABASERS.MONEDA
	SELECT DISTINCT ANUNCIO_MONEDA FROM gd_esquema.Maestra WHERE ANUNCIO_MONEDA IS NOT NULL
	UNION
	SELECT DISTINCT PAGO_VENTA_MONEDA FROM gd_esquema.Maestra WHERE PAGO_VENTA_MONEDA IS NOT NULL
	UNION
	SELECT DISTINCT VENTA_MONEDA FROM gd_esquema.Maestra WHERE VENTA_MONEDA IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_VENTA --DONE
AS
BEGIN
	SET IDENTITY_INSERT DATABASERS.VENTA ON

	INSERT INTO DATABASERS.VENTA (VENTA_CODIGO, VENTA_ANUNCIO, VENTA_MONEDA, VENTA_FECHA, VENTA_PRECIO_VENTA, VENTA_COMISION)
	SELECT DISTINCT VENTA_CODIGO, ANUNCIO_CODIGO, MONEDA_CODIGO, VENTA_FECHA, VENTA_PRECIO_VENTA, VENTA_COMISION
	FROM gd_esquema.Maestra 
	JOIN DATABASERS.MONEDA ON MONEDA_DETALLE = VENTA_MONEDA

	SET IDENTITY_INSERT DATABASERS.VENTA OFF
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_PAGO_VENTA --DONE
AS
BEGIN
	INSERT INTO DATABASERS.PAGO_VENTA (PAGO_VENTA_VENTA, PAGO_VENTA_IMPORTE, PAGO_VENTA_MONEDA,
	PAGO_VENTA_COTIZACION, PAGO_VENTA_MEDIO_PAGO)
	SELECT DISTINCT VENTA_CODIGO, PAGO_VENTA_IMPORTE, MONEDA_CODIGO, 
	PAGO_VENTA_COTIZACION, MEDIO_PAGO_CODIGO
	FROM gd_esquema.Maestra
	JOIN DATABASERS.MONEDA ON VENTA_MONEDA = MONEDA_DETALLE
	JOIN DATABASERS.MEDIO_PAGO ON PAGO_VENTA_MEDIO_PAGO = MEDIO_PAGO_NOMBRE
END
GO

-- PROCEDIMIENTOS DE BARRIO, LOCALIDAD, PROVINCIA
CREATE PROCEDURE DATABASERS.MIGRAR_BARRIO --DONE
AS 
BEGIN 
	INSERT INTO DATABASERS.BARRIO (BARRIO_DETALLE, BARRIO_LOCALIDAD)
	SELECT DISTINCT INMUEBLE_BARRIO, LOCALIDAD_CODIGO FROM gd_esquema.Maestra JOIN DATABASERS.LOCALIDAD
	ON INMUEBLE_LOCALIDAD = LOCALIDAD_DETALLE
	WHERE INMUEBLE_BARRIO IS NOT NULL
END 
GO

CREATE PROCEDURE DATABASERS.MIGRAR_LOCALIDAD --DONE
AS 
BEGIN 
	INSERT INTO DATABASERS.LOCALIDAD (LOCALIDAD_DETALLE, LOCALIDAD_PROVINCIA)
	SELECT DISTINCT INMUEBLE_LOCALIDAD, PROVINCIA_CODIGO FROM gd_esquema.Maestra JOIN DATABASERS.PROVINCIA 
	ON INMUEBLE_PROVINCIA = PROVINCIA_DETALLE
	WHERE INMUEBLE_LOCALIDAD IS NOT NULL

	UNION
	
	SELECT DISTINCT SUCURSAL_LOCALIDAD, PROVINCIA_CODIGO FROM gd_esquema.Maestra JOIN DATABASERS.PROVINCIA 
	ON SUCURSAL_PROVINCIA = PROVINCIA_DETALLE
	WHERE SUCURSAL_LOCALIDAD IS NOT NULL
END 
GO

CREATE PROCEDURE DATABASERS.MIGRAR_PROVINCIA --DONE
AS 
BEGIN 
	INSERT INTO DATABASERS.PROVINCIA
	SELECT DISTINCT INMUEBLE_PROVINCIA FROM gd_esquema.Maestra WHERE INMUEBLE_PROVINCIA IS NOT NULL
	UNION
	SELECT DISTINCT SUCURSAL_PROVINCIA FROM gd_esquema.Maestra WHERE SUCURSAL_PROVINCIA IS NOT NULL
END 
GO

--PROCEDIMIENTOS DE PERSONAS (AGENTE, PROPIETARIO, COMPRADOR, INQUILINO)
CREATE PROCEDURE DATABASERS.MIGRAR_AGENTE --DONE
AS
BEGIN
	INSERT INTO DATABASERS.AGENTE (AGENTE_PERSONA, AGENTE_SUCURSAL)
	SELECT DISTINCT PERSONA_CODIGO, SUCURSAL_CODIGO FROM gd_esquema.Maestra m JOIN DATABASERS.PERSONA p
	ON PERSONA_DNI = AGENTE_DNI AND p.PERSONA_NOMBRE = m.AGENTE_NOMBRE AND p.PERSONA_APELLIDO = m.AGENTE_APELLIDO 
		AND p.PERSONA_FECHA_REGISTRO = m.AGENTE_FECHA_REGISTRO AND p.PERSONA_FECHA_NAC = m.AGENTE_FECHA_NAC 
		AND p.PERSONA_MAIL = m.AGENTE_MAIL AND p.PERSONA_TELEFONO = m.AGENTE_TELEFONO
	WHERE PERSONA_CODIGO IS NOT NULL AND SUCURSAL_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_PROPIETARIO --DONE
AS
BEGIN
	INSERT INTO DATABASERS.PROPIETARIO (PROPIETARIO_PERSONA, PROPIETARIO_INMUEBLE)
	SELECT DISTINCT PERSONA_CODIGO, INMUEBLE_CODIGO FROM gd_esquema.Maestra m JOIN DATABASERS.PERSONA p
	ON PERSONA_DNI = PROPIETARIO_DNI AND p.PERSONA_NOMBRE = m.PROPIETARIO_NOMBRE AND p.PERSONA_APELLIDO = m.PROPIETARIO_APELLIDO 
		AND p.PERSONA_FECHA_REGISTRO = m.PROPIETARIO_FECHA_REGISTRO AND p.PERSONA_FECHA_NAC = m.PROPIETARIO_FECHA_NAC 
		AND p.PERSONA_MAIL = m.PROPIETARIO_MAIL AND p.PERSONA_TELEFONO = m.PROPIETARIO_TELEFONO
	WHERE PERSONA_CODIGO IS NOT NULL AND INMUEBLE_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_INQUILINO --DONE
AS
BEGIN
	INSERT INTO DATABASERS.INQUILINO (INQUILINO_PERSONA, INQUILINO_ALQUILER)
	SELECT DISTINCT PERSONA_CODIGO, ALQUILER_CODIGO FROM gd_esquema.Maestra m JOIN DATABASERS.PERSONA p
	ON PERSONA_DNI = INQUILINO_DNI AND p.PERSONA_NOMBRE = m.INQUILINO_NOMBRE AND p.PERSONA_APELLIDO = m.INQUILINO_APELLIDO 
		AND p.PERSONA_FECHA_REGISTRO = m.INQUILINO_FECHA_REGISTRO AND p.PERSONA_FECHA_NAC = m.INQUILINO_FECHA_NAC 
		AND p.PERSONA_MAIL = m.INQUILINO_MAIL AND p.PERSONA_TELEFONO = m.INQUILINO_TELEFONO
	WHERE PERSONA_CODIGO IS NOT NULL AND ALQUILER_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_COMPRADOR --DONE
AS
BEGIN
	INSERT INTO DATABASERS.COMPRADOR (COMPRADOR_PERSONA, COMPRADOR_VENTA)
	SELECT DISTINCT PERSONA_CODIGO, VENTA_CODIGO FROM gd_esquema.Maestra m JOIN DATABASERS.PERSONA p
	ON PERSONA_DNI = COMPRADOR_DNI AND p.PERSONA_NOMBRE = m.COMPRADOR_NOMBRE AND p.PERSONA_APELLIDO = m.COMPRADOR_APELLIDO 
		AND p.PERSONA_FECHA_REGISTRO = m.COMPRADOR_FECHA_REGISTRO AND p.PERSONA_FECHA_NAC = m.COMPRADOR_FECHA_NAC 
		AND p.PERSONA_MAIL = m.COMPRADOR_MAIL AND p.PERSONA_TELEFONO = m.COMPRADOR_TELEFONO
	WHERE PERSONA_CODIGO IS NOT NULL AND VENTA_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_PERSONA --DONE
AS
BEGIN
	INSERT INTO DATABASERS.PERSONA (PERSONA_DNI,PERSONA_NOMBRE,PERSONA_APELLIDO,PERSONA_FECHA_REGISTRO,PERSONA_TELEFONO,PERSONA_MAIL,PERSONA_FECHA_NAC)
	(SELECT DISTINCT INQUILINO_DNI, INQUILINO_NOMBRE, 
	INQUILINO_APELLIDO,  INQUILINO_FECHA_REGISTRO,
	INQUILINO_TELEFONO,
	INQUILINO_MAIL, INQUILINO_FECHA_NAC 
	FROM gd_esquema.Maestra m WHERE INQUILINO_DNI IS NOT NULL
	
	UNION

	SELECT DISTINCT COMPRADOR_DNI,COMPRADOR_NOMBRE, 
	COMPRADOR_APELLIDO,  COMPRADOR_FECHA_REGISTRO,
	COMPRADOR_TELEFONO,
	COMPRADOR_MAIL, COMPRADOR_FECHA_NAC 
	FROM gd_esquema.Maestra m WHERE COMPRADOR_DNI IS NOT NULL

	UNION

	SELECT DISTINCT PROPIETARIO_DNI,PROPIETARIO_NOMBRE, 
	PROPIETARIO_APELLIDO,  PROPIETARIO_FECHA_REGISTRO,
	PROPIETARIO_TELEFONO,
	PROPIETARIO_MAIL, PROPIETARIO_FECHA_NAC 
	FROM gd_esquema.Maestra m WHERE PROPIETARIO_DNI IS NOT NULL

	UNION

	SELECT DISTINCT AGENTE_DNI,AGENTE_NOMBRE, 
	AGENTE_APELLIDO,  AGENTE_FECHA_REGISTRO,
	AGENTE_TELEFONO,
	AGENTE_MAIL, AGENTE_FECHA_NAC 
	FROM gd_esquema.Maestra m WHERE AGENTE_DNI IS NOT NULL)

END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_MAESTRA
AS
BEGIN
EXECUTE DATABASERS.MIGRAR_MONEDA
EXECUTE DATABASERS.MIGRAR_MEDIO_PAGO
EXECUTE DATABASERS.MIGRAR_TIPO_OPERACION_ANUNCIO
EXECUTE DATABASERS.MIGRAR_TIPO_PERIODO_ANUNCIO
EXECUTE DATABASERS.MIGRAR_TIPO_INMUEBLE
EXECUTE DATABASERS.MIGRAR_ESTADO_INMUEBLE
EXECUTE DATABASERS.MIGRAR_CANT_AMBIENTES_INMUEBLE
EXECUTE DATABASERS.MIGRAR_DISPOSICION_INMUEBLE
EXECUTE DATABASERS.MIGRAR_ORIENTACION_INMUEBLE
EXECUTE DATABASERS.MIGRAR_CARACTERISTICA_INMUEBLE
EXECUTE DATABASERS.MIGRAR_ESTADO_ALQUILER
EXECUTE DATABASERS.MIGRAR_ESTADO_ANUNCIO
EXECUTE DATABASERS.MIGRAR_PROVINCIA
EXECUTE DATABASERS.MIGRAR_LOCALIDAD
EXECUTE DATABASERS.MIGRAR_BARRIO
EXECUTE DATABASERS.MIGRAR_SUCURSAL
EXECUTE DATABASERS.MIGRAR_PERSONA
EXECUTE DATABASERS.MIGRAR_AGENTE
EXECUTE DATABASERS.MIGRAR_INMUEBLE
EXECUTE DATABASERS.MIGRAR_ANUNCIO
EXECUTE DATABASERS.MIGRAR_ALQUILER
EXECUTE DATABASERS.MIGRAR_DETALLE
EXECUTE DATABASERS.MIGRAR_VENTA
EXECUTE DATABASERS.MIGRAR_PROPIETARIO
EXECUTE DATABASERS.MIGRAR_INQUILINO
EXECUTE DATABASERS.MIGRAR_COMPRADOR
EXECUTE DATABASERS.MIGRAR_PAGO_ALQUILER
EXECUTE DATABASERS.MIGRAR_PAGO_VENTA
EXECUTE DATABASERS.MIGRAR_INMUEBLE_X_CARACTERISTICA
END
GO

-- 5. EJECUCIÓN DE MIGRACIÓN

EXECUTE DATABASERS.CREAR_TABLAS
EXECUTE DATABASERS.AGREGAR_FK
EXECUTE DATABASERS.MIGRAR_MAESTRA
GO