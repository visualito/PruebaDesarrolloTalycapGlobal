//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebClima.ServicioClima {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Clima", Namespace="http://schemas.datacontract.org/2004/07/LibreriaClimaWCF")]
    [System.SerializableAttribute()]
    public partial class Clima : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int AnioField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private WebClima.ServicioClima.Ciudad CiudadField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int DiaField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private WebClima.ServicioClima.Estado EstadoField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private System.DateTime FechaField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private System.DateTime HoraField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int HoraEnteraField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int IdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int MesField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int MinutosEnterosField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private WebClima.ServicioClima.Pais PaisField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private double TemperaturaField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Anio {
            get {
                return this.AnioField;
            }
            set {
                if ((this.AnioField.Equals(value) != true)) {
                    this.AnioField = value;
                    this.RaisePropertyChanged("Anio");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public WebClima.ServicioClima.Ciudad Ciudad {
            get {
                return this.CiudadField;
            }
            set {
                if ((object.ReferenceEquals(this.CiudadField, value) != true)) {
                    this.CiudadField = value;
                    this.RaisePropertyChanged("Ciudad");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Dia {
            get {
                return this.DiaField;
            }
            set {
                if ((this.DiaField.Equals(value) != true)) {
                    this.DiaField = value;
                    this.RaisePropertyChanged("Dia");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public WebClima.ServicioClima.Estado Estado {
            get {
                return this.EstadoField;
            }
            set {
                if ((object.ReferenceEquals(this.EstadoField, value) != true)) {
                    this.EstadoField = value;
                    this.RaisePropertyChanged("Estado");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.DateTime Fecha {
            get {
                return this.FechaField;
            }
            set {
                if ((this.FechaField.Equals(value) != true)) {
                    this.FechaField = value;
                    this.RaisePropertyChanged("Fecha");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.DateTime Hora {
            get {
                return this.HoraField;
            }
            set {
                if ((this.HoraField.Equals(value) != true)) {
                    this.HoraField = value;
                    this.RaisePropertyChanged("Hora");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int HoraEntera {
            get {
                return this.HoraEnteraField;
            }
            set {
                if ((this.HoraEnteraField.Equals(value) != true)) {
                    this.HoraEnteraField = value;
                    this.RaisePropertyChanged("HoraEntera");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Id {
            get {
                return this.IdField;
            }
            set {
                if ((this.IdField.Equals(value) != true)) {
                    this.IdField = value;
                    this.RaisePropertyChanged("Id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Mes {
            get {
                return this.MesField;
            }
            set {
                if ((this.MesField.Equals(value) != true)) {
                    this.MesField = value;
                    this.RaisePropertyChanged("Mes");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int MinutosEnteros {
            get {
                return this.MinutosEnterosField;
            }
            set {
                if ((this.MinutosEnterosField.Equals(value) != true)) {
                    this.MinutosEnterosField = value;
                    this.RaisePropertyChanged("MinutosEnteros");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public WebClima.ServicioClima.Pais Pais {
            get {
                return this.PaisField;
            }
            set {
                if ((object.ReferenceEquals(this.PaisField, value) != true)) {
                    this.PaisField = value;
                    this.RaisePropertyChanged("Pais");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public double Temperatura {
            get {
                return this.TemperaturaField;
            }
            set {
                if ((this.TemperaturaField.Equals(value) != true)) {
                    this.TemperaturaField = value;
                    this.RaisePropertyChanged("Temperatura");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Ciudad", Namespace="http://schemas.datacontract.org/2004/07/LibreriaClimaWCF")]
    [System.SerializableAttribute()]
    public partial class Ciudad : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int IdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int IdPaisField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string NombreField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Id {
            get {
                return this.IdField;
            }
            set {
                if ((this.IdField.Equals(value) != true)) {
                    this.IdField = value;
                    this.RaisePropertyChanged("Id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int IdPais {
            get {
                return this.IdPaisField;
            }
            set {
                if ((this.IdPaisField.Equals(value) != true)) {
                    this.IdPaisField = value;
                    this.RaisePropertyChanged("IdPais");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Nombre {
            get {
                return this.NombreField;
            }
            set {
                if ((object.ReferenceEquals(this.NombreField, value) != true)) {
                    this.NombreField = value;
                    this.RaisePropertyChanged("Nombre");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Estado", Namespace="http://schemas.datacontract.org/2004/07/LibreriaClimaWCF")]
    [System.SerializableAttribute()]
    public partial class Estado : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int IdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string NombreField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Id {
            get {
                return this.IdField;
            }
            set {
                if ((this.IdField.Equals(value) != true)) {
                    this.IdField = value;
                    this.RaisePropertyChanged("Id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Nombre {
            get {
                return this.NombreField;
            }
            set {
                if ((object.ReferenceEquals(this.NombreField, value) != true)) {
                    this.NombreField = value;
                    this.RaisePropertyChanged("Nombre");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Pais", Namespace="http://schemas.datacontract.org/2004/07/LibreriaClimaWCF")]
    [System.SerializableAttribute()]
    public partial class Pais : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int IdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string NombreField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Id {
            get {
                return this.IdField;
            }
            set {
                if ((this.IdField.Equals(value) != true)) {
                    this.IdField = value;
                    this.RaisePropertyChanged("Id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Nombre {
            get {
                return this.NombreField;
            }
            set {
                if ((object.ReferenceEquals(this.NombreField, value) != true)) {
                    this.NombreField = value;
                    this.RaisePropertyChanged("Nombre");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServicioClima.IClimaService")]
    public interface IClimaService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IClimaService/CrearClima", ReplyAction="http://tempuri.org/IClimaService/CrearClimaResponse")]
        int CrearClima(WebClima.ServicioClima.Clima clima);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IClimaService/CrearClima", ReplyAction="http://tempuri.org/IClimaService/CrearClimaResponse")]
        System.Threading.Tasks.Task<int> CrearClimaAsync(WebClima.ServicioClima.Clima clima);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IClimaService/GetClimaPorDia", ReplyAction="http://tempuri.org/IClimaService/GetClimaPorDiaResponse")]
        WebClima.ServicioClima.Clima[] GetClimaPorDia(System.DateTime fecha);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IClimaService/GetClimaPorDia", ReplyAction="http://tempuri.org/IClimaService/GetClimaPorDiaResponse")]
        System.Threading.Tasks.Task<WebClima.ServicioClima.Clima[]> GetClimaPorDiaAsync(System.DateTime fecha);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IClimaService/EditaClima", ReplyAction="http://tempuri.org/IClimaService/EditaClimaResponse")]
        void EditaClima(WebClima.ServicioClima.Clima clima);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IClimaService/EditaClima", ReplyAction="http://tempuri.org/IClimaService/EditaClimaResponse")]
        System.Threading.Tasks.Task EditaClimaAsync(WebClima.ServicioClima.Clima clima);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IClimaService/BorraClima", ReplyAction="http://tempuri.org/IClimaService/BorraClimaResponse")]
        bool BorraClima(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IClimaService/BorraClima", ReplyAction="http://tempuri.org/IClimaService/BorraClimaResponse")]
        System.Threading.Tasks.Task<bool> BorraClimaAsync(int id);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IClimaServiceChannel : WebClima.ServicioClima.IClimaService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ClimaServiceClient : System.ServiceModel.ClientBase<WebClima.ServicioClima.IClimaService>, WebClima.ServicioClima.IClimaService {
        
        public ClimaServiceClient() {
        }
        
        public ClimaServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ClimaServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ClimaServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ClimaServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public int CrearClima(WebClima.ServicioClima.Clima clima) {
            return base.Channel.CrearClima(clima);
        }
        
        public System.Threading.Tasks.Task<int> CrearClimaAsync(WebClima.ServicioClima.Clima clima) {
            return base.Channel.CrearClimaAsync(clima);
        }
        
        public WebClima.ServicioClima.Clima[] GetClimaPorDia(System.DateTime fecha) {
            return base.Channel.GetClimaPorDia(fecha);
        }
        
        public System.Threading.Tasks.Task<WebClima.ServicioClima.Clima[]> GetClimaPorDiaAsync(System.DateTime fecha) {
            return base.Channel.GetClimaPorDiaAsync(fecha);
        }
        
        public void EditaClima(WebClima.ServicioClima.Clima clima) {
            base.Channel.EditaClima(clima);
        }
        
        public System.Threading.Tasks.Task EditaClimaAsync(WebClima.ServicioClima.Clima clima) {
            return base.Channel.EditaClimaAsync(clima);
        }
        
        public bool BorraClima(int id) {
            return base.Channel.BorraClima(id);
        }
        
        public System.Threading.Tasks.Task<bool> BorraClimaAsync(int id) {
            return base.Channel.BorraClimaAsync(id);
        }
    }
}
