using System;
using System.Collections.Generic;
using Datos;
using Entidades;

namespace Negocios
{
    public class Usuarios_Negocio
    {
        public Usuarios_Dato objUsuario = null;

        public Usuarios_Negocio()
        {
            objUsuario = new Usuarios_Dato();
        }

        public List<Usuario_Entidad> AMUsuarios(Usuario_Entidad ue, string opcion)
        {
            return objUsuario.AMUsuarios(ue, opcion);
        }

        public List<Usuario_Entidad> RemueveUsuario(int Usuario_id)
        {
            return objUsuario.RemueveUsuario(Usuario_id);
        }

        public List<Usuario_Entidad> RegresaUsuarios(string correo, int activacion, string sOpcion)
        {
            return objUsuario.RegresaUsuarios(correo, activacion, sOpcion);
        }

        public Usuario_Entidad RegresaNoActivacion(int Usuario_ID, int NoActivacion)
        {
            return objUsuario.RegresaNoActivacion(Usuario_ID, NoActivacion);
        }

        public static int NoActivacion()
        {
            Random objeto = new Random();
            //int numero = objeto.Next(1, 7);

            return objeto.Next(1000, 9999);
        }
    }
}