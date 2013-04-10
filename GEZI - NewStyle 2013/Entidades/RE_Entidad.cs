namespace Entidades
{
    public class RE_Entidad
    {
        #region Inicializacion

        private int _Encuesta_id;
        private int _RE_id;
        private int _TRespuesta1;
        private int _TRespuesta2;
        private int _TRespuesta3;
        private int _TRespuesta4;
        private int _TRespuesta5;

        private Plantel_Entidad _Plantel;
        private Usuario_Entidad _Usuario;

        #endregion Inicializacion

        #region Encapsulamiento

        public int Encuesta_id
        {
            get { return _Encuesta_id; }
            set { _Encuesta_id = value; }
        }

        public Usuario_Entidad Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }

        public int RE_id
        {
            get { return _RE_id; }
            set { _RE_id = value; }
        }

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

        public Plantel_Entidad Plantel
        {
            get { return _Plantel; }
            set { _Plantel = value; }
        }

        #endregion Encapsulamiento

        #region Constructor

        public RE_Entidad()
        {
            _Plantel = new Plantel_Entidad();
            _Usuario = new Usuario_Entidad();
        }

        #endregion Constructor
    }
}