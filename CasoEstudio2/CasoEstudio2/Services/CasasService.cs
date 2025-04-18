﻿// Archivo: Services/CasasService.cs
using Dapper;
using System.Data;
using CasoEstudio2.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.Data.SqlClient;

namespace CasoEstudio2.Services
{
    public class CasasService
    {
        private readonly IConfiguration _configuration;

        public CasasService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<RespuestaModel> ConsultarCasaAsync()
        {
            using var connection = new SqlConnection(
                _configuration.GetConnectionString("BDConnection")
            );

            var respuesta = new RespuestaModel();

            var resultado = await connection.QueryAsync<CasasModel>(
                "ConsultarCasa",
                commandType: CommandType.StoredProcedure
            );

            if (resultado.Any())
            {
                respuesta.Resultado = true;
                respuesta.Datos = resultado;
            }
            else
            {
                respuesta.Resultado = false;
                respuesta.Mensaje = "No se encontraron registros de casas en ese rango de precio.";
            }

            return respuesta;
        }
    }
}
