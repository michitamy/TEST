using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Pais_Entidad
    {
        #region Inicializacion
        int _Pais_id;
        string _Pais;
        Usuario_Entidad _Usuario;
        #endregion

        #region Encapsulamiento
        public string Pais
        {
            get { return _Pais; }
            set { _Pais = value; }
        }
        public int Pais_id
        {
            get { return _Pais_id; }
            set { _Pais_id = value; }
        }
        public Usuario_Entidad Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }
        #endregion
        #region Constructor

        public Pais_Entidad()
        {
            _Pais = string.Empty;
            _Usuario = new Usuario_Entidad();
        }
        #endregion
    }
}
