using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;

namespace LibreriaClimaWCF
{
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]
    public class CiudadService : ICiudadService
    {
        public Ciudad GetPaisPorId(int idPais, int idCiudad)
        {
            Ciudad r = null;
            var resultado = LibreriaClimaNegocio.Ciudad.ObtenerCiudad(idPais, idCiudad);

            if (resultado != null)
            {
                r = new Ciudad
                {
                    Id = resultado.Id,
                    Nombre = resultado.Nombre
                };
            }

            return r;
        }
    }
}
