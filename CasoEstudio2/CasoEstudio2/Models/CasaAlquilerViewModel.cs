using Microsoft.AspNetCore.Mvc.Rendering;

namespace CasoEstudio2.Models
{
    public class CasaAlquilerViewModel
    {
        public int IdCasa { get; set; }

        public string UsuarioAlquiler { get; set; } = default!;

        public List<SelectListItem> CasasDisponibles { get; set; } = new();

        public object CasasJson { get; set; } = new();
    }
}
