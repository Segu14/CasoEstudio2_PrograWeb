USE [master]
GO

CREATE DATABASE [CasoEstudioJN]
GO

USE [CasoEstudioJN]
GO

/* :: inicio Creación de la Tabla :: */
CREATE TABLE [dbo].[CasasSistema] (
	[IdCasa] [bigint] IDENTITY(1,1) NOT NULL,
	[DescripcionCasa] [varchar](30) NOT NULL,
	[PrecioCasa] [decimal](10,2) NOT NULL,
	[UsuarioAlquiler] [varchar](30),
	[FechaAlquiler] [datetime],
	[EstadoCasa] [bit] NOT NULL,
  CONSTRAINT [PK_IdCasa] PRIMARY KEY CLUSTERED ([IdCasa] ASC )
) 
GO
/* :: fin Creación de la Tabla :: */

/* :: inicio Inserciones en la Tabla :: */
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa],[PrecioCasa],[UsuarioAlquiler],[FechaAlquiler], [EstadoCasa])
	VALUES ('Casa en San José',190000,null,null, 1)

INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa],[PrecioCasa],[UsuarioAlquiler],[FechaAlquiler], [EstadoCasa])
	VALUES ('Casa en Alajuela',145000,null,null, 1)

INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa],[PrecioCasa],[UsuarioAlquiler],[FechaAlquiler], [EstadoCasa])
	VALUES ('Casa en Cartago',115000,null,null, 1)

INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa],[PrecioCasa],[UsuarioAlquiler],[FechaAlquiler], [EstadoCasa])
	VALUES ('Casa en Heredia',122000,null,null, 1)

INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa],[PrecioCasa],[UsuarioAlquiler],[FechaAlquiler], [EstadoCasa])
	VALUES ('Casa en Guanacaste',105000,null,null, 1)
/* :: fin Inserciones en la Tabla :: */

SELECT * FROM CasasSistema;

/* :: inicio Procesos Almacenados :: */

	/* :: inicio Consultar Casa :: */
	CREATE PROCEDURE ConsultarCasa
	AS
	BEGIN
		SELECT
			DescripcionCasa,
			PrecioCasa,
			UsuarioAlquiler,
			CASE
				WHEN EstadoCasa = 1 THEN 'Disponible'
				ELSE 'Reservada'
			END AS EstadoCasa,
			FORMAT (FechaAlquiler, 'dd/MM/yyyy') AS Fecha
		FROM
			CasasSistema
		WHERE
			PrecioCasa BETWEEN 115000 AND 180000
		ORDER BY
			CASE
				WHEN EstadoCasa = 1 THEN 0
				ELSE 1
			END
	END
	/* :: fin Consultar Casa */

	/* :: inicio Alquilar Casa :: */
	CREATE PROCEDURE AlquilarCasa
		@IdCasa bigint,
		@UsuarioAlquiler varchar(30)
	AS
	BEGIN
		UPDATE CasasSistema
		SET
			UsuarioAlquiler = @UsuarioAlquiler,
			FechaAlquiler = GETDATE(),
			EstadoCasa = 0
		WHERE
			IdCasa = @IdCasa AND EstadoCasa = 1
	END

/* :: fin Procesos Almacenados :: */

