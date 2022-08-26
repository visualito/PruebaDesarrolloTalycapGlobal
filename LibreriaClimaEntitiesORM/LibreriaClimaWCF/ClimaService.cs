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
    public class ClimaService : IClimaService
    {
        public bool BorraClima(int id)
        {
            bool r = false;

            r = LibreriaClimaNegocio.Clima.Borrar(id);

            return r;
        }

        public int CrearClima(Clima clima)
        {
            LibreriaClimaNegocio.Estado est = new LibreriaClimaNegocio.Estado
            {
                Id = clima.Estado.Id,
            };

            LibreriaClimaNegocio.Pais p = new LibreriaClimaNegocio.Pais
            {
                Id = clima.Pais.Id,
            };

            LibreriaClimaNegocio.Ciudad c = new LibreriaClimaNegocio.Ciudad
            {
                Id = clima.Ciudad.Id,
                IdPais = clima.Pais.Id
            };


            LibreriaClimaNegocio.Clima cl = new LibreriaClimaNegocio.Clima {

                Fecha = clima.Fecha,
                Hora = clima.Hora,
                Temperatura = clima.Temperatura,
                Pais = p,
                Ciudad = c,
                Estado = est
                
            };
            
            int r = LibreriaClimaNegocio.Clima.Crear(cl);

            return r;
        }

        public void EditaClima(Clima clima)
        {
            LibreriaClimaNegocio.Estado est = new LibreriaClimaNegocio.Estado
            {
                Id = clima.Estado.Id,
                Nombre = clima.Estado.Nombre
            };

            LibreriaClimaNegocio.Clima c = new LibreriaClimaNegocio.Clima
            {

                Fecha = clima.Fecha,
                Hora = clima.Hora,
                Temperatura = clima.Temperatura,
                Estado = est

            };

            LibreriaClimaNegocio.Clima.Editar(c);
        }

        public List<Clima> GetClimaPorDia(DateTime fecha)
        {
            List<Clima> r = new List<Clima>();

            var resultado = LibreriaClimaNegocio.Clima.ClimasPorDia(fecha);

            LibreriaClimaWCF.Estado estado = null;
            foreach (var item in resultado)
            {
                estado = new LibreriaClimaWCF.Estado
                {
                    Id = item.Estado.Id,
                    Nombre = item.Estado.Nombre
                };
                
                r.Add(
                    new LibreriaClimaWCF.Clima
                    {
                        Id = item.Id,
                        Fecha = item.Fecha,
                        Hora = item.Hora,
                        HoraEntera = item.HoraEntera,
                        MinutosEnteros = item.MinutosEnteros,
                        Anio = item.Anio,
                        Mes = item.Mes,
                        Dia = item.Dia,
                        Temperatura = item.Temperatura,
                        Estado = estado
                    });
            
            }

            return r;
        }
    }
}
