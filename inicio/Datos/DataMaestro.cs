using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    public class DataMaestro : ConnectionDB
    {
        public DataMaestro() : base() { }
        
        /// <summary>
        /// metodo que regresa un entero positivo al realiza la coneccion
        /// </summary>
        /// <param name="eT">entidad tipo EntityMaestro</param>
        /// <param name="op">opcion tipo string</param>
        /// <returns></returns>
        public int Maestro(EntityMaestro eT, string op)
        {

            int resultado = -1;

            SqlCommand cmdItems = new SqlCommand();

            if (connection.State == ConnectionState.Broken || connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }

            try
            {
                cmdItems.Connection = connection;
                cmdItems.CommandType = CommandType.StoredProcedure;//store procedure permite hacer uso del sqlparameters
                cmdItems.CommandText = "[gezi].[spMaestro]";
                SqlParameter paramItems = new SqlParameter("@option", SqlDbType.VarChar, 50);
                paramItems.Value = op;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@id", SqlDbType.Int);
                paramItems.Value = eT.Id;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@noEmpleado", SqlDbType.VarChar, 50);
                paramItems.Value = eT.NoEmpleado;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@nombre", SqlDbType.VarChar, 50);
                paramItems.Value = eT.Nombre;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@apellidoP", SqlDbType.VarChar, 50);
                paramItems.Value = eT.ApellidoP;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@apellidoM", SqlDbType.VarChar, 50);
                paramItems.Value = eT.ApellidoM;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@carrera", SqlDbType.VarChar, 50);
                paramItems.Value = eT.Carrera;
                cmdItems.Parameters.Add(paramItems);
               
                paramItems = new SqlParameter("@modifyBy", SqlDbType.VarChar, 50);
                paramItems.Value = eT.ModifyBy;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@modifyHost", SqlDbType.VarChar, 50);
                paramItems.Value = eT.ModifyHost;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@modifyDate", SqlDbType.DateTime);
                paramItems.Value = eT.ModifyDate;
                cmdItems.Parameters.Add(paramItems);

                resultado = cmdItems.ExecuteNonQuery();//ejeuta
            }
            catch(Exception e) 
            {
                throw new Exception(e.Message);
            }

            finally 
            {
                connection.Close();
                cmdItems.Dispose();
            }
            return resultado;
        }

        public void holaMich() {
            Console.Write("ola k ase");
        }

        /// <summary>
        /// metodo que despliega datos del maestro
        /// </summary>
        /// <param name="eT">objeto tipo EntityMaestro</param>
        /// <param name="op">opcion tipo string</param>
        /// <returns></returns>
        public DataSet MaestroDS(EntityMaestro eT, string op)
        {
            DataSet dsItems = new DataSet();
            SqlDataAdapter sqItems = new SqlDataAdapter();

            SqlCommand cmdItems = new SqlCommand();

            if (connection.State == ConnectionState.Broken || connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }

            try
            {
                cmdItems.Connection = connection;
                cmdItems.CommandType = CommandType.StoredProcedure;//store procedure permite hacer uso del sqlparameters
                cmdItems.CommandText = "[gezi].[spMaestro]";
                SqlParameter paramItems = new SqlParameter("@option", SqlDbType.VarChar, 50);
                paramItems.Value = op;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@id", SqlDbType.Int);
                paramItems.Value = eT.Id;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@noEmpleado", SqlDbType.VarChar, 50);
                paramItems.Value = eT.NoEmpleado;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@nombre", SqlDbType.VarChar, 50);
                paramItems.Value = eT.Nombre;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@apellidoP", SqlDbType.VarChar, 50);
                paramItems.Value = eT.ApellidoP;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@apellidoM", SqlDbType.VarChar, 50);
                paramItems.Value = eT.ApellidoM;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@carrera", SqlDbType.VarChar, 50);
                paramItems.Value = eT.Carrera;
                cmdItems.Parameters.Add(paramItems);
               
                paramItems = new SqlParameter("@modifyBy", SqlDbType.VarChar, 50);
                paramItems.Value = eT.ModifyBy;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@modifyHost", SqlDbType.VarChar, 50);
                paramItems.Value = eT.ModifyHost;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@modifyDate", SqlDbType.DateTime);
                paramItems.Value = eT.ModifyDate;
                cmdItems.Parameters.Add(paramItems);

                sqItems.SelectCommand = cmdItems;
                sqItems.Fill(dsItems);
            }
            catch (Exception e)
            {

                throw new Exception(e.Message);
            }
            finally
            {

                connection.Close();
                cmdItems.Dispose();
            }

            return dsItems;
        }
    }
}
