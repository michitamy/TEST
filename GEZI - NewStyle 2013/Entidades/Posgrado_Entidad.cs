using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Posgrado_Entidad
    {
        #region inicializacion
        int _Posgrado_id;
        

        string _Estudio;
        string _UnivDondeEstudio;
        string _Pais;
        string _NoCedula;
        string _Comentarios;
        
        bool _TituloGradoLegal;
        bool _Grado;
        
        DateTime _PeriodoInicio;
        DateTime _PeriodoFinal;
        Nivel_Entidad _Nivel;
        Usuario_Entidad _Usuario;
        #endregion
        #region encapsulamiento
        public int Posgrado_id
        {
            get { return _Posgrado_id; }
            set { _Posgrado_id = value; }
        }
        public Nivel_Entidad Nivel
        {
            get { return _Nivel; }
            set { _Nivel = value; }
        }
        public string Estudio
        {
            get { return _Estudio; }
            set { _Estudio = value; }
        }
        public string UnivDondeEstudio
        {
            get { return _UnivDondeEstudio; }
            set { _UnivDondeEstudio = value; }
        }
        public string Pais
        {
            get { return _Pais; }
            set { _Pais = value; }
        }
        public string NoCedula
        {
            get { return _NoCedula; }
            set { _NoCedula = value; }
        }
        public string Comentarios
        {
            get { return _Comentarios; }
            set { _Comentarios = value; }
        }
        public bool TituloGradoLegal
        {
            get { return _TituloGradoLegal; }
            set { _TituloGradoLegal = value; }
        }
        public bool Grado
        {
            get { return _Grado; }
            set { _Grado = value; }
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
        #region constructor
        public Posgrado_Entidad()
        {
            _Nivel = new Nivel_Entidad();
            _Estudio            =string.Empty;
            _UnivDondeEstudio   = string.Empty;
            _Pais               = string.Empty;
            _NoCedula           = string.Empty;
            _Comentarios        = string.Empty;

            _PeriodoInicio      = DateTime.Now;
            _PeriodoFinal       = DateTime.Now;

            _Usuario            = new Usuario_Entidad();
        }
        #endregion
    }
}
