using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    public class DataAlumno : ConnectionDB
    {
        public DataAlumno() : base() { }

        public int Alumno(EntityAlumno eT, string op)
        {
            
            int resultado = -1;

            SqlCommand cmdItems = new SqlCommand();

            if (connection.State == ConnectionState.Broken || connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            #region try
            try {

                cmdItems.Connection = connection;
                cmdItems.CommandType = CommandType.StoredProcedure;//store procedure permite hacer uso del sqlparameters
                cmdItems.CommandText = "[gezi].[spAlumnos]";

                SqlParameter paramItems = new SqlParameter("@option", SqlDbType.VarChar, 50);
                paramItems.Value = op;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@id", SqlDbType.Int);
                paramItems.Value = eT.Id;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@matricula", SqlDbType.VarChar, 50);
                paramItems.Value = eT.Matricula;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@nombre", SqlDbType.VarChar, 50);
                paramItems.Value = eT.Nombre;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@apellido", SqlDbType.VarChar, 50);
                paramItems.Value = eT.Apellido;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@edad", SqlDbType.Int);
                paramItems.Value = eT.Edad;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@activo", SqlDbType.Bit);
                paramItems.Value = eT.Activo;
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

                resultado = cmdItems.ExecuteNonQuery();

            }
            #endregion

            catch(Exception e) {

                throw new Exception(e.Message);
            }

            finally {

                connection.Close();
                cmdItems.Dispose();
            }

            return resultado;
        }

        public DataSet AlumnoDS(EntityAlumno eT, string op)
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
                cmdItems.CommandType = CommandType.StoredProcedure;
                cmdItems.CommandText = "[gezi].[spAlumnos]";//nombre de la [base de datos].[tabla]

                SqlParameter paramItems = new SqlParameter("@option", SqlDbType.VarChar, 50);
                paramItems.Value = op;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@id", SqlDbType.Int);
                paramItems.Value = eT.Id;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@matricula", SqlDbType.VarChar, 50);
                paramItems.Value = eT.Matricula;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@nombre", SqlDbType.VarChar, 50);
                paramItems.Value = eT.Nombre;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@apellido", SqlDbType.VarChar, 50);
                paramItems.Value = eT.Apellido;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@edad", SqlDbType.Int);
                paramItems.Value = eT.Edad;
                cmdItems.Parameters.Add(paramItems);

                paramItems = new SqlParameter("@activo", SqlDbType.Bit);
                paramItems.Value = eT.Activo;
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
