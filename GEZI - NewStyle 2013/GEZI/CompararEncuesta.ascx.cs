using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;
using System.Web.UI;

public partial class Encuesta : BaseUserControl
{
    private List<Plantel_Entidad> listaComparacion = new List<Plantel_Entidad>();
    private Views_Negocio vn = new Views_Negocio();
    private List<Encuesta_Entidad> lista = new List<Encuesta_Entidad>();
    private int counter = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlMensaje.Visible = false;
        bool primero = true;

        //if (!Page.IsPostBack)
        //{
        if (Session[Constantes.SESSION_COMPARA] != null)
        {
            listaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];
            int cont = 0;


            foreach (Plantel_Entidad p in
               listaComparacion.Count <= 5 ?
               listaComparacion.OrderBy(x => x.Numero_comp).Take(5) :
                listaComparacion.Where(x => x.Numero_comp >= (int)Session[Constantes.SESSION_COMPARADESDE]).Take(5).OrderBy(x => x.Numero_comp))
            {
                try
                {
                    lista = vn.RegresaDetalleEncuesta(p.Plantel_id);
                }
                catch
                {
                    PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                       "Error al intentar traer los registros de la encuesta.",
                                       "Alerta."));
                }
                cont++;

                //lblMensRegistros.Text = lista.Count.Equals(0) ? "ND" : string.Empty;
                //if (lista.Count == 0)
                //    continue;
                //else if (cont.Equals(6))
                //    return;

                if (primero)
                {
                    rptEncuesta.DataSource = lista;
                    rptEncuesta.DataBind();
                    primero = false;
                }

                if (lista.Count == 0)
                    continue;

                foreach (RepeaterItem item in rptEncuesta.Items)
                {
                    int encuesta_id = int.Parse(((HiddenField)item.FindControl("hfEncuesta_id")).Value);

                    if (!string.IsNullOrEmpty(lista.Where(n => n.Encuesta_id == encuesta_id).Select(x => x.Respuesta1).First()))
                        ((Label)item.FindControl("lblTRespuesta1" + cont)).Text = lista.Where(n => n.Encuesta_id == encuesta_id).Select(x => x.TRespuesta1).First().ToString();
                    if (!string.IsNullOrEmpty(lista.Where(n => n.Encuesta_id == encuesta_id).Select(x => x.Respuesta2).First()))
                        ((Label)item.FindControl("lblTRespuesta2" + cont)).Text = lista.Where(n => n.Encuesta_id == encuesta_id).Select(x => x.TRespuesta2).First().ToString();
                    if (!string.IsNullOrEmpty(lista.Where(n => n.Encuesta_id == encuesta_id).Select(x => x.Respuesta3).First()))
                        ((Label)item.FindControl("lblTRespuesta3" + cont)).Text = lista.Where(n => n.Encuesta_id == encuesta_id).Select(x => x.TRespuesta3).First().ToString();
                    if (!string.IsNullOrEmpty(lista.Where(n => n.Encuesta_id == encuesta_id).Select(x => x.Respuesta4).First()))
                        ((Label)item.FindControl("lblTRespuesta4" + cont)).Text = lista.Where(n => n.Encuesta_id == encuesta_id).Select(x => x.TRespuesta4).First().ToString();
                    if (!string.IsNullOrEmpty(lista.Where(n => n.Encuesta_id == encuesta_id).Select(x => x.Respuesta5).First()))
                        ((Label)item.FindControl("lblTRespuesta5" + cont)).Text = lista.Where(n => n.Encuesta_id == encuesta_id).Select(x => x.TRespuesta5).First().ToString();
                }
            }
        }

        //}
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
            return "#F2F2F2";
        else
            return "#FFF";
    }
}