using System.Drawing;
using Entidades;

/// <summary>
/// Summary description for BaseUserControl
/// </summary>
public class BaseUserControl : System.Web.UI.UserControl
{
    /// <summary>
    /// obtiene de sesion los datos del usuario actual
    /// </summary>
    public Usuario_Entidad usuario
    {
        get
        {
            #region Datos del usuario para pruebas

            if (Session[Constantes.SESSION_LOGIN] == null)
            {
                //Usuario_Entidad u = new Usuario_Entidad();

                //u.Usuario = "Ricardo";
                //u.Equipo = "IDEV01";
                //u.Fecha = DateTime.Now;

                //Session[Constantes.SESSION_LOGIN] = u;

                Response.Redirect(ResolveUrl("~/Admin/Login.aspx"), false);
            }

            #endregion Datos del usuario para pruebas

            return (Usuario_Entidad)Session[Constantes.SESSION_LOGIN];
        }
    }

    /// <summary>
    /// Se da formato al tipo de Notificación que se desee.
    /// </summary>
    /// <param name="tipoMensaje">Satisfacción, Alerta, Información y Error.</param>
    /// <param name="Notificacion">La notificación que se mostrara en pantalla.</param>
    /// <param name="Titulo">Titulo que tendrá la notificación.</param>
    /// <returns>Regresa un objeto tipo mensaje con el formato, notificación y titulo deseado</returns>
    protected Mensaje GetMessages(Mensaje.TipoMens tipoMensaje, string Notificacion, string Titulo)
    {
        Mensaje mje = new Mensaje();

        mje.Notificacion = Notificacion;
        mje.Titulo = Titulo;

        switch (tipoMensaje)
        {
            case Mensaje.TipoMens.Alerta:
                mje.ColorBorde = Color.FromName("#F3D97E");
                mje.ColorFondo = Color.FromName("#FFF8D8");
                mje.ColorFuente = Color.FromName("#A68510");
                mje.Icono = "~/Images/icons/error.png";
                break;

            case Mensaje.TipoMens.Error:
                mje.ColorBorde = Color.FromName("#E4BBBC");
                mje.ColorFondo = Color.FromName("#F8E9E9");
                mje.ColorFuente = Color.FromName("#BF2C11");
                mje.Icono = "~/Images/icons/cross.png";
                break;

            case Mensaje.TipoMens.Satisfaccion:
                mje.ColorBorde = Color.FromName("#BEE4A5");
                mje.ColorFondo = Color.FromName("#EBF9E2");
                mje.ColorFuente = Color.FromName("#658C2C");
                mje.Icono = "~/Images/icons/accept.png";
                break;

            case Mensaje.TipoMens.Informacion:
                mje.ColorBorde = Color.FromName("#BBD7E4");
                mje.ColorFondo = Color.FromName("#E9F3F8");
                mje.ColorFuente = Color.FromName("#3876C6");
                mje.Icono = "~/Images/icons/help.png";
                break;

            case Mensaje.TipoMens.Nota:
                mje.ColorBorde = Color.FromName("#DEDEDE");
                mje.ColorFondo = Color.FromName("#F8F8F8");
                mje.ColorFuente = Color.FromName("#666");
                mje.Icono = "~/Images/icons/note.png";
                break;
            default:
                mje.ColorBorde = Color.Transparent;
                mje.ColorFondo = Color.Transparent;
                mje.Icono = string.Empty;
                break;
        }

        return mje;
    }
}