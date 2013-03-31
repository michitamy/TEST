using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entidades;

namespace Datos
{
    public class DataCatalogo : ConnectionDB
    {
        public DataCatalogo():base() 
        {
        }

        /// <summary>
        /// Detalle idw
        /// </summary>
        /// <param name="Objeto">variable idw</param>
        /// <returns>regreso entero</returns>
        public int nuevoNivel(EntityNivel Objeto) // metodo
        {
            int Resultado = -1;
            SqlCommand comandoNivel = new SqlCommand();
            if (connection.State == ConnectionState.Broken || connection.State == ConnectionState.Closed)
            {
                connection.Open(); 
            }
            comandoNivel.Connection = connection;
            comandoNivel.CommandType = CommandType.StoredProcedure;
            comandoNivel.CommandText = "gezi.ProcedimientoMich";
            SqlParameter parametros = new SqlParameter("@Nivel_id", SqlDbType.Int);
            parametros.Value=Objeto.Nivel_id;
            comandoNivel.Parameters.Add(parametros);
            parametros = new SqlParameter("@Nombre", SqlDbType.VarChar);
            parametros.Value = Objeto.Nombre;
            comandoNivel.Parameters.Add(parametros);
            parametros = new SqlParameter("@Porcarrera", SqlDbType.Bit);
            parametros.Value = Objeto.Porcarrera;
            comandoNivel.Parameters.Add(parametros);
            parametros = new SqlParameter("@Creadopor", SqlDbType.VarChar);
            parametros.Value = Objeto.Creadopor;
            comandoNivel.Parameters.Add(parametros);
            parametros = new SqlParameter("@Creadoen", SqlDbType.SmallDateTime);
            parametros.Value = Objeto.Creadoen;
            comandoNivel.Parameters.Add(parametros);
            parametros = new SqlParameter("@Creadodesde", SqlDbType.VarChar);
            parametros.Value = Objeto.Creadodesde;
            comandoNivel.Parameters.Add(parametros);
            parametros = new SqlParameter("@Modifpor", SqlDbType.VarChar);
            parametros.Value = Objeto.Modifpor;
            comandoNivel.Parameters.Add(parametros);
            parametros = new SqlParameter("@Modifen", SqlDbType.SmallDateTime);
            parametros.Value = Objeto.Modifen;
            comandoNivel.Parameters.Add(parametros);
            parametros = new SqlParameter("@Modifdesde", SqlDbType.VarChar);
            parametros.Value = Objeto.Modfdesde;
            comandoNivel.Parameters.Add(parametros);

            try
            {
                Resultado = comandoNivel.ExecuteNonQuery();
            }
            catch (Exception Error)
            {
                throw new Exception(Error.Message);
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
                return Resultado;
        }
    }
}
