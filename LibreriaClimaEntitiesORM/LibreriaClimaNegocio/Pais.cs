using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using LibreriaClimaEntitiesORM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LibreriaClimaNegocio
{
    public class Pais
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        public Pais()
        {

        }

        public Pais(int id, string nombre)
        {
            this.Id = id;
            this.Nombre = nombre;
        }

        public override string ToString()
        {
            return this.Nombre;
        }


        

        public static List<Pais> Paises()
        {
            List<Pais> r = new List<Pais>();
            using (var db = new InfoClimaModel())
            {
                r = (from p in db.Pais
                         select new Pais
                         {
                             Id = p.Id,
                             Nombre = p.Nombre
                         }).ToList();
            }
            return r;
        }

        public static Pais PaisPorId(int id)
        {
            Pais r = new Pais();
            using (var db = new InfoClimaModel())
            {
                r = (from p in db.Pais
                     select new Pais
                     {
                         Id = p.Id,
                         Nombre = p.Nombre
                     }).FirstOrDefault();
            }
            return r;
        }

    }
}
