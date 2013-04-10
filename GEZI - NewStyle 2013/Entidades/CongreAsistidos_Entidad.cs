using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    class CongreAsistidos_Entidad
    {
        #region inicializacion

        int _CongresosAsist_Id;
        int _AreaConocimiento_Id;
        
        string _NombreCongreso;
        string _Institucion;
        string _Tematica;
        string _TipoParticip;
        string _NombreConferencia;
        string _NombrePonencia;
        string _Comentarios;

        DateTime _PeriodoInicio;
        DateTime _PeriodoFinal;

        Usuario_Entidad _Usuario;


        #endregion
        #region encapsulamiento
        
        public int CongresosAsist_Id
        {
            get { return _CongresosAsist_Id; }
            set { _CongresosAsist_Id = value; }
        }
        public int AreaConocimiento_Id
        {
            get { return _AreaConocimiento_Id; }
            set { _AreaConocimiento_Id = value; }
        }
        public string NombreCongreso
        {
            get { return _NombreCongreso; }
            set { _NombreCongreso = value; }
        }
        public string Institucion
        {
            get { return _Institucion; }
            set { _Institucion = value; }
        }
        public string Tematica
        {
            get { return _Tematica; }
            set { _Tematica = value; }
        }
        public string TipoParticip
        {
            get { return _TipoParticip; }
            set { _TipoParticip = value; }
        }
        public string NombreConferencia
        {
            get { return _NombreConferencia; }
            set { _NombreConferencia = value; }
        }
        public string NombrePonencia
        {
            get { return _NombrePonencia; }
            set { _NombrePonencia = value; }
        }
        public string Comentarios
        {
            get { return _Comentarios; }
            set { _Comentarios = value; }
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

        public CongreAsistidos_Entidad()
        {
        _NombreCongreso = string.Empty;
        _Institucion = string.Empty;
        _Tematica = string.Empty;
        _TipoParticip = string.Empty;
        _NombreConferencia = string.Empty;
        _NombrePonencia = string.Empty;
        _Comentarios=string.Empty;

        _PeriodoInicio = DateTime.Now;
        _PeriodoFinal = DateTime.Now;

        _Usuario=new Usuario_Entidad();
    }
        #endregion
    }
}
