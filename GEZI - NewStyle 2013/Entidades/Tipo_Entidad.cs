namespace Entidades
{
    public class Tipo_Entidad
    {
        #region Inicializacion

        private int _Tipo_id;

        private string _Nombre;

        #endregion Inicializacion

        #region Encapsulamiento

        public int Tipo_id
        {
            get { return _Tipo_id; }
            set { _Tipo_id = value; }
        }

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        #endregion Encapsulamiento

        #region Constructor

        public Tipo_Entidad()
        {
            _Nombre = string.Empty;
        }

        #endregion Constructor
    }
}