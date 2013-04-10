using System.Collections.Generic;
namespace Entidades
{
    public class Plantel_Entidad
    {
        #region Inicializacion

        private int _Plantel_id;
        private int _Ciudad_Id;
        private int _Estado_Id;
        private int _Carrera_id;

        private int _CP;

        private Institucion_Entidad _Institucion;
        private Usuario_Entidad _Usuario;
        private Encuesta_Entidad _Encuesta;

        private string _Contacto;
        private string _Telefono;
        private string _Correo;
        private string _Plantel;
        private string _Direccion;

        private string _Ciudad;
        private string _Carrera;

        //Con esta variable se va a indicar en que orden se van a ir
        //comparando los planteles.
        private int _Numero_comp;

        private List<int> _ListNumero;


        #endregion Inicializacion

        #region Encapsulamiento

        public List<int> ListNumero
        {
            get { return _ListNumero; }
            set { _ListNumero = value; }
        }

        public int Carrera_id
        {
            get { return _Carrera_id; }
            set { _Carrera_id = value; }
        }

        public string Carrera
        {
            get { return _Carrera; }
            set { _Carrera = value; }
        }

        public int Numero_comp
        {
            get { return _Numero_comp; }
            set { _Numero_comp = value; }
        }

        public Encuesta_Entidad Encuesta
        {
            get { return _Encuesta; }
            set { _Encuesta = value; }
        }

        public string Ciudad
        {
            get { return _Ciudad; }
            set { _Ciudad = value; }
        }

        public int Estado_Id
        {
            get { return _Estado_Id; }
            set { _Estado_Id = value; }
        }

        private string _Estado;

        public string Estado
        {
            get { return _Estado; }
            set { _Estado = value; }
        }

        public Usuario_Entidad Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }

        public int Plantel_id
        {
            get { return _Plantel_id; }
            set { _Plantel_id = value; }
        }

        public int Ciudad_Id
        {
            get { return _Ciudad_Id; }
            set { _Ciudad_Id = value; }
        }

        public int CP
        {
            get { return _CP; }
            set { _CP = value; }
        }

        public Institucion_Entidad Institucion
        {
            get { return _Institucion; }
            set { _Institucion = value; }
        }

        public string Contacto
        {
            get { return _Contacto; }
            set { _Contacto = value; }
        }

        public string Telefono
        {
            get { return _Telefono; }
            set { _Telefono = value; }
        }

        public string Correo
        {
            get { return _Correo; }
            set { _Correo = value; }
        }

        public string Plantel
        {
            get { return _Plantel; }
            set { _Plantel = value; }
        }

        public string Direccion
        {
            get { return _Direccion; }
            set { _Direccion = value; }
        }

        #endregion Encapsulamiento

        #region Constructor

        public Plantel_Entidad()
        {
            _Institucion = new Institucion_Entidad();
            _Usuario = new Usuario_Entidad();
            _Encuesta = new Encuesta_Entidad();
            _ListNumero = new List<int>();

            _Contacto = string.Empty;
            _Telefono = string.Empty;
            _Correo = string.Empty;
            _Plantel = string.Empty;
            _Direccion = string.Empty;

            _Ciudad = string.Empty;
            _Carrera = string.Empty;
        }

        #endregion Constructor
    }
}