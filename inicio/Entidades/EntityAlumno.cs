using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class EntityAlumno
    {
        #region inicializacion
        int _id;
        string _matricula;
        string _nombre;
        string _apellido;
        int _edad;
        bool _activo;
        string _modifyBy;
        string _modifyHost;
        DateTime _modifyDate;
        #endregion inicializacion

        #region encapsulados
        public DateTime ModifyDate
        {
            get { return _modifyDate; }
            set { _modifyDate = value; }
        }

        public string ModifyHost
        {
            get { return _modifyHost; }
            set { _modifyHost = value; }
        }

        public string ModifyBy
        {
            get { return _modifyBy; }
            set { _modifyBy = value; }
        }


        public bool Activo
        {
            get { return _activo; }
            set { _activo = value; }
        }

        public int Edad
        {
            get { return _edad; }
            set { _edad = value; }
        }

        public string Apellido
        {
            get { return _apellido; }
            set { _apellido = value; }
        }

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        public string Matricula
        {
            get { return _matricula; }
            set { _matricula = value; }
        }

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }
        #endregion encapsulado

        #region constructor
        public EntityAlumno()
        {
            _id = 0;
            _matricula = string.Empty;
            _nombre = string.Empty;
            _apellido = string.Empty;
            _edad = 0;
            _activo = false;
            _modifyBy = string.Empty;
            _modifyHost = System.Environment.MachineName;
            _modifyDate = DateTime.Now;
        
        }
        #endregion constructor
    }
}
