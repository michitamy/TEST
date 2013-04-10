using System.Collections.Generic;
using Datos;
using Entidades;

namespace Negocios
{
    public class Escuelas_Negocio
    {
        public Escuelas_Dato objEscuela = null;

        public Escuelas_Negocio()
        {
            objEscuela = new Escuelas_Dato();
        }

        /// <summary>
        /// Método para agregar o modificar una institución, se manda a llamar al
        /// método AMInstitucion en la clase Escuelas_Datos.
        /// </summary>
        /// <param name="ie">Objeto tipo Institucion_Entidad con los registros de la institución.</param>
        /// <param name="sOpcion">Indica si va ha ser una inserción o una modificación de registros.</param>
        /// <returns>Se obtiene el numero de identificación del instituto.</returns>
        public int AMInstitucion(Institucion_Entidad ie, string sOpcion)
        {
            return objEscuela.AMInstitucion(ie, sOpcion);
        }

        /// <summary>
        /// Método para agregar o modificar una carrera, se manda a llamar al
        /// método AMCarrera en la clase Escuelas_Datos.
        /// </summary>
        /// <param name="ce">Objeto tipo Carreras_Entidad con los datos de la carrera.</param>
        /// <param name="sOpcion">Indica si va a ser una inserción o una modificación de registros.</param>
        /// <returns>Se obtiene una lista con todos las carreras pertenecientes a un mismo plantel.</returns>
        public List<Carreras_Entidad> AMCarrera(Carreras_Entidad ce, string sOpcion)
        {
            return objEscuela.AMCarrera(ce, sOpcion);
        }

        /// <summary>
        /// Método para agregar o modificar un plantel, se manda a llamar al
        /// método AMPlantel en la clase Escuelas_Datos.
        /// </summary>
        /// <param name="pe">Objeto tipo Plantel_Entidad con los registros del plantel.</param>
        /// <param name="sOpcion">Indica si va ha ser una inserción o una modificación de registros.</param>
        /// <returns>Se obtiene el numero de identificación del plantel.</returns>
        public int AMPlantel(Plantel_Entidad pe, string sOpcion)
        {
            return objEscuela.AMPlantel(pe, sOpcion);
        }

        /// <summary>
        /// Metodo para remover una institucion, mientras no tenga asignado un plantel
        /// </summary>
        /// <param name="iIID">ID de la institucion que se desea remover</param>
        /// <returns>Indicar si se removio correctamente la institucion</returns>
        public int RemueveInstitucion(int iIID)
        {
            return objEscuela.RemueveInstitucion(iIID);
        }

        /// <summary>
        /// Metodo para remover un plantel, miestras no tenga asignado un cuestionario
        /// </summary>
        /// <param name="iPID">ID del plantel que se desea remover</param>
        /// <returns>Indicar si se removio correctamente el plantel</returns>
        public int RemuevePlantel(int iPID)
        {
            return objEscuela.RemuevePlantel(iPID);
        }

        /// <summary>
        /// Método para agregar o modificar un cuestionario a un plantel, se manda a llamar al
        /// método AMCaracteristica en la clase Escuelas_Datos.
        /// </summary>
        /// <param name="ce">Objeto tipo Caracteristicas_Entidad con los registros del cuestionario.</param>
        /// <param name="sOpcion">Indica si va ha ser una inserción o una modificación de registros.</param>
        /// <returns>Se obtiene el numero de identificación del cuestionario.</returns>
        public int AMCaracteristica(Caracteristicas_Entidad ce, string sOpcion)
        {
            return objEscuela.AMCaracteristica(ce, sOpcion);
        }

        /// <summary>
        /// Metodo para remover la caracteristica del plantel
        /// </summary>
        /// <param name="iCaractID">ID de la caracteristica(cuestionario) que se desea remover</param>
        /// <param name="iPlantelID">ID del plantel que se hace referencia a la caracteristica(cuestionarion).</param>
        /// <returns>Indicar si se removio correctamente la caracterisitica(cuestionarion).</returns>
        public int RemueveCaracteristica(int iCaractID, int iPlantelID)
        {
            return objEscuela.RemueveCaracteristica(iCaractID, iPlantelID);
        }

        /// <summary>
        /// Método para agregar o modificar una encuesta o preguntas, se manda a llamar al
        /// método AMEncuesta en la clase Escuelas_Datos.
        /// </summary>
        /// <param name="ee">Objeto tipo Encuesta_Entidad con los datos de la pregunta.</param>
        /// <param name="sOpcion">Indica si va a ser una inserción o una modificación de registros.</param>
        /// <returns>Se obtiene el número de guía(GUID) de la encuesta.</returns>
        public List<Encuesta_Entidad> AMEncuesta(Encuesta_Entidad ee, string sOpcion)
        {
            return objEscuela.AMEncuesta(ee, sOpcion);
        }

        /// <summary>
        /// Método para remover una encuesta o una pregunta.
        /// </summary>
        /// <param name="sGuidEncuesta">Numero de guía de la encuesta que se desea remover.</param>
        /// <param name="iPregunta">ID de la pregunta que se desea remover.</param>
        /// <returns>Indicar si se removió correctamente la encuesta o la pregunta.</returns>
        public List<Encuesta_Entidad> RemueveEncuesta(string sGuidEncuesta, int iPregunta, string sOpcion)
        {
            return objEscuela.RemueveEncuesta(sGuidEncuesta, iPregunta, sOpcion);
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
            return objEscuela.AMResultadoEncuesta(ree);
        }

        /// <summary>
        /// Metodo para remover los resultados de una encuesta.
        /// </summary>
        /// <param name="iPlantelID">ID del plantel que se desea remover sus resultados.</param>
        /// <returns>Indicar si se removio correctamente los resutaldos.</returns>
        public int RemueveResultados(int iPlantelID)
        {
            return objEscuela.RemueveResultados(iPlantelID);
        }

        public bool PerteneceMismoNivel(List<Plantel_Entidad> lista, Nivel_Entidad.Niveles nivel)
        {
            foreach (Plantel_Entidad p in lista)
            {
                if (!p.Institucion.Nivel.Nivel_id.Equals((int)nivel))
                    return false;
            }

            return true;
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
            return objEscuela.RemueveCarrera(iCarrera_id, Plantel_id);
        }

        public int TotalHojas(int registros)
        {
            int numerados;
            int denominador;

            decimal division = registros / 5.0M;
            numerados = int.Parse(division.ToString("N2").Split('.')[0]);
            denominador = int.Parse(division.ToString("N2").Split('.')[1]);

            return (denominador.Equals(0)) ? numerados : numerados + 1;

        }
    }
}