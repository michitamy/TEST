using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos;
using Entidades;
using System.Data;

namespace Negocios
{
    public class BusinessMaestro
    {
        public DataMaestro objMaestroData = null;

        public BusinessMaestro()
        {
            objMaestroData = new DataMaestro();
        }

        public int Maestro(EntityMaestro eT, string op)
        {
            return objMaestroData.Maestro(eT, op);
        }

        public DataSet MaestroDS(EntityMaestro eT, string op)
        {
            return objMaestroData.MaestroDS(eT, op);
        }
    }
}
