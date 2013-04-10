namespace Entidades
{
    public class Institucion_Entidad
    {
        #region Inicializacion

        private int _Institucion_id;

        private Nivel_Entidad _Nivel;
        private Tipo_Entidad _Tipo;
        private Usuario_Entidad _Usuario;

        private string _Institucion;
        private string _Clave;
        private string _Telefono;
        private string _Web;
        private string _Area;
        private string _Imagen;

        public enum Niveles
        {
            Preescolar = 1,
            Primaria = 2,
            Secundaria = 3,
            Preparatoria = 4,
            Universidad = 5
        };

        #endregion Inicializacion

        #region Encapsulamiento

        public string Imagen
        {
            get { return _Imagen; }
            set { _Imagen = value; }
        }

        public Usuario_Entidad Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }

        public int Institucion_id
        {
            get { return _Institucion_id; }
            set { _Institucion_id = value; }
        }

        public Nivel_Entidad Nivel
        {
            get { return _Nivel; }
            set { _Nivel = value; }
        }

        public Tipo_Entidad Tipo
        {
            get { return _Tipo; }
            set { _Tipo = value; }
        }

        public string Institucion
        {
            get { return _Institucion; }
            set { _Institucion = value; }
        }

        public string Clave
        {
            get { return _Clave; }
            set { _Clave = value; }
        }

        public string Telefono
        {
            get { return _Telefono; }
            set { _Telefono = value; }
        }

        public string Web
        {
            get { return _Web; }
            set { _Web = value; }
        }

        public string Area
        {
            get { return _Area; }
            set { _Area = value; }
        }

        #endregion Encapsulamiento

        #region Constructor

        public Institucion_Entidad()
        {
            _Institucion = string.Empty;
            _Clave = string.Empty;
            _Telefono = string.Empty;
            _Web = string.Empty;
            _Area = string.Empty;
            _Imagen = string.Empty;

            _Nivel = new Nivel_Entidad();
            _Tipo = new Tipo_Entidad();
            _Usuario = new Usuario_Entidad();
        }

        #endregion Constructor
    }
}