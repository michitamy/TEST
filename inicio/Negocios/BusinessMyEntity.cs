using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos;
using Entidades;

namespace Negocios
{
    public class BusinessMyEntity
    {
        public DataMyEntity objMyEntityData = null;

        public BusinessMyEntity()
        {
            objMyEntityData = new DataMyEntity();
        }

        public int myMethodToInt(MyEntity eT, string op)//especificas lo que recibe el metodo
        {

            return objMyEntityData.myMethodToInt(eT, op);
        }
        
        public string myMethodToString(MyEntity eT, string op)//especificas lo que recibe el metodo
        {

            return objMyEntityData.myMethodToString(eT, op);
        }
    }
}
