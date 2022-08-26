using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using LibreriaClimaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace LibreriaClimaWCF
{
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]
    public class PaisService : IPaisService
    {
        public Pais GetPaisPorId(int id)
        {
            Pais r = null;
            var resultado = LibreriaClimaNegocio.Pais.PaisPorId(id);

            if (resultado != null)
            {
                r = new Pais
                {
                    Id = resultado.Id,
                    Nombre = resultado.Nombre
                };
            }

            return r;
        }
    }
}
