namespace Entidades
{
    /// <summary>
    /// Constantes utilizadas dentro de la aplicación
    /// </summary>
    public class Constantes
    {
        #region Sesiones

        public static string SESSION_LOGIN          = "Usuario_Login";
        public static string SESSION_PLANTEL        = "Plantel";
        public static string SESSION_PLANTELES      = "ListaPlanteles";
        public static string SESSION_CARACTERISTICA = "Caracteristica";
        public static string SESSION_ESCUELAS       = "Escuela";
        public static string SESSION_COMPARA        = "Comparar";
        public static string SESSION_USUARIOS       = "ListaUsuarios";
        public static string SESSION_NIVEL          = "Nivel";
        public static string SESSION_CARRERA        = "Carrera";
        public static string SESSION_COMPARADESDE   = "NoComparacionActual";
        public static string SESSION_LICENCIATURA   = "Licenciatura";
        public static string SESSION_LICENCIATURAS  = "ListaLicenciaturas";
        public static string SESSION_POSGRADO       = "Posgrado";
        public static string SESSION_POSGRADOS      = "ListaPosgrados";
        public static string SESSION_EXPDOCENTE     = "ExpDocente";
        public static string SESSION_EXPDOCENTES    = "ListaExpDocente";

        /// <summary>
        ///Para las notificaciones debe de ser una cadena separado por comas.
        ///El primer valor debe de ser el TIPO, despues el TITULO y por ultimo
        ///el MENSAJE ejm."Constantes.ALERTA,'Alerta','Hay una alerta.'"
        ///Para el TIPO pueden aplicar solo estos: [Alerta][Error][Satisfaccion][Informacion][Nota]
        /// </summary>
        public static string SESSION_NOTIFICACION = "Notificacion";

        #endregion Sesiones

        #region Acciones

        public static string AGREGAR = "AGREGA";
        public static string ACTUALIZAR = "ACTUALIZA";
        public static string ELIMINAR = "ELIMINA";
        public static string SELECCIONA = "SELECCIONA";
        public static string RESTAURAR = "RESTAURA";
        public static string RECUPERAR = "RECUPERAR"; //Varibale para recuperar la contraseña
        public static string MASCARA_CONTRASENIA = "{@gez#12@}"; //Mascar para las contraseñas

        #endregion Acciones

        #region Opciones

        public static string ESTADO = "EDO";
        public static string CIUDAD = "CDD";

        public static string TODOS = "TODOS";
        public static string TODOS_PORID = "TODO_PorID";
        public static string PORID = "PorID";
        public static string PORPLANTEL = "PorPLTL";
        public static string PORNOMBRE = "PorNMBRE";
        public static string PORGUID = "PorGUID";
        public static string PORNIVEL = "PorNIVEL";
        public static string PORENCUESTA = "ENCUESTA";
        public static string PORPREGUNTA = "PREGUNTA";
        public static string TIPOPLANTEL = "TIPO";
        public static string PORMunEst = "PorMoE"; //Por municipio o estado

        #endregion Opciones
    }
}