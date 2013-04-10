using System;

namespace Entidades
{
    public class Usuario_Entidad
    {
        #region Inicializacion

        private string _Usuario;
        private string _Equipo;

        private int _Usuario_Id;
        private int _Activacion;

        private string _Nombre;
        private string _Apellido;
        private string _NombreUsuario;
        private string _ContraseniaHash;
        private string _ContraseniaSalt;
        private string _Correo;

        bool _IsAdmin;

        private DateTime _Fecha;

        #endregion Inicializacion

        #region Encapsulamiento

        public bool IsAdmin
        {
            get { return _IsAdmin; }
            set { _IsAdmin = value; }
        }

        public int Usuario_Id
        {
            get { return _Usuario_Id; }
            set { _Usuario_Id = value; }
        }

        public int Activacion
        {
            get { return _Activacion; }
            set { _Activacion = value; }
        }

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        public string Apellido
        {
            get { return _Apellido; }
            set { _Apellido = value; }
        }

        public string NombreUsuario
        {
            get { return _NombreUsuario; }
            set { _NombreUsuario = value; }
        }

        public string ContraseniaHash
        {
            get { return _ContraseniaHash; }
            set { _ContraseniaHash = value; }
        }

        public string ContraseniaSalt
        {
            get { return _ContraseniaSalt; }
            set { _ContraseniaSalt = value; }
        }

        public string Correo
        {
            get { return _Correo; }
            set { _Correo = value; }
        }

        public string Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }

        public string Equipo
        {
            get { return _Equipo; }
            set { _Equipo = value; }
        }

        public DateTime Fecha
        {
            get { return _Fecha; }
            set { _Fecha = value; }
        }

        #endregion Encapsulamiento

        #region Constructor

        public Usuario_Entidad()
        {
            _Usuario = string.Empty;
            _Equipo = string.Empty;

            _Nombre = string.Empty;
            _Apellido = string.Empty;
            _NombreUsuario = string.Empty;
            _ContraseniaHash = string.Empty;
            _ContraseniaSalt = string.Empty;
            _Correo = string.Empty;

            _Fecha = DateTime.Now;
        }

        #endregion Constructor
    }
}