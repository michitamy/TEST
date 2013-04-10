namespace Entidades
{
    public class Carreras_Entidad
    {
        #region Inicializacion

        private int _Carrera_ID;
        private int _Cursosingles;
        private int _Cursoscompu;
        private int _NoAlumnos;

        private Nivel_Entidad _Nivel;
        private Plantel_Entidad _Plantel;
        private TipoRVOE_Entidad _TipoRVOE;
        private Usuario_Entidad _Usuario;

        private System.Nullable<bool> _Licacredit;
        private System.Nullable<bool> _Inglesreq;
        private System.Nullable<bool> _Labs;
        private System.Nullable<bool> _Postgrados;

        private string _Tipoestudios;
        private string _NoRVOE;
        private string _Queacredit;
        private string _Opctitcion;
        private string _Proydinv;

        private decimal _Costoinsc;
        private decimal _Costocolra;

        private decimal _Egresados;
        private decimal _Duracion;
        private string _DuracionText;

        #endregion Inicializacion

        #region Encapsulamiento

        public int NoAlumnos
        {
            get { return _NoAlumnos; }
            set { _NoAlumnos = value; }
        }

        public string DuracionText
        {
            get
            {
                string val = string.Format("{0} Año(s) {1} Mes(es)", //Formato que tendrá la duración de la carrera
                                      _Duracion.ToString("N2").Split('.')[0], //Se divide la variable _Duracion y se toma la parte entera, este se asigna como el primer valor [Año(s)]
                                      int.Parse(_Duracion.ToString("N2").Split('.')[1])//Se divide la variable _Duracion, se toma la parte de la fracción y se pasa entero para que quite los 0's Ej.[09 -> 9], este se asigna como el segundo valor [Mes(es)]
                                     );

                val = int.Parse(_Duracion.ToString("N2").Split('.')[0]) < 10 ? val.Replace("0 Año(s) ", "") : val;
                val = int.Parse(_Duracion.ToString("N2").Split('.')[1]) < 10 ? val.Replace("0 Mes(es)", "") : val;
                return val;
            }
            set { _DuracionText = value; }
        }

        public Nivel_Entidad Nivel
        {
            get { return _Nivel; }
            set { _Nivel = value; }
        }

        public int Carrera_ID
        {
            get { return _Carrera_ID; }
            set { _Carrera_ID = value; }
        }

        public string Tipoestudios
        {
            get { return _Tipoestudios; }
            set { _Tipoestudios = value; }
        }

        public Plantel_Entidad Plantel
        {
            get { return _Plantel; }
            set { _Plantel = value; }
        }

        public decimal Duracion
        {
            get { return _Duracion; }
            set { _Duracion = value; }
        }

        public int Cursosingles
        {
            get { return _Cursosingles; }
            set { _Cursosingles = value; }
        }

        public int Cursoscompu
        {
            get { return _Cursoscompu; }
            set { _Cursoscompu = value; }
        }

        public Usuario_Entidad Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }

        public TipoRVOE_Entidad TipoRVOE
        {
            get { return _TipoRVOE; }
            set { _TipoRVOE = value; }
        }

        public System.Nullable<bool> Licacredit
        {
            get { return _Licacredit; }
            set { _Licacredit = value; }
        }

        public System.Nullable<bool> Inglesreq
        {
            get { return _Inglesreq; }
            set { _Inglesreq = value; }
        }

        public System.Nullable<bool> Labs
        {
            get { return _Labs; }
            set { _Labs = value; }
        }

        public System.Nullable<bool> Postgrados
        {
            get { return _Postgrados; }
            set { _Postgrados = value; }
        }

        public string NoRVOE
        {
            get { return _NoRVOE; }
            set { _NoRVOE = value; }
        }

        public string Queacredit
        {
            get { return _Queacredit; }
            set { _Queacredit = value; }
        }

        public string Opctitcion
        {
            get { return _Opctitcion; }
            set { _Opctitcion = value; }
        }

        public string Proydinv
        {
            get { return _Proydinv; }
            set { _Proydinv = value; }
        }

        public decimal Costoinsc
        {
            get { return _Costoinsc; }
            set { _Costoinsc = value; }
        }

        public decimal Costocolra
        {
            get { return _Costocolra; }
            set { _Costocolra = value; }
        }

        public decimal Egresados
        {
            get { return _Egresados; }
            set { _Egresados = value; }
        }

        #endregion Encapsulamiento

        #region Constructor

        public Carreras_Entidad()
        {
            _Tipoestudios = string.Empty;
            _NoRVOE = string.Empty;
            _Queacredit = string.Empty;
            _Opctitcion = string.Empty;
            _Proydinv = string.Empty;
            _DuracionText = string.Empty;

            _Costoinsc = (decimal)0;
            _Costocolra = (decimal)0;
            _Egresados = (decimal)0;
            _Duracion = (decimal)0;

            _Plantel = new Plantel_Entidad();
            _TipoRVOE = new TipoRVOE_Entidad();
            _Usuario = new Usuario_Entidad();
            _Nivel = new Nivel_Entidad();
        }

        #endregion Constructor
    }
}