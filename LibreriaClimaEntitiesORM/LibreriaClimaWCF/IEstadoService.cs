using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Web;

namespace LibreriaClimaWCF
{
    public interface IEstadoService
    {
        [OperationContract]
        Estado GetEstadoPorId(int id);
    }

    [DataContract()]
    public class Estado
    {
        [DataMember]
        public int Id { get; set; }

        [DataMember]
        public string Nombre { get; set; }
    }
}
