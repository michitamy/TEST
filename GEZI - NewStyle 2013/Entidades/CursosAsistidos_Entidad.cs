using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class CursosAsistidos_Entidad
    {
        #region inicializacion
        int _CursosAsist_Id;
        int _Duracion;
        
        string _NombreCurso;
        string _Institucion;
        string _Comentarios;

        DateTime _PeriodoInicio;
        DateTime _PeriodoFinal;
        
        Usuario_Entidad _Usuario;
        #endregion
        #region encapsulamiento
        
        public int CursosAsist_Id
        {
            get { return _CursosAsist_Id; }
            set { _CursosAsist_Id = value; }
        }
        public int Duracion
        {
            get { return _Duracion; }
            set { _Duracion = value; }
        }
        public string NombreCurso
        {
            get { return _NombreCurso; }
            set { _NombreCurso = value; }
        }
        public string Institucion
        {
            get { return _Institucion; }
            set { _Institucion = value; }
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
        public CursosAsistidos_Entidad()
        {
            _Duracion = 0;
            _NombreCurso = string.Empty;
            _Institucion = string.Empty;
            _Comentarios = string.Empty;

            _PeriodoInicio = DateTime.Now;
            _PeriodoFinal = DateTime.Now;

            _Usuario = new Usuario_Entidad();
        }
        #endregion
    }
}
