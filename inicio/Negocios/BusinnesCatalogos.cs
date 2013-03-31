using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using Datos;




namespace Negocios
{
    public class BusinnesCatalogos
    {
        public DataCatalogo Objeto1=null;
        public BusinnesCatalogos()
        {
            Objeto1=new DataCatalogo();
        }

        public int nuevoNivel(EntityNivel Objeto2)
        {
            return Objeto1.nuevoNivel(Objeto2);
        }
    }

}
