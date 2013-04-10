using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    public class Docentes_Dato : ConeccionBD
    {
        public Docentes_Dato() : base() { }

        public List<Licenciatura_Entidad> Licenciatura(Licenciatura_Entidad objLic, string sOpcion)
        {
            List<Licenciatura_Entidad> lista = new List<Licenciatura_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[doc].[spLicenciatura]";

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@licenciatura_id", SqlDbType.Int);
            paramItems.Value = objLic.Licenciatura_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@licenciatura", SqlDbType.VarChar, 200);
            paramItems.Value = objLic.Licenciatura;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@dondeEstudio", SqlDbType.VarChar, 200);
            paramItems.Value = objLic.DondeEstudio;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@pais", SqlDbType.VarChar, 30);
            paramItems.Value = objLic.Pais;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@tituloLegalizado", SqlDbType.Bit);
            paramItems.Value = objLic.TituloLegalizado;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@periodoInicio", SqlDbType.SmallDateTime);
            paramItems.Value = objLic.PeriodoInicio;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@periodoFinal", SqlDbType.SmallDateTime);
            paramItems.Value = objLic.PeriodoFinal;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@noCedula", SqlDbType.VarChar, 30);
            paramItems.Value = objLic.NoCedula;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@usuario", SqlDbType.VarChar, 50);
            paramItems.Value = objLic.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@equipo", SqlDbType.VarChar, 50);
            paramItems.Value = objLic.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@fecha", SqlDbType.DateTime);
            paramItems.Value = objLic.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Licenciatura_Entidad l = new Licenciatura_Entidad();
                        l.Licenciatura_id = (int)reader["Licenciatura_id"];
                        l.Licenciatura = (string)reader["Licenciatura"];
                        l.DondeEstudio = (string)reader["DondeEstudio"];
                        l.Pais = (string)reader["Pais"];
                        l.TituloLegalizado = (bool)reader["TituloLegalizado"];
                        l.PeriodoInicio = (DateTime)reader["PeriodoInicio"];
                        l.PeriodoFinal = (DateTime)reader["PeriodoFinal"];
                        l.NoCedula = (string)reader["NoCedula"];

                        lista.Add(l);
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
        public List<Licenciatura_Entidad> RegresaLicenciaturas(string sOpcion, int licenciatura_id)
        {
            List<Licenciatura_Entidad> lista = new List<Licenciatura_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@licenciatura_id", SqlDbType.Int);
            paramItems.Value = licenciatura_id;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[doc].[spRegresaLicenciatura]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Licenciatura_Entidad l = new Licenciatura_Entidad();
                        l.Licenciatura_id = (int)reader["Licenciatura_id"];
                        l.Licenciatura = (string)reader["Licenciatura"];
                        l.DondeEstudio = (string)reader["DondeEstudio"];
                        l.Pais = (string)reader["Pais"];
                        l.TituloLegalizado = (bool)reader["TituloLegalizado"];
                        l.PeriodoInicio = (DateTime)reader["PeriodoInicio"];
                        l.PeriodoFinal = (DateTime)reader["PeriodoFinal"];
                        l.NoCedula = (string)reader["NoCedula"];

                        lista.Add(l);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return lista;
        }

        public List<Posgrado_Entidad> Posgrado(Posgrado_Entidad objPos, string sOpcion)
        {
            List<Posgrado_Entidad> listaPos = new List<Posgrado_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[doc].[spPosgrado]";

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@posgrado_id", SqlDbType.Int);
            paramItems.Value = objPos.Posgrado_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@nivel_id", SqlDbType.Int);
            paramItems.Value = objPos.Nivel.Nivel_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@estudio", SqlDbType.VarChar,200);
            paramItems.Value = objPos.Estudio;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@univDondeEstudio", SqlDbType.VarChar,200);
            paramItems.Value = objPos.UnivDondeEstudio;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@pais", SqlDbType.VarChar,30);
            paramItems.Value = objPos.Pais;
            cmdItems.Parameters.Add(paramItems);
            
            paramItems = new SqlParameter("@tituloGradoLegal", SqlDbType.Bit);
            paramItems.Value = objPos.TituloGradoLegal;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@periodoInicio", SqlDbType.SmallDateTime);
            paramItems.Value = objPos.PeriodoInicio;
            cmdItems.Parameters.Add(paramItems);
            
            paramItems = new SqlParameter("@periodoFinal", SqlDbType.SmallDateTime);
            paramItems.Value = objPos.PeriodoFinal;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@grado", SqlDbType.Bit);
            paramItems.Value = objPos.Grado;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@noCedula", SqlDbType.VarChar,30);
            paramItems.Value = objPos.NoCedula;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@comentarios", SqlDbType.VarChar,500);
            paramItems.Value = objPos.Comentarios;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@usuario", SqlDbType.VarChar,50);
            paramItems.Value = objPos.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@equipo", SqlDbType.VarChar,50);
            paramItems.Value = objPos.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@fecha", SqlDbType.SmallDateTime);
            paramItems.Value = objPos.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);
            
             try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Posgrado_Entidad p = new Posgrado_Entidad();
                        p.Posgrado_id = (int)reader["Posgrado_id"];
                        p.Nivel.Nivel_id = (int)reader["nivel_id"];
                        p.Nivel.Nombre = (string)reader["nivel_nombre"];
                        p.Estudio = (string)reader["estudio"];
                        p.UnivDondeEstudio = (string)reader["univDondeEstudio"];
                        p.Pais = (string)reader["pais"];
                        p.TituloGradoLegal = (bool)reader["tituloGradoLegal"];
                        p.PeriodoInicio = (DateTime)reader["periodoInicio"];
                        p.PeriodoFinal = (DateTime)reader["periodoFinal"];
                        p.Grado = (bool)reader["grado"];
                        p.NoCedula = (string)reader["noCedula"];
                        p.Comentarios = (string)reader["comentarios"];
                        
                        listaPos.Add(p);
                    }
                }
            }
             catch (Exception ex)
             {
                 throw new Exception(ex.Message);
             }
             finally
             {
                 coneccion.Close();
                 cmdItems.Dispose();
             }
             return listaPos;
        }
        public List<Posgrado_Entidad> RegresaPosgrados(string sOpcion, int posgrado_id)
        {
            List<Posgrado_Entidad> listaPos = new List<Posgrado_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@posgrado_id", SqlDbType.Int);
            paramItems.Value = posgrado_id;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[doc].[spRegresaPosgrado]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Posgrado_Entidad p = new Posgrado_Entidad();
                        p.Posgrado_id = (int)reader["Posgrado_id"];
                        p.Nivel.Nivel_id = (int)reader["nivel_id"];
                        p.Nivel.Nombre = (string)reader["nivel_nombre"];
                        p.Estudio = (string)reader["estudio"];
                        p.UnivDondeEstudio = (string)reader["univDondeEstudio"];
                        p.Pais = (string)reader["pais"];
                        p.TituloGradoLegal = (bool)reader["tituloGradoLegal"];
                        p.PeriodoInicio = (DateTime)reader["periodoInicio"];
                        p.PeriodoFinal = (DateTime)reader["periodoFinal"];
                        p.Grado = (bool)reader["grado"];
                        p.NoCedula = (string)reader["noCedula"];
                        p.Comentarios = (string)reader["comentarios"];

                        listaPos.Add(p);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return listaPos;
        }

        public List<ExpDocente_Entidad> ExpDocente(ExpDocente_Entidad objExpDoc, string sOpcion)
        {
            List<ExpDocente_Entidad> listaExpPos = new List<ExpDocente_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;

            cmdItems.CommandText = "[doc].[spExperiencia_Docente]";

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@expDoc_Id", SqlDbType.Int);
            paramItems.Value = objExpDoc.ExpDoc_Id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@nomAsignatura", SqlDbType.VarChar,100);
            paramItems.Value = objExpDoc.NomAsignatura;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@nivelEscolar", SqlDbType.Int);
            paramItems.Value = objExpDoc.NivelEscolar.Nivel_id;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@institucion", SqlDbType.VarChar, 200);
            paramItems.Value = objExpDoc.Institucion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@periodoInicio", SqlDbType.SmallDateTime);
            paramItems.Value = objExpDoc.PeriodoInicio;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@periodoFinal", SqlDbType.SmallDateTime);
            paramItems.Value = objExpDoc.PeriodoFinal;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@categoriaDoc_Id", SqlDbType.Int);
            paramItems.Value = objExpDoc.CategoriaDoc.CategoDoc_Id;
            cmdItems.Parameters.Add(paramItems);
            
            paramItems = new SqlParameter("@resultEvaluacion", SqlDbType.Int);
            paramItems.Value = objExpDoc.ResultEvaluacion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@comentarios", SqlDbType.VarChar, 500);
            paramItems.Value = objExpDoc.Comentarios;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@usuario", SqlDbType.VarChar, 50);
            paramItems.Value = objExpDoc.Usuario.Usuario;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@equipo", SqlDbType.VarChar, 50);
            paramItems.Value = objExpDoc.Usuario.Equipo;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@fecha", SqlDbType.SmallDateTime);
            paramItems.Value = objExpDoc.Usuario.Fecha;
            cmdItems.Parameters.Add(paramItems);

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ExpDocente_Entidad ed = new ExpDocente_Entidad();
                        ed.ExpDoc_Id = (int)reader["expDoc_Id"];
                        ed.NomAsignatura = (string)reader["nomAsignatura"];
                        ed.NivelEscolar.Nivel_id = (int)reader["nivelEscolar"];
                        ed.NivelEscolar.Nombre= (string)reader["nivel_nombre"];
                        ed.Institucion = (string)reader["institucion"];
                        ed.PeriodoInicio = (DateTime)reader["periodoInicio"];
                        ed.PeriodoFinal = (DateTime)reader["periodoFinal"];
                        ed.CategoriaDoc.CategoDoc_Id = (int)reader["categoriaDoc_Id"];
                        ed.CategoriaDoc.Descripcion = (string)reader["categoriaDoc_Des"];
                        ed.ResultEvaluacion = (string)reader["resultEvaluacion"];
                        ed.Comentarios = (string)reader["comentarios"];

                        listaExpPos.Add(ed);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                coneccion.Close();
                cmdItems.Dispose();
            }
            return listaExpPos;
        }
        public List<ExpDocente_Entidad> RegresaExpDocente(string sOpcion, int expDoc_Id)
        {
            List<ExpDocente_Entidad> listaExpPos = new List<ExpDocente_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@opcion", SqlDbType.Char, 10);
            paramItems.Value = sOpcion;
            cmdItems.Parameters.Add(paramItems);

            paramItems = new SqlParameter("@expDoc_Id", SqlDbType.Int);
            paramItems.Value = expDoc_Id;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[doc].[RegresaExpDocente]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ExpDocente_Entidad ed = new ExpDocente_Entidad();
                        ed.ExpDoc_Id = (int)reader["expDoc_Id"];
                        ed.NomAsignatura = (string)reader["nomAsignatura"];
                        ed.NivelEscolar.Nivel_id = (int)reader["nivelEscolar"];
                        ed.NivelEscolar.Nombre = (string)reader["nivel_nombre"];
                        ed.Institucion = (string)reader["institucion"];
                        ed.PeriodoInicio = (DateTime)reader["periodoInicio"];
                        ed.PeriodoFinal = (DateTime)reader["periodoFinal"];
                        ed.CategoriaDoc.CategoDoc_Id = (int)reader["categoriaDoc_Id"];
                        ed.CategoriaDoc.Descripcion = (string)reader["categoriaDoc_Des"];
                        ed.ResultEvaluacion = (string)reader["resultEvaluacion"];
                        ed.Comentarios = (string)reader["comentarios"];

                        listaExpPos.Add(ed);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return listaExpPos;
        }
        public List<CategoriaDoc_Entidad> RegresaCategoria(int CategoDoc_Id)
        {
            List<CategoriaDoc_Entidad> lista = new List<CategoriaDoc_Entidad>();
            SqlCommand cmdItems = new SqlCommand();

            if (coneccion.State == ConnectionState.Broken || coneccion.State == ConnectionState.Closed)
                coneccion.Open();

            SqlParameter paramItems = new SqlParameter("@categoDoc_Id", SqlDbType.Int);
            paramItems.Value = CategoDoc_Id;
            cmdItems.Parameters.Add(paramItems);

            cmdItems.Connection = coneccion;
            cmdItems.CommandType = CommandType.StoredProcedure;
            cmdItems.CommandText = "[doc].[spRegresaCategoria_Doc]";

            try
            {
                using (SqlDataReader reader = cmdItems.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        CategoriaDoc_Entidad cde = new CategoriaDoc_Entidad();
                        cde.CategoDoc_Id = (int)reader["CategoDoc_Id"];
                        cde.Descripcion = (string)reader["Nombre"];
                        cde.PagoHr = (int)reader["PagoHr"];

                        lista.Add(cde);
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
