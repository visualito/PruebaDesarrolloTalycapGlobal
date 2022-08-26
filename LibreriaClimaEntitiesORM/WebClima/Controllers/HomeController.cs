using Newtonsoft;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebClima.ServicioClima;

namespace WebClima.Controllers
{
  
    public class HomeController : Controller
    {
        private readonly SeguridadEntities _dbContext = new SeguridadEntities();
        private readonly ServicioClima.ClimaServiceClient clienteClima = new ServicioClima.ClimaServiceClient();
        public ActionResult Index()
        {
            
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string usuario, string password)
        {
            if (ModelState.IsValid)
            {

                // bool usuarioValido = _dbContext.Autentica(usuario, password).Count() > 0?true:false;
                bool usuarioValido = false;

                var result = (from u in _dbContext.usuarios
                              where u.usuario == usuario && u.password == password
                              select u).ToList();

                usuarioValido = result.Count > 0 ? true : false;

                if (usuarioValido)
                {
                    FormsAuthentication.SetAuthCookie(usuario, false);
                    return RedirectToAction("Climas", "Home");
                }
            }
            ModelState.AddModelError("ERRORUSERPWD", "Usuario o password inválido");
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult Climas()
        {
            var resultado = clienteClima.GetClimaPorDia(DateTime.Now).ToList();
            

            return View(resultado);
        }

        [HttpGet]
        [Authorize]
        public ActionResult ClimasEdit(Clima clima)
        {
            var resultado = clienteClima.GetClimaPorDia(DateTime.Now).ToList();
            return View(resultado);
        }
        
        [HttpGet]
        public async Task<string> Create()
        {
            Random rTemperatura = new Random(System.Environment.TickCount);
            Random rPais = new Random(System.Environment.TickCount);
            Random rCiudad = new Random(System.Environment.TickCount);
            Random rEstado = new Random(System.Environment.TickCount);

            Clima clima = new Clima();

            clima.Fecha = DateTime.Now;
            clima.Hora = DateTime.Now;
            clima.Temperatura = rCiudad.Next(5, 45);

            Estado est = new Estado();
            est.Id = rEstado.Next(1, 7);
            clima.Estado = est;

            Pais p = new Pais();
            p.Id = rPais.Next(1, 3);

            Ciudad c = new Ciudad();
            int idCiudad = 0;

            switch (p.Id)
            {
                case 1:

                    int iTemp = rCiudad.Next(1, 5);
                    iTemp = iTemp == 2 ? iTemp + 1 : iTemp;
                    idCiudad = iTemp;

                    break;
                case 2:
                    idCiudad = rCiudad.Next(6, 9);
                    break;
                case 3:
                    idCiudad = rCiudad.Next(10, 13);
                    break;
                default:
                    break;
            }

            c.Id = idCiudad;
            c.IdPais = p.Id;
            clima.Pais = p;

            clima.Ciudad = c;

            clienteClima.CrearClima(clima);
            string strJson =  JsonConvert.SerializeObject(clienteClima.GetClimaPorDiaAsync(DateTime.Now).Result.ToList());
            return strJson;
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}