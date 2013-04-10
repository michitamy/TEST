using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class ExpLaboral_Entidad
    {
        #region inicializacion
        
        int _ExpLaboral_Id;
                
        string _NomPuesto;
        string _InstLaboral;
        string _FuncDesemp;
        string _Comentarios;
        
        DateTime _PeriodoInicio;
        DateTime _PeriodoTermino;
        
        Usuario_Entidad Usuario;
        #endregion
        #region encapsulamiento
        public int ExpLaboral_Id
        {
            get { return _ExpLaboral_Id; }
            set { _ExpLaboral_Id = value; }
        }
        public string NomPuesto
        {
            get { return _NomPuesto; }
            set { _NomPuesto = value; }
        }
        public string FuncDesemp
        {
            get { return _FuncDesemp; }
            set { _FuncDesemp = value; }
        }
        public string Comentarios
        {
            get { return _Comentarios; }
            set { _Comentarios = value; }
        }
        public string InstLaboral
        {
            get { return _InstLaboral; }
            set { _InstLaboral = value; }
        }
        public DateTime PeriodoInicio
        {
            get { return _PeriodoInicio; }
            set { _PeriodoInicio = value; }
        }
        public DateTime PeriodoTermino
        {
            get { return _PeriodoTermino; }
            set { _PeriodoTermino = value; }
        }
        public Usuario_Entidad Usuario1
        {
            get { return Usuario; }
            set { Usuario = value; }
        }
        #endregion
        #region constructor
        public ExpLaboral_Entidad()
        {
            _NomPuesto=string.Empty;
            _InstLaboral = string.Empty;
            _FuncDesemp = string.Empty;
            _Comentarios = string.Empty;

            _PeriodoInicio = DateTime.Now;
            _PeriodoTermino = DateTime.Now;

            Usuario=new Usuario_Entidad();
        }
        #endregion
    }
}
