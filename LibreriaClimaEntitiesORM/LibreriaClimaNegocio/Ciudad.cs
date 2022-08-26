using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using LibreriaClimaEntitiesORM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LibreriaClimaNegocio
{
    public class Ciudad
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int IdPais { get; set; }

        public Ciudad()
        {

        }

        public Ciudad(int id, string nombre, int idPais)
        {
            this.Id = id;
            this.Nombre = nombre;
            this.IdPais = idPais;
        }
        
        public static List<Ciudad> Ciudades (int pais)
        {
            List<Ciudad> r = new List<Ciudad>();

            using (var db = new InfoClimaModel())
            {
                var result = db.Ciudad.Where(x => x.Pais.Id == pais).ToList();

                foreach (var item in result)
                {
                    r.Add(
                        new Ciudad
                        {
                            Id = item.Id,
                            Nombre = item.Nombre,
                            IdPais = item.Pais.Id
                        });
                }
            }

            return r;
        }

        public static Ciudad ObtenerCiudad(int ciudad)
        {
            Ciudad r = new Ciudad();
            using (var db = new InfoClimaModel())
            {
                r = (from c in db.Ciudad
                                  where c.Id == ciudad
                                  select new Ciudad
                                  {
                                      Id = c.Id,
                                      Nombre = c.Nombre,
                                      IdPais = c.Pais.Id
                                  }).FirstOrDefault();
            }
            return r;
        }
        
        public static Ciudad ObtenerCiudad (int idPais, int idCiudad)
        {
            Ciudad r = new Ciudad();
            using (var db = new InfoClimaModel())
            {
                r = (from c in db.Ciudad
                     where c.Id == idCiudad && c.Pais.Id == idPais
                     select new Ciudad
                     {
                         Id = c.Id,
                         Nombre = c.Nombre,
                         IdPais = c.Pais.Id
                     }).FirstOrDefault();
            }
            return r;
        }
        
    }
}
