using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;

public partial class Admin_LlenadoEncuesta : BasePage
{
    private Escuelas_Negocio en = null;
    private Views_Negocio vn = null;
    private Plantel_Entidad sesion_pe;
    private int counter = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        string sGUID = string.Empty;
        pnlMensaje.Visible = false;

        if (!Page.IsPostBack)
        {
            sGUID = Request.QueryString["guid"];

            List<Encuesta_Entidad> lista = new List<Encuesta_Entidad>();
            vn = new Views_Negocio();
            try
            {
                if (Session[Constantes.SESSION_PLANTEL] != null)
                    sesion_pe = (Plantel_Entidad)Session[Constantes.SESSION_PLANTEL];

                lista = vn.RegresaEncuestas(sGUID, sesion_pe.Plantel_id, Constantes.PORGUID);

                lblEncuesta.Text = lista.Select(a => a.Nombre).First().Trim();

                rptLlenaEncuesta.DataSource = lista;
                rptLlenaEncuesta.DataBind();
            }
            catch (Exception ex)
            {
                Session[Constantes.SESSION_NOTIFICACION] = "Error,Error.,Error al consultar la encuesta. " + ex.Message;
                Response.Redirect("~/Admin/Inicio_Admin.aspx", false);
            }
        }
    }

    protected void RptLlenaEncuesta_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        if (Session[Constantes.SESSION_PLANTEL] != null)
            sesion_pe = (Plantel_Entidad)Session[Constantes.SESSION_PLANTEL];

        int errores = 0;

        foreach (RepeaterItem ri in rptLlenaEncuesta.Items)
        {
            int resultado = -1;
            RE_Entidad ree = new RE_Entidad();
            en = new Escuelas_Negocio();

            string respuesta1 = ((TextBox)ri.FindControl("txtRespuesta1")).Text.Trim();
            string respuesta2 = ((TextBox)ri.FindControl("txtRespuesta2")).Text.Trim();
            string respuesta3 = ((TextBox)ri.FindControl("txtRespuesta3")).Text.Trim();
            string respuesta4 = ((TextBox)ri.FindControl("txtRespuesta4")).Text.Trim();
            string respuesta5 = ((TextBox)ri.FindControl("txtRespuesta5")).Text.Trim();

            string r1 = ((HiddenField)ri.FindControl("hfRespuesta1")).Value.Trim();
            string r2 = ((HiddenField)ri.FindControl("hfRespuesta2")).Value.Trim();
            string r3 = ((HiddenField)ri.FindControl("hfRespuesta3")).Value.Trim();
            string r4 = ((HiddenField)ri.FindControl("hfRespuesta4")).Value.Trim();
            string r5 = ((HiddenField)ri.FindControl("hfRespuesta5")).Value.Trim();

            if (string.Equals(r1, respuesta1) && string.Equals(r2, respuesta2) &&
                    string.Equals(r3, respuesta3) && string.Equals(r4, respuesta4) && string.Equals(r5, respuesta5))
                continue;

            ree.Plantel.Plantel_id = sesion_pe.Plantel_id;
            ree.Encuesta_id = int.Parse(((HiddenField)ri.FindControl("hfEncuesta_id")).Value);

            ree.TRespuesta1 = string.IsNullOrEmpty(respuesta1) ? -1 : int.Parse(respuesta1);
            ree.TRespuesta2 = string.IsNullOrEmpty(respuesta2) ? -1 : int.Parse(respuesta2);
            ree.TRespuesta3 = string.IsNullOrEmpty(respuesta3) ? -1 : int.Parse(respuesta3);
            ree.TRespuesta4 = string.IsNullOrEmpty(respuesta4) ? -1 : int.Parse(respuesta4);
            ree.TRespuesta5 = string.IsNullOrEmpty(respuesta5) ? -1 : int.Parse(respuesta5);

            ree.Usuario.Equipo = usuario.Equipo;
            ree.Usuario.Fecha = DateTime.Now;
            ree.Usuario.Usuario = usuario.Usuario;

            try
            {
                resultado = en.AMResultadoEncuesta(ree);
            }
            catch
            { errores += 1; }
        }

        if (errores == 0)
        {
            Session[Constantes.SESSION_NOTIFICACION] = "Satisfaccion,Bien.,Los registros para la encuesta fueron almacenados correctamente. ";
            Response.Redirect("~/Admin/Inicio_Admin.aspx", false);
        }
        else
            PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                     "Hubo unos errores durante la ejecución, verifique los datos e intente de nuevo.",
                                     "Alerta"));
    }

    /// <summary>
    /// Para darle formato al control que muestra las notificaciones en pantalla
    /// </summary>
    /// <param name="mje">Objecto con los datos del mensaje</param>
    protected void PintaPanel(Mensaje mje)
    {

        string jScript;
        jScript = "function lunchboxClose() {" +
          "document.getElementById('pnlMensaje').style.display = 'none';" +
          "}";

        ScriptManager.RegisterStartupScript(this, typeof(Page), "CloseScript", jScript, true);

        pnlMensaje.Style.Add("Display", "inherit");
        pnlMensaje.BorderColor = mje.ColorBorde;
        pnlMensaje.BackColor = mje.ColorFondo;

        lblTitulo.Text = mje.Titulo;
        lblMensaje.Text = mje.Notificacion;

        imgMensaje.ImageUrl = mje.Icono;
    }

    /// <summary>
    /// Funcion para alternar colores de los rengloes del control Repeater
    /// </summary>
    /// <returns>Regresa el color que le corresponda.</returns>
    protected string GetRowColor()
    {
        if (counter++ % 2 == 0)
            return "#E0E0E0";
        else
            return "#F4F4F4";
    }
}