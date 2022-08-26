using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using LibreriaClimaEntitiesORM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LibreriaClimaNegocio
{
    public class Clima
    {
        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public DateTime Hora { get; set; }
        public int HoraEntera { get; set; }
        public int MinutosEnteros { get; set; }
        public int Anio { get; set; }
        public int Mes { get; set; }
        public int Dia { get; set; }
        public double Temperatura { get; set; }

        public Pais Pais { get; set; }
        public Ciudad Ciudad { get; set; }
        
        
        public Estado Estado { get; set; }

        public Clima()
        {
                
        }

        public Clima(int id, DateTime fecha, DateTime hora, double temperatura, Pais pais, Ciudad ciudad, Estado estado)
        {
            this.Id = id;
            this.Fecha = fecha;
            this.Hora = hora;
            this.HoraEntera = hora.Hour;
            this.MinutosEnteros = hora.Minute;
            this.Anio = fecha.Year;
            this.Mes = fecha.Month;
            this.Dia = fecha.Day;
            this.Temperatura = temperatura;
            this.Pais = pais;
            this.Ciudad = ciudad;
            this.Estado = estado;
        }
        public Clima(DateTime fecha, DateTime hora, double temperatura, Pais pais, Ciudad ciudad, Estado estado)
        {
            this.Fecha = fecha;
            this.Hora = hora;
            this.HoraEntera = hora.Hour;
            this.MinutosEnteros = hora.Minute;
            this.Anio = fecha.Year;
            this.Mes = fecha.Month;
            this.Dia = fecha.Day;
            this.Temperatura = temperatura;
            this.Pais = pais;
            this.Ciudad = ciudad;
            this.Estado = estado;
        }

        public override string ToString()
        {
            return this.Fecha.ToString("dd/MM/yyyy") + " " + this.Hora.ToString("HH:mm") + " " + this.Temperatura + " " + this.Estado.ToString();
        }
        
        public static List<Clima> ClimasPorDia(DateTime fecha)
        {
            List<Clima> r = new List<Clima>();

            using (var db = new InfoClimaModel())
            {
                var result = (from c in db.Clima
                              join s in db.Estado on c.Estado.Id equals s.Id
                               where c.Anio == fecha.Year && c.Mes == fecha.Month && c.Dia == fecha.Day
                               orderby c.HoraEntera,c.MinutosEnteros
                               select new
                               {
                                   Id= c.Id,
                                   Fecha = c.Fecha,
                                   Hora= c.Hora,
                                   HoraEntera= c.HoraEntera,
                                   MinutosEnteros = c.MinutosEnteros,
                                   Anio= c.Anio,
                                   Mes = c.Mes,
                                   Dia = c.Dia,
                                   Temperatura= c.Temperatura,
                                   IdEstado = c.Estado.Id,
                                   NombreEstado = c.Estado.Nombre
                               }).ToList();

                
                foreach (var item in result)
                {
                    r.Add(new Clima 
                    { 
                        Id = item.Id,
                        Fecha = item.Fecha,
                        Hora = item.Hora,
                        HoraEntera = item.HoraEntera.Value,
                        MinutosEnteros = item.MinutosEnteros.Value,
                        Anio = item.Anio.Value,
                        Mes = item.Mes.Value,
                        Dia = item.Dia.Value,
                        Temperatura = item.Temperatura,
                        Estado = new Estado { Id = item.IdEstado, Nombre = item.NombreEstado}
                    });

                }
                
            }

            return r;
            
        }

        public static int Crear(Clima clima)
        {
            int r = 0;
            using (var db = new InfoClimaModel())
            {
                LibreriaClimaEntitiesORM.Clima c = new LibreriaClimaEntitiesORM.Clima()
                {
                    Fecha = clima.Fecha,
                    Hora = clima.Hora,
                    Temperatura = clima.Temperatura,
                    Pais = db.Pais.Where(e => e.Id == clima.Pais.Id).FirstOrDefault(),
                    Ciudad = db.Ciudad.Where(e => e.Id == clima.Ciudad.Id && e.Pais.Id == clima.Pais.Id).FirstOrDefault(),
                    Estado = db.Estado.Where(e => e.Id == clima.Estado.Id).FirstOrDefault()
                };
                
                db.AddToClima(c);
                db.SaveChanges();
                r = c.Id;
            }
            return r;
        }

        public static int Crear(DateTime fecha, DateTime hora, double temperatura, Pais pais, Ciudad ciudad, Estado estado)
        {
            Clima c = new Clima(fecha, hora, temperatura,pais,ciudad, estado);
            return Crear(c);
        }

        public static int Crear(DateTime fecha, DateTime hora, double temperatura, int idPais, int idCiudad, int idEstado)
        {
            Estado est = Estado.EstadoPorId(idEstado);
            Pais pais = Pais.PaisPorId(idPais);
            Ciudad ciudad = Ciudad.ObtenerCiudad(idPais, idCiudad);

            Clima c = new Clima(fecha, hora, temperatura,pais, ciudad, est);
            return Crear(c);
        }

        public static bool Borrar(int id)
        {
            using (var db = new InfoClimaModel())
            {
                var result = (from c in db.Clima
                              where c.Id == id
                              select c).FirstOrDefault();
                if (result != null)
                {
                    db.DeleteObject(result);
                    db.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public static void Editar(Clima clima)
        {

            using (var db = new InfoClimaModel())
            {
                var result = (from c in db.Clima
                              where c.Id == clima.Id
                              select c).FirstOrDefault();
                if (result != null)
                {
                    result.Fecha = clima.Fecha;
                    result.Hora = clima.Hora;
                    result.HoraEntera = clima.HoraEntera;
                    result.MinutosEnteros = clima.MinutosEnteros;
                    result.Anio = clima.Anio;
                    result.Mes = clima.Mes;
                    result.Dia = clima.Dia;
                    result.Temperatura = clima.Temperatura;
                    result.Estado = db.Estado.Where(e => e.Id == clima.Estado.Id).FirstOrDefault();
                    db.SaveChanges();
                }
            }
        }

    }
}
