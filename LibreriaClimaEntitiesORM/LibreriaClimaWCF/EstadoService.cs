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
    public class EstadoService : IEstadoService
    {
        public Estado GetEstadoPorId(int id)
        {
            Estado r = null;
            var resultado = LibreriaClimaNegocio.Estado.EstadoPorId(id);
            
            if (resultado != null)
            {
                r = new Estado
                {
                    Id = resultado.Id,
                    Nombre = resultado.Nombre
                };
            }

            return r;
        }
    }
}
