USE CasoEstudioJn;

ALTER PROCEDURE [dbo].[ObtenerCasasDisponibles]
AS
BEGIN
    SELECT * FROM CasasSistema WHERE EstadoCasa = 1
END


ALTER PROCEDURE [dbo].[AlquilarCasa]
    @IdCasa BIGINT,
    @Usuario VARCHAR(30)
AS
BEGIN
    UPDATE CasasSistema
    SET UsuarioAlquiler = @Usuario,
        FechaAlquiler = GETDATE(),
		EstadoCasa = 0
    WHERE IdCasa = @IdCasa
END