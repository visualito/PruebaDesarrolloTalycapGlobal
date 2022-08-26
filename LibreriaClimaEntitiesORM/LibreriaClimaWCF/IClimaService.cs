using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using LibreriaClimaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Web;

namespace LibreriaClimaWCF
{
    [ServiceContract]
    internal interface IClimaService
    {
        [OperationContract]
        int CrearClima(Clima clima);
        
        [OperationContract]
        List<Clima> GetClimaPorDia(DateTime fecha);
        
        [OperationContract]
        void EditaClima(Clima clima);

        [OperationContract]
        bool BorraClima(int id);

        
    }

    [DataContract()]
    public class Clima
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public DateTime Fecha { get; set; }
        [DataMember]
        public DateTime Hora { get; set; }
        [DataMember]
        public int HoraEntera { get; set; }
        [DataMember]
        public int MinutosEnteros { get; set; }
        [DataMember]
        public int Anio { get; set; }
        [DataMember]
        public int Mes { get; set; }
        [DataMember]
        public int Dia { get; set; }
        [DataMember]
        public double Temperatura { get; set; }
        [DataMember]
        public Pais Pais { get; set; }

        [DataMember]
        public Ciudad Ciudad { get; set; }

        [DataMember]
        public Estado Estado { get; set; }
    }
}
