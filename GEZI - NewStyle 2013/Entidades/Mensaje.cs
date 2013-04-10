using System.Drawing;

namespace Entidades
{
    public class Mensaje
    {
        #region Inicializacion

        private Color _ColorFondo;
        private Color _ColorBorde;
        private Color _ColorFuente;
        private string _Icono;
        private string _Notificacion;
        private string _Titulo;

        public enum TipoMens
        {
            Satisfaccion,
            Alerta,
            Error,
            Informacion,
            Nota
        };

        #endregion Inicializacion

        #region Encapsulamiento

        public Color ColorFuente
        {
            get { return _ColorFuente; }
            set { _ColorFuente = value; }
        }

        public Color ColorFondo
        {
            get { return _ColorFondo; }
            set { _ColorFondo = value; }
        }

        public Color ColorBorde
        {
            get { return _ColorBorde; }
            set { _ColorBorde = value; }
        }

        public string Icono
        {
            get { return _Icono; }
            set { _Icono = value; }
        }

        public string Notificacion
        {
            get { return _Notificacion; }
            set { _Notificacion = value; }
        }

        public string Titulo
        {
            get { return _Titulo; }
            set { _Titulo = value; }
        }

        #endregion Encapsulamiento

        #region Constructor

        public Mensaje()
        {
            //_ColorFondo = string.Empty;
            //_ColorBorde = string.Empty;
            //_ColorFuente=
            _Icono = string.Empty;
            _Notificacion = string.Empty;
            _Titulo = string.Empty;
        }

        #endregion Constructor
    }
}