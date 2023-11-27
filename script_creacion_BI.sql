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
    IF OBJECT_ID('DATABASERS.BI_ESTADO_ALQUILER', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_ESTADO_ALQUILER;
    IF OBJECT_ID('DATABASERS.BI_PAGO_ALQUILER', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_PAGO_ALQUILER;
    IF OBJECT_ID('DATABASERS.BI_BARRIO', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_BARRIO;
    IF OBJECT_ID('DATABASERS.BI_LOCALIDAD', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_LOCALIDAD;
    IF OBJECT_ID('DATABASERS.BI_TIPO_OPERACION', 'U') IS NOT NULL DROP TABLE DATABASERS.BI_TIPO_OPERACION;
END
GO


CREATE PROCEDURE DATABASERS.ELIMINAR_PROCEDIMIENTOS_BI
AS
BEGIN
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_TIEMPO_Y_VENTA', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_TIEMPO_Y_VENTA
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_TIEMPO_Y_ALQUILER', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_TIEMPO_Y_ALQUILER
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_TIEMPO_Y_ANUNCIO', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_TIEMPO_Y_ANUNCIO
	IF OBJECT_ID('DATABASERS.GENERAR_BI_TIEMPO', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.GENERAR_BI_TIEMPO
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_RANGO_SUPERFICIE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_RANGO_SUPERFICIE
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_RANGO_ETARIO', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_RANGO_ETARIO
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_TIPO_INMUEBLE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_TIPO_INMUEBLE
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_TIPO_OPERACION', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_TIPO_OPERACION
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_MONEDA', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_MONEDA
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_SUCURSAL', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_SUCURSAL
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_AMBIENTES_INMUEBLE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_AMBIENTES_INMUEBLE
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_ESTADO_ALQUILER', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_ESTADO_ALQUILER
	IF OBJECT_ID('DATABASERS.MIGRAR_BI_BARRIO', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_BARRIO
    IF OBJECT_ID('DATABASERS.MIGRAR_BI_LOCALIDAD', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.MIGRAR_BI_LOCALIDAD
	IF OBJECT_ID('DATABASERS.OBTENER_RANGO_SUPERFICIE', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.OBTENER_RANGO_SUPERFICIE
	IF OBJECT_ID('DATABASERS.OBTENER_RANGO_ETARIO', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.OBTENER_RANGO_ETARIO
	IF OBJECT_ID('DATABASERS.OBTENER_COMISION', 'P') IS NOT NULL DROP PROCEDURE DATABASERS.OBTENER_COMISION
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
	BI_ANUNCIO_CODIGO NUMERIC (19,0) PRIMARY KEY NOT NULL,
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
	BI_ANUNCIO_COMISION NUMERIC (18,2) NULL
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
	BI_VENTA_CODIGO NUMERIC(18,0) PRIMARY KEY NOT NULL,
	BI_VENTA_INMUEBLE_SUPERFICIE_TOTAL NUMERIC(18,2) NULL,
	BI_VENTA_LOCALIDAD NUMERIC(18, 0) NOT NULL,
	BI_VENTA_TIEMPO INTEGER NOT NULL,
	BI_VENTA_PRECIO_VENTA NUMERIC(18, 2) NULL,
	BI_VENTA_TIPO_INMUEBLE NUMERIC(18, 0) NOT NULL,
	BI_VENTA_PRECIO_M2 NUMERIC(18, 2) NULL
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
	BI_TIEMPO_MES INTEGER NULL,
	BI_TIEMPO_DIA INTEGER NULL
)

CREATE TABLE DATABASERS.BI_SUCURSAL(
	BI_SUCURSAL_CODIGO NUMERIC(18,0) PRIMARY KEY NOT NULL,
	BI_SUCURSAL_NOMBRE NVARCHAR(100) NULL,
)

CREATE TABLE DATABASERS.BI_ALQUILER
(
	BI_ALQUILER_CODIGO NUMERIC(18,0) NOT NULL,
	BI_ALQUILER_PAGO_CODIGO NUMERIC(18,0) NOT NULL,
	BI_ALQUILER_BARRIO NUMERIC(18,0) NOT NULL,
	BI_ALQUILER_ESTADO NUMERIC(18,0) NOT NULL,
	BI_ALQUILER_TIEMPO INTEGER  NOT NULL,
	BI_ALQUILER_RANGO_ETARIO INTEGER NOT NULL,
	BI_ALQUILER_INCUMPLIMIENTO TINYINT NULL, --1 TRUE, 0 FALSE
	BI_ALQUILER_INCREMENTO NUMERIC (18,2) NULL,
	PRIMARY KEY(BI_ALQUILER_CODIGO, BI_ALQUILER_PAGO_CODIGO)
)

CREATE TABLE DATABASERS.BI_ESTADO_ALQUILER(
	BI_ESTADO_ALQUILER_CODIGO NUMERIC(18,0) PRIMARY KEY NOT NULL,
	BI_ESTADO_ALQUILER_NOMBRE NVARCHAR (100) NULL
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

--FK BI_ALQUILER
ALTER TABLE DATABASERS.BI_ALQUILER 
ADD FOREIGN KEY (BI_ALQUILER_BARRIO) REFERENCES DATABASERS.BI_BARRIO(BI_BARRIO_CODIGO); 

ALTER TABLE DATABASERS.BI_ALQUILER 
ADD FOREIGN KEY (BI_ALQUILER_RANGO_ETARIO) REFERENCES DATABASERS.BI_RANGO_ETARIO(BI_RANGO_ETARIO_CODIGO);

ALTER TABLE DATABASERS.BI_ALQUILER
ADD FOREIGN KEY (BI_ALQUILER_TIEMPO) REFERENCES DATABASERS.BI_TIEMPO(BI_TIEMPO_CODIGO);

ALTER TABLE DATABASERS.BI_ALQUILER 
ADD FOREIGN KEY (BI_ALQUILER_ESTADO) REFERENCES DATABASERS.BI_ESTADO_ALQUILER(BI_ESTADO_ALQUILER_CODIGO);

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

CREATE PROCEDURE DATABASERS.GENERAR_BI_TIEMPO(@fecha datetime, @PK INTEGER OUTPUT)
AS 
BEGIN

	INSERT INTO DATABASERS.BI_TIEMPO 
	(BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_MES, BI_TIEMPO_DIA)
	VALUES (YEAR(@FECHA), DATEPART(QUARTER, @FECHA), MONTH(@FECHA), DAY(@FECHA))

	SET @PK = SCOPE_IDENTITY()

END
GO

CREATE PROCEDURE DATABASERS.OBTENER_RANGO_SUPERFICIE(@SUPERFICIE NUMERIC (18,2), @RANGO INTEGER OUTPUT)
AS 
BEGIN

	IF(@SUPERFICIE<35) SET @RANGO = 1 
	ELSE IF(@SUPERFICIE>=35 AND @SUPERFICIE<55) SET @RANGO = 2
	ELSE IF(@SUPERFICIE>=55 AND @SUPERFICIE<75) SET @RANGO = 3
	ELSE IF(@SUPERFICIE>=75 AND @SUPERFICIE<100) SET @RANGO = 4
	ELSE IF(@SUPERFICIE>=100) SET @RANGO = 5

END
GO

CREATE PROCEDURE DATABASERS.OBTENER_RANGO_ETARIO(@FECHA_NAC DATETIME, @FECHA DATETIME, @RANGO INTEGER OUTPUT)
AS 
BEGIN

	DECLARE @EDAD INTEGER

	SET @EDAD = DATEDIFF(YEAR, @FECHA_NAC, @FECHA)

	IF(@EDAD<25) SET @RANGO = 1 
	ELSE IF(@EDAD>=25 AND @EDAD<35) SET @RANGO = 2
	ELSE IF(@EDAD>=35 AND @EDAD<50) SET @RANGO = 3
	ELSE IF(@EDAD>=50) SET @RANGO = 4

END
GO

CREATE PROCEDURE DATABASERS.OBTENER_COMISION( @ANUNCIO NUMERIC(19,0), @TIPO_OPERACION NUMERIC(18,0), @COMISION NUMERIC(18,2) OUTPUT)
AS 
BEGIN
	IF(@TIPO_OPERACION = 1 OR @TIPO_OPERACION = 2)
	BEGIN
		SELECT @COMISION = ALQUILER_COMISION FROM DATABASERS.ALQUILER WHERE ALQUILER_ANUNCIO = @ANUNCIO
	END
	ELSE IF(@TIPO_OPERACION = 3)
	BEGIN
		SELECT @COMISION = VENTA_COMISION FROM DATABASERS.VENTA WHERE VENTA_ANUNCIO = @ANUNCIO
	END

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


CREATE PROCEDURE DATABASERS.MIGRAR_BI_ESTADO_ALQUILER
AS 
BEGIN 
	INSERT INTO DATABASERS.BI_ESTADO_ALQUILER
	SELECT DISTINCT ESTADO_ALQUILER_CODIGO, ESTADO_ALQUILER_NOMBRE FROM DATABASERS.ESTADO_ALQUILER
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


CREATE PROCEDURE DATABASERS.MIGRAR_BI_TIEMPO_Y_ANUNCIO
AS
BEGIN
	-- ATRIBUTOS DE ANUNCIO
	DECLARE @ANUNCIO_CODIGO NUMERIC(19,0)
	DECLARE @ANUNCIO_SUCURSAL NUMERIC(19)
	DECLARE @ANUNCIO_TIPO_OPERACION NUMERIC(18,0)
	DECLARE @ANUNCIO_MONEDA NUMERIC(18,0)
	DECLARE @ANUNCIO_PRECIO_PUBLICADO NUMERIC(18,2)
	DECLARE @ANUNCIO_FECHA_PUBLICACION DATETIME
    DECLARE @ANUNCIO_FECHA_FINALIZACION DATETIME
	--ATRIBUTOS DE INMUEBLE
	DECLARE @ANUNCIO_AMBIENTES_INMUEBLE NUMERIC(18,0)
	DECLARE @ANUNCIO_SUPERFICIE NUMERIC(18,0)
	DECLARE @ANUNCIO_TIPO_INMUEBLE NUMERIC(18,0)
	DECLARE @ANUNCIO_BARRIO NUMERIC(18,0)
	--ATRIBUTOS DE AGENTE/PERSONA
	DECLARE @ANUNCIO_FECHA_NAC_AGENTE DATETIME

	declare c1 cursor for SELECT ANUNCIO_CODIGO, ANUNCIO_SUCURSAL, ANUNCIO_TIPO_OPERACION,
	ANUNCIO_MONEDA, ANUNCIO_PRECIO_PUBLICADO, ANUNCIO_FECHA_PUBLICACION, ANUNCIO_FECHA_FINALIZACION,
	INMUEBLE_CANT_AMBIENTES, INMUEBLE_SUPERFICIETOTAL, INMUEBLE_TIPO_INMUEBLE, INMUEBLE_BARRIO, PERSONA_FECHA_NAC
	FROM DATABASERS.ANUNCIO
	JOIN DATABASERS.INMUEBLE ON ANUNCIO_INMUEBLE = INMUEBLE_CODIGO 
	JOIN DATABASERS.PERSONA ON ANUNCIO_AGENTE = PERSONA_CODIGO
	open c1
	fetch next from c1 into @ANUNCIO_CODIGO, @ANUNCIO_SUCURSAL, @ANUNCIO_TIPO_OPERACION, @ANUNCIO_MONEDA, 
	@ANUNCIO_PRECIO_PUBLICADO,@ANUNCIO_FECHA_PUBLICACION, @ANUNCIO_FECHA_FINALIZACION, @ANUNCIO_AMBIENTES_INMUEBLE,
	@ANUNCIO_SUPERFICIE, @ANUNCIO_TIPO_INMUEBLE, @ANUNCIO_BARRIO, @ANUNCIO_FECHA_NAC_AGENTE
	while @@FETCH_STATUS = 0
	begin 
			
			DECLARE @FK_BI_TIEMPO INTEGER
			DECLARE @RANGO_ETARIO INTEGER
			DECLARE @RANGO_SUPERFICIE INTEGER
			DECLARE @ANUNCIO_COMISION NUMERIC (18,2)

			--
			DECLARE @OPERACION_CONCRETADA TINYINT
			DECLARE @MONTO_TOTAL_OPERACION NUMERIC (18,2)
			SET @OPERACION_CONCRETADA = 0
			SET @MONTO_TOTAL_OPERACION = 0

			IF (SELECT VENTA_CODIGO FROM DATABASERS.VENTA WHERE VENTA_ANUNCIO = @ANUNCIO_CODIGO) IS NOT NULL
			BEGIN
				SET @MONTO_TOTAL_OPERACION = (SELECT VENTA_PRECIO_VENTA FROM DATABASERS.VENTA WHERE VENTA_ANUNCIO = @ANUNCIO_CODIGO) + (SELECT VENTA_COMISION FROM DATABASERS.VENTA WHERE VENTA_ANUNCIO = @ANUNCIO_CODIGO)
				SET @OPERACION_CONCRETADA = 1
			END
			IF (SELECT ALQUILER_CODIGO FROM DATABASERS.ALQUILER WHERE ALQUILER_ANUNCIO = @ANUNCIO_CODIGO) IS NOT NULL
			BEGIN
				SET @MONTO_TOTAL_OPERACION = (SELECT ALQUILER_DEPOSITO FROM DATABASERS.ALQUILER WHERE ALQUILER_ANUNCIO = @ANUNCIO_CODIGO) + (SELECT ALQUILER_COMISION FROM DATABASERS.ALQUILER WHERE ALQUILER_ANUNCIO = @ANUNCIO_CODIGO)
				SET @OPERACION_CONCRETADA = 1
			END
			--

			SET @FK_BI_TIEMPO = 0
			SET @RANGO_ETARIO = 0
			SET @RANGO_SUPERFICIE = 0
			SET @ANUNCIO_COMISION = 0

			EXEC DATABASERS.GENERAR_BI_TIEMPO @FECHA=@ANUNCIO_FECHA_PUBLICACION, @PK=@FK_BI_TIEMPO OUTPUT
			EXEC DATABASERS.OBTENER_RANGO_ETARIO @FECHA_NAC=@ANUNCIO_FECHA_NAC_AGENTE, @FECHA=@ANUNCIO_FECHA_PUBLICACION, @RANGO=@RANGO_ETARIO OUTPUT
			EXEC DATABASERS.OBTENER_RANGO_SUPERFICIE @SUPERFICIE=@ANUNCIO_SUPERFICIE, @RANGO=@RANGO_SUPERFICIE OUTPUT
			EXEC DATABASERS.OBTENER_COMISION @ANUNCIO=@ANUNCIO_CODIGO, @TIPO_OPERACION=@ANUNCIO_TIPO_OPERACION, @COMISION=@ANUNCIO_COMISION OUTPUT
			

			INSERT INTO DATABASERS.BI_ANUNCIO
			(BI_ANUNCIO_CODIGO, BI_ANUNCIO_SUCURSAL, BI_ANUNCIO_TIPO_OPERACION, BI_ANUNCIO_AMBIENTES_INMUEBLE,
			BI_ANUNCIO_RANGO_SUPERFICIE, BI_ANUNCIO_TIPO_INMUEBLE, BI_ANUNCIO_MONEDA, BI_ANUNCIO_TIEMPO,
			BI_ANUNCIO_RANGO_ETARIO, BI_ANUNCIO_BARRIO, BI_ANUNCIO_DIAS_PUBLICADO, BI_ANUNCIO_PRECIO_INMUEBLE, BI_ANUNCIO_COMISION,
			BI_ANUNCIO_OP_CONCRETADA, BI_ANUNCIO_MONTO_TOTAL)

			VALUES (@ANUNCIO_CODIGO, @ANUNCIO_SUCURSAL, @ANUNCIO_TIPO_OPERACION, @ANUNCIO_AMBIENTES_INMUEBLE,
			@RANGO_SUPERFICIE, @ANUNCIO_TIPO_INMUEBLE, @ANUNCIO_MONEDA, @FK_BI_TIEMPO, @RANGO_ETARIO, @ANUNCIO_BARRIO,
			DATEDIFF(DAY, @ANUNCIO_FECHA_PUBLICACION, @ANUNCIO_FECHA_FINALIZACION), @ANUNCIO_PRECIO_PUBLICADO, @ANUNCIO_COMISION,
			@OPERACION_CONCRETADA, @MONTO_TOTAL_OPERACION)


		fetch next from c1 into @ANUNCIO_CODIGO, @ANUNCIO_SUCURSAL, @ANUNCIO_TIPO_OPERACION, @ANUNCIO_MONEDA, 
		@ANUNCIO_PRECIO_PUBLICADO,@ANUNCIO_FECHA_PUBLICACION, @ANUNCIO_FECHA_FINALIZACION, @ANUNCIO_AMBIENTES_INMUEBLE,
		@ANUNCIO_SUPERFICIE, @ANUNCIO_TIPO_INMUEBLE, @ANUNCIO_BARRIO, @ANUNCIO_FECHA_NAC_AGENTE
	end
	close c1
	deallocate c1

END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_TIEMPO_Y_VENTA
AS
BEGIN
	
	DECLARE @VENTA_CODIGO NUMERIC(18,0)
	DECLARE @VENTA_ANUNCIO NUMERIC(19,0)
	DECLARE @VENTA_PRECIO_VENTA NUMERIC(18,2)
	DECLARE @VENTA_FECHA DATETIME

	declare c1 cursor for select VENTA_CODIGO, VENTA_ANUNCIO, VENTA_PRECIO_VENTA, VENTA_FECHA from DATABASERS.VENTA
	open c1
	fetch next from c1 into @VENTA_CODIGO, @VENTA_ANUNCIO,@VENTA_PRECIO_VENTA,@VENTA_FECHA
	while @@FETCH_STATUS = 0
	begin 
			
			DECLARE @FK_BI_TIEMPO INTEGER

			SET @FK_BI_TIEMPO = 0 

			EXEC DATABASERS.GENERAR_BI_TIEMPO @FECHA=@VENTA_FECHA, @PK=@FK_BI_TIEMPO OUTPUT

			INSERT INTO DATABASERS.BI_VENTA
			(BI_VENTA_CODIGO,
			BI_VENTA_INMUEBLE_SUPERFICIE_TOTAL,
			BI_VENTA_LOCALIDAD,
			BI_VENTA_PRECIO_VENTA,
			BI_VENTA_TIPO_INMUEBLE,
			BI_VENTA_PRECIO_M2,
			BI_VENTA_TIEMPO)

			SELECT 
			@VENTA_CODIGO,
			(SELECT INMUEBLE_SUPERFICIETOTAL FROM DATABASERS.INMUEBLE
			JOIN DATABASERS.ANUNCIO ON INMUEBLE_CODIGO = ANUNCIO_INMUEBLE
			WHERE ANUNCIO_CODIGO = @VENTA_ANUNCIO),
			(SELECT SUCURSAL_LOCALIDAD FROM DATABASERS.SUCURSAL
			JOIN DATABASERS.ANUNCIO ON ANUNCIO_SUCURSAL = SUCURSAL_CODIGO
			WHERE ANUNCIO_CODIGO = @VENTA_ANUNCIO),
			@VENTA_PRECIO_VENTA,
			(SELECT INMUEBLE_TIPO_INMUEBLE FROM DATABASERS.INMUEBLE
			JOIN DATABASERS.ANUNCIO ON ANUNCIO_INMUEBLE = INMUEBLE_CODIGO
			WHERE ANUNCIO_CODIGO = @VENTA_ANUNCIO),
			@VENTA_PRECIO_VENTA /(SELECT INMUEBLE_SUPERFICIETOTAL FROM DATABASERS.INMUEBLE
			JOIN DATABASERS.ANUNCIO ON INMUEBLE_CODIGO = ANUNCIO_INMUEBLE
			WHERE ANUNCIO_CODIGO = @VENTA_ANUNCIO),
			@FK_BI_TIEMPO

		fetch next from c1 into @VENTA_CODIGO, @VENTA_ANUNCIO,@VENTA_PRECIO_VENTA,@VENTA_FECHA
	end
	close c1
	deallocate c1

END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_BI_TIEMPO_Y_ALQUILER
AS
BEGIN
	
	DECLARE @ALQUILER_CODIGO NUMERIC(18,0)
	DECLARE @ALQUILER_PAGO_CODIGO NUMERIC(18,0)
	DECLARE @ALQUILER_BARRIO NUMERIC(18,0)
	DECLARE @ALQUILER_ESTADO NUMERIC(18,0)
	DECLARE @FECHA_NAC_INQUILINO DATETIME
	DECLARE @ALQUILER_PAGO_IMPORTE NUMERIC(18,2)
	DECLARE @ALQUILER_FECHA_INICIO DATETIME
	DECLARE @ALQUILER_FECHA_FIN DATETIME
	DECLARE @ALQUILER_FECHA_PAGO DATETIME
	DECLARE @ALQUILER_FECHA_PAGO_VENCIMIENTO DATETIME

	DECLARE @ALQUILER_CODIGO_ANTERIOR NUMERIC(18,0)
	DECLARE @ALQUILER_IMPORTE_ANTERIOR NUMERIC(18,2)

	SET @ALQUILER_CODIGO_ANTERIOR = 0
	SET @ALQUILER_IMPORTE_ANTERIOR = 0

	DECLARE @PORCENTAJE NUMERIC(5,2)

	declare c1 cursor for select ALQUILER_CODIGO, PAGO_ALQUILER_CODIGO, INMUEBLE_BARRIO, ALQUILER_ESTADO, PERSONA_FECHA_NAC, PAGO_ALQUILER_IMPORTE, ALQUILER_FECHA_INICIO, ALQUILER_FECHA_FIN, PAGO_ALQUILER_FECHA, PAGO_ALQUILER_FECHA_VENCIMIENTO
	from DATABASERS.ALQUILER 
	JOIN DATABASERS.PAGO_ALQUILER ON ALQUILER_CODIGO=PAGO_ALQUILER_ALQUILER
	JOIN DATABASERS.ANUNCIO ON ALQUILER_ANUNCIO = ANUNCIO_CODIGO
	JOIN DATABASERS.INMUEBLE ON ANUNCIO_INMUEBLE = INMUEBLE_CODIGO
	JOIN DATABASERS.INQUILINO ON ALQUILER_CODIGO = INQUILINO_ALQUILER
	JOIN DATABASERS.PERSONA ON INQUILINO_PERSONA = PERSONA_CODIGO
	
	open c1
	fetch next from c1 into @ALQUILER_CODIGO, @ALQUILER_PAGO_CODIGO, @ALQUILER_BARRIO, @ALQUILER_ESTADO, @FECHA_NAC_INQUILINO, @ALQUILER_PAGO_IMPORTE, @ALQUILER_FECHA_INICIO, 
	@ALQUILER_FECHA_FIN, @ALQUILER_FECHA_PAGO, @ALQUILER_FECHA_PAGO_VENCIMIENTO
	while @@FETCH_STATUS = 0
	begin 
			
			DECLARE @FK_BI_TIEMPO INTEGER
			DECLARE @RANGO_ETARIO INTEGER

			SET @FK_BI_TIEMPO = 0 
			SET @RANGO_ETARIO = 0
						
			EXEC DATABASERS.GENERAR_BI_TIEMPO @FECHA=@ALQUILER_FECHA_PAGO, @PK=@FK_BI_TIEMPO OUTPUT
			EXEC DATABASERS.OBTENER_RANGO_ETARIO @FECHA_NAC=@FECHA_NAC_INQUILINO, @FECHA=@ALQUILER_FECHA_PAGO, @RANGO=@RANGO_ETARIO OUTPUT

			IF(@ALQUILER_CODIGO_ANTERIOR = @ALQUILER_CODIGO)
				BEGIN SET @PORCENTAJE = ((@ALQUILER_PAGO_IMPORTE - @ALQUILER_IMPORTE_ANTERIOR)/@ALQUILER_IMPORTE_ANTERIOR)*100 END
			ELSE
				BEGIN SET @PORCENTAJE = 0 END

			INSERT INTO DATABASERS.BI_ALQUILER
			(BI_ALQUILER_CODIGO, BI_ALQUILER_PAGO_CODIGO, BI_ALQUILER_BARRIO, BI_ALQUILER_ESTADO, BI_ALQUILER_TIEMPO, BI_ALQUILER_RANGO_ETARIO,
			BI_ALQUILER_INCUMPLIMIENTO, BI_ALQUILER_INCREMENTO) VALUES
			(@ALQUILER_CODIGO, @ALQUILER_PAGO_CODIGO, @ALQUILER_BARRIO, @ALQUILER_ESTADO, @FK_BI_TIEMPO, @RANGO_ETARIO, 
			CASE WHEN @ALQUILER_FECHA_PAGO >= @ALQUILER_FECHA_PAGO_VENCIMIENTO THEN 1 ELSE 0 END, @PORCENTAJE)

			SET @ALQUILER_CODIGO_ANTERIOR = @ALQUILER_CODIGO
			SET @ALQUILER_IMPORTE_ANTERIOR = @ALQUILER_PAGO_IMPORTE

		fetch next from c1 into @ALQUILER_CODIGO, @ALQUILER_PAGO_CODIGO, @ALQUILER_BARRIO, @ALQUILER_ESTADO, @FECHA_NAC_INQUILINO, @ALQUILER_PAGO_IMPORTE, @ALQUILER_FECHA_INICIO, 
		@ALQUILER_FECHA_FIN, @ALQUILER_FECHA_PAGO, @ALQUILER_FECHA_PAGO_VENCIMIENTO
	end
	close c1
	deallocate c1

END
GO

CREATE PROCEDURE DATABASERS.MIGRAR_RELACIONAL
AS
BEGIN
	EXECUTE DATABASERS.MIGRAR_BI_RANGO_SUPERFICIE
	EXECUTE DATABASERS.MIGRAR_BI_RANGO_ETARIO
	EXECUTE DATABASERS.MIGRAR_BI_TIPO_INMUEBLE
	EXECUTE DATABASERS.MIGRAR_BI_TIPO_OPERACION
	EXECUTE DATABASERS.MIGRAR_BI_MONEDA
	EXECUTE DATABASERS.MIGRAR_BI_SUCURSAL
	EXECUTE DATABASERS.MIGRAR_BI_AMBIENTES_INMUEBLE
	EXECUTE DATABASERS.MIGRAR_BI_ESTADO_ALQUILER
	EXECUTE DATABASERS.MIGRAR_BI_BARRIO
	EXECUTE DATABASERS.MIGRAR_BI_LOCALIDAD
	EXECUTE DATABASERS.MIGRAR_BI_TIEMPO_Y_VENTA
	EXECUTE DATABASERS.MIGRAR_BI_TIEMPO_Y_ALQUILER
	EXECUTE DATABASERS.MIGRAR_BI_TIEMPO_Y_ANUNCIO
END
GO

-- 5. EJECUCIÓN DE MIGRACIÓN

/*
EXEC DATABASERS.ELIMINAR_TABLAS_BI
EXEC DATABASERS.ELIMINAR_PROCEDIMIENTOS_BI
EXEC DATABASERS.ELIMINAR_CREAR_TABLAS_BI

EXEC DATABASERS.CREAR_TABLAS_BI
EXEC DATABASERS.AGREGAR_FK_BI
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
	SELECT AVG(BI_ANUNCIO_DIAS_PUBLICADO) AS DIAS_PROMEDIO, BI_TIPO_OPERACION_DETALLE, BI_BARRIO_DETALLE, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_ANIO
	FROM DATABASERS.BI_ANUNCIO 
	JOIN DATABASERS.BI_TIPO_OPERACION ON BI_ANUNCIO_TIPO_OPERACION = BI_TIPO_OPERACION_CODIGO
	JOIN DATABASERS.BI_BARRIO ON BI_ANUNCIO_BARRIO = BI_BARRIO_CODIGO
	JOIN DATABASERS.BI_TIEMPO ON BI_ANUNCIO_TIEMPO = BI_TIEMPO_CODIGO
	GROUP BY BI_TIPO_OPERACION_DETALLE, BI_BARRIO_DETALLE, BI_TIEMPO_CUATRIMESTRE, BI_TIEMPO_ANIO
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
	SELECT TOP 5 BI_BARRIO_DETALLE AS MEJOR_BARRIO, BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE FROM DATABASERS.BI_ALQUILER
	JOIN DATABASERS.BI_TIEMPO ON BI_ALQUILER_TIEMPO=BI_TIEMPO_CODIGO
	JOIN DATABASERS.BI_RANGO_ETARIO ON BI_ALQUILER_RANGO_ETARIO = BI_RANGO_ETARIO_CODIGO
	JOIN DATABASERS.BI_BARRIO ON BI_ALQUILER_BARRIO = BI_BARRIO_CODIGO
	GROUP BY BI_BARRIO_DETALLE, BI_TIEMPO_ANIO, BI_TIEMPO_CUATRIMESTRE
	ORDER BY COUNT(*) DESC
GO

-- VISTA 4

CREATE VIEW DATABASERS.PORCENTAJE_INCUMPLIMIENTO
AS
	SELECT CONCAT(100*SUM(BI_ALQUILER_INCUMPLIMIENTO)/COUNT(*), ' %') AS PORCENTAJE_INCUMPLIMIENTO, BI_TIEMPO_ANIO, BI_TIEMPO_MES
	FROM DATABASERS.BI_ALQUILER
	JOIN DATABASERS.BI_TIEMPO ON BI_ALQUILER_TIEMPO = BI_TIEMPO_CODIGO
	GROUP BY BI_TIEMPO_ANIO, BI_TIEMPO_MES
GO

-- VISTA 5
CREATE VIEW DATABASERS.INCREMENTO_ALQUILER
AS
	SELECT CONCAT(100*SUM(BI_ALQUILER_INCREMENTO)/COUNT(*), ' %') AS PORCENTAJE_PROM_INCREMENTO, BI_TIEMPO_ANIO, BI_TIEMPO_MES
	FROM DATABASERS.BI_ALQUILER
	JOIN DATABASERS.BI_TIEMPO ON BI_ALQUILER_TIEMPO = BI_TIEMPO_CODIGO
	WHERE BI_ALQUILER_ESTADO = 3 
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
	SELECT BI_SUCURSAL_NOMBRE, BI_RANGO_ETARIO_DETALLE, BI_TIEMPO_ANIO, CONCAT (COUNT(*)* 100.0 /(SELECT COUNT(*)
																						  FROM DATABASERS.BI_ANUNCIO A1
																								   JOIN DATABASERS.BI_TIEMPO T1 ON A1.BI_ANUNCIO_TIEMPO = BI_TIEMPO_CODIGO
																						  WHERE T1.BI_TIEMPO_ANIO = BI_TIEMPO_ANIO), ' %') AS PORCENTAJE
	FROM DATABASERS.BI_ANUNCIO
			 JOIN DATABASERS.BI_SUCURSAL ON BI_ANUNCIO_SUCURSAL = BI_SUCURSAL_CODIGO
			 JOIN DATABASERS.BI_TIEMPO ON BI_ANUNCIO_TIEMPO = BI_TIEMPO_CODIGO
			 JOIN DATABASERS.BI_RANGO_ETARIO ON BI_ANUNCIO_RANGO_ETARIO = BI_RANGO_ETARIO_CODIGO
	WHERE BI_ANUNCIO_OP_CONCRETADA=1
	GROUP BY BI_SUCURSAL_NOMBRE, BI_RANGO_ETARIO_DETALLE, BI_TIEMPO_ANIO
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
	WHERE BI_ANUNCIO_OP_CONCRETADA = 1
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

