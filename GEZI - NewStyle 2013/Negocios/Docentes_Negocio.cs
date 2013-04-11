using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using Datos;

namespace Negocios
{
    public class Docentes_Negocio
    {
        Docentes_Dato objDocente = null;

        public Docentes_Negocio()
        {
            objDocente = new Docentes_Dato();
        }

        public List<Licenciatura_Entidad> Licenciatura(Licenciatura_Entidad objLic, string sOpcion)
        {
            return objDocente.Licenciatura(objLic, sOpcion);
        }

        public List<Licenciatura_Entidad> RegresaLicenciaturas(string sOpcion, int licenciatura_id)
        {
            return objDocente.RegresaLicenciaturas(sOpcion, licenciatura_id);
        }

        public List<Posgrado_Entidad> Posgrado(Posgrado_Entidad objPos, string sOpcion)
        {
            return objDocente.Posgrado(objPos, sOpcion);
        }

        public List<Posgrado_Entidad> RegresaPosgrados(string sOpcion, int posgrado_id)
        {
            return objDocente.RegresaPosgrados(sOpcion, posgrado_id);
        }

        public List<ExpDocente_Entidad> ExpDocente(ExpDocente_Entidad objExpDoc, string sOpcion)
        {
            return objDocente.ExpDocente(objExpDoc, sOpcion);
        }

        public List<ExpDocente_Entidad> RegresaExpDocente(string sOpcion, int expDoc_Id)
        {
            return objDocente.RegresaExpDocente(sOpcion, expDoc_Id);
        }
        public List<CategoriaDoc_Entidad> RegresaCategoria()
        {
            return objDocente.RegresaCategoria();
        }

    }
}
