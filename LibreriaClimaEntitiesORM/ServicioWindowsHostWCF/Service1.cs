using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using LibreriaClimaWCF;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.ServiceModel;
using System.IO;

namespace ServicioWindowsHostWCF
{
    public partial class Service1 : ServiceBase
    {
        string rutaLog;

        BooleanSwitch sw;

        TextWriterTraceListener escuchadorLog;


        FileStream archivoLog;

        ServiceHost sh = null;


        public Service1()
        {
            InitializeComponent();
            rutaLog = AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "log.txt";

            sw = new BooleanSwitch("habilitaLog", "Control de trace");
            archivoLog = new FileStream(rutaLog, FileMode.Append, FileAccess.Write);

            escuchadorLog = new TextWriterTraceListener(archivoLog);
            Trace.AutoFlush = true;

            Trace.Listeners.Add(escuchadorLog);

            try
            {
                sh = new ServiceHost(typeof(LibreriaClimaWCF.ClimaService));

                Trace.WriteLineIf(sw.Enabled, "Instancia del servicio inicializada: ");
            }
            catch (Exception ex)
            {

                Trace.WriteLineIf(sw.Enabled, ex.Message);
            }
        }

        protected override void OnStart(string[] args)
        {
            try
            {
                sh.Open();
            }
            catch (Exception ex)
            {

                Trace.WriteLineIf(sw.Enabled, ex.Message);
            }
        }

        protected override void OnStop()
        {
            sh.Close();
        }
    }
}
