namespace Entidades
{
    public class Encuesta_Entidad
    {
        #region Inicializacion

        private int _Encuesta_id;
        private int _PreguntaNo;

        private string _Nombre;
        private string _Pregunta;
        private string _Respuesta1;
        private string _Respuesta2;
        private string _Respuesta3;
        private string _Respuesta4;
        private string _Respuesta5;

        //Pertenecen a la Tabla Resultado_Encuesta
        //Se anexaron a esta hoja, ya que si se hace un objeto de tipo RE_Encuesta
        //se genera un ciclo y marca error.
        private int _TRespuesta1;

        private int _TRespuesta2;
        private int _TRespuesta3;
        private int _TRespuesta4;
        private int _TRespuesta5;

        private System.Nullable<System.Guid> _GUID;

        private Usuario_Entidad _Usuario;
        private Nivel_Entidad _Nivel;

        #endregion Inicializacion

        #region Encapsulamiento

        public int TRespuesta1
        {
            get { return _TRespuesta1; }
            set { _TRespuesta1 = value; }
        }

        public int TRespuesta2
        {
            get { return _TRespuesta2; }
            set { _TRespuesta2 = value; }
        }

        public int TRespuesta3
        {
            get { return _TRespuesta3; }
            set { _TRespuesta3 = value; }
        }

        public int TRespuesta4
        {
            get { return _TRespuesta4; }
            set { _TRespuesta4 = value; }
        }

        public int TRespuesta5
        {
            get { return _TRespuesta5; }
            set { _TRespuesta5 = value; }
        }

        public Nivel_Entidad Nivel
        {
            get { return _Nivel; }
            set { _Nivel = value; }
        }

        public int PreguntaNo
        {
            get { return _PreguntaNo; }
            set { _PreguntaNo = value; }
        }

        public System.Nullable<System.Guid> GUID
        {
            get { return _GUID; }
            set { _GUID = value; }
        }

        public int Encuesta_id
        {
            get { return _Encuesta_id; }
            set { _Encuesta_id = value; }
        }

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        public string Pregunta
        {
            get { return _Pregunta; }
            set { _Pregunta = value; }
        }

        public string Respuesta1
        {
            get { return _Respuesta1; }
            set { _Respuesta1 = value; }
        }

        public string Respuesta2
        {
            get { return _Respuesta2; }
            set { _Respuesta2 = value; }
        }

        public string Respuesta3
        {
            get { return _Respuesta3; }
            set { _Respuesta3 = value; }
        }

        public string Respuesta4
        {
            get { return _Respuesta4; }
            set { _Respuesta4 = value; }
        }

        public string Respuesta5
        {
            get { return _Respuesta5; }
            set { _Respuesta5 = value; }
        }

        public Usuario_Entidad Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }

        #endregion Encapsulamiento

        #region Constructor

        public Encuesta_Entidad()
        {
            _Nombre = string.Empty;
            _Pregunta = string.Empty;
            _Respuesta1 = string.Empty;
            _Respuesta2 = string.Empty;
            _Respuesta3 = string.Empty;
            _Respuesta4 = string.Empty;
            _Respuesta5 = string.Empty;
            _GUID = System.Guid.Empty;

            _Usuario = new Usuario_Entidad();
            _Nivel = new Nivel_Entidad();
        }

        #endregion Constructor
    }
}