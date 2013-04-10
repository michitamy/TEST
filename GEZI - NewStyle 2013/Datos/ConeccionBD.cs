using System.Configuration;
using System.Data.SqlClient;

namespace Datos
{
    public class ConeccionBD
    {
        public SqlConnection coneccion;

        public ConeccionBD()
        {
            coneccion = new SqlConnection();
            coneccion.ConnectionString = ConfigurationManager.ConnectionStrings["csGEZI"].ConnectionString;
        }
    }
}