using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Licenciatura_Entidad
    {
        #region Inicializacion

        int _Licenciatura_id;
        
        string _Licenciatura;
        string _DondeEstudio;
        string _NoCedula;

        bool _TituloLegalizado;

        DateTime _PeriodoInicio;
        DateTime _PeriodoFinal;
        Pais_Entidad _Pais;
        Usuario_Entidad _Usuario;

        #endregion

        #region Encapsulamiento

        public int Licenciatura_id
        {
            get { return _Licenciatura_id; }
            set { _Licenciatura_id = value; }
        }

        public string Licenciatura
        {
            get { return _Licenciatura; }
            set { _Licenciatura = value; }
        }

        public string DondeEstudio
        {
            get { return _DondeEstudio; }
            set { _DondeEstudio = value; }
        }

        public Pais_Entidad Pais
        {
            get { return _Pais; }
            set { _Pais = value; }
        }

        public string NoCedula
        {
            get { return _NoCedula; }
            set { _NoCedula = value; }
        }

        public bool TituloLegalizado
        {
            get { return _TituloLegalizado; }
            set { _TituloLegalizado = value; }
        }

        public DateTime PeriodoInicio
        {
            get { return _PeriodoInicio; }
            set { _PeriodoInicio = value; }
        }

        public DateTime PeriodoFinal
        {
            get { return _PeriodoFinal; }
            set { _PeriodoFinal = value; }
        }

        public Usuario_Entidad Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }
        #endregion

        #region Constrcutor

        public Licenciatura_Entidad()
        {
            _Licenciatura   = string.Empty;
            _DondeEstudio   = string.Empty;
            _NoCedula       = string.Empty;
            
            _PeriodoInicio  = DateTime.Now;
            _PeriodoFinal   = DateTime.Now;
            _Pais           = new Pais_Entidad();
            _Usuario        = new Usuario_Entidad();
        }
        #endregion

    }

}
