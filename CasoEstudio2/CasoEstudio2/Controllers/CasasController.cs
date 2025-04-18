using Microsoft.AspNetCore.Mvc;
using CasoEstudio2.Services;
using CasoEstudio2.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CasoEstudio2.Controllers
{
    public class CasasController : Controller
    {
        private readonly CasasService _casasService;

        public CasasController(CasasService casasService)
        {
            _casasService = casasService;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            RespuestaModel respuesta = await _casasService.ConsultarCasaAsync();

            if (respuesta.Resultado)
            {
                var listaCasas = respuesta.Datos as IEnumerable<CasasModel>;         
                return View(listaCasas);
            }
            else
            {
                ViewBag.Error = respuesta.Mensaje;
                return View(new List<CasasModel>());
            }
        }
    }
}
