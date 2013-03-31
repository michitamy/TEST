using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class EntityNivel
    {

        #region initialization
        int _Nivel_id;
        string _Nombre;
        bool _Porcarrera;
        string _Creadopor;
        DateTime _Creadoen;
        string _Creadodesde;
        string _Modifpor;
        DateTime _Modifen;
        string _Modfdesde;
        #endregion

        #region encaptulation

        public int Nivel_id
        {
            get { return _Nivel_id; }
            set { _Nivel_id = value; }
        }

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        public bool Porcarrera
        {
            get { return _Porcarrera; }
            set { _Porcarrera = value; }
        }

        public string Creadopor
        {
            get { return _Creadopor; }
            set { _Creadopor = value; }
        }
        public DateTime Creadoen
        {
            get { return _Creadoen; }
            set { _Creadoen = value; }
        }

        public string Creadodesde
        {
            get { return _Creadodesde; }
            set { _Creadodesde = value; }
        }

        public string Modifpor
        {
            get { return _Modifpor; }
            set { _Modifpor = value; }
        }
        public DateTime Modifen
        {
            get { return _Modifen; }
            set { _Modifen = value; }
        }
        public string Modfdesde
        {
            get { return _Modfdesde; }
            set { _Modfdesde = value; }
        }
        #endregion

        #region constructor
        public EntityNivel()
        {
            _Nivel_id = 0;
            _Nombre = string.Empty; 
            _Porcarrera = false;
            _Creadopor = "";
            _Creadoen = DateTime.Now;
            _Creadodesde = string.Empty;
            _Modifpor = string.Empty;
            _Modifen = DateTime.Now;
            _Modfdesde = string.Empty;
        }
        #endregion


    }
}
