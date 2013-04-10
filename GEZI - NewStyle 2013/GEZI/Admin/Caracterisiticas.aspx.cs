using System;
using System.Web.UI;
using Entidades;
using Negocios;

public partial class Admin_Caracterisiticas : BasePage
{
    private Plantel_Entidad sesion_pe = new Plantel_Entidad();

    protected void Page_Load(object sender, EventArgs e)
    {
        //Plantel_Entidad pe = new Plantel_Entidad();
        //pe.Institucion.Institucion_id = 2;
        //pe.Plantel_id = 1;
        //Session[Constantes.SESSION_PLANTEL] = pe;

        if (Session[Constantes.SESSION_PLANTEL] != null)
            sesion_pe = (Plantel_Entidad)Session[Constantes.SESSION_PLANTEL];
        else
        {
            Response.Redirect("~/Admin/Inicio_Admin.aspx", false);
            return;
        }

        Institucion_Entidad ie = new Institucion_Entidad();
        Views_Negocio vn = new Views_Negocio();
        Control nivel = new Control();

        if (sesion_pe.Institucion.Institucion_id.Equals(0))
        {
            Response.Redirect("~/Admin/Inicio_Admin.aspx", false);
            return;
        }

        try
        {
            ie = vn.RegresaInstitucion(sesion_pe.Institucion.Institucion_id, Constantes.PORID);

            switch (ie.Nivel.Nivel_id)
            {
                case (int)Institucion_Entidad.Niveles.Preescolar:
                    nivel = Page.LoadControl("~/Admin/Preescolar.ascx");
                    break;

                case (int)Institucion_Entidad.Niveles.Primaria:
                    nivel = Page.LoadControl("~/Admin/Primaria.ascx");
                    break;

                case (int)Institucion_Entidad.Niveles.Secundaria:
                    nivel = Page.LoadControl("~/Admin/Secundaria.ascx");
                    break;

                case (int)Institucion_Entidad.Niveles.Preparatoria:
                    nivel = Page.LoadControl("~/Admin/Preparatoria.ascx");
                    break;

                case (int)Institucion_Entidad.Niveles.Universidad:
                    nivel = Page.LoadControl("~/Admin/Universidad.ascx");
                    break;
            }

            PlaceHolder1.Controls.Clear();
            PlaceHolder1.Controls.Add(nivel);
        }
        catch
        {
            Session[Constantes.SESSION_NOTIFICACION] = "Alerta,Alerta.,Ocurrio un problema al querer acceder al nivel institucional al que pertenece el plantel, intente de nuevo. ";

            Response.Redirect("~/Admin/Inicio_Admin.aspx", false);
        }
    }
}