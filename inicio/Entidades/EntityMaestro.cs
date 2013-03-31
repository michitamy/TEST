using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class EntityMaestro
    {
        #region inicializacion
            int _id;
            string _noEmpleado;
            string _titulo;
            string _nombre;        
            string _apellidoP;       
            string _apellidoM;
            string _carrera;
            string _modifyBy;
            string _modifyHost;
            DateTime _modifyDate;

          
        #endregion
        #region encapsulamiento
            public int Id
            {
                get { return _id; }
                set { _id = value; }
            }
        
            public string NoEmpleado
            {
                get { return _noEmpleado; }
                set { _noEmpleado = value; }
            }

            public string Titulo
            {
                get { return _titulo; }
                set { _titulo = value; }
            }

            public string Nombre
            {
                get { return _nombre; }
                set { _nombre = value; }
            }
        
            public string ApellidoM
            {
                get { return _apellidoM; }
                set { _apellidoM = value; }
            }
        
            public string ApellidoP
            {
               get { return _apellidoP; }
               set { _apellidoP = value; }
            }
        
            public string Carrera
            {
                get { return _carrera; }
                set { _carrera = value; }
            }

            public string ModifyBy
            {
                get { return _modifyBy; }
                set { _modifyBy = value; }
            }

            public string ModifyHost
            {
                get { return _modifyHost; }
                set { _modifyHost = value; }
            }        
        
            public DateTime ModifyDate
                {
                    get { return _modifyDate; }
                    set { _modifyDate = value; }
                }
        #endregion

        public EntityMaestro()
        {
            _id = 0;
            _noEmpleado= string.Empty;
            _nombre = string.Empty;
            _apellidoM = string.Empty;
            _apellidoP = string.Empty;
            _carrera = string.Empty;
            _modifyBy = string.Empty;
            _modifyHost = System.Environment.MachineName;
            _modifyDate = DateTime.Now;
        }
    }
}
