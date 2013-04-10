namespace Entidades
{
    public class Caracteristicas_Entidad
    {
        #region Inicializacion

        private int _Caract_id;
        private int _Labidiomas;
        private int _LabComputo;
        private int _Acrditaasig;
        private int _Revcurriculo;
        private int _NoAlumnos;
        
        private Plantel_Entidad _Plantel;
        private Usuario_Entidad _Usuario;
        private Carreras_Entidad _Carreras;
        
        private System.Nullable<bool> _Exadiag;
        private System.Nullable<bool> _Prepingr;
        private System.Nullable<bool> _Servpsco;
        private System.Nullable<bool> _Activextracurles;
        private System.Nullable<bool> _Servevaegre;
        private System.Nullable<bool> _ProgInterncion;
        private System.Nullable<bool> _Conscalif;
        private System.Nullable<bool> _Sistadminclases;
        private System.Nullable<bool> _Tutorias;
        private System.Nullable<bool> _Cursosremed;
        private System.Nullable<bool> _Intercacadem;
        private System.Nullable<bool> _Servcomunidad;
        private System.Nullable<bool> _Aireacond;
        private System.Nullable<bool> _Salonesmultim;
        private System.Nullable<bool> _Biblioteca;
        private System.Nullable<bool> _Bibcompeint;
        private System.Nullable<bool> _Biblvirtual;
        private System.Nullable<bool> _Educacontinua;
        private System.Nullable<bool> _Formpedagca;
        private System.Nullable<bool> _Actdisc;
        private System.Nullable<bool> _Evaluadoct;

        private string _FormaEval;
        private string _Calfmin;
        private string _Razonbaja;
        private string _Activextracrs;
        private string _FormaEvaluadoct;
        private string _Catdocts;
        private string _Asocsinst;

        private decimal _Resulpenlace;
        private decimal _Costoinsc;
        private decimal _Costocolra;

        private decimal _Eficterm;
        private decimal _Doctsmatria;
        private decimal _Doctsdocdo;
        private decimal _InvesSNI;
        private decimal _Doctslibrs;

        #endregion Inicializacion

        #region Encapsulamiento

        public int NoAlumnos
        {
            get { return _NoAlumnos; }
            set { _NoAlumnos = value; }
        }

        public Carreras_Entidad Carreras
        {
            get { return _Carreras; }
            set { _Carreras = value; }
        }
        public Plantel_Entidad Plantel
        {
            get { return _Plantel; }
            set { _Plantel = value; }
        }

        public int Caract_id
        {
            get { return _Caract_id; }
            set { _Caract_id = value; }
        }

        public int Labidiomas
        {
            get { return _Labidiomas; }
            set { _Labidiomas = value; }
        }

        public int LabComputo
        {
            get { return _LabComputo; }
            set { _LabComputo = value; }
        }

        public int Acrditaasig
        {
            get { return _Acrditaasig; }
            set { _Acrditaasig = value; }
        }

        public int Revcurriculo
        {
            get { return _Revcurriculo; }
            set { _Revcurriculo = value; }
        }

        public Usuario_Entidad Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }

        public System.Nullable<bool> Exadiag
        {
            get { return _Exadiag; }
            set { _Exadiag = value; }
        }

        public System.Nullable<bool> Prepingr
        {
            get { return _Prepingr; }
            set { _Prepingr = value; }
        }

        public System.Nullable<bool> Servpsco
        {
            get { return _Servpsco; }
            set { _Servpsco = value; }
        }

        public System.Nullable<bool> Activextracurles
        {
            get { return _Activextracurles; }
            set { _Activextracurles = value; }
        }

        public System.Nullable<bool> Servevaegre
        {
            get { return _Servevaegre; }
            set { _Servevaegre = value; }
        }

        public System.Nullable<bool> ProgInterncion
        {
            get { return _ProgInterncion; }
            set { _ProgInterncion = value; }
        }

        public System.Nullable<bool> Conscalif
        {
            get { return _Conscalif; }
            set { _Conscalif = value; }
        }

        public System.Nullable<bool> Sistadminclases
        {
            get { return _Sistadminclases; }
            set { _Sistadminclases = value; }
        }

        public System.Nullable<bool> Tutorias
        {
            get { return _Tutorias; }
            set { _Tutorias = value; }
        }

        public System.Nullable<bool> Cursosremed
        {
            get { return _Cursosremed; }
            set { _Cursosremed = value; }
        }

        public System.Nullable<bool> Intercacadem
        {
            get { return _Intercacadem; }
            set { _Intercacadem = value; }
        }

        public System.Nullable<bool> Servcomunidad
        {
            get { return _Servcomunidad; }
            set { _Servcomunidad = value; }
        }

        public System.Nullable<bool> Aireacond
        {
            get { return _Aireacond; }
            set { _Aireacond = value; }
        }

        public System.Nullable<bool> Salonesmultim
        {
            get { return _Salonesmultim; }
            set { _Salonesmultim = value; }
        }

        public System.Nullable<bool> Biblioteca
        {
            get { return _Biblioteca; }
            set { _Biblioteca = value; }
        }

        public System.Nullable<bool> Bibcompeint
        {
            get { return _Bibcompeint; }
            set { _Bibcompeint = value; }
        }

        public System.Nullable<bool> Biblvirtual
        {
            get { return _Biblvirtual; }
            set { _Biblvirtual = value; }
        }

        public System.Nullable<bool> Educacontinua
        {
            get { return _Educacontinua; }
            set { _Educacontinua = value; }
        }

        public System.Nullable<bool> Formpedagca
        {
            get { return _Formpedagca; }
            set { _Formpedagca = value; }
        }

        public System.Nullable<bool> Actdisc
        {
            get { return _Actdisc; }
            set { _Actdisc = value; }
        }

        public System.Nullable<bool> Evaluadoct
        {
            get { return _Evaluadoct; }
            set { _Evaluadoct = value; }
        }

        public string FormaEval
        {
            get { return _FormaEval; }
            set { _FormaEval = value; }
        }

        public string Calfmin
        {
            get { return _Calfmin; }
            set { _Calfmin = value; }
        }

        public string Razonbaja
        {
            get { return _Razonbaja; }
            set { _Razonbaja = value; }
        }

        public string Activextracrs
        {
            get { return _Activextracrs; }
            set { _Activextracrs = value; }
        }

        public string FormaEvaluadoct
        {
            get { return _FormaEvaluadoct; }
            set { _FormaEvaluadoct = value; }
        }

        public string Catdocts
        {
            get { return _Catdocts; }
            set { _Catdocts = value; }
        }

        public string Asocsinst
        {
            get { return _Asocsinst; }
            set { _Asocsinst = value; }
        }

        public decimal Resulpenlace
        {
            get { return _Resulpenlace; }
            set { _Resulpenlace = value; }
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

        public decimal Eficterm
        {
            get { return _Eficterm; }
            set { _Eficterm = value; }
        }

        public decimal Doctsmatria
        {
            get { return _Doctsmatria; }
            set { _Doctsmatria = value; }
        }

        public decimal Doctsdocdo
        {
            get { return _Doctsdocdo; }
            set { _Doctsdocdo = value; }
        }

        public decimal InvesSNI
        {
            get { return _InvesSNI; }
            set { _InvesSNI = value; }
        }

        public decimal Doctslibrs
        {
            get { return _Doctslibrs; }
            set { _Doctslibrs = value; }
        }

        #endregion Encapsulamiento

        #region Constructor

        public Caracteristicas_Entidad()
        {
            _FormaEval = string.Empty;
            _Calfmin = string.Empty;
            _Razonbaja = string.Empty;
            _Activextracrs = string.Empty;
            _FormaEvaluadoct = string.Empty;
            _Catdocts = string.Empty;
            _Asocsinst = string.Empty;

            _Resulpenlace = (decimal)0;
            _Costoinsc = (decimal)0;
            _Costocolra = (decimal)0;
            _Eficterm = (decimal)0;
            _Doctsmatria = (decimal)0;
            _Doctsdocdo = (decimal)0;
            _InvesSNI = (decimal)0;
            _Doctslibrs = (decimal)0;

            _Plantel = new Plantel_Entidad();
            _Usuario = new Usuario_Entidad();
            _Carreras = new Carreras_Entidad();
        }

        #endregion Constructor
    }
}