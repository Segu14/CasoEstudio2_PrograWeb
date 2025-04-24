using System;
using System.ComponentModel.DataAnnotations;

namespace CasoEstudio2.Models
{
    public class CasasModel
    {
        public long IdCasa { get; set; }
        public string DescripcionCasa { get; set; } = default!;
        public decimal PrecioCasa { get; set; }
        public string? UsuarioAlquiler { get; set; }
        public string EstadoCasa { get; set; } = default!; 
        public DateTime? FechaAlquiler { get; set; } = default!; 
    }
}
