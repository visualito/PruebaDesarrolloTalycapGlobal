using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using LibreriaClimaEntitiesORM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LibreriaClimaNegocio
{
    public class Estado
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        public Estado()
        {

        }

        public Estado(int id, string nombre)
        {
            this.Id = id;
            this.Nombre = nombre;
        }

        public override string ToString()
        {
            return this.Nombre;
        }

        public static List<Estado> Estados()
        {
            List<Estado> r = new List<Estado>();
            using (var db = new InfoClimaModel())
            {
                r = (from e in db.Estado
                         select new Estado
                         {
                             Id = e.Id,
                             Nombre = e.Nombre
                         }).ToList();
            }
            return r;
        }

        public static  Estado EstadoPorId(int id)
        {
            Estado r = new Estado();
            using (var db = new InfoClimaModel())
            {
                r = (from e in db.Estado
                          select new Estado
                          {
                              Id = e.Id,
                              Nombre = e.Nombre
                          }).FirstOrDefault();
            }
            return r;
        }

    }
}
