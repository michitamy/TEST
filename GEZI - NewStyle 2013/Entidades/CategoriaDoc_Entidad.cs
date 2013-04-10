using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class CategoriaDoc_Entidad
    {
        #region inicializacion
        int _CategoDoc_Id;
        int _PagoHr;

        string _Descripcion;
        Usuario_Entidad _Usuario;
        #endregion
        #region encapsulamiento
        public int CategoDoc_Id
        {
            get { return _CategoDoc_Id; }
            set { _CategoDoc_Id = value; }
        }
        public int PagoHr
        {
            get { return _PagoHr; }
            set { _PagoHr = value; }
        }
        public string Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }
        #endregion
        #region constructor
        public CategoriaDoc_Entidad()
        {
            _CategoDoc_Id = 0;
            _PagoHr = 0;
            _Descripcion=string.Empty;
            _Usuario= new Usuario_Entidad();
        }

        #endregion
    }
}
