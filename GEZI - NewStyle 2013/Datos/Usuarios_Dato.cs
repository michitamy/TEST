using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class Usuarios_Dato : ConeccionBD
    {
        public Usuarios_Dato() : base() { }

        public List<Usuario_Entidad> AMUsuarios(Usuario_Entidad ue, string sOpcion)
        {
            List<Usuario_Entidad> lista = new List<Usuario_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spUsuarios]";

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@apellido", SqlDbType.VarChar, 100);
            paramItems.Value = ue.Apellido;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@usuario_Id", SqlDbType.Int);
            paramItems.Value = ue.Usuario_Id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@hash", SqlDbType.VarChar, 128);
            paramItems.Value = ue.ContraseniaHash;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@salt", SqlDbType.VarChar, 128);
            paramItems.Value = ue.ContraseniaSalt;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@correo", SqlDbType.VarChar, 100);
            paramItems.Value = ue.Correo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@nombre", SqlDbType.VarChar, 75);
            paramItems.Value = ue.Nombre;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@activacion", SqlDbType.Int);
            paramItems.Value = ue.Activacion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@nombreUsuario", SqlDbType.VarChar, 15);
            paramItems.Value = ue.NombreUsuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@usuario", SqlDbType.VarChar, 50);
            paramItems.Value = ue.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@equipo", SqlDbType.VarChar, 50);
            paramItems.Value = ue.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@fecha", SqlDbType.DateTime);
            paramItems.Value = ue.Fecha;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Usuario_Entidad u = new Usuario_Entidad();
                        u.Usuario_Id = (int)reader["Usuario_Id"];
                        u.Apellido = (string)reader["Apellido"];
                        u.Correo = (string)reader["Correo"];
                        u.Nombre = (string)reader["Nombre"];
                        u.NombreUsuario = (string)reader["Usuario"];
                        u.ContraseniaHash = (string)reader["ContraseniaHash"];
                        u.ContraseniaSalt = (string)reader["ContraseniaSalt"];

                        lista.Add(u);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                coneccion.Close();
                cmdItems.Dispose();
            }
            return lista;
        }

        public List<Usuario_Entidad> RemueveUsuario(int usuario_id)
        {
            List<Usuario_Entidad> lista = new List<Usuario_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spRemueveUsuario]";

            SqlParameter paramItems = new SqlParameter("@usuario_Id", SqlDbType.Int);
            paramItems.Value = usuario_id;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Usuario_Entidad u = new Usuario_Entidad();
                        u.Usuario_Id = (int)reader["Usuario_Id"];
                        u.Apellido = (string)reader["Apellido"];
                        u.Correo = (string)reader["Correo"];
                        u.Nombre = (string)reader["Nombre"];
                        u.NombreUsuario = (string)reader["Usuario"];
                        u.ContraseniaHash = (string)reader["ContraseniaHash"];
                        u.ContraseniaSalt = (string)reader["ContraseniaSalt"];

                        lista.Add(u);
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                coneccion.Close();
                cmdItems.Dispose();
            }
            return lista;
        }

        public List<Usuario_Entidad> RegresaUsuarios(string correo, int activacion, string sOpcion)
        {
            List<Usuario_Entidad> lista = new List<Usuario_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@correo", SqlDbType.VarChar, 100);
            paramItems.Value = correo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@activacion", SqlDbType.Int);
            paramItems.Value = activacion;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaUsuarios]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Usuario_Entidad u = new Usuario_Entidad();
                        u.Usuario_Id = (int)reader["Usuario_Id"];
                        u.Apellido = (string)reader["Apellido"];
                        u.Correo = (string)reader["Correo"];
                        u.Nombre = (string)reader["Nombre"];
                        u.Activacion = (int)reader["Activacion"];
                        u.NombreUsuario = (string)reader["Usuario"];
                        u.ContraseniaHash = (string)reader["ContraseniaHash"];
                        u.ContraseniaSalt = (string)reader["ContraseniaSalt"];

                        lista.Add(u);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return lista;
        }

        public Usuario_Entidad VerificaUsuario(string username)
        {
            SqlCommand cmdItems = new SqlCommand();
            Usuario_Entidad ue = null;

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.Text;
            cmdItems.CommandText = string.Format("SELECT * FROM gezi.[ufn_VerificaUsuario]('{0}')", username);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ue = new Usuario_Entidad();

                        ue.Usuario_Id = (int)reader["Usuario_Id"];
                        ue.Nombre = (string)reader["Nombre"];
                        ue.Apellido = (string)reader["Apellido"];
                        ue.Correo = (string)reader["Correo"];
                        ue.Usuario = (string)reader["Usuario"];
                        ue.ContraseniaHash = (string)reader["ContraseniaHash"];
                        ue.ContraseniaSalt = (string)reader["ContraseniaSalt"];
                        ue.IsAdmin = (bool)reader["IsAdmin"];
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                coneccion.Close();
                cmdItems.Dispose();
            }
            return ue;
        }

        public Usuario_Entidad RegresaNoActivacion(int Usuario_ID, int NoActivacion)
        {
            SqlCommand cmdItems = new SqlCommand();
            Usuario_Entidad ue = null;

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.Text;
            cmdItems.CommandText = string.Format("SELECT * FROM gezi.[ufn_RegresaNoActivacion]({0}, {1})", Usuario_ID, NoActivacion);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ue = new Usuario_Entidad();

                        ue.Usuario_Id = (int)reader["Usuario_Id"];
                        ue.Usuario = (string)reader["Usuario"];
                        ue.Activacion = (int)reader["Activacion"];
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                coneccion.Close();
                cmdItems.Dispose();
            }
            return ue;
        }
    }
}