-- TP12C2023 K3521 DATABASERS 7

-- EJECUTAR TODO DESDE ACÁ

USE GD2C2023
GO

-- 1. INICIALIZACIÓN

IF (SCHEMA_ID('DATABASERS') IS NULL)
BEGIN
	EXECUTE('CREATE SCHEMA DATABASERS AUTHORIZATION DBO')
END
ELSE 
	PRINT('EL ESQUEMA "DATABASERS" YA ESTA CREADO')
GO

CREATE PROCEDURE DATABASERS.ELIMINAR_TABLAS_BI
AS
BEGIN
    IF OBJECT_ID('DATABASERS.BI_MONEDA', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_MONEDA;
    IF OBJECT_ID('DATABASERS.BI_TIPO_INMUEBLE', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_TIPO_INMUEBLE;
    IF OBJECT_ID('DATABASERS.BI_RANGO_ETARIO', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_RANGO_ETARIO;
    IF OBJECT_ID('DATABASERS.BI_AMBIENTES_INMUEBLE', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_AMBIENTES_INMUEBLE;
    IF OBJECT_ID('DATABASERS.BI_RANGO_SUPERFICIE', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_RANGO_SUPERFICIE;
    IF OBJECT_ID('DATABASERS.BI_ANUNCIO', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_ANUNCIO;
    IF OBJECT_ID('DATABASERS.BI_VENTA', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_VENTA;
    IF OBJECT_ID('DATABASERS.BI_TIEMPO', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_TIEMPO;
    IF OBJECT_ID('DATABASERS.BI_SUCURSAL', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_SUCURSAL;
    IF OBJECT_ID('DATABASERS.BI_ALQUILER', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_ALQUILER;
    IF OBJECT_ID('DATABASERS.BI_PAGO_ALQUILER', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_PAGO_ALQUILER;
    IF OBJECT_ID('DATABASERS.BI_BARRIO', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_BARRIO;
    IF OBJECT_ID('DATABASERS.BI_LOCALIDAD', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_LOCALIDAD;
    IF OBJECT_ID('DATABASERS.BI_TIPO_OPERACION', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_TIPO_OPERACION;
END
GO


CREATE PROCEDURE DATABASERS.ELIMINAR_PROCEDIMIENTOS_BI
AS
BEGIN
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_VENTA', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_VENTA
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_ALQUILER', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_ALQUILER
	IF OBJECT_ID('DATABASERS.MIGRAR_BI_PAGO_ALQUILER', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_PAGO_ALQUILER
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_ANUNCIO', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_ANUNCIO
	IF OBJECT_ID('DATABASERS.MIGRAR_BI_TIEMPO', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_TIEMPO
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_RANGO_SUPERFICIE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_RANGO_SUPERFICIE
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_RANGO_ETARIO', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_RANGO_ETARIO
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_TIPO_INMUEBLE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_TIPO_INMUEBLE
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_TIPO_OPERACION', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_TIPO_OPERACION
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_MONEDA', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_MONEDA
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_SUCURSAL', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_SUCURSAL
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_AMBIENTES_INMUEBLE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_AMBIENTES_INMUEBLE
	IF OBJECT_ID('DATABASERS.MIGRAR_BI_BARRIO', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_BARRIO
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_LOCALIDAD', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_LOCALIDAD
	IF OBJECT_ID('DATABASERS.OBTENER_RANGO_SUPERFICIE', 'F') IS NOT NULL DROP FUNCTION DATABASERS.OBTENER_RANGO_SUPERFICIE
	IF OBJECT_ID('DATABASERS.OBTENER_RANGO_ETARIO', 'F') IS NOT NULL DROP FUNCTION DATABASERS.OBTENER_RANGO_ETARIO
	IF OBJECT_ID('DATABASERS.OBTENER_COMISION', 'F') IS NOT NULL DROP FUNCTION DATABASERS.OBTENER_COMISION
END
GO

CREATE PROCEDURE DATABASERS.ELIMINAR_CREAR_TABLAS_BI
AS
BEGIN
	IF OBJECT_ID('DATABASERS.CREAR_TABLAS_BI','P') IS NOT NULL DROP PROCEDURE DATABASERS.CREAR_TABLAS_BI
	IF OBJECT_ID('DATABASERS.AGREGAR_FK_BI','P') IS NOT NULL DROP PROCEDURE DATABASERS.AGREGAR_FK_BI
END
GO

-- 2. CREACION DE TABLAS

-- CREO TABLAS
CREATE PROCEDURE DATABASERS.CREAR_TABLAS_BI
AS
BEGIN

CREATE TABLE DATABASERS.BI_ANUNCIO(
	BI_ANUNCIO_SUCURSAL NUMERIC (18,0) NOT NULL,
	BI_ANUNCIO_TIPO_OPERACION NUMERIC (18,0) NOT NULL,
	BI_ANUNCIO_AMBIENTES_INMUEBLE NUMERIC (18,0) NOT NULL,
	BI_ANUNCIO_RANGO_SUPERFICIE INTEGER NOT NULL,
	BI_ANUNCIO_TIPO_INMUEBLE NUMERIC (18,0) NOT NULL,
	BI_ANUNCIO_MONEDA NUMERIC (18,0) NOT NULL,
	BI_ANUNCIO_TIEMPO INTEGER NOT NULL,
	BI_ANUNCIO_RANGO_ETARIO INTEGER NOT NULL,
	BI_ANUNCIO_BARRIO NUMERIC (18,0) NOT NULL,

	BI_ANUNCIO_DIAS_PUBLICADO INTEGER NULL,
	BI_ANUNCIO_PRECIO_INMUEBLE NUMERIC (18,2) NULL,
	BI_ANUNCIO_OP_CONCRETADA TINYINT NULL, --1 TRUE, 0 FALSE
	BI_ANUNCIO_MONTO_TOTAL NUMERIC (18,2) NULL,
	BI_ANUNCIO_COMISION NUMERIC (18,2) NULL,

	BI_ANUNCIO_CANTIDAD_ANUNCIOS INTEGER NULL

	PRIMARY KEY(BI_ANUNCIO_SUCURSAL, BI_ANUNCIO_TIPO_OPERACION, BI_ANUNCIO_AMBIENTES_INMUEBLE, BI_ANUNCIO_RANGO_SUPERFICIE, BI_ANUNCIO_TIPO_INMUEBLE,
	BI_ANUNCIO_MONEDA, BI_ANUNCIO_TIEMPO, BI_ANUNCIO_RANGO_ETARIO, BI_ANUNCIO_BARRIO)
)

CREATE TABLE DATABASERS.BI_RANGO_SUPERFICIE
(
	BI_RANGO_SUPERFICIE_CODIGO INTEGER IDENTITY PRIMARY KEY NOT NULL,
	BI_RANGO_SUPERFICIE_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.BI_RANGO_ETARIO
(
	BI_RANGO_ETARIO_CODIGO INTEGER IDENTITY PRIMARY KEY NOT NULL,
	BI_RANGO_ETARIO_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.BI_AMBIENTES_INMUEBLE
(
	BI_AMBIENTES_INMUEBLE_CODIGO NUMERIC(18,0) PRIMARY KEY NOT NULL,
	BI_AMBIENTES_INMUEBLE_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.BI_TIPO_OPERACION(
	BI_TIPO_OPERACION_CODIGO NUMERIC(18,0) PRIMARY KEY NOT NULL,
	BI_TIPO_OPERACION_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.BI_MONEDA
(
	BI_MONEDA_CODIGO NUMERIC(18,0) PRIMARY KEY NOT NULL,
	BI_MONEDA_DETALLE NVARCHAR(100) NULL
)



CREATE TABLE DATABASERS.BI_VENTA
(
	BI_VENTA_LOCALIDAD NUMERIC(18, 0) NOT NULL,
	BI_VENTA_TIEMPO INTEGER NOT NULL,
	BI_VENTA_TIPO_INMUEBLE NUMERIC(18, 0) NOT NULL,
	BI_VENTA_CANT_AMBIENTES NUMERIC (18,0),
	BI_VENTA_RANGO_ETARIO_AGENTE INTEGER,
	BI_VENTA_RANGO_SUPERFICIE INTEGER,
	BI_VENTA_SUCURSAL NUMERIC(18,0),
	BI_VENTA_MONEDA NUMERIC(18,0),
	BI_VENTA_CANT_TOTAL INTEGER ,
	BI_VENTA_PRECIO_M2 NUMERIC(18, 2) NULL,
	PRIMARY KEY(BI_VENTA_LOCALIDAD, BI_VENTA_TIEMPO, BI_VENTA_TIPO_INMUEBLE,BI_VENTA_CANT_AMBIENTES,BI_VENTA_RANGO_ETARIO_AGENTE,BI_VENTA_RANGO_SUPERFICIE,BI_VENTA_SUCURSAL,BI_VENTA_MONEDA)
)

CREATE TABLE DATABASERS.BI_TIPO_INMUEBLE
(
	BI_TIPO_INMUEBLE_CODIGO NUMERIC(18,0) PRIMARY KEY NOT NULL,
	BI_TIPO_INMUEBLE_DETALLE NVARCHAR(100) NULL
)

CREATE TABLE DATABASERS.BI_TIEMPO
(
	BI_TIEMPO_CODIGO INTEGER IDENTITY PRIMARY KEY NOT NULL,
	BI_TIEMPO_ANIO INTEGER NULL,
	BI_TIEMPO_CUATRIMESTRE INTEGER NULL,
	BI_TIEMPO_MES INTEGER NULL
)

CREATE TABLE DATABASERS.BI_SUCURSAL(
	BI_SUCURSAL_CODIGO NUMERIC(18,0) PRIMARY KEY NOT NULL,
	BI_SUCURSAL_NOMBRE NVARCHAR(100) NULL,
)


CREATE TABLE DATABASERS.BI_ALQUILER
(
	BI_ALQUILER_BARRIO NUMERIC(18,0) NOT NULL,
	BI_ALQUILER_TIEMPO INTEGER  NOT NULL,
	BI_ALQUILER_RANGO_ETARIO INTEGER NOT NULL,
	BI_ALQUILER_CANT_ALQUILER INTEGER NOT NULL,
	PRIMARY KEY(BI_ALQUILER_BARRIO, BI_ALQUILER_TIEMPO, BI_ALQUILER_RANGO_ETARIO)
)

CREATE TABLE DATABASERS.BI_PAGO_ALQUILER
(
	BI_PAGO_ALQUILER_TIEMPO INTEGER PRIMARY KEY NOT NULL,
	BI_PAGO_ALQUILER_INCUMPLIMIENTO INTEGER NULL, --1 TRUE, 0 FALSE
	BI_PAGO_ALQUILER_INCREMENTO NUMERIC (18,2) NULL
)


CREATE TABLE DATABASERS.BI_BARRIO (
	BI_BARRIO_CODIGO NUMERIC(18,0) PRIMARY KEY NOT NULL,
	BI_BARRIO_DETALLE NVARCHAR(100) NULL,
	BI_BARRIO_LOCALIDAD NUMERIC(18,0) NULL
)

CREATE TABLE DATABASERS.BI_LOCALIDAD
(
	BI_LOCALIDAD_CODIGO NUMERIC(18,0) PRIMARY KEY NOT NULL,
	BI_LOCALIDAD_DETALLE NVARCHAR(100) NULL
)

END
GO

-- 3. ADICIÓN DE FK A LAS TABLAS

CREATE PROCEDURE DATABASERS.AGREGAR_FK_BI
AS
BEGIN

--FK BI_VENTA 
ALTER TABLE DATABASERS.BI_VENTA
ADD FOREIGN KEY (BI_VENTA_LOCALIDAD) REFERENCES DATABASERS.BI_LOCALIDAD(BI_LOCALIDAD_CODIGO);

ALTER TABLE DATABASERS.BI_VENTA
ADD FOREIGN KEY (BI_VENTA_TIEMPO) REFERENCES DATABASERS.BI_TIEMPO(BI_TIEMPO_CODIGO);

ALTER TABLE DATABASERS.BI_VENTA
ADD FOREIGN KEY (BI_VENTA_TIPO_INMUEBLE) REFERENCES DATABASERS.BI_TIPO_INMUEBLE(BI_TIPO_INMUEBLE_CODIGO);


ALTER TABLE DATABASERS.BI_VENTA
ADD FOREIGN KEY (BI_VENTA_RANGO_ETARIO_AGENTE) REFERENCES DATABASERS.BI_RANGO_ETARIO(BI_RANGO_ETARIO_CODIGO);

ALTER TABLE DATABASERS.BI_VENTA
ADD FOREIGN KEY (BI_VENTA_RANGO_SUPERFICIE) REFERENCES DATABASERS.BI_RANGO_SUPERFICIE(BI_RANGO_SUPERFICIE_CODIGO);

ALTER TABLE DATABASERS.BI_VENTA
ADD FOREIGN KEY (BI_VENTA_SUCURSAL) REFERENCES DATABASERS.BI_SUCURSAL(BI_SUCURSAL_CODIGO);

ALTER TABLE DATABASERS.BI_VENTA
ADD FOREIGN KEY (BI_VENTA_MONEDA) REFERENCES DATABASERS.BI_MONEDA(BI_MONEDA_CODIGO);

ALTER TABLE DATABASERS.BI_VENTA
ADD FOREIGN KEY (BI_VENTA_CANT_AMBIENTES) REFERENCES DATABASERS.BI_AMBIENTES_INMUEBLE(BI_AMBIENTES_INMUEBLE_CODIGO);


--FK BI_ALQUILER
ALTER TABLE DATABASERS.BI_ALQUILER 
ADD FOREIGN KEY (BI_ALQUILER_BARRIO) REFERENCES DATABASERS.BI_BARRIO(BI_BARRIO_CODIGO); 

ALTER TABLE DATABASERS.BI_ALQUILER 
ADD FOREIGN KEY (BI_ALQUILER_RANGO_ETARIO) REFERENCES DATABASERS.BI_RANGO_ETARIO(BI_RANGO_ETARIO_CODIGO);

ALTER TABLE DATABASERS.BI_ALQUILER
ADD FOREIGN KEY (BI_ALQUILER_TIEMPO) REFERENCES DATABASERS.BI_TIEMPO(BI_TIEMPO_CODIGO);

--FK BI_PAGO_ALQUILER

ALTER TABLE DATABASERS.BI_PAGO_ALQUILER
ADD FOREIGN KEY (BI_PAGO_ALQUILER_TIEMPO) REFERENCES DATABASERS.BI_TIEMPO(BI_TIEMPO_CODIGO);

--FK BI_ANUNCIO
ALTER TABLE DATABASERS.BI_ANUNCIO
ADD FOREIGN KEY (BI_ANUNCIO_SUCURSAL) REFERENCES DATABASERS.BI_SUCURSAL(BI_SUCURSAL_CODIGO); 

ALTER TABLE DATABASERS.BI_ANUNCIO
ADD FOREIGN KEY (BI_ANUNCIO_TIPO_OPERACION) REFERENCES DATABASERS.BI_TIPO_OPERACION(BI_TIPO_OPERACION_CODIGO); 

ALTER TABLE DATABASERS.BI_ANUNCIO
ADD FOREIGN KEY (BI_ANUNCIO_AMBIENTES_INMUEBLE) REFERENCES DATABASERS.BI_AMBIENTES_INMUEBLE(BI_AMBIENTES_INMUEBLE_CODIGO);

ALTER TABLE DATABASERS.BI_ANUNCIO
ADD FOREIGN KEY (BI_ANUNCIO_RANGO_SUPERFICIE) REFERENCES DATABASERS.BI_RANGO_SUPERFICIE(BI_RANGO_SUPERFICIE_CODIGO); 

ALTER TABLE DATABASERS.BI_ANUNCIO
ADD FOREIGN KEY (BI_ANUNCIO_TIPO_INMUEBLE) REFERENCES DATABASERS.BI_TIPO_INMUEBLE(BI_TIPO_INMUEBLE_CODIGO); 

ALTER TABLE DATABASERS.BI_ANUNCIO
ADD FOREIGN KEY (BI_ANUNCIO_MONEDA) REFERENCES DATABASERS.BI_MONEDA(BI_MONEDA_CODIGO); 

ALTER TABLE DATABASERS.BI_ANUNCIO
ADD FOREIGN KEY (BI_ANUNCIO_TIEMPO) REFERENCES DATABASERS.BI_TIEMPO(BI_TIEMPO_CODIGO);

ALTER TABLE DATABASERS.BI_ANUNCIO
ADD FOREIGN KEY (BI_ANUNCIO_RANGO_ETARIO) REFERENCES DATABASERS.BI_RANGO_ETARIO(BI_RANGO_ETARIO_CODIGO);

ALTER TABLE DATABASERS.BI_ANUNCIO
ADD FOREIGN KEY (BI_ANUNCIO_BARRIO) REFERENCES DATABASERS.BI_BARRIO(BI_BARRIO_CODIGO); 

END
GO


-- 4. MIGRACIÓN DE TABLAS

-- PROCEDIMIENTOS

CREATE FUNCTION DATABASERS.OBTENER_RANGO_SUPERFICIE(@SUPERFICIE NUMERIC (18,2))
RETURNS INTEGER
AS 
BEGIN
	DECLARE @RANGO INTEGER

	IF(@SUPERFICIE<35) SET @RANGO = 1 
	ELSE IF(@SUPERFICIE>=35 AND @SUPERFICIE<55) SET @RANGO = 2
	ELSE IF(@SUPERFICIE>=55 AND @SUPERFICIE<75) SET @RANGO = 3
	ELSE IF(@SUPERFICIE>=75 AND @SUPERFICIE<100) SET @RANGO = 4
	ELSE IF(@SUPERFICIE>=100) SET @RANGO = 5

	RETURN @RANGO
END
GO

CREATE FUNCTION DATABASERS.OBTENER_RANGO_ETARIO(@FECHA_NAC DATETIME, @FECHA DATETIME)
RETURNS INTEGER
AS 
BEGIN

	DECLARE @EDAD INTEGER
	DECLARE @RANGO INTEGER

	SET @EDAD = DATEDIFF(YEAR, @FECHA_NAC, @FECHA)

	IF(@EDAD<25) SET @RANGO = 1 
	ELSE IF(@EDAD>=25 AND @EDAD<35) SET @RANGO = 2
	ELSE IF(@EDAD>=35 AND @EDAD<50) SET @RANGO = 3
	ELSE IF(@EDAD>=50) SET @RANGO = 4
	RETURN @RANGO
END
GO

CREATE FUNCTION DATABASERS.OBTENER_COMISION( @ANUNCIO NUMERIC(19,0), @TIPO_OPERACION NUMERIC(18,0))
RETURNS NUMERIC(18,2)
AS
BEGIN
	DECLARE @COMISION NUMERIC(18,2)

	IF(@TIPO_OPERACION = 1 OR @TIPO_OPERACION = 2)
	BEGIN
		SELECT @COMISION = ALQUILER_COMISION FROM DATABASERS.ALQUILER WHERE ALQUILER_ANUNCIO = @ANUNCIO
	END
	ELSE IF(@TIPO_OPERACION = 3)
	BEGIN
		SELECT @COMISION = VENTA_COMISION FROM DATABASERS.VENTA WHERE VENTA_ANUNCIO = @ANUNCIO
	END
	RETURN @COMISION
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_TIEMPO
AS
BEGIN
	INSERT INTO DATABASERS.BI_TIEMPO 
	(BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_MES)
	SELECT YEAR(ANUNCIO_FECHA_PUBLICACION), DATEPART(QUARTER, ANUNCIO_FECHA_PUBLICACION), MONTH(ANUNCIO_FECHA_PUBLICACION) FROM DATABASERS.ANUNCIO
	UNION 
	(SELECT YEAR(VENTA_FECHA), DATEPART(QUARTER, VENTA_FECHA), MONTH(VENTA_FECHA) FROM DATABASERS.VENTA)
	UNION
	(SELECT YEAR(ALQUILER_FECHA_INICIO), DATEPART(QUARTER, ALQUILER_FECHA_INICIO), MONTH(ALQUILER_FECHA_INICIO) FROM DATABASERS.ALQUILER)
	UNION 
	(SELECT YEAR(PAGO_ALQUILER_FECHA), DATEPART(QUARTER, PAGO_ALQUILER_FECHA), MONTH(PAGO_ALQUILER_FECHA) FROM DATABASERS.PAGO_ALQUILER)

END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_RANGO_SUPERFICIE
AS
BEGIN
	INSERT INTO DATABASERS.BI_RANGO_SUPERFICIE (BI_RANGO_SUPERFICIE_DETALLE) VALUES
	('<35'), ('35-55'), ('55-75'), ('75-100'), ('>100')
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_RANGO_ETARIO
AS
BEGIN
	INSERT INTO DATABASERS.BI_RANGO_ETARIO (BI_RANGO_ETARIO_DETALLE) VALUES
	('<25'), ('25-35'), ('35-50'), ('>50')
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_TIPO_INMUEBLE 
AS
BEGIN
	INSERT INTO DATABASERS.BI_TIPO_INMUEBLE
	SELECT DISTINCT TIPO_INMUEBLE_CODIGO, TIPO_INMUEBLE_DETALLE FROM DATABASERS.TIPO_INMUEBLE
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_TIPO_OPERACION
AS
BEGIN
	INSERT INTO DATABASERS.BI_TIPO_OPERACION
	SELECT DISTINCT TIPO_OPERACION_CODIGO, TIPO_OPERACION_DETALLE FROM DATABASERS.TIPO_OPERACION
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_MONEDA
AS
BEGIN
	INSERT INTO DATABASERS.BI_MONEDA
	SELECT DISTINCT MONEDA_CODIGO, MONEDA_DETALLE FROM DATABASERS.MONEDA
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_SUCURSAL
AS
BEGIN
	INSERT INTO DATABASERS.BI_SUCURSAL
	SELECT DISTINCT SUCURSAL_CODIGO, SUCURSAL_NOMBRE FROM DATABASERS.SUCURSAL
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_AMBIENTES_INMUEBLE
AS
BEGIN
	INSERT INTO DATABASERS.BI_AMBIENTES_INMUEBLE
	SELECT DISTINCT CANT_AMBIENTES_INMUEBLE_CODIGO, CANT_AMBIENTES_INMUEBLE_DETALLE FROM DATABASERS.CANT_AMBIENTES_INMUEBLE
END
GO


CREATE PROCEDURE DATABASERS.MIGRAR_BI_BARRIO
AS
BEGIN
	INSERT INTO DATABASERS.BI_BARRIO
	SELECT DISTINCT BARRIO_CODIGO, BARRIO_DETALLE, BARRIO_LOCALIDAD FROM DATABASERS.BARRIO
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_LOCALIDAD
AS
BEGIN
	INSERT INTO DATABASERS.BI_LOCALIDAD
	SELECT DISTINCT LOCALIDAD_CODIGO, LOCALIDAD_DETALLE FROM DATABASERS.LOCALIDAD
END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_ANUNCIO
AS
BEGIN
	DECLARE @CANTIDAD_ANUNCIOS INTEGER

	SET @CANTIDAD_ANUNCIOS = (SELECT COUNT(*) FROM DATABASERS.ANUNCIO)

	--anuncios que no tuvieron ni ventas ni alquilers
	INSERT INTO DATABASERS.BI_ANUNCIO 
	(BI_ANUNCIO_TIEMPO, BI_ANUNCIO_TIPO_OPERACION, BI_ANUNCIO_BARRIO, BI_ANUNCIO_AMBIENTES_INMUEBLE, BI_ANUNCIO_SUCURSAL,
	BI_ANUNCIO_TIPO_INMUEBLE, BI_ANUNCIO_MONEDA,  BI_ANUNCIO_RANGO_SUPERFICIE, BI_ANUNCIO_RANGO_ETARIO, BI_ANUNCIO_DIAS_PUBLICADO,
	BI_ANUNCIO_PRECIO_INMUEBLE, BI_ANUNCIO_COMISION, BI_ANUNCIO_OP_CONCRETADA, BI_ANUNCIO_CANTIDAD_ANUNCIOS, BI_ANUNCIO_MONTO_TOTAL)
	SELECT BI_TIEMPO_CODIGO, ANUNCIO_TIPO_OPERACION, INMUEBLE_BARRIO, INMUEBLE_CANT_AMBIENTES, ANUNCIO_SUCURSAL,
	INMUEBLE_TIPO_INMUEBLE, ANUNCIO_MONEDA, DATABASERS.OBTENER_RANGO_SUPERFICIE(INMUEBLE_SUPERFICIETOTAL),
	DATABASERS.OBTENER_RANGO_ETARIO(PERSONA_FECHA_NAC, GETDATE()), AVG(DATEDIFF(DAY, ANUNCIO_FECHA_PUBLICACION,
	ANUNCIO_FECHA_FINALIZACION)), AVG(ANUNCIO_PRECIO_PUBLICADO), 0,0, (SELECT COUNT(*) FROM DATABASERS.ANUNCIO), 0 

	FROM DATABASERS.ANUNCIO A
	JOIN DATABASERS.INMUEBLE ON ANUNCIO_INMUEBLE = INMUEBLE_CODIGO
	JOIN DATABASERS.PERSONA ON ANUNCIO_AGENTE = PERSONA_CODIGO
	JOIN DATABASERS.BI_TIEMPO ON BI_TIEMPO_MES = MONTH(ANUNCIO_FECHA_PUBLICACION) AND BI_TIEMPO_CUATRIMESTRE = DATEPART(QUARTER, ANUNCIO_FECHA_PUBLICACION) AND BI_TIEMPO_ANIO = YEAR(ANUNCIO_FECHA_PUBLICACION)
	WHERE ANUNCIO_CODIGO NOT IN (SELECT VENTA_ANUNCIO FROM DATABASERS.VENTA) AND ANUNCIO_CODIGO NOT IN (SELECT ALQUILER_ANUNCIO FROM DATABASERS.ALQUILER)
	GROUP BY BI_TIEMPO_CODIGO, BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE, ANUNCIO_TIPO_OPERACION, INMUEBLE_BARRIO, INMUEBLE_CANT_AMBIENTES, ANUNCIO_SUCURSAL, INMUEBLE_TIPO_INMUEBLE, ANUNCIO_MONEDA, DATABASERS.OBTENER_RANGO_SUPERFICIE(INMUEBLE_SUPERFICIETOTAL),  DATABASERS.OBTENER_RANGO_ETARIO(PERSONA_FECHA_NAC, GETDATE()), ANUNCIO_FECHA_PUBLICACION, ANUNCIO_FECHA_FINALIZACION
	
	--anuncios con ventas
	INSERT INTO DATABASERS.BI_ANUNCIO 
	(BI_ANUNCIO_TIEMPO, BI_ANUNCIO_TIPO_OPERACION, BI_ANUNCIO_BARRIO, BI_ANUNCIO_AMBIENTES_INMUEBLE, BI_ANUNCIO_SUCURSAL,
	BI_ANUNCIO_TIPO_INMUEBLE, BI_ANUNCIO_MONEDA,  BI_ANUNCIO_RANGO_SUPERFICIE, BI_ANUNCIO_RANGO_ETARIO, BI_ANUNCIO_DIAS_PUBLICADO,
	BI_ANUNCIO_PRECIO_INMUEBLE, BI_ANUNCIO_COMISION,  BI_ANUNCIO_OP_CONCRETADA, BI_ANUNCIO_CANTIDAD_ANUNCIOS, BI_ANUNCIO_MONTO_TOTAL)
	SELECT BI_TIEMPO_CODIGO, ANUNCIO_TIPO_OPERACION, INMUEBLE_BARRIO, INMUEBLE_CANT_AMBIENTES, ANUNCIO_SUCURSAL,
	INMUEBLE_TIPO_INMUEBLE, ANUNCIO_MONEDA, DATABASERS.OBTENER_RANGO_SUPERFICIE(INMUEBLE_SUPERFICIETOTAL),
	DATABASERS.OBTENER_RANGO_ETARIO(PERSONA_FECHA_NAC, GETDATE()), AVG(DATEDIFF(DAY, ANUNCIO_FECHA_PUBLICACION,
	ANUNCIO_FECHA_FINALIZACION)), AVG(ANUNCIO_PRECIO_PUBLICADO), AVG(VENTA_COMISION), COUNT(*), (SELECT COUNT(*) FROM DATABASERS.ANUNCIO), SUM(VENTA_PRECIO_VENTA+VENTA_COMISION)

	FROM DATABASERS.ANUNCIO A
	JOIN DATABASERS.VENTA ON ANUNCIO_CODIGO = VENTA_ANUNCIO
	JOIN DATABASERS.INMUEBLE ON ANUNCIO_INMUEBLE = INMUEBLE_CODIGO
	JOIN DATABASERS.PERSONA ON ANUNCIO_AGENTE = PERSONA_CODIGO
	JOIN DATABASERS.BI_TIEMPO ON BI_TIEMPO_MES = MONTH(ANUNCIO_FECHA_PUBLICACION) AND BI_TIEMPO_CUATRIMESTRE = DATEPART(QUARTER, ANUNCIO_FECHA_PUBLICACION) AND BI_TIEMPO_ANIO = YEAR(ANUNCIO_FECHA_PUBLICACION)
	GROUP BY BI_TIEMPO_CODIGO, BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE, ANUNCIO_TIPO_OPERACION, INMUEBLE_BARRIO, INMUEBLE_CANT_AMBIENTES, ANUNCIO_SUCURSAL, INMUEBLE_TIPO_INMUEBLE, ANUNCIO_MONEDA, DATABASERS.OBTENER_RANGO_SUPERFICIE(INMUEBLE_SUPERFICIETOTAL),  DATABASERS.OBTENER_RANGO_ETARIO(PERSONA_FECHA_NAC, GETDATE()), ANUNCIO_FECHA_PUBLICACION, ANUNCIO_FECHA_FINALIZACION

	--anuncios con alquiler
	INSERT INTO DATABASERS.BI_ANUNCIO 
	(BI_ANUNCIO_TIEMPO, BI_ANUNCIO_TIPO_OPERACION, BI_ANUNCIO_BARRIO, BI_ANUNCIO_AMBIENTES_INMUEBLE, BI_ANUNCIO_SUCURSAL,
	BI_ANUNCIO_TIPO_INMUEBLE, BI_ANUNCIO_MONEDA,  BI_ANUNCIO_RANGO_SUPERFICIE, BI_ANUNCIO_RANGO_ETARIO, BI_ANUNCIO_DIAS_PUBLICADO,
	BI_ANUNCIO_PRECIO_INMUEBLE, BI_ANUNCIO_COMISION,  BI_ANUNCIO_OP_CONCRETADA, BI_ANUNCIO_CANTIDAD_ANUNCIOS, BI_ANUNCIO_MONTO_TOTAL)
	SELECT BI_TIEMPO_CODIGO, ANUNCIO_TIPO_OPERACION, INMUEBLE_BARRIO, INMUEBLE_CANT_AMBIENTES, ANUNCIO_SUCURSAL,
	INMUEBLE_TIPO_INMUEBLE, ANUNCIO_MONEDA, DATABASERS.OBTENER_RANGO_SUPERFICIE(INMUEBLE_SUPERFICIETOTAL),
	DATABASERS.OBTENER_RANGO_ETARIO(PERSONA_FECHA_NAC, GETDATE()), AVG(DATEDIFF(DAY, ANUNCIO_FECHA_PUBLICACION,
	ANUNCIO_FECHA_FINALIZACION)), AVG(ANUNCIO_PRECIO_PUBLICADO), AVG(ALQUILER_COMISION), COUNT(*), (SELECT COUNT(*) FROM DATABASERS.ANUNCIO), SUM(ALQUILER_DEPOSITO+ALQUILER_COMISION)
	
	FROM DATABASERS.ANUNCIO A
	JOIN DATABASERS.ALQUILER ON ANUNCIO_CODIGO = ALQUILER_ANUNCIO
	JOIN DATABASERS.INMUEBLE ON ANUNCIO_INMUEBLE = INMUEBLE_CODIGO
	JOIN DATABASERS.PERSONA ON ANUNCIO_AGENTE = PERSONA_CODIGO
	JOIN DATABASERS.BI_TIEMPO ON BI_TIEMPO_MES = MONTH(ANUNCIO_FECHA_PUBLICACION) AND BI_TIEMPO_CUATRIMESTRE = DATEPART(QUARTER, ANUNCIO_FECHA_PUBLICACION) AND BI_TIEMPO_ANIO = YEAR(ANUNCIO_FECHA_PUBLICACION)
	GROUP BY BI_TIEMPO_CODIGO, BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE, ANUNCIO_TIPO_OPERACION, INMUEBLE_BARRIO, INMUEBLE_CANT_AMBIENTES, ANUNCIO_SUCURSAL, INMUEBLE_TIPO_INMUEBLE, ANUNCIO_MONEDA, DATABASERS.OBTENER_RANGO_SUPERFICIE(INMUEBLE_SUPERFICIETOTAL),  DATABASERS.OBTENER_RANGO_ETARIO(PERSONA_FECHA_NAC, GETDATE()), ANUNCIO_FECHA_PUBLICACION, ANUNCIO_FECHA_FINALIZACION


END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_ALQUILER
AS
BEGIN 
	INSERT INTO DATABASERS.BI_ALQUILER
	(BI_ALQUILER_CANT_ALQUILER ,BI_ALQUILER_BARRIO,BI_ALQUILER_TIEMPO,BI_ALQUILER_RANGO_ETARIO)
	SELECT COUNT(*), INMUEBLE_BARRIO,BI_TIEMPO_CODIGO, DATABASERS.OBTENER_RANGO_ETARIO(PERSONA_FECHA_NAC, GETDATE())
	FROM DATABASERS.ALQUILER 
	JOIN DATABASERS.ANUNCIO ON ALQUILER_ANUNCIO=ANUNCIO_CODIGO
	JOIN DATABASERS.INMUEBLE ON ANUNCIO_INMUEBLE=INMUEBLE_CODIGO
	JOIN DATABASERS.BI_TIEMPO ON BI_TIEMPO_MES=MONTH(ALQUILER_FECHA_INICIO) AND BI_TIEMPO_CUATRIMESTRE=DATEPART(QUARTER,ALQUILER_FECHA_INICIO) AND BI_TIEMPO_ANIO = YEAR(ALQUILER_FECHA_INICIO)
	JOIN DATABASERS.PERSONA ON ANUNCIO_AGENTE=PERSONA_CODIGO
	GROUP BY INMUEBLE_BARRIO, BI_TIEMPO_CODIGO, DATABASERS.OBTENER_RANGO_ETARIO(PERSONA_FECHA_NAC, GETDATE())
END 
GO
/*
CREATE PROCEDURE DATABASASERS.MIGRAR_BI_PAGO_ALQUILER
AS
BEGIN 
	INSERT INTO DATABASERS.BI_PAGO_ALQUILER 
	(BI_PAGO_ALQUILER_TIEMPO,BI_PAGO_ALQUILER_INCUMPLIMIENTO,BI_PAGO_ALQUILER_INCREMENTO)
	SELECT DISTINCT BI_TIEMPO_CODIGO, CASE WHEN PAGO_ALQUILER_FECHA >= PAGO_ALQUILER_FECHA_VENCIMIENTO THEN 1 ELSE 0 END FROM DATABASERS.ALQUILER 
	JOIN DATABASERS.PAGO_ALQUILER ON PAGO_ALQUILER_ALQUILER=ALQUILER_CODIGO 
	JOIN DATABASERS.BI_TIEMPO ON BI_TIEMPO_MES=MONTH(PAGO_ALQUILER_FECHA) AND BI_TIEMPO_CUATRIMESTRE=DATEPART(QUARTER,PAGO_ALQUILER_FECHA) AND BI_TIEMPO_ANIO = YEAR(PAGO_ALQUILER_FECHA)
END 
*/

CREATE PROCEDURE DATABASERS.MIGRAR_BI_VENTA
AS
BEGIN
INSERT INTO DATABASERS.BI_VENTA
    (BI_VENTA_LOCALIDAD,
	BI_VENTA_TIEMPO,
	BI_VENTA_TIPO_INMUEBLE,
	BI_VENTA_CANT_AMBIENTES,
	BI_VENTA_RANGO_ETARIO_AGENTE,
	BI_VENTA_RANGO_SUPERFICIE,
	BI_VENTA_SUCURSAL,
	BI_VENTA_MONEDA,
	BI_VENTA_CANT_TOTAL,
	BI_VENTA_PRECIO_M2)
	 	
	(SELECT
	DISTINCT 
	BARRIO_LOCALIDAD,
	BI_TIEMPO_CODIGO,
	INMUEBLE_TIPO_INMUEBLE,
	INMUEBLE_CANT_AMBIENTES,
	DATABASERS.OBTENER_RANGO_ETARIO(PERSONA_FECHA_NAC,VENTA_FECHA),
	DATABASERS.OBTENER_RANGO_SUPERFICIE(INMUEBLE_SUPERFICIETOTAL),
	SUCURSAL_CODIGO,
	VENTA_MONEDA,
	COUNT(*),
	SUM(VENTA_PRECIO_VENTA/INMUEBLE_SUPERFICIETOTAL)
	FROM DATABASERS.VENTA 
	 JOIN DATABASERS.ANUNCIO ON ANUNCIO_CODIGO = VENTA_ANUNCIO
	 JOIN DATABASERS.SUCURSAL ON SUCURSAL_CODIGO = ANUNCIO_SUCURSAL
	 JOIN DATABASERS.BI_TIEMPO ON BI_TIEMPO_ANIO = YEAR(VENTA_FECHA) AND BI_TIEMPO_CUATRIMESTRE=DATEPART(QUARTER, VENTA_FECHA) AND BI_TIEMPO_MES=MONTH(VENTA_FECHA)
	 JOIN DATABASERS.INMUEBLE ON INMUEBLE_CODIGO = ANUNCIO_INMUEBLE
	 JOIN DATABASERS.BARRIO ON INMUEBLE_BARRIO = BARRIO_CODIGO
	 JOIN DATABASERS.PERSONA ON PERSONA_CODIGO = ANUNCIO_AGENTE
	 GROUP BY 
	 BARRIO_LOCALIDAD,
	BI_TIEMPO_CODIGO,
	INMUEBLE_TIPO_INMUEBLE,
	INMUEBLE_CANT_AMBIENTES,
	SUCURSAL_CODIGO,
	VENTA_MONEDA,
	DATABASERS.OBTENER_RANGO_ETARIO(PERSONA_FECHA_NAC,VENTA_FECHA),
	DATABASERS.OBTENER_RANGO_SUPERFICIE(INMUEBLE_SUPERFICIETOTAL))


    END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_RELACIONAL
AS
BEGIN
	EXECUTE DATABASERS.MIGRAR_BI_TIEMPO
	EXECUTE DATABASERS.MIGRAR_BI_RANGO_SUPERFICIE
	EXECUTE DATABASERS.MIGRAR_BI_RANGO_ETARIO
	EXECUTE DATABASERS.MIGRAR_BI_TIPO_INMUEBLE
	EXECUTE DATABASERS.MIGRAR_BI_TIPO_OPERACION
	EXECUTE DATABASERS.MIGRAR_BI_MONEDA
	EXECUTE DATABASERS.MIGRAR_BI_SUCURSAL
	EXECUTE DATABASERS.MIGRAR_BI_AMBIENTES_INMUEBLE
	EXECUTE DATABASERS.MIGRAR_BI_BARRIO
	EXECUTE DATABASERS.MIGRAR_BI_LOCALIDAD
	EXECUTE DATABASERS.MIGRAR_BI_VENTA
	EXECUTE DATABASERS.MIGRAR_BI_ALQUILER
	--EXECUTE DATABASERS.MIGRAR_BI_PAGO_ALQUILER
	EXECUTE DATABASERS.MIGRAR_BI_ANUNCIO
END
GO


-- 5. EJECUCIÓN DE MIGRACIÓN

/*
EXEC DATABASERS.ELIMINAR_TABLAS_BI
EXEC DATABASERS.ELIMINAR_PROCEDIMIENTOS_BI
EXEC DATABASERS.ELIMINAR_CREAR_TABLAS_BI

GO
*/

EXEC DATABASERS.CREAR_TABLAS_BI
EXEC DATABASERS.AGREGAR_FK_BI
EXEC DATABASERS.MIGRAR_RELACIONAL
GO

-- 6. CREACIÓN DE VISTAS

-- VISTA 1
CREATE VIEW DATABASERS.PROM_DIAS_PUBLICACION
AS
	SELECT (BI_ANUNCIO_DIAS_PUBLICADO) AS DIAS_PROMEDIO, BI_TIPO_OPERACION_DETALLE, BI_BARRIO_DETALLE, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_ANIO
	FROM DATABASERS.BI_ANUNCIO 
	JOIN DATABASERS.BI_TIPO_OPERACION ON BI_ANUNCIO_TIPO_OPERACION = BI_TIPO_OPERACION_CODIGO
	JOIN DATABASERS.BI_BARRIO ON BI_ANUNCIO_BARRIO = BI_BARRIO_CODIGO
	JOIN DATABASERS.BI_TIEMPO ON BI_ANUNCIO_TIEMPO = BI_TIEMPO_CODIGO
	GROUP BY BI_ANUNCIO_DIAS_PUBLICADO, BI_TIPO_OPERACION_DETALLE, BI_BARRIO_DETALLE, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_ANIO
GO

-- VISTA 2
CREATE VIEW DATABASERS.PROM_PRECIO_ANUNCIO
AS
	SELECT CONCAT(AVG(BI_ANUNCIO_PRECIO_INMUEBLE),' ',BI_MONEDA_DETALLE) AS PRECIO_PROMEDIO, BI_TIPO_OPERACION_DETALLE, BI_TIPO_INMUEBLE_DETALLE, BI_RANGO_SUPERFICIE_DETALLE, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_ANIO
	FROM DATABASERS.BI_ANUNCIO 
	JOIN DATABASERS.BI_TIPO_OPERACION ON BI_ANUNCIO_TIPO_OPERACION = BI_TIPO_OPERACION_CODIGO
	JOIN DATABASERS.BI_TIPO_INMUEBLE ON BI_ANUNCIO_TIPO_INMUEBLE = BI_TIPO_INMUEBLE_CODIGO
	JOIN DATABASERS.BI_RANGO_SUPERFICIE ON BI_ANUNCIO_RANGO_SUPERFICIE = BI_RANGO_SUPERFICIE_CODIGO
	JOIN DATABASERS.BI_MONEDA ON BI_ANUNCIO_MONEDA = BI_MONEDA_CODIGO
	JOIN DATABASERS.BI_TIEMPO ON BI_ANUNCIO_TIEMPO = BI_TIEMPO_CODIGO
	GROUP BY BI_TIPO_OPERACION_DETALLE, BI_TIPO_INMUEBLE_DETALLE, BI_RANGO_SUPERFICIE_DETALLE, BI_MONEDA_DETALLE, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_ANIO
GO

--VISTA 3
CREATE VIEW DATABASERS.MEJORES_BARRIOS
AS
	SELECT TOP 5 BI_BARRIO_DETALLE AS MEJOR_BARRIO, BI_ALQUILER_CANT_ALQUILER, BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE FROM DATABASERS.BI_ALQUILER
	JOIN DATABASERS.BI_TIEMPO ON BI_ALQUILER_TIEMPO=BI_TIEMPO_CODIGO
	JOIN DATABASERS.BI_RANGO_ETARIO ON BI_ALQUILER_RANGO_ETARIO = BI_RANGO_ETARIO_CODIGO
	JOIN DATABASERS.BI_BARRIO ON BI_ALQUILER_BARRIO = BI_BARRIO_CODIGO
	GROUP BY BI_BARRIO_DETALLE, BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE, BI_ALQUILER_CANT_ALQUILER
	ORDER BY BI_ALQUILER_CANT_ALQUILER DESC
GO

-- VISTA 4

CREATE VIEW DATABASERS.PORCENTAJE_INCUMPLIMIENTO
AS
	SELECT CONCAT(100*SUM(BI_PAGO_ALQUILER_INCUMPLIMIENTO)/COUNT(*), ' %') AS PORCENTAJE_INCUMPLIMIENTO, BI_TIEMPO_ANIO, BI_TIEMPO_MES
	FROM DATABASERS.BI_PAGO_ALQUILER
	JOIN DATABASERS.BI_TIEMPO ON BI_PAGO_ALQUILER_TIEMPO = BI_TIEMPO_CODIGO
	GROUP BY BI_TIEMPO_ANIO, BI_TIEMPO_MES
GO

-- VISTA 5
CREATE VIEW DATABASERS.INCREMENTO_ALQUILER
AS
	SELECT CONCAT(100*SUM(BI_PAGO_ALQUILER_INCREMENTO)/COUNT(*), ' %') AS PORCENTAJE_PROM_INCREMENTO, BI_TIEMPO_ANIO, BI_TIEMPO_MES
	FROM DATABASERS.BI_PAGO_ALQUILER
	JOIN DATABASERS.BI_TIEMPO ON BI_PAGO_ALQUILER_TIEMPO = BI_TIEMPO_CODIGO
	GROUP BY BI_TIEMPO_ANIO, BI_TIEMPO_MES
GO

-- VISTA 6
CREATE VIEW DATABASERS.PROM_PRECIO_M2_VENTAS
AS
	SELECT BI_TIPO_INMUEBLE_DETALLE, BI_LOCALIDAD_DETALLE, BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE, AVG(BI_VENTA_PRECIO_M2) AS PROM_PRECIO_M2
	FROM DATABASERS.BI_VENTA 
	JOIN DATABASERS.BI_TIPO_INMUEBLE ON BI_VENTA_TIPO_INMUEBLE= BI_TIPO_INMUEBLE_CODIGO
	JOIN DATABASERS.BI_LOCALIDAD ON BI_VENTA_LOCALIDAD = BI_LOCALIDAD_CODIGO
	JOIN DATABASERS.BI_TIEMPO ON BI_VENTA_TIEMPO = BI_TIEMPO_CODIGO
	GROUP BY  BI_TIPO_INMUEBLE_DETALLE, BI_LOCALIDAD_DETALLE, BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE
GO

-- VISTA 7
CREATE VIEW DATABASERS.PROM_COMISION
AS
	SELECT AVG(BI_ANUNCIO_COMISION) AS COMISION_PROMEDIO, BI_TIPO_OPERACION_DETALLE, BI_SUCURSAL_NOMBRE, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_ANIO
	FROM DATABASERS.BI_ANUNCIO 
	JOIN DATABASERS.BI_TIPO_OPERACION ON BI_ANUNCIO_TIPO_OPERACION = BI_TIPO_OPERACION_CODIGO
	JOIN DATABASERS.BI_SUCURSAL ON BI_ANUNCIO_SUCURSAL = BI_SUCURSAL_CODIGO
	JOIN DATABASERS.BI_TIEMPO ON BI_ANUNCIO_TIEMPO = BI_TIEMPO_CODIGO
	GROUP BY BI_TIPO_OPERACION_DETALLE, BI_SUCURSAL_NOMBRE, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_ANIO
GO

--VISTA 8
CREATE VIEW DATABASERS.PORCENTAJE_OPERACIONES_CONCRETADAS
AS
	SELECT BI_SUCURSAL_NOMBRE, BI_RANGO_ETARIO_DETALLE, BI_TIPO_OPERACION_DETALLE, BI_TIEMPO_ANIO, CAST(100.0 * SUM(BI_ANUNCIO_OP_CONCRETADA) / BI_ANUNCIO_CANTIDAD_ANUNCIOS AS DECIMAL) AS PORCENTAJE
	FROM DATABASERS.BI_ANUNCIO
			 JOIN DATABASERS.BI_SUCURSAL ON BI_ANUNCIO_SUCURSAL = BI_SUCURSAL_CODIGO
			 JOIN DATABASERS.BI_TIEMPO ON BI_ANUNCIO_TIEMPO = BI_TIEMPO_CODIGO
			 JOIN DATABASERS.BI_RANGO_ETARIO ON BI_ANUNCIO_RANGO_ETARIO = BI_RANGO_ETARIO_CODIGO
			 JOIN DATABASERS.BI_TIPO_OPERACION ON BI_ANUNCIO_TIPO_OPERACION = BI_TIPO_OPERACION_CODIGO
	GROUP BY BI_SUCURSAL_NOMBRE, BI_RANGO_ETARIO_DETALLE, BI_TIPO_OPERACION_DETALLE, BI_TIEMPO_ANIO, BI_ANUNCIO_CANTIDAD_ANUNCIOS
GO


--VISTA 9
CREATE VIEW DATABASERS.MONTO_TOTAL_CIERRE_CONTRATOS_POR_TIPO_OP
AS
	SELECT BI_TIEMPO_CUATRIMESTRE,BI_TIPO_OPERACION_DETALLE, BI_SUCURSAL_NOMBRE, BI_MONEDA_DETALLE, SUM(BI_ANUNCIO_MONTO_TOTAL) AS MONTO_TOTAL_CIERRE_CONTRATO
	FROM DATABASERS.BI_ANUNCIO
			 JOIN DATABASERS.BI_SUCURSAL ON BI_ANUNCIO_SUCURSAL = BI_SUCURSAL_CODIGO
			 JOIN DATABASERS.BI_TIEMPO ON BI_ANUNCIO_TIEMPO = BI_TIEMPO_CODIGO
			 JOIN DATABASERS.BI_MONEDA ON BI_ANUNCIO_MONEDA = BI_MONEDA_CODIGO
			 JOIN DATABASERS.BI_TIPO_OPERACION ON BI_ANUNCIO_TIPO_OPERACION = BI_TIPO_OPERACION_CODIGO
	GROUP BY BI_TIEMPO_CUATRIMESTRE,BI_TIPO_OPERACION_DETALLE, BI_SUCURSAL_NOMBRE, BI_MONEDA_DETALLE
GO


-- 6. EJECUCIÓN DE MIGRACIÓN

/*
EXEC DATABASERS.ELIMINAR_TABLAS_BI
EXEC DATABASERS.ELIMINAR_PROCEDIMIENTOS_BI
EXEC DATABASERS.ELIMINAR_CREAR_TABLAS_BI
GO
*/

EXEC DATABASERS.CREAR_TABLAS_BI
EXEC DATABASERS.AGREGAR_FK_BI
EXEC DATABASERS.MIGRAR_RELACIONAL
GO

-- 7. SELECCIÓN DE VISTAS

SELECT * FROM DATABASERS.PROM_DIAS_PUBLICACION
SELECT * FROM DATABASERS.PROM_PRECIO_ANUNCIO
SELECT * FROM DATABASERS.MEJORES_BARRIOS
SELECT * FROM DATABASERS.PORCENTAJE_INCUMPLIMIENTO
SELECT * FROM DATABASERS.INCREMENTO_ALQUILER
SELECT * FROM DATABASERS.PROM_PRECIO_M2_VENTAS
SELECT * FROM DATABASERS.PROM_COMISION
SELECT * FROM DATABASERS.PORCENTAJE_OPERACIONES_CONCRETADAS
SELECT * FROM DATABASERS.MONTO_TOTAL_CIERRE_CONTRATOS_POR_TIPO_OP

IF OBJECT_ID('DATABASERS.PROM_DIAS_PUBLICACION', 'V') IS NOT NULL DROP VIEW DATABASERS.PROM_DIAS_PUBLICACION;
IF OBJECT_ID('DATABASERS.PROM_PRECIO_ANUNCIO', 'V') IS NOT NULL DROP VIEW DATABASERS.PROM_PRECIO_ANUNCIO;
IF OBJECT_ID('DATABASERS.MEJORES_BARRIOS', 'V') IS NOT NULL DROP VIEW DATABASERS.MEJORES_BARRIOS;
IF OBJECT_ID('DATABASERS.PORCENTAJE_INCUMPLIMIENTO', 'V') IS NOT NULL DROP VIEW DATABASERS.PORCENTAJE_INCUMPLIMIENTO;
IF OBJECT_ID('DATABASERS.INCREMENTO_ALQUILER', 'V') IS NOT NULL DROP VIEW DATABASERS.INCREMENTO_ALQUILER;
IF OBJECT_ID('DATABASERS.PROM_PRECIO_M2_VENTAS', 'V') IS NOT NULL DROP VIEW DATABASERS.PROM_PRECIO_M2_VENTAS;
IF OBJECT_ID('DATABASERS.PROM_COMISION', 'V') IS NOT NULL DROP VIEW DATABASERS.PROM_COMISION;
IF OBJECT_ID('DATABASERS.PORCENTAJE_OPERACIONES_CONCRETADAS', 'V') IS NOT NULL DROP VIEW DATABASERS.PORCENTAJE_OPERACIONES_CONCRETADAS;
IF OBJECT_ID('DATABASERS.MONTO_TOTAL_CIERRE_CONTRATOS_POR_TIPO_OP', 'V') IS NOT NULL DROP VIEW DATABASERS.MONTO_TOTAL_CIERRE_CONTRATOS_POR_TIPO_OP;

