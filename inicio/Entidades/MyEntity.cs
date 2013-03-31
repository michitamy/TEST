using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class MyEntity
    {
        #region inicializacion
            int _id;
            int _id2;
            string _name;
            string _apellido;
            DateTime _date;
            bool _active;
        #endregion inicializacion

        #region encapzulacion
            public int Id
            {
                get { return _id; }
                set { _id = value; }
            }

            public int Id2
            {
                get { return _id2; }
                set { _id2 = value; }
            }

            public string Name
            {
                get { return _name; }
                set { _name = value; }
            }

           public string Apellido
            {
                get { return _apellido; }
                set { _apellido = value; }
            }
            public DateTime Date
            {
                get { return _date; }
                set { _date = value; }
            }

            public bool Active
            {
                get { return _active; }
                set { _active = value; }
            }
        #endregion encapzulacion

        #region constructor

            public MyEntity()
            {
                _id = 0;
                _id2 = 0;
                _name = string.Empty;
                _date = DateTime.Now;
                _active = false;
            }

        #endregion constructor

    }
}
