using System.Collections.Generic;
using Datos;
using Entidades;

namespace Negocios
{
    public class Views_Negocio
    {
        public Views_Dato objViews = null;

        public Views_Negocio()
        {
            objViews = new Views_Dato();
        }

        /// <summary>
        /// Llama a la clase datos, metodo RegresaTipos
        /// </summary>
        /// <returns>Regresa la lista de "Tipos de escuelas" disponibles en la base de datos.</returns>
        public List<Tipo_Entidad> RegresaTipos()
        {
            return objViews.RegresaTipos();
        }

        /// <summary>
        /// Llama a la clase datos, metodo RegresaNiveles
        /// </summary>
        /// <param name="Porcarrera">Indica si va traer solo los niveles de Licenciatura, Especialidad, Maestria, Doctorado.
        /// Estos niveles solo aplican para el caso de que el usuario elija como nivel Licenciatura.</param>
        /// <returns>Regresa la lista de "Niveles de escuelas" disponibles en la base de datos.</returns>
        public List<Nivel_Entidad> RegresaNiveles(bool Porcarrera)
        {
            return objViews.RegresaNiveles(Porcarrera);
        }

        /// <summary>
        /// Llama a la clase datos, metodo Nacion
        /// </summary>
        /// <param name="iCE">Codigo de la entidad(ciudad) de la que se quieren traer sus municipios(estados), en caso de que lo necesite.</param>
        /// <param name="tipo">Ciudad o Estado</param>
        /// <returns>Regresa la lista de los "Estados" o ciudad disponibles en la base de datos.</returns>
        public List<Plantel_Entidad> Nacion(int iCE, string tipo)
        {
            return objViews.Nacion(iCE, tipo);
        }

        /// <summary>
        /// Llama a la clase datos, método RegresaInstituciones
        /// </summary>
        /// <param name="opcion">Indicas el tipo de búsqueda que deseas. Todos, PorID, etc.</param>
        /// <returns>Regresa la lista de las "Instituciones" en la base de datos.</returns>
        public List<Institucion_Entidad> RegresaInstituciones(string opcion)
        {
            return objViews.RegresaInstituciones(opcion);
        }

        /// <summary>
        /// Llama a la clase datos, método RegresaInstitucion
        /// </summary>
        /// <param name="iInst">Indicas el id de la institución que deseas buscar.</param>
        /// <param name="opcion">Indicas el tipo de búsqueda que deseas. Todos, PorID, etc.</param>
        /// <returns>Regresa solo la institución indicada por su Id.</returns>
        public Institucion_Entidad RegresaInstitucion(int iInst, string opcion)
        {
            return objViews.RegresaInstitucion(iInst, opcion);
        }

        /// <summary>
        /// Llama a la clase datos, metodo RegresaPlanteles
        /// </summary>
        /// <param name="iIE">Id de la institucion de la que se quieren traer sus planteles.</param>
        /// <param name="opcion">Por id o todos</param>
        /// <returns>Regresa la lista de los "Planteles" para una institucion disponibles en la base de datos.</returns>
        public List<Plantel_Entidad> RegresaPlanteles(int iIE, string opcion)
        {
            return objViews.RegresaPlanteles(iIE, opcion);
        }

        /// <summary>
        /// Llama a la clase datos, metodo RegresaPlantel
        /// </summary>
        /// <param name="iPE">Id del plantel de la que se quieren traer.</param>
        /// <param name="opcion">Indicas el tipo de búsqueda que deseas. Todos, PorID, etc.</param>
        /// <returns>Regresa solo el plantel indicado por su Id.</returns>
        public Plantel_Entidad RegresaPlantel(int iPE, string opcion)
        {
            return objViews.RegresaPlantel(iPE, opcion);
        }

        /// <summary>
        /// Llama a la clase datos, metodo RegresaTiposRVOEs
        /// </summary>
        /// <returns>Regresa la lista de los tipos de "RVOE" disponibles en la base de datos.</returns>
        public List<TipoRVOE_Entidad> RegresaTiposRVOEs()
        {
            return objViews.RegresaTiposRVOEs();
        }

        /// <summary>
        /// Llama a la clase datos, método RegresaCaracteristica
        /// </summary>
        /// <param name="iCaract">Indicas el id de la característica que deseas buscar.</param>
        /// <param name="iPlantel">Indicas el id del plantel que deseas buscar.</param>
        /// <param name="opcion">Indicas el tipo de búsqueda que deseas. Todos, PorID, etc.</param>
        /// <returns>Regresa solo la característica indicada por su Id o por el IdPlantel que haga referencia.</returns>
        public Caracteristicas_Entidad RegresaCaracteristica(int iCaract, int iPlantel, string opcion)
        {
            return objViews.RegresaCaracteristica(iCaract, iPlantel, opcion);
        }

        /// <summary>
        /// Llama a la clase datos, metodo RegresaEncuestas.
        /// </summary>
        /// <param name="sNombre">Nombre de la encuesta que se quiere buscar. En este campo se puede indicar
        /// su numero de guia (GUID)</param>
        /// <param name="opcion">Indicas el tipo de búsqueda que deseas. Todos, PorNombre, etc.</param>
        /// <returns>Aquí se trae todos los nombres de las encuestas que coincidan con el texto
        /// que este ingresando en el control.</returns>
        public List<Encuesta_Entidad> RegresaEncuestas(string sNombre, int plantel_id, string opcion)
        {
            return objViews.RegresaEncuestas(sNombre, plantel_id, opcion);
        }

        /// <summary>
        /// Llama a la clase datos, metodo RegresaPlantel.
        /// </summary>
        /// <param name="sNombre">Nombre de la encuesta que se quiere buscar. En este campo se puede indicar
        /// su numero de guia (GUID)</param>
        /// <param name="opcion">Indicas el tipo de búsqueda que deseas. Todos, PorNombre, etc.</param>
        /// <returns>Aquí se trae todos los nombres de las encuestas que coincidan con el texto
        /// que este ingresando en el control.</returns>
        public List<Encuesta_Entidad> RegresaEncabezados(string sNombre, string opcion)
        {
            return objViews.RegresaEncabezados(sNombre, opcion);
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
            return objViews.RegresaDetallePlanteles(iCiudad_id, iEscuela_id, iNivel_id, sCarrera);
        }

        public Caracteristicas_Entidad RegresaDetalleResumen(int plantel_id, int Carrera_id)
        {
            return objViews.RegresaDetalleResumen(plantel_id, Carrera_id);
        }

        public Caracteristicas_Entidad RegresaDetalleExtras(int plantel_id, int Carrera_id)
        {
            return objViews.RegresaDetalleExtras(plantel_id, Carrera_id);
        }

        public List<Encuesta_Entidad> RegresaDetalleEncuesta(int plantel_id)
        {
            return objViews.RegresaDetalleEncuesta(plantel_id);
        }

        public List<Plantel_Entidad> ActualizaNumeracionList(List<Plantel_Entidad> lista)
        {
            int cont = 1;

            foreach (Plantel_Entidad p in lista)
                p.Numero_comp = cont++;

            return lista;
        }

        /// <summary>
        /// Llama a la clase datos, metodo RegresaCarreras.
        /// </summary>
        /// <param name="plantel_id">Numero de identificacion del plantel que se desea consultar sus carreras disponibles.</param>
        /// <param name="opcion">Indica el tipo de consulta que se desea que se ejecute en la base de datos.</param>
        /// <returns>Regresa las carreras disponibles para un mismo plantel.</returns>
        public List<Carreras_Entidad> RegresaCarreras(int plantel_id, string opcion)
        {
            return objViews.RegresaCarreras(plantel_id, opcion);
        }

        public static double FormatoDecimal(string val)
        {
            if (string.IsNullOrEmpty(val))
                return 0.00;

            double fraccion = double.Parse(val);

            fraccion = fraccion * 0.01;

            return fraccion;
        }

        public int RegresaTipoPlanteles(int iPlantel_ID, string opcion)
        {
            return objViews.RegresaTipoPlanteles(iPlantel_ID, opcion);
        }

        public List<Institucion_Entidad> RegresaInstituciones_PorEstadoMunicipio(int iEstado, int iMunicipio, string opcion)
        {
            return objViews.RegresaInstituciones_PorEstadoMunicipio(iEstado, iMunicipio, opcion);
        }
    }
}