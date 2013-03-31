using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

namespace Datos
{
    public class ConnectionDB
    {
    public SqlConnection connection;

        /// <summary>
        /// csGezi representa la coneccion que se configuro dentro de Connection String
        /// </summary>
        public ConnectionDB()
        {
            connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["csGEZI"].ConnectionString;

            
        }
    }
}
