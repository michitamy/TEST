using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class ExpDocente_Entidad
    {
        #region inicializacion
        int _ExpDoc_Id;
        
        
        string _NomAsignatura;
        string _ResultEvaluacion;
        string _Comentarios;
        string _Institucion;
        
        DateTime _PeriodoInicio;
        DateTime _PeriodoFinal;
        Nivel_Entidad _NivelEscolar;        
        Usuario_Entidad _Usuario;
        CategoriaDoc_Entidad _CategoriaDoc;
        #endregion

        #region encapsulamiento
        public int ExpDoc_Id
        {
            get { return _ExpDoc_Id; }
            set { _ExpDoc_Id = value; }
        }
        public string NomAsignatura
        {
            get { return _NomAsignatura; }
            set { _NomAsignatura = value; }
        }
        public Nivel_Entidad NivelEscolar
        {
            get { return _NivelEscolar; }
            set { _NivelEscolar = value; }
        }
        public string Institucion
        {
            get { return _Institucion; }
            set { _Institucion = value; }
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
        public CategoriaDoc_Entidad CategoriaDoc
        {
            get { return _CategoriaDoc; }
            set { _CategoriaDoc = value; }
        }
        public string ResultEvaluacion
        {
            get { return _ResultEvaluacion; }
            set { _ResultEvaluacion = value; }
        }
        public string Comentarios
        {
            get { return _Comentarios; }
            set { _Comentarios = value; }
        }
        public Usuario_Entidad Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }
        #endregion
        #region constructor
        public ExpDocente_Entidad()
        {
            
            _NomAsignatura =string.Empty;
            _ResultEvaluacion = string.Empty;
            _Comentarios = string.Empty;
            _Institucion = string.Empty;

            _PeriodoInicio = DateTime.Now;
            _PeriodoFinal = DateTime.Now;
            _NivelEscolar = new Nivel_Entidad();
            _Usuario = new Usuario_Entidad();
            _CategoriaDoc = new CategoriaDoc_Entidad();

        }
        #endregion
    }
}
