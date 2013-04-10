using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class Escuelas_Dato : ConeccionBD
    {
        public Escuelas_Dato() : base() { }

        /// <summary>
        /// Método para agregar o modificar una institución, se manda a llamar al
        /// procedimiento [GEZI].[spInstitucion].
        /// </summary>
        /// <param name="ie">Objeto tipo Institucion_Entidad con los registros de la institución.</param>
        /// <param name="sOpcion">Indica si va ha ser una inserción o una modificación de registros.</param>
        /// <returns>Se obtiene el numero de identificación del instituto.</returns>
        public int AMInstitucion(Institucion_Entidad ie, string sOpcion)
        {
            int institucion_id = -1;
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spInstitucion]";

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@regresa_inst", SqlDbType.Int);
            paramItems.Direction = ParameterDirection.Output;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@institucion_id", SqlDbType.Int);
            paramItems.Value = ie.Institucion_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@institucion", SqlDbType.VarChar, 200);
            paramItems.Value = ie.Institucion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@nivel_id", SqlDbType.Int);
            paramItems.Value = ie.Nivel.Nivel_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@tipo_id", SqlDbType.Int);
            paramItems.Value = ie.Tipo.Tipo_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@clave", SqlDbType.VarChar, 30);
            paramItems.Value = ie.Clave;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@telefono", SqlDbType.VarChar, 30);
            paramItems.Value = ie.Telefono;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@web", SqlDbType.VarChar, 200);
            paramItems.Value = ie.Web;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@area", SqlDbType.VarChar, 200);
            paramItems.Value = ie.Area;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@imagen", SqlDbType.VarChar, 100);
            paramItems.Value = ie.Imagen;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadopor", SqlDbType.VarChar, 50);
            paramItems.Value = ie.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadodesde", SqlDbType.VarChar, 50);
            paramItems.Value = ie.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadoen", SqlDbType.DateTime);
            paramItems.Value = ie.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifpor", SqlDbType.VarChar, 50);
            paramItems.Value = ie.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifdesde", SqlDbType.VarChar, 50);
            paramItems.Value = ie.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifen", SqlDbType.DateTime);
            paramItems.Value = ie.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                cmdItems.ExecuteNonQuery();

                institucion_id = (int)cmdItems.Parameters["@regresa_inst"].Value;
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
            return institucion_id;
        }

        /// <summary>
        /// Método para agregar o modificar un plantel, se manda a llamar al
        /// procedimiento [GEZI].[spPlantel].
        /// </summary>
        /// <param name="pe">Objeto tipo Plantel_Entidad con los registros del plantel.</param>
        /// <param name="sOpcion">Indica si va ha ser una inserción o una modificación de registros.</param>
        /// <returns>Se obtiene el numero de identificación del plantel.</returns>
        public int AMPlantel(Plantel_Entidad pe, string sOpcion)
        {
            int plantel_id = -1;
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spPlantel]";

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@regresa_plantel", SqlDbType.Int);
            paramItems.Direction = ParameterDirection.Output;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = pe.Plantel_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@plantel", SqlDbType.VarChar, 200);
            paramItems.Value = pe.Plantel;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@direccion", SqlDbType.VarChar, 300);
            paramItems.Value = pe.Direccion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@ciudad_Id", SqlDbType.Int);
            paramItems.Value = pe.Ciudad_Id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@cp", SqlDbType.Int);
            paramItems.Value = pe.CP;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@institucion_id", SqlDbType.Int);
            paramItems.Value = pe.Institucion.Institucion_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@contacto", SqlDbType.VarChar, 200);
            paramItems.Value = pe.Contacto;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@telefono", SqlDbType.VarChar, 30);
            paramItems.Value = pe.Telefono;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@correo", SqlDbType.VarChar, 75);
            paramItems.Value = pe.Correo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadopor", SqlDbType.VarChar, 50);
            paramItems.Value = pe.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadodesde", SqlDbType.VarChar, 50);
            paramItems.Value = pe.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadoen", SqlDbType.DateTime);
            paramItems.Value = pe.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifpor", SqlDbType.VarChar, 50);
            paramItems.Value = pe.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifdesde", SqlDbType.VarChar, 50);
            paramItems.Value = pe.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifen", SqlDbType.DateTime);
            paramItems.Value = pe.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                cmdItems.ExecuteNonQuery();

                plantel_id = (int)cmdItems.Parameters["@regresa_plantel"].Value;
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
            return plantel_id;
        }

        /// <summary>
        /// Metodo para remover una institucion, mientras no tenga asignado un plantel, manda a llamar
        /// al procedimiento [GEZI].[spRemueveInstitucion]
        /// </summary>
        /// <param name="iIID">ID de la institucion que se desea remover</param>
        /// <returns>Indicar si se removio correctamente la institucion</returns>
        public int RemueveInstitucion(int iIID)
        {
            int resultado = -1;
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spRemueveInstitucion]";

            SqlParameter paramItems = new SqlParameter("@institucion_id", SqlDbType.Int);
            paramItems.Value = iIID;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                resultado = cmdItems.ExecuteNonQuery();
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
            return resultado;
        }

        /// <summary>
        /// Metodo para remover un plantel, miestras no tenga asignado un cuestionario, manda a llamar
        /// al procedimiento [GEZI].[spRemuevePlantel]
        /// </summary>
        /// <param name="iPID">ID del plantel que se desea remover</param>
        /// <returns>Indicar si se removio correctamente el plantel</returns>
        public int RemuevePlantel(int iPID)
        {
            int resultado = -1;
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spRemuevePlantel]";

            SqlParameter paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = iPID;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                resultado = cmdItems.ExecuteNonQuery();
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
            return resultado;
        }

        /// <summary>
        /// Método para agregar o modificar un cuestionario a un plantel, se manda a llamar el
        /// procedimiento [GEZI].[spCaracteristica]
        /// </summary>
        /// <param name="ce">Objeto tipo Caracteristicas_Entidad con los registros del cuestionario.</param>
        /// <param name="sOpcion">Indica si va ha ser una inserción o una modificación de registros.</param>
        /// <returns>Se obtiene el numero de identificación del cuestionario.</returns>
        public int AMCaracteristica(Caracteristicas_Entidad ce, string sOpcion)
        {
            int cuestionario_id = -1;
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spCaracteristica]";

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@regresa_caract", SqlDbType.Int);
            paramItems.Direction = ParameterDirection.Output;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@caract_id", SqlDbType.Int);
            paramItems.Value = ce.Caract_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = ce.Plantel.Plantel_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@exadiag", SqlDbType.Bit);
            paramItems.Value = ce.Exadiag;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@prepingr", SqlDbType.Bit);
            paramItems.Value = ce.Prepingr;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@servpsco", SqlDbType.Bit);
            paramItems.Value = ce.Servpsco;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@activextracurles", SqlDbType.Bit);
            paramItems.Value = ce.Activextracurles;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@servevaegre", SqlDbType.Bit);
            paramItems.Value = ce.Servevaegre;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@progInterncion", SqlDbType.Bit);
            paramItems.Value = ce.ProgInterncion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@conscalif", SqlDbType.Bit);
            paramItems.Value = ce.Conscalif;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@sistadminclases", SqlDbType.Bit);
            paramItems.Value = ce.Sistadminclases;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@tutorias", SqlDbType.Bit);
            paramItems.Value = ce.Tutorias;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@cursosremed", SqlDbType.Bit);
            paramItems.Value = ce.Cursosremed;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@intercacadem", SqlDbType.Bit);
            paramItems.Value = ce.Intercacadem;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@servcomunidad", SqlDbType.Bit);
            paramItems.Value = ce.Servcomunidad;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@aireacond", SqlDbType.Bit);
            paramItems.Value = ce.Aireacond;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@salonesmultim", SqlDbType.Bit);
            paramItems.Value = ce.Salonesmultim;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@biblioteca", SqlDbType.Bit);
            paramItems.Value = ce.Biblioteca;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@bibcompeint", SqlDbType.Bit);
            paramItems.Value = ce.Bibcompeint;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@biblvirtual", SqlDbType.Bit);
            paramItems.Value = ce.Biblvirtual;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@educacontinua", SqlDbType.Bit);
            paramItems.Value = ce.Educacontinua;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@formpedagca", SqlDbType.Bit);
            paramItems.Value = ce.Formpedagca;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@actdisc", SqlDbType.Bit);
            paramItems.Value = ce.Actdisc;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@labidiomas", SqlDbType.Int);
            paramItems.Value = ce.Labidiomas;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@labComputo", SqlDbType.Int);
            paramItems.Value = ce.LabComputo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@noAlumnos", SqlDbType.Int);
            paramItems.Value = ce.NoAlumnos;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@formaEval", SqlDbType.VarChar, 500);
            paramItems.Value = ce.FormaEval;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@calfmin", SqlDbType.VarChar, 25);
            paramItems.Value = ce.Calfmin;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@acrditaasig", SqlDbType.Int);
            paramItems.Value = ce.Acrditaasig;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@razonbaja", SqlDbType.VarChar, 500);
            paramItems.Value = ce.Razonbaja;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@activextracrs", SqlDbType.VarChar, 500);
            paramItems.Value = ce.Activextracrs;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@resulpenlace", SqlDbType.Decimal);
            paramItems.Value = ce.Resulpenlace;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@eficterm", SqlDbType.Decimal);
            paramItems.Value = ce.Eficterm;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@revcurriculo", SqlDbType.Int);
            paramItems.Value = ce.Revcurriculo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@doctsmatria", SqlDbType.Decimal);
            paramItems.Value = ce.Doctsmatria;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@doctsdocdo", SqlDbType.Decimal);
            paramItems.Value = ce.Doctsdocdo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@evaluadoct", SqlDbType.Bit);
            paramItems.Value = ce.Evaluadoct;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@formaEvaluadoct", SqlDbType.VarChar, 500);
            paramItems.Value = ce.FormaEvaluadoct;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@catdocts", SqlDbType.VarChar, 500);
            paramItems.Value = ce.Catdocts;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@invesSNI", SqlDbType.Decimal);
            paramItems.Value = ce.InvesSNI;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@doctslibrs", SqlDbType.Decimal);
            paramItems.Value = ce.Doctslibrs;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@asocsinst", SqlDbType.VarChar, 500);
            paramItems.Value = ce.Asocsinst;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@costoinsc", SqlDbType.Decimal);
            paramItems.Value = ce.Costoinsc;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@costocolra", SqlDbType.Decimal);
            paramItems.Value = ce.Costocolra;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadopor", SqlDbType.VarChar, 50);
            paramItems.Value = ce.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadodesde", SqlDbType.VarChar, 50);
            paramItems.Value = ce.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadoen", SqlDbType.DateTime);
            paramItems.Value = ce.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifpor", SqlDbType.VarChar, 50);
            paramItems.Value = ce.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifdesde", SqlDbType.VarChar, 50);
            paramItems.Value = ce.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifen", SqlDbType.DateTime);
            paramItems.Value = ce.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                cmdItems.ExecuteNonQuery();

                cuestionario_id = (int)cmdItems.Parameters["@regresa_caract"].Value;
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
            return cuestionario_id;
        }

        /// <summary>
        /// Metodo para remover la caracteristica del plantel
        /// </summary>
        /// <param name="iCaractID">ID de la caracteristica(cuestionario) que se desea remover</param>
        /// <param name="iPlantelID">ID del plantel que se hace referencia a la caracteristica(cuestionarion).</param>
        /// <returns>Indicar si se removio correctamente la caracterisitica(cuestionarion).</returns>
        public int RemueveCaracteristica(int iCaractID, int iPlantelID)
        {
            int resultado = -1;
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spRemueveCaracteristica]";

            SqlParameter paramItems = new SqlParameter("@caract_id", SqlDbType.Int);
            paramItems.Value = iCaractID;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = iPlantelID;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                resultado = cmdItems.ExecuteNonQuery();
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
            return resultado;
        }

        /// <summary>
        /// Método para agregar o modificar una encuesta o preguntas, se manda a llamar al
        /// procedimiento [GEZI].[spEncuesta]
        /// </summary>
        /// <param name="ee">Objeto tipo Encuesta_Entidad con los datos de la pregunta.</param>
        /// <param name="sOpcion">Indica si va a ser una inserción o una modificación de registros.</param>
        /// <returns>Se obtiene las preguntas que tiene la encuesta por el número de guía(GUID).</returns>
        public List<Encuesta_Entidad> AMEncuesta(Encuesta_Entidad ee, string sOpcion)
        {
            List<Encuesta_Entidad> lista = new List<Encuesta_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spEncuesta]";

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@encuesta_id", SqlDbType.Int);
            paramItems.Value = ee.Encuesta_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@nombre", SqlDbType.VarChar, 250);
            paramItems.Value = ee.Nombre;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@guid", SqlDbType.UniqueIdentifier);
            paramItems.Value = ee.GUID;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@nivel_id", SqlDbType.Int);
            paramItems.Value = ee.Nivel.Nivel_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@pregunta_no", SqlDbType.Int);
            paramItems.Value = ee.PreguntaNo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@pregunta", SqlDbType.VarChar, 250);
            paramItems.Value = ee.Pregunta;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@respuesta1", SqlDbType.VarChar, 250);
            paramItems.Value = ee.Respuesta1;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@respuesta2", SqlDbType.VarChar, 250);
            paramItems.Value = ee.Respuesta2;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@respuesta3", SqlDbType.VarChar, 250);
            paramItems.Value = ee.Respuesta3;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@Respuesta4", SqlDbType.VarChar, 250);
            paramItems.Value = ee.Respuesta4;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@respuesta5", SqlDbType.VarChar, 250);
            paramItems.Value = ee.Respuesta5;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadopor", SqlDbType.VarChar, 50);
            paramItems.Value = ee.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadodesde", SqlDbType.VarChar, 50);
            paramItems.Value = ee.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadoen", SqlDbType.DateTime);
            paramItems.Value = ee.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifpor", SqlDbType.VarChar, 50);
            paramItems.Value = ee.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifdesde", SqlDbType.VarChar, 50);
            paramItems.Value = ee.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifen", SqlDbType.DateTime);
            paramItems.Value = ee.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Encuesta_Entidad e = new Encuesta_Entidad();
                        e.Encuesta_id = (int)reader["Encuesta_id"];
                        e.GUID = (System.Guid)reader["GUID"];
                        e.Nombre = (string)reader["Nombre"];
                        e.PreguntaNo = (int)reader["Pregunta_no"];
                        e.Nivel.Nivel_id = (int)reader["Nivel_id"];
                        e.Pregunta = (string)reader["Pregunta"];
                        e.Respuesta1 = (string)reader["Respuesta1"];
                        e.Respuesta2 = (string)reader["Respuesta2"];
                        e.Respuesta3 = (string)reader["Respuesta3"];
                        e.Respuesta4 = (string)reader["Respuesta4"];
                        e.Respuesta5 = (string)reader["Respuesta5"];

                        lista.Add(e);
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

        /// <summary>
        /// Método para remover una encuesta o una pregunta.
        /// </summary>
        /// <param name="sGuidEncuesta">Numero de guía de la encuesta que se desea remover.</param>
        /// <param name="iPregunta">ID de la pregunta que se desea remover.</param>
        /// <returns>Indicar si se removió correctamente la encuesta o la pregunta.</returns>
        public List<Encuesta_Entidad> RemueveEncuesta(string sGuidEncuesta, int iPregunta, string sOpcion)
        {
            List<Encuesta_Entidad> lista = new List<Encuesta_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spRemueveEncuesta]";

            SqlParameter paramItems = new SqlParameter("@encuesta_id", SqlDbType.Int);
            paramItems.Value = iPregunta;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@guid", SqlDbType.UniqueIdentifier);
            paramItems.Value = System.Guid.Parse(sGuidEncuesta);
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Encuesta_Entidad e = new Encuesta_Entidad();
                        e.Encuesta_id = (int)reader["Encuesta_id"];
                        e.GUID = (System.Guid)reader["GUID"];
                        e.Nombre = (string)reader["Nombre"];
                        e.PreguntaNo = (int)reader["Pregunta_no"];
                        e.Pregunta = (string)reader["Pregunta"];
                        e.Respuesta1 = (string)reader["Respuesta1"];
                        e.Respuesta2 = (string)reader["Respuesta2"];
                        e.Respuesta3 = (string)reader["Respuesta3"];
                        e.Respuesta4 = (string)reader["Respuesta4"];
                        e.Respuesta5 = (string)reader["Respuesta5"];

                        lista.Add(e);
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

        /// <summary>
        /// Método para agregar o modificar las respuestas de una pregunta, se manda a llamar al
        /// método AMResultadoEncuesta en la clase Escuelas_Datos.
        /// </summary>
        /// <param name="ree">Objeto tipo RE_Entidad con los datos del resultado de "x" pregunta.</param>
        /// <returns>Regresa si fue correcto la inserción o actualización de las respuestas
        /// de x la encuesta.</returns>
        public int AMResultadoEncuesta(RE_Entidad ree)
        {
            int resultado = -1;
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spResultadoEncuesta]";

            SqlParameter paramItems = new SqlParameter("@tRespuesta1", SqlDbType.Int);
            paramItems.Value = ree.TRespuesta1;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@tRespuesta2", SqlDbType.Int);
            paramItems.Value = ree.TRespuesta2;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@tRespuesta3", SqlDbType.Int);
            paramItems.Value = ree.TRespuesta3;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@tRespuesta4", SqlDbType.Int);
            paramItems.Value = ree.TRespuesta4;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@tRespuesta5", SqlDbType.Int);
            paramItems.Value = ree.TRespuesta5;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@Plantel_id", SqlDbType.Int);
            paramItems.Value = ree.Plantel.Plantel_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@Encuesta_id", SqlDbType.Int);
            paramItems.Value = ree.Encuesta_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadopor", SqlDbType.VarChar, 50);
            paramItems.Value = ree.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadodesde", SqlDbType.VarChar, 50);
            paramItems.Value = ree.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@creadoen", SqlDbType.DateTime);
            paramItems.Value = ree.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifpor", SqlDbType.VarChar, 50);
            paramItems.Value = ree.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifdesde", SqlDbType.VarChar, 50);
            paramItems.Value = ree.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@modifen", SqlDbType.DateTime);
            paramItems.Value = ree.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                resultado = cmdItems.ExecuteNonQuery();

                //resultado = (int)cmdItems.Parameters["@regresa_caract"].Value;
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
            return resultado;
        }

        /// <summary>
        /// Metodo para remover los resultados de una encuesta.
        /// </summary>
        /// <param name="iPlantelID">ID del plantel que se desea remover sus resultados.</param>
        /// <returns>Indicar si se removio correctamente los resutaldos.</returns>
        public int RemueveResultados(int iPlantelID)
        {
            int resultado = -1;
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spRemueveResultados]";

            SqlParameter paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = iPlantelID;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                resultado = cmdItems.ExecuteNonQuery();
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
            return resultado;
        }

        /// <summary>
        /// Método para agregar o modificar una carrera, se manda a llamar al
        /// procedimiento [GEZI].[spCarrera].
        /// </summary>
        /// <param name="ce">Objeto tipo Carreras_Entidad con los datos de la carrera.</param>
        /// <param name="sOpcion">Indica si va a ser una inserción o una modificación de registros.</param>
        /// <returns>Se obtiene una lista con todos las carreras pertenecientes a un mismo plantel.</returns>
        public List<Carreras_Entidad> AMCarrera(Carreras_Entidad ce, string sOpcion)
        {
            List<Carreras_Entidad> lista = new List<Carreras_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spCarrera]";

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@carrera_ID", SqlDbType.Int);
            paramItems.Value = ce.Carrera_ID;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = ce.Plantel.Plantel_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@tipoestudios", SqlDbType.VarChar, 200);
            paramItems.Value = ce.Tipoestudios;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@nivel_id", SqlDbType.Int);
            paramItems.Value = ce.Nivel.Nivel_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@noRVOE", SqlDbType.VarChar, 50);
            paramItems.Value = ce.NoRVOE;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@tipoRVOE_id", SqlDbType.Int);
            paramItems.Value = ce.TipoRVOE.TipoRVOE_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@duracion", SqlDbType.Decimal);
            paramItems.Value = ce.Duracion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@licacredit", SqlDbType.Bit);
            paramItems.Value = ce.Licacredit;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@queacredit", SqlDbType.VarChar, 500);
            paramItems.Value = ce.Queacredit;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@costoinsc", SqlDbType.Decimal);
            paramItems.Value = ce.Costoinsc;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@costocolra", SqlDbType.Decimal);
            paramItems.Value = ce.Costocolra;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@opctitcion", SqlDbType.VarChar, 500);
            paramItems.Value = ce.Opctitcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@inglesreq", SqlDbType.Bit);
            paramItems.Value = ce.Inglesreq;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@cursosingles", SqlDbType.Int);
            paramItems.Value = ce.Cursosingles;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@cursoscompu", SqlDbType.Int);
            paramItems.Value = ce.Cursoscompu;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@labs", SqlDbType.Bit);
            paramItems.Value = ce.Labs;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@postgrados", SqlDbType.Bit);
            paramItems.Value = ce.Postgrados;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@proydinv", SqlDbType.VarChar, 500);
            paramItems.Value = ce.Proydinv;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@egresados", SqlDbType.Decimal);
            paramItems.Value = ce.Egresados;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@noAlumnos", SqlDbType.Int);
            paramItems.Value = ce.NoAlumnos;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@usuario", SqlDbType.VarChar, 50);
            paramItems.Value = ce.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@equipo", SqlDbType.VarChar, 50);
            paramItems.Value = ce.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@fecha", SqlDbType.DateTime);
            paramItems.Value = ce.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Carreras_Entidad c = new Carreras_Entidad();

                        c.Carrera_ID = (int)reader["Carrera_Id"];
                        c.TipoRVOE.TipoRVOE_id = (int)reader["TipoRVOE_id"];
                        c.Licacredit = (bool?)reader["Licacredit"];
                        c.Inglesreq = (bool?)reader["Inglesreq"];
                        c.Labs = reader["Labs"] == System.DBNull.Value ? null : (bool?)reader["Labs"];
                        c.Postgrados = reader["Postgrados"] == System.DBNull.Value ? null : (bool?)reader["Postgrados"];
                        c.Tipoestudios = (string)reader["Tipoestudios"];
                        c.NoRVOE = (string)reader["NoRVOE"];
                        c.Queacredit = (string)reader["Queacredit"];
                        c.Opctitcion = (string)reader["Opctitcion"];
                        c.Proydinv = (string)reader["Proydinv"];
                        c.Duracion = (decimal)reader["Duracion"];
                        c.Cursosingles = (int)reader["Cursosingles"];
                        c.Cursoscompu = (int)reader["Cursoscompu"];
                        c.Egresados = (decimal)reader["Egresados"];
                        c.Costoinsc = (decimal)reader["Costoinsc"];
                        c.Costocolra = (decimal)reader["Costocolra"];
                        c.Nivel.Nivel_id = (int)reader["Nivel_id"];
                        c.Nivel.Nombre = ((Nivel_Entidad.Niveles)(int)reader["Nivel_id"]).ToString();
                        c.NoAlumnos = (int)reader["NoAlumnos"];

                        lista.Add(c);
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

        /// <summary>
        /// Método para remover una carrera.
        /// </summary>
        /// <param name="iCarrera_id">Numero de identificacion de la carrera que se desa eliminar.</param>
        /// <param name="Plantel_id">Numero de identificacion del plantel que se desea traer sus carreras
        /// hasta este momento.</param>
        /// <returns>En caso de que se elimine correctamente la carrera, regresa la lista de las carreras
        /// actuales para un plantel.</returns>
        public List<Carreras_Entidad> RemueveCarrera(int iCarrera_id, int Plantel_id)
        {
            List<Carreras_Entidad> lista = new List<Carreras_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spRemueveCarrera]";

            SqlParameter paramItems = new SqlParameter("@carrera_ID", SqlDbType.Int);
            paramItems.Value = iCarrera_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = Plantel_id;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Carreras_Entidad c = new Carreras_Entidad();

                        c.Carrera_ID = (int)reader["Carrera_Id"];
                        c.TipoRVOE.TipoRVOE_id = (int)reader["TipoRVOE_id"];
                        c.Licacredit = (bool?)reader["Licacredit"];
                        c.Inglesreq = (bool?)reader["Inglesreq"];
                        c.Labs = reader["Labs"] == System.DBNull.Value ? null : (bool?)reader["Labs"];
                        c.Postgrados = reader["Postgrados"] == System.DBNull.Value ? null : (bool?)reader["Postgrados"];
                        c.Tipoestudios = (string)reader["Tipoestudios"];
                        c.NoRVOE = (string)reader["NoRVOE"];
                        c.Queacredit = (string)reader["Queacredit"];
                        c.Opctitcion = (string)reader["Opctitcion"];
                        c.Proydinv = (string)reader["Proydinv"];
                        c.Duracion = (decimal)reader["Duracion"];
                        c.Cursosingles = (int)reader["Cursosingles"];
                        c.Cursoscompu = (int)reader["Cursoscompu"];
                        c.Egresados = (decimal)reader["Egresados"];
                        c.Costoinsc = (decimal)reader["Costoinsc"];
                        c.Costocolra = (decimal)reader["Costocolra"];
                        c.Nivel.Nivel_id = (int)reader["Nivel_id"];
                        c.Nivel.Nombre = ((Nivel_Entidad.Niveles)(int)reader["Nivel_id"]).ToString();
                        c.NoAlumnos = (int)reader["NoAlumnos"];

                        lista.Add(c);
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
    }
}