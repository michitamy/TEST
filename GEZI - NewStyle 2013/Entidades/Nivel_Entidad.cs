namespace Entidades
{
    public class Nivel_Entidad
    {
        #region Inicializacion

        private int _Nivel_id;

        private string _Nombre;

        public enum Niveles
        {
            Preescolar = 1,
            Primaria = 2,
            Secundaria = 3,
            Preparatoria = 4,
            Universidad = 5,
            Maestria = 6,
            Licenciatura = 7,
            Especialidad = 8,
            Doctorado = 9
        };

        #endregion Inicializacion

        #region Encapsulamiento

        public int Nivel_id
        {
            get { return _Nivel_id; }
            set { _Nivel_id = value; }
        }

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        #endregion Encapsulamiento

        #region Constructor

        public Nivel_Entidad()
        {
            _Nombre = string.Empty;
        }

        #endregion Constructor
    }
}