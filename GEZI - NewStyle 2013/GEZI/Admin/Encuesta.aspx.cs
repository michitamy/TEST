using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;

public partial class Admin_Encuesta : BasePage
{
    private Escuelas_Negocio en = null;
    private Views_Negocio vn = null;
    private List<Encuesta_Entidad> lsesion_ee = null;
    private List<Encuesta_Entidad> lista = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        //pnlMensaje.Visible = false;
        pnlMensaje.Style.Add("Display", "none");

        if (!Page.IsPostBack)
        {
            LimpiarCampos(true);
            //pnlEncuesta.Enabled = false;
        }
        //else
        //{
        //    if (Request.Form["__EVENTTARGET"] != null &&
        //       Request.Form["__EVENTTARGET"] == "AutoCompleteExtender" &&
        //       Request.Form["__EVENTARGUMENT"] != null)
        //    {
        //        // Emulate button click search
        //        btnBuscar_Click(null, null);
        //    }
        //}
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpiarCampos(false);
    }

    protected void btnAgregarPregunta_Click(object sender, EventArgs e)
    {
        Encuesta_Entidad ee = new Encuesta_Entidad();
        en = new Escuelas_Negocio();
        List<Encuesta_Entidad> lista = new List<Encuesta_Entidad>();
        string notificacion = string.Empty;

        ee.Nombre = txtNombre.Text.Trim();
        ee.Nivel.Nivel_id = int.Parse(ddlNivel.SelectedValue);
        ee.PreguntaNo = string.IsNullOrEmpty(txtPreguntaNo.Text) ? 0 : int.Parse(txtPreguntaNo.Text.Trim());
        ee.Pregunta = txtPregunta.Text.Trim();
        ee.Respuesta1 = txtRespuesta1.Text.Trim();
        ee.Respuesta2 = txtRespuesta2.Text.Trim();
        ee.Respuesta3 = txtRespuesta3.Text.Trim();
        ee.Respuesta4 = txtRespuesta4.Text.Trim();
        ee.Respuesta5 = txtRespuesta5.Text.Trim();
        ee.Usuario.Equipo = usuario.Equipo;
        ee.Usuario.Fecha = DateTime.Now;
        ee.Usuario.Usuario = usuario.Usuario;

        if (!string.IsNullOrEmpty(hfEncuesta_GUID.Value))
            ee.GUID = System.Guid.Parse(hfEncuesta_GUID.Value);
        else
            ee.GUID = System.Guid.NewGuid();

        try
        {
            if (hfAccion.Value == Constantes.AGREGAR)
            {
                lista = en.AMEncuesta(ee, Constantes.AGREGAR);

                notificacion = "Los datos para la encuesta fueron agregados correctamente.";
            }
            else
            {
                ee.Encuesta_id = int.Parse(hfID.Value);
                lista = en.AMEncuesta(ee, Constantes.ACTUALIZAR);

                notificacion = "Los datos para la encuesta fueron actualizados correctamente.";
            }

            if (lista.Count > 0)
            {
                //txtNombre.Enabled = false;
                lbEliminarEnc.Visible = true;
                LlenaCampos(lista);

                if (cbLimpiar.Checked)
                    LimpiarCampos(false);
                else
                {
                    txtPregunta.Text = string.Empty;
                    btnAgregarPregunta.Text = "Agregar";

                    hfAccion.Value = Constantes.AGREGAR;
                    btnCancelar.Visible = false;
                }

                PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
             notificacion,
              "Bien."));
            }
            else
                PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                       "No se pudo guardar la encuesta, verifique la información e intente de nuevo.",
                                       "Alerta."));
        }
        catch (Exception ex)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
              ex.Message,
              "Error."));
        }

        txtPregunta.Focus();
        gvEncuesta.DataBind();
    }

    //protected void btnBuscar_Click(object sender, EventArgs e)
    //{
    //    lista = new List<Encuesta_Entidad>();
    //    vn = new Views_Negocio();

    //    lista = vn.RegresaEncuestas(txtBuscaEncuesta.Text.Trim(), -1, Constantes.PORNOMBRE);

    //    if (lista.Count > 0)
    //    {
    //        if (lista.GroupBy(x => x.GUID).Count() == 1)
    //            LlenaCampos(lista);
    //        else
    //        {
    //            Session[Constantes.SESSION_ESCUELAS] = lista;

    //            gvListaEncuestas.DataSource = lista.GroupBy(x => x.GUID).Select(a => a.First()).ToList();
    //            gvListaEncuestas.DataBind();

    //            mpeListaEncuestas.Show();
    //        }

    //        LimpiarCampos(true);
    //    }
    //}

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        lsesion_ee = new List<Encuesta_Entidad>();
        System.Guid sGUID;

        if (Session[Constantes.SESSION_ESCUELAS] != null)
        {
            sGUID = System.Guid.Parse(((HiddenField)gvEncuesta.Rows[0].FindControl("hfGUID")).Value);

            lsesion_ee = (List<Encuesta_Entidad>)Session[Constantes.SESSION_ESCUELAS];
            txtPreguntaNo.Text = (lsesion_ee.Where(x => x.GUID == sGUID & x.Encuesta_id != 0).Count() + 1).ToString();
        }

        LimpiarCampos(true);
        //pnlEncuesta.Enabled = true;
    }

    protected void GvEncuesta_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);

        if (e.CommandName == Constantes.ACTUALIZAR)
        {
            //txtNombre.Enabled = true;
            //pnlEncuesta.Enabled = true;

            txtPregunta.Text = ((Label)row.FindControl("lblPregunta")).Text.Trim();
            txtPreguntaNo.Text = ((Label)row.FindControl("lblPreguntaNo")).Text.Trim();
            txtRespuesta1.Text = ((Label)row.FindControl("lblRespuesta1")).Text.Trim();
            txtRespuesta2.Text = ((Label)row.FindControl("lblRespuesta2")).Text.Trim();
            txtRespuesta3.Text = ((Label)row.FindControl("lblRespuesta3")).Text.Trim();
            txtRespuesta4.Text = ((Label)row.FindControl("lblRespuesta4")).Text.Trim();
            txtRespuesta5.Text = ((Label)row.FindControl("lblRespuesta5")).Text.Trim();
            txtNombre.Text = ((HiddenField)row.FindControl("hfNombre")).Value;

            hfEncuesta_GUID.Value = ((HiddenField)row.FindControl("hfGUID")).Value;
            hfID.Value = ((HiddenField)row.FindControl("hfEncuesta_id")).Value;
            hfAccion.Value = Constantes.ACTUALIZAR;

            btnAgregarPregunta.Text = "Actualizar";
            btnCancelar.Visible = true;
        }
        else if (e.CommandName == Constantes.ELIMINAR)
        {
            if (RemueveInformacion(((HiddenField)row.FindControl("hfGUID")).Value,
                                    int.Parse(((HiddenField)row.FindControl("hfEncuesta_id")).Value),
                                    gvEncuesta.Rows.Count > 1 ? Constantes.PORPREGUNTA : Constantes.PORENCUESTA))
            {
                LimpiarCampos(false);

                btnAgregarPregunta.Text = "Agregar";

                hfAccion.Value = Constantes.AGREGAR;
                btnCancelar.Visible = false;
            }
        }
    }

    protected void GvListaEncuestas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
        lsesion_ee = new List<Encuesta_Entidad>();
        System.Guid sGUID;

        if (e.CommandName == Constantes.SELECCIONA)
        {
            lsesion_ee = (List<Encuesta_Entidad>)Session[Constantes.SESSION_ESCUELAS];
            sGUID = System.Guid.Parse(((Label)row.FindControl("lblGUID")).Text.Trim());

            hfEncuesta_GUID.Value = lsesion_ee.Where(x => x.GUID == sGUID).Select(a => a.GUID).First().ToString();
            txtNombre.Text = lsesion_ee.Where(x => x.GUID == sGUID).Select(a => a.Nombre).First().Trim();
            txtPreguntaNo.Text = (lsesion_ee.Where(x => x.GUID == sGUID & x.Encuesta_id != 0).Count() + 1).ToString();
            cddNivel.SelectedValue = (lsesion_ee.Where(x => x.GUID == sGUID).Select(a => a.Nivel.Nivel_id).First().ToString());

            lbEliminarEnc.Visible = true;
            gvEncuesta.DataSource = lsesion_ee.Where(x => x.GUID == sGUID & x.Encuesta_id != 0);
            gvEncuesta.DataBind();
        }
    }

    protected void ddlNivel_SelectedIndexChanged(object sender, EventArgs e)
    {
        LimpiarCampos(true);

        if (string.IsNullOrEmpty(ddlNivel.SelectedValue))
            return;

        //pnlEncuesta.Enabled = true;
        lista = new List<Encuesta_Entidad>();
        vn = new Views_Negocio();

        lista = vn.RegresaEncuestas(ddlNivel.SelectedValue, -1, Constantes.PORNIVEL);

        if (lista.Count > 0)
            LlenaCampos(lista);
        else
            gvEncuesta.DataBind();

        //pnlEncuesta.Enabled = true;
    }

    protected void lbEliminarEnc_Click(object sender, EventArgs e)
    {
        if (RemueveInformacion(hfEncuesta_GUID.Value, -1, Constantes.PORENCUESTA))
            LimpiarCampos(true);
    }

    /// <summary>
    /// Se llenan los campos del formulario desde una lista
    /// </summary>
    /// <param name="lista">Lista de tipo Encuesta_Entidad</param>
    protected void LlenaCampos(List<Encuesta_Entidad> lista)
    {
        hfEncuesta_GUID.Value = lista.Select(a => a.GUID).First().ToString();

        txtNombre.Text = lista.Select(a => a.Nombre).First().Trim();
        txtPreguntaNo.Text = (lista.Count() + 1).ToString();
        cddNivel.SelectedValue = lista.Select(a => a.Nivel.Nivel_id).First().ToString();

        lbEliminarEnc.Visible = true;
        gvEncuesta.DataSource = lista;
        gvEncuesta.DataBind();
    }

    /// <summary>
    /// Funcion para remover una Encuesta o una Pregunta de la base de datos
    /// </summary>
    /// <param name="guid">Numero de guía (GUID) de la encuesta.</param>
    /// <param name="encuesta_id">Numero de ID para la pregunta de una encuesta.</param>
    /// <param name="opcion">Tipo de registro que se desea eliminar (PORENCUESTA o PORPREGUNTA)</param>
    /// <returns>Regresa si fue correcta la eliminación del registro.</returns>
    protected bool RemueveInformacion(string guid, int encuesta_id, string opcion)
    {
        en = new Escuelas_Negocio();
        List<Encuesta_Entidad> lista = new List<Encuesta_Entidad>();

        try
        {
            lista = en.RemueveEncuesta(guid, encuesta_id, opcion);
            gvEncuesta.DataSource = lista;
            gvEncuesta.DataBind();

            if (lista.Count > 0)
            {


                txtPreguntaNo.Text = (lista.Count + 1).ToString();

                if (lista.Where(x => x.Encuesta_id == encuesta_id).Count().Equals(0))
                    PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                                "Registro(s) eliminado(s) correctamente de la encuesta.",
                                "Bien."));
                else
                    PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                "Error al intentar eliminar la(s) pregunta(s).",
                                "Alerta."));

                return true;
            }
            else
                PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                        "Registro(s) eliminado(s) correctamente de la encuesta.",
                        "Bien."));

            return true;
        }
        catch (Exception ex)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
              ex.Message,
              "Error."));
        }

        return false;
    }

    /// <summary>
    /// Metodo para limpiar los campos del formulario.
    /// </summary>
    /// <param name="todos">Indica si van a restaurar todos los campos.
    /// para el caso contrario solo se limpiarian los de las respuestas y la pregunta.</param>
    protected void LimpiarCampos(bool todos)
    {
        //txtPregunta.Text = string.Empty;

        txtRespuesta1.Text = string.Empty;
        txtRespuesta2.Text = string.Empty;
        txtRespuesta3.Text = string.Empty;
        txtRespuesta4.Text = string.Empty;
        txtRespuesta5.Text = string.Empty;

        if (todos)
        {
            txtPregunta.Text = string.Empty;

            txtNombre.Text = string.Empty;
            txtPreguntaNo.Text = "1";

            btnAgregarPregunta.Text = "Agregar";
            btnCancelar.Visible = false;

            hfAccion.Value = Constantes.AGREGAR;
            hfEncuesta_GUID.Value = string.Empty;
            hfID.Value = string.Empty;

            lbEliminarEnc.Visible = false;

            //pnlEncuesta.Enabled = false;
        }
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
}