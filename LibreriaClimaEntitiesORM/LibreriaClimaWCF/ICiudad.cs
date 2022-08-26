using LibreriaClimaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace LibreriaClimaWCF
{
    public interface ICiudadService
    {
        [OperationContract]
        Ciudad GetPaisPorId(int idPais, int idCiudad);
    }

    [DataContract()]
    public class Ciudad
    {
        [DataMember]
        public int Id { get; set; }

        [DataMember]
        public int IdPais { get; set; }

        [DataMember]
        public string Nombre { get; set; }
    }
}
