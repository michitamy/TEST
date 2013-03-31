using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;

namespace Datos
{
    public class DataMyEntity : ConnectionDB
    {
        public DataMyEntity() : base() { }

        /// <summary>
        /// Metodo para hacer x operacion
        /// </summary>
        /// <param name="eT">mi entidad</param>
        /// <param name="op"> opcion para el metodo</param>
        /// <returns>la edad</returns>
        public int myMethodToInt(MyEntity eT, string op)//especificas lo que recibe el metodo
        {
            int resultado = -1;

            switch (op)
            { 
                case "sum":
                    resultado = eT.Id + eT.Id2;
                    break;

                case "res":
                    resultado = eT.Id - eT.Id2;
                    break;
            
            }

            return resultado;
        }

        public string myMethodToString(MyEntity eT, string op)//especificas lo que recibe el metodo
        {
            string resultado = string.Empty;

            switch (op)
            {
                case "normal":
                    resultado = eT.Name +" " +eT.Apellido;
                    break;

                case "reversa":
                    resultado = eT.Apellido +" " +eT.Name;
                    break;

            }

            return resultado;
        }
    }
}
