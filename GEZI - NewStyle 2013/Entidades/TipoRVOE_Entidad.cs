namespace Entidades
{
    public class TipoRVOE_Entidad
    {
        #region Inicializacion

        private int _TipoRVOE_id;

        private string _Nombre;

        private Usuario_Entidad _Usuario;

        #endregion Inicializacion

        #region Encapsulamiento

        public int TipoRVOE_id
        {
            get { return _TipoRVOE_id; }
            set { _TipoRVOE_id = value; }
        }

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        public Usuario_Entidad Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }

        #endregion Encapsulamiento

        #region Constructor

        public TipoRVOE_Entidad()
        {
            _Nombre = string.Empty;
        }

        #endregion Constructor
    }
}