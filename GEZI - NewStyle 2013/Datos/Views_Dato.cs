using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class Views_Dato : ConeccionBD
    {
        public Views_Dato() : base() { }

        /// <summary>
        /// Llama al procedimiento "[gezi].[spRegresaTipos]" de la base de datos.
        /// </summary>
        /// <returns>Regresa la lista de "Tipos de escuelas" disponibles en la base de datos.</returns>
        public List<Tipo_Entidad> RegresaTipos()
        {
            List<Tipo_Entidad> lista = new List<Tipo_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaTipos]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Tipo_Entidad te = new Tipo_Entidad();
                        te.Tipo_id = (int)reader["Tipo_id"];
                        te.Nombre = (string)reader["Nombre"];

                        lista.Add(te);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return lista;
        }

        /// <summary>
        /// Llama al procedimiento "[gezi].[spRegresaNiveles]" de la base de datos.
        /// </summary>
        /// <returns>Regresa la lista de "Niveles de escuelas" disponibles en la base de datos.</returns>
        public List<Nivel_Entidad> RegresaNiveles(bool Porcarrera)
        {
            List<Nivel_Entidad> lista = new List<Nivel_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@porCarrera", SqlDbType.Bit);
            paramItems.Value = Porcarrera;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaNiveles]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Nivel_Entidad ne = new Nivel_Entidad();
                        ne.Nivel_id = (int)reader["Nivel_id"];
                        ne.Nombre = (string)reader["Nombre"];

                        lista.Add(ne);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return lista;
        }

        /// <summary>
        /// Llama al procedimiento "[dbo].[spNacion]" de la base de datos.
        /// </summary>
        /// <param name="iCE">Codigo de la entidad(ciudad) de la que se quieren traer sus municipios(estados), en caso de que lo necesite.</param>
        /// <param name="tipo">Ciudad o Estado</param>
        /// <returns>Regresa la lista de los "Estados" o ciudad disponibles en la base de datos.</returns>
        public List<Plantel_Entidad> Nacion(int iCE, string sTipo)
        {
            List<Plantel_Entidad> lista = new List<Plantel_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@codigo_ent", SqlDbType.Int);
            paramItems.Value = iCE;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@tipo", SqlDbType.Char, 10);
            paramItems.Value = sTipo;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[dbo].[spNacion]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Plantel_Entidad pe = new Plantel_Entidad();

                        if (sTipo == Constantes.ESTADO)
                        {
                            pe.Estado_Id = (int)reader["Estado_Id"];
                            pe.Estado = (string)reader["Estado"];
                        }
                        else if (sTipo == Constantes.CIUDAD)
                        {
                            pe.Ciudad_Id = (int)reader["Ciudad_Id"];
                            pe.Ciudad = (string)reader["Ciudad"];
                        }

                        lista.Add(pe);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return lista;
        }

        /// <summary>
        /// Llama al procedimiento "[gezi].[spRegresaInstituciones]" de la base de datos.
        /// </summary>
        /// <param name="opcion">Indicas el tipo de búsqueda que deseas. Todos, PorID, etc.</param>
        /// <returns>Regresa la lista de las "Instituciones" disponibles en la base de datos.</returns>
        public List<Institucion_Entidad> RegresaInstituciones(string opcion)
        {
            List<Institucion_Entidad> lista = new List<Institucion_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = opcion;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaInstituciones]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Institucion_Entidad ie = new Institucion_Entidad();

                        //if (opcion == Constantes.TODOS)
                        //{
                        ie.Institucion_id = (int)reader["Institucion_id"];
                        ie.Institucion = (string)reader["Institucion"];

                        //}
                        //else if (opcion == Constantes.PORID)
                        //{
                        //    ie.Institucion_id = (int)reader["Institucion_id"];
                        //    ie.Institucion = (string)reader["Institucion"];
                        //    ie.Nivel.Nivel_id = (int)reader["Nivel_id"];
                        //    ie.Tipo.Tipo_id = (int)reader["Tipo_id"];
                        //    ie.Telefono = (string)reader["Telefono"];
                        //    ie.Web = (string)reader["Web"];
                        //    ie.Area = (string)reader["Area"];
                        //}

                        lista.Add(ie);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return lista;
        }

        /// <summary>
        /// Llama al procedimiento "[gezi].[spRegresaInstituciones]" de la base de datos.
        /// </summary>
        /// <param name="iInst">Indicas el id de la institución que deseas buscar.</param>
        /// <param name="opcion">Indicas el tipo de búsqueda que deseas. Todos, PorID, etc.</param>
        /// <returns>Regresa solo la institución indicada por su Id.</returns>
        public Institucion_Entidad RegresaInstitucion(int iInst, string opcion)
        {
            Institucion_Entidad ie = null;
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@institucion_id", SqlDbType.Int);
            paramItems.Value = iInst;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = opcion;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaInstituciones]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ie = new Institucion_Entidad();

                        ie.Institucion_id = (int)reader["Institucion_id"];
                        ie.Institucion = (string)reader["Institucion"];
                        ie.Nivel.Nivel_id = (int)reader["Nivel_id"];
                        ie.Tipo.Tipo_id = (int)reader["Tipo_id"];
                        ie.Nivel.Nombre = (string)reader["Nivel"];
                        ie.Tipo.Nombre = (string)reader["Tipo"];
                        ie.Clave = (string)reader["Clave"];
                        ie.Telefono = (string)reader["Telefono"];
                        ie.Web = (string)reader["Web"];
                        ie.Area = (string)reader["Area"];
                        ie.Imagen = (string)reader["Logo"];
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return ie;
        }

        /// <summary>
        /// Llama al procedimiento "[gezi].[spRegresaPlanteles]" de la base de datos.
        /// </summary>
        /// <param name="iIE">Id de la institucion de la que se quieren traer sus planteles.</param>
        /// <param name="opcion">Por id o todos</param>
        /// <returns>Regresa la lista de los "Planteles" para una institucion disponibles en la base de datos.</returns>
        public List<Plantel_Entidad> RegresaPlanteles(int iIE, string opcion)
        {
            List<Plantel_Entidad> lista = new List<Plantel_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = opcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@institucion_id", SqlDbType.Int);
            paramItems.Value = iIE;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaPlanteles]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Plantel_Entidad pe = new Plantel_Entidad();

                        pe.Plantel_id = (int)reader["Plantel_id"];
                        pe.Plantel = (string)reader["Plantel"];
                        pe.Institucion.Nivel.Nivel_id = (int)reader["Nivel_id"];

                        lista.Add(pe);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return lista;
        }

        /// <summary>
        /// Llama al procedimiento "[gezi].[spRegresaPlanteles]" de la base de datos.
        /// </summary>
        /// <param name="iInst">Indica el id del plantel que desea buscar.</param>
        /// <param name="opcion">Indica el tipo de búsqueda que deseas. Todos, PorID, etc.</param>
        /// <returns>Regresa solo el plantel indicada por su Id.</returns>
        public Plantel_Entidad RegresaPlantel(int iPlantel, string opcion)
        {
            Plantel_Entidad pe = null;
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = iPlantel;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = opcion;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaPlanteles]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        pe = new Plantel_Entidad();

                        pe.Plantel_id = (int)reader["Plantel_id"];
                        pe.Plantel = (string)reader["Plantel"];
                        pe.Direccion = (string)reader["Direccion"];
                        pe.Ciudad_Id = (int)reader["Ciudad_Id"];
                        pe.Ciudad = (string)reader["Municipio"];
                        pe.Estado_Id = (int)reader["Codigo_Entidad"];
                        pe.Estado = (string)reader["Entidad"];
                        pe.CP = (int)reader["CP"];
                        pe.Encuesta.GUID = reader["GUID"] == System.DBNull.Value ? System.Guid.Empty : (System.Guid)reader["GUID"];
                        pe.Contacto = (string)reader["Contacto"];
                        pe.Telefono = (string)reader["Telefono"];
                        pe.Correo = (string)reader["Correo"];
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return pe;
        }

        /// <summary>
        /// Llama al procedimiento "[gezi].[spRegresaTiposRVOE]" de la base de datos.
        /// </summary>
        /// <returns>Regresa la lista de los tipos de "RVOE" disponibles en la base de datos.</returns>
        public List<TipoRVOE_Entidad> RegresaTiposRVOEs()
        {
            List<TipoRVOE_Entidad> lista = new List<TipoRVOE_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaTiposRVOE]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        TipoRVOE_Entidad te = new TipoRVOE_Entidad();
                        te.TipoRVOE_id = (int)reader["TipoRVOE_id"];
                        te.Nombre = (string)reader["Nombre"];

                        lista.Add(te);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return lista;
        }

        /// <summary>
        /// Llama al procedimiento "[gezi].[spRegresaCaracteristicas]" de la base de datos.
        /// </summary>
        /// <param name="iCaract">Indicas el id de la característica que deseas buscar.</param>
        /// <param name="iPlantel">Indicas el id del plantel que deseas buscar.</param>
        /// <param name="opcion">Indicas el tipo de búsqueda que deseas. Todos, PorID, etc.</param>
        /// <returns>Regresa solo la característica indicada por su Id o por el IdPlantel que haga referencia.</returns>
        public Caracteristicas_Entidad RegresaCaracteristica(int iCaract, int iPlantel, string opcion)
        {
            Caracteristicas_Entidad ce = null;
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@caract_id", SqlDbType.Int);
            paramItems.Value = iCaract;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = iPlantel;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = opcion;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaCaracteristicas]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ce = new Caracteristicas_Entidad();

                        //if (string.Equals(opcion, Constantes.PORPLANTEL))
                        //    ce.Caract_id = (int)reader["Caract_id"];
                        //else
                        //{
                        ce.Caract_id = (int)reader["Caract_id"];
                        ce.Plantel.Plantel_id = (int)reader["Plantel_id"];

                        ce.Prepingr = (bool?)reader["Prepingr"];
                        ce.Servpsco = (bool?)reader["Servpsco"];
                        ce.Activextracurles = (bool?)reader["Activextracurles"];
                        ce.Conscalif = (bool?)reader["Conscalif"];
                        ce.Tutorias = (bool?)reader["Tutorias"];
                        ce.Cursosremed = (bool?)reader["Cursosremed"];
                        ce.Aireacond = (bool?)reader["Aireacond"];
                        ce.Salonesmultim = (bool?)reader["Salonesmultim"];
                        ce.Biblioteca = (bool?)reader["Biblioteca"];
                        ce.Formpedagca = (bool?)reader["Formpedagca"];
                        ce.Evaluadoct = (bool?)reader["Evaluadoct"];
                        ce.Exadiag = (bool?)reader["Exadiag"];
                        ce.Servevaegre = reader["Servevaegre"] == System.DBNull.Value ? null : (bool?)reader["Servevaegre"];
                        ce.ProgInterncion = reader["ProgInterncion"] == System.DBNull.Value ? null : (bool?)reader["ProgInterncion"];
                        ce.Sistadminclases = reader["Sistadminclases"] == System.DBNull.Value ? null : (bool?)reader["Sistadminclases"];
                        ce.Intercacadem = reader["Intercacadem"] == System.DBNull.Value ? null : (bool?)reader["Intercacadem"];
                        ce.Servcomunidad = reader["Servcomunidad"] == System.DBNull.Value ? null : (bool?)reader["Servcomunidad"];
                        ce.Bibcompeint = reader["Bibcompeint"] == System.DBNull.Value ? null : (bool?)reader["Bibcompeint"];
                        ce.Biblvirtual = reader["Biblvirtual"] == System.DBNull.Value ? null : (bool?)reader["Biblvirtual"];
                        ce.Actdisc = reader["Actdisc"] == System.DBNull.Value ? null : (bool?)reader["Actdisc"];
                        ce.Educacontinua = reader["Educacontinua"] == System.DBNull.Value ? null : (bool?)reader["Educacontinua"];

                        ce.FormaEval = (string)reader["FormaEval"];
                        ce.Calfmin = (string)reader["Calfmin"];
                        ce.Razonbaja = (string)reader["Razonbaja"];
                        ce.Activextracrs = (string)reader["Activextracrs"];
                        ce.FormaEvaluadoct = (string)reader["FormaEvaluadoct"];
                        ce.Catdocts = (string)reader["Catdocts"];
                        ce.Asocsinst = (string)reader["Asocsinst"];

                        ce.Labidiomas = (int)reader["Labidiomas"];
                        ce.LabComputo = (int)reader["LabComputo"];
                        ce.Acrditaasig = (int)reader["Acrditaasig"];
                        ce.Revcurriculo = (int)reader["Revcurriculo"];
                        ce.NoAlumnos = (int)reader["NoAlumnos"];

                        ce.Resulpenlace = (decimal)reader["Resulpenlace"];
                        ce.Costoinsc = (decimal)reader["Costoinsc"];
                        ce.Costocolra = (decimal)reader["Costocolra"];

                        ce.Eficterm = (decimal)reader["Eficterm"];
                        ce.Doctsmatria = (decimal)reader["Doctsmatria"];
                        ce.Doctsdocdo = (decimal)reader["Doctsdocdo"];
                        ce.InvesSNI = (decimal)reader["InvesSNI"];
                        ce.Doctslibrs = (decimal)reader["Doctslibrs"];
                    }

                    //}
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return ce;
        }

        /// <summary>
        ///  Llama al procedimiento "[gezi].[spRegresaEncuestas]" de la base de datos.
        /// </summary>
        /// <param name="sNombre">Nombre de la encuesta que se quiere buscar. En este campo se puede indicar
        /// su numero de guia (GUID)</param>
        /// <param name="opcion">Indicas el tipo de búsqueda que deseas. Todos, PorNombre, etc.</param>
        /// <returns>Aquí se trae todos los nombres de las encuestas que coincidan con el texto
        /// que este ingresando en el control.</returns>
        public List<Encuesta_Entidad> RegresaEncuestas(string sNombre, int plantel_id, string opcion)
        {
            List<Encuesta_Entidad> lista = new List<Encuesta_Entidad>();

            SqlCommand cmdItems = new SqlCommand();
            System.Guid NoGuia = System.Guid.Empty;

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = opcion;
            cmdItems.Parameters.Add(paramItems);

            if (opcion == Constantes.PORGUID)
                NoGuia = System.Guid.Parse(sNombre);
            else if (opcion == Constantes.PORNIVEL)
            {
                paramItems = new SqlParameter("@nivel_id", SqlDbType.Int);
                paramItems.Value = int.Parse(sNombre);
                cmdItems.Parameters.Add(paramItems);
            }
            else
            {
                paramItems = new SqlParameter("@nombre", SqlDbType.VarChar, 250);
                paramItems.Value = sNombre;
                cmdItems.Parameters.Add(paramItems);
            }

            paramItems = new SqlParameter("@guid", SqlDbType.UniqueIdentifier);
            paramItems.Value = NoGuia;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = plantel_id;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaEncuestas]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Encuesta_Entidad ee = new Encuesta_Entidad();
                        ee.GUID = (System.Guid)reader["GUID"];
                        ee.Nombre = (string)reader["Nombre"];

                        ee.Encuesta_id = (int)reader["Encuesta_id"];
                        ee.PreguntaNo = (int)reader["Pregunta_no"];
                        ee.Nivel.Nivel_id = (int)reader["Nivel_id"];
                        ee.Pregunta = (string)reader["Pregunta"];
                        ee.Respuesta1 = (string)reader["Respuesta1"];
                        ee.Respuesta2 = (string)reader["Respuesta2"];
                        ee.Respuesta3 = (string)reader["Respuesta3"];
                        ee.Respuesta4 = (string)reader["Respuesta4"];
                        ee.Respuesta5 = (string)reader["Respuesta5"];

                        if (Constantes.PORGUID.Equals(opcion))
                        {
                            ee.TRespuesta1 = (int)reader["TRespuesta1"];
                            ee.TRespuesta2 = (int)reader["TRespuesta2"];
                            ee.TRespuesta3 = (int)reader["TRespuesta3"];
                            ee.TRespuesta4 = (int)reader["TRespuesta4"];
                            ee.TRespuesta5 = (int)reader["TRespuesta5"];
                        }

                        ee.Usuario.Fecha = (DateTime)reader["Creadoen"];
                        ee.Usuario.Usuario = (string)reader["Creadopor"];

                        lista.Add(ee);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return lista;
        }

        /// <summary>
        ///  Llama al procedimiento "[gezi].[spRegresaEncabezados]" de la base de datos.
        /// </summary>
        /// <param name="sNombre">Nombre de la encuesta que se quiere buscar. En este campo se puede indicar
        /// su numero de guia (GUID)</param>
        /// <param name="opcion">Indicas el tipo de búsqueda que deseas. Todos, PorNombre, etc.</param>
        /// <returns>Aquí se trae todos los nombres de las encuestas que coincidan con el texto
        /// que este ingresando en el control.</returns>
        public List<Encuesta_Entidad> RegresaEncabezados(string sNombre, string opcion)
        {
            List<Encuesta_Entidad> lista = new List<Encuesta_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = opcion;
            cmdItems.Parameters.Add(paramItems);

            if (opcion == Constantes.PORNIVEL)
            {
                paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
                paramItems.Value = int.Parse(sNombre);
                cmdItems.Parameters.Add(paramItems);
            }
            else
            {
                paramItems = new SqlParameter("@nombre", SqlDbType.VarChar, 250);
                paramItems.Value = sNombre;
                cmdItems.Parameters.Add(paramItems);
            }

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaEncabezados]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Encuesta_Entidad ee = new Encuesta_Entidad();
                        ee.GUID = (System.Guid)reader["GUID"];
                        ee.Nombre = (string)reader["Nombre"];

                        lista.Add(ee);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return lista;
        }

        /// <summary>
        /// Busqueda de los planteles que coincidan con los filtros de búsqueda.
        /// </summary>
        /// <param name="iCiudad_id">Numero de identificación de la Ciudad</param>
        /// <param name="iEscuela_id">Numero de identificación de la escuela de Prescolar hasta Universidad</param>
        /// <param name="iNivel_id">Numero de identificación del Nivel de Licenciatura hasta Doctorado</param>
        /// <param name="sCarrera">Nombre de la carrera que se desea realizar la búsqueda.</param>
        /// <returns>Regresa el detalle de los planteles, dependiendo su filtro de búsqueda.</returns>
        public List<Plantel_Entidad> RegresaDetallePlanteles(int iCiudad_id, int iEscuela_id, int iNivel_id, string sCarrera)
        {
            List<Plantel_Entidad> lista = new List<Plantel_Entidad>();

            SqlCommand cmdItems = new SqlCommand();
            System.Guid NoGuia = System.Guid.Empty;

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.Text;

            if (iEscuela_id.Equals(5) && iNivel_id > 5)
                cmdItems.CommandText = string.Format("SELECT * FROM [gezi].[ufn_RegresaDetallePlantelCarrera]({0},{1},'{2}')", iCiudad_id, iNivel_id, sCarrera);
            else
                cmdItems.CommandText = string.Format("SELECT * FROM [gezi].[ufn_RegresaDetallePlantel]({0},{1},{2})", iCiudad_id, iEscuela_id, iNivel_id);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Plantel_Entidad pe = new Plantel_Entidad();
                        pe.Plantel_id = (int)reader["Plantel_id"];
                        pe.Plantel = (string)reader["Plantel"];
                        pe.Telefono = (string)reader["Telefono"];
                        pe.Institucion.Institucion_id = (int)reader["Institucion_id"];
                        pe.Institucion.Institucion = (string)reader["Institucion"];
                        pe.Institucion.Imagen = (string)reader["Logo"];
                        pe.Institucion.Tipo.Nombre = (string)reader["Tipo"];
                        pe.Institucion.Web = (string)reader["Web"];
                        pe.Direccion = (string)reader["Direccion"];
                        pe.CP = (int)reader["CP"];
                        pe.Carrera = ((string)reader["Carrera"]).Trim();
                        pe.Estado = (string)reader["Estado"];
                        pe.Ciudad = (string)reader["Ciudad"];
                        pe.Carrera_id = (int)reader["Carrera_Id"];

                        lista.Add(pe);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return lista;
        }

        public Caracteristicas_Entidad RegresaDetalleResumen(int plantel_id, int Carrera_id)
        {
            Caracteristicas_Entidad ce = null;

            SqlCommand cmdItems = new SqlCommand();
            System.Guid NoGuia = System.Guid.Empty;

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.Text;

            if (Carrera_id.Equals(-1))
                cmdItems.CommandText = string.Format("SELECT * FROM gezi.[ufn_RegresaDetalleResumen]({0})", plantel_id);
            else
                cmdItems.CommandText = string.Format("SELECT * FROM gezi.[ufn_RegresaDetalleResumenCarrera]({0},{1})", plantel_id, Carrera_id);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ce = new Caracteristicas_Entidad();

                        //Estos son los campos que se muestran como principal
                        if (!Carrera_id.Equals(-1))
                        {
                            ce.Carreras.Costoinsc = (decimal)reader["Costoinsc"];
                            ce.Carreras.Costocolra = (decimal)reader["Costocolra"];
                            ce.Carreras.Egresados = (decimal)reader["Egresados"];
                            ce.Carreras.Duracion = (decimal)reader["Duracion"];
                            ce.InvesSNI = (decimal)reader["InvesSNI"];
                            ce.Doctslibrs = (decimal)reader["Doctslibrs"];

                            ce.Carreras.NoAlumnos = (int)reader["NoAlumnos"];
                            ce.Carreras.Cursosingles = (int)reader["Cursosingles"];
                            ce.Carreras.Cursoscompu = (int)reader["Cursoscompu"];

                            ce.Carreras.NoRVOE = (string)reader["NoRVOE"];
                            ce.Carreras.TipoRVOE.Nombre = (string)reader["Nombre"];
                            ce.Carreras.Queacredit = (string)reader["Queacredit"];
                            ce.Carreras.Opctitcion = (string)reader["Opctitcion"];
                            ce.Carreras.Proydinv = (string)reader["Proydinv"];

                            ce.Carreras.Labs = reader["Labs"] == System.DBNull.Value ? null : (bool?)reader["Labs"];
                            ce.Carreras.Inglesreq = reader["Inglesreq"] == System.DBNull.Value ? null : (bool?)reader["Inglesreq"];
                            ce.Carreras.Postgrados = reader["Postgrados"] == System.DBNull.Value ? null : (bool?)reader["Postgrados"];
                        }
                        else
                        {
                            ce.Costoinsc = (decimal)reader["Costoinsc"];
                            ce.Costocolra = (decimal)reader["Costocolra"];

                            ce.NoAlumnos = (int)reader["NoAlumnos"];
                        }

                        //Estos son los campos que se muestras en la parte inferior
                        //de la pagina.
                        ce.Labidiomas = (int)reader["Labidiomas"];
                        ce.LabComputo = (int)reader["LabComputo"];
                        ce.Acrditaasig = (int)reader["Acrditaasig"];
                        ce.Revcurriculo = (int)reader["Revcurriculo"];

                        ce.FormaEval = (string)reader["FormaEval"];
                        ce.Calfmin = (string)reader["Calfmin"];
                        ce.Razonbaja = (string)reader["Razonbaja"];
                        ce.Activextracrs = (string)reader["Activextracrs"];
                        ce.FormaEvaluadoct = (string)reader["FormaEvaluadoct"];
                        ce.Catdocts = (string)reader["Catdocts"];

                        ce.Exadiag = reader["Exadiag"] == System.DBNull.Value ? null : (bool?)reader["Exadiag"];
                        ce.Prepingr = reader["Prepingr"] == System.DBNull.Value ? null : (bool?)reader["Prepingr"];
                        ce.Servpsco = reader["Servpsco"] == System.DBNull.Value ? null : (bool?)reader["Servpsco"];
                        ce.Activextracurles = reader["Activextracurles"] == System.DBNull.Value ? null : (bool?)reader["Activextracurles"];
                        ce.Servevaegre = reader["Servevaegre"] == System.DBNull.Value ? null : (bool?)reader["Servevaegre"];
                        ce.ProgInterncion = reader["ProgInterncion"] == System.DBNull.Value ? null : (bool?)reader["ProgInterncion"];
                        ce.Conscalif = reader["Conscalif"] == System.DBNull.Value ? null : (bool?)reader["Conscalif"];
                        ce.Sistadminclases = reader["Sistadminclases"] == System.DBNull.Value ? null : (bool?)reader["Sistadminclases"];
                        ce.Tutorias = reader["Tutorias"] == System.DBNull.Value ? null : (bool?)reader["Tutorias"];
                        ce.Cursosremed = reader["Cursosremed"] == System.DBNull.Value ? null : (bool?)reader["Cursosremed"];
                        ce.Intercacadem = reader["Intercacadem"] == System.DBNull.Value ? null : (bool?)reader["Intercacadem"];
                        ce.Servcomunidad = reader["Servcomunidad"] == System.DBNull.Value ? null : (bool?)reader["Servcomunidad"];
                        ce.Aireacond = reader["Aireacond"] == System.DBNull.Value ? null : (bool?)reader["Aireacond"];
                        ce.Salonesmultim = reader["Salonesmultim"] == System.DBNull.Value ? null : (bool?)reader["Salonesmultim"];
                        ce.Educacontinua = reader["Educacontinua"] == System.DBNull.Value ? null : (bool?)reader["Educacontinua"];
                        ce.Formpedagca = reader["Formpedagca"] == System.DBNull.Value ? null : (bool?)reader["Formpedagca"];
                        ce.Actdisc = reader["Actdisc"] == System.DBNull.Value ? null : (bool?)reader["Actdisc"];
                        ce.Evaluadoct = reader["Evaluadoct"] == System.DBNull.Value ? null : (bool?)reader["Evaluadoct"];
                        ce.Bibcompeint = reader["Bibcompeint"] == System.DBNull.Value ? null : (bool?)reader["Bibcompeint"];
                        ce.Biblvirtual = reader["Biblvirtual"] == System.DBNull.Value ? null : (bool?)reader["Biblvirtual"];

                        ce.Eficterm = (decimal)reader["Eficterm"];
                        ce.Doctsmatria = (decimal)reader["Doctsmatria"];
                        ce.Doctsdocdo = (decimal)reader["Doctsdocdo"];
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return ce;
        }

        public Caracteristicas_Entidad RegresaDetalleExtras(int plantel_id, int Carrera_id)
        {
            Caracteristicas_Entidad ce = null;

            SqlCommand cmdItems = new SqlCommand();
            System.Guid NoGuia = System.Guid.Empty;

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.Text;

            if (Carrera_id.Equals(-1))
                cmdItems.CommandText = string.Format("SELECT * FROM gezi.[ufn_RegresaDetalleExtras]({0})", plantel_id);
            else
                cmdItems.CommandText = string.Format("SELECT * FROM gezi.[ufn_RegresaDetalleExtrasCarrera]({0},{1})", plantel_id, Carrera_id);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ce = new Caracteristicas_Entidad();
                        ce.Labidiomas = (int)reader["Labidiomas"];
                        ce.LabComputo = (int)reader["LabComputo"];
                        ce.FormaEvaluadoct = (string)reader["FormaEvaluadoct"];

                        if (!Carrera_id.Equals(-1))
                        {
                            ce.Carreras.Tipoestudios = (string)reader["Tipoestudios"];
                            ce.Carreras.NoRVOE = (string)reader["NoRVOE"];
                            ce.Carreras.Duracion = (decimal)reader["Duracion"];
                            ce.Carreras.Queacredit = (string)reader["Queacredit"];
                            ce.Carreras.Opctitcion = (string)reader["Opctitcion"];
                            ce.Carreras.Cursosingles = (int)reader["Cursosingles"];
                            ce.Carreras.Cursoscompu = (int)reader["Cursoscompu"];
                            ce.Carreras.Proydinv = (string)reader["Proydinv"];
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return ce;
        }

        public List<Encuesta_Entidad> RegresaDetalleEncuesta(int plantel_id)
        {
            List<Encuesta_Entidad> lista = new List<Encuesta_Entidad>();

            SqlCommand cmdItems = new SqlCommand();
            System.Guid NoGuia = System.Guid.Empty;

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.Text;
            cmdItems.CommandText = string.Format("SELECT * FROM gezi.[ufn_RegresaDetalleEncuesta]({0})", plantel_id);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Encuesta_Entidad ee = new Encuesta_Entidad();
                        ee.GUID = (System.Guid)reader["GUID"];
                        ee.Encuesta_id = (int)reader["Encuesta_id"];

                        ee.PreguntaNo = (int)reader["Pregunta_no"];
                        ee.Pregunta = (string)reader["Pregunta"];
                        ee.Respuesta1 = (string)reader["Respuesta1"];
                        ee.Respuesta2 = (string)reader["Respuesta2"];
                        ee.Respuesta3 = (string)reader["Respuesta3"];
                        ee.Respuesta4 = (string)reader["Respuesta4"];
                        ee.Respuesta5 = (string)reader["Respuesta5"];

                        ee.TRespuesta1 = (int)reader["TRespuesta1"];
                        ee.TRespuesta2 = (int)reader["TRespuesta2"];
                        ee.TRespuesta3 = (int)reader["TRespuesta3"];
                        ee.TRespuesta4 = (int)reader["TRespuesta4"];
                        ee.TRespuesta5 = (int)reader["TRespuesta5"];

                        lista.Add(ee);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return lista;
        }

        /// <summary>
        /// Llama a la clase datos, metodo RegresaCarreras.
        /// </summary>
        /// <param name="plantel_id">Numero de identificacion del plantel que se desea consultar sus carreras disponibles.</param>
        /// <param name="opcion">Indica el tipo de consulta que se desea que se ejecute en la base de datos.</param>
        /// <returns>Regresa las carreras disponibles para un mismo plantel.</returns>
        public List<Carreras_Entidad> RegresaCarreras(int plantel_id, string sOpcion)
        {
            List<Carreras_Entidad> lista = new List<Carreras_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[GEZI].[spRegresaCarreras]";

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = plantel_id;
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
                        c.NoAlumnos = (int)reader["NoAlumnos"];
                        c.Nivel.Nivel_id = (int)reader["Nivel_id"];
                        c.Cursosingles = (int)reader["Cursosingles"];
                        c.Cursoscompu = (int)reader["Cursoscompu"];
                        c.Nivel.Nombre = ((Nivel_Entidad.Niveles)(int)reader["Nivel_id"]).ToString();

                        c.Licacredit = (bool?)reader["Licacredit"];
                        c.Inglesreq = (bool?)reader["Inglesreq"];
                        c.Labs = reader["Labs"] == System.DBNull.Value ? null : (bool?)reader["Labs"];
                        c.Postgrados = reader["Postgrados"] == System.DBNull.Value ? null : (bool?)reader["Postgrados"]; ;

                        c.Tipoestudios = (string)reader["Tipoestudios"];
                        c.NoRVOE = (string)reader["NoRVOE"];
                        c.Queacredit = (string)reader["Queacredit"];
                        c.Opctitcion = (string)reader["Opctitcion"];
                        c.Proydinv = (string)reader["Proydinv"];

                        c.Duracion = (decimal)reader["Duracion"];
                        c.Egresados = (decimal)reader["Egresados"];
                        c.Costoinsc = (decimal)reader["Costoinsc"];
                        c.Costocolra = (decimal)reader["Costocolra"];

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

        public int RegresaTipoPlanteles(int iPlantel_ID, string opcion)
        {
            SqlCommand cmdItems = new SqlCommand();
            int tipo = -1;

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = opcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@plantel_id", SqlDbType.Int);
            paramItems.Value = iPlantel_ID;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaPlanteles]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        tipo = (int)reader["Tipo_id"];

                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return tipo;
        }

        public List<Institucion_Entidad> RegresaInstituciones_PorEstadoMunicipio(int iEstado, int iMunicipio, string opcion)
        {
            List<Institucion_Entidad> lista = new List<Institucion_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = opcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@ciudad", SqlDbType.Int);
            paramItems.Value = iMunicipio;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@estado", SqlDbType.Int);
            paramItems.Value = iEstado;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[gezi].[spRegresaInstituciones]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Institucion_Entidad ie = new Institucion_Entidad();

                        ie.Institucion_id = (int)reader["Institucion_id"];
                        ie.Institucion = (string)reader["Institucion"];
                        //ie.Nivel.Nivel_id = (int)reader["Nivel_id"];
                        
                        lista.Add(ie);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return lista;
        }
    }
}