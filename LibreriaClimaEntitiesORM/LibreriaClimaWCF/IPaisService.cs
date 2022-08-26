using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace LibreriaClimaWCF
{
    public interface IPaisService
    {
        [OperationContract]
        Pais GetPaisPorId(int id);
    }

    [DataContract()]
    public class Pais
    {
        [DataMember]
        public int Id { get; set; }

        [DataMember]
        public string Nombre { get; set; }
    }
}
