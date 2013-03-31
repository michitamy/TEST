using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using Datos;
using System.Data;

namespace Negocios
{
    public class BusinessAlumno
    {
        public DataAlumno objAlumnoData = null;

        public BusinessAlumno()
        {
            objAlumnoData = new DataAlumno();
        }

        public int Alumno(EntityAlumno eT, string op)
        {
            return objAlumnoData.Alumno(eT, op);
        }

        public DataSet AlumnoDS(EntityAlumno eT, string op)
        {
            return objAlumnoData.AlumnoDS(eT, op);
        }
    }
}
