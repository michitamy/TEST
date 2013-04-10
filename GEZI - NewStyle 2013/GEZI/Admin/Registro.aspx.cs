using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;

public partial class Admin_Registro : BasePage
{
    private Usuario_Entidad ue = new Usuario_Entidad();
    private Usuarios_Negocio un = new Usuarios_Negocio();
    private List<Usuario_Entidad> lista = new List<Usuario_Entidad>();
    private List<Usuario_Entidad> lsesion_ue = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlMensaje.Visible = false;

        if (!usuario.IsAdmin)
        {
            Response.Redirect(Page.ResolveClientUrl("~/Admin/Inicio_Admin.aspx"), false);
            return;
        }

        if (!Page.IsPostBack)
        {
            pnlUsuario.Enabled = false;
            lista = un.RegresaUsuarios(string.Empty, -1, Constantes.TODOS);
            if (lista.Count > 0)
            {
                Session[Constantes.SESSION_USUARIOS] = lista;
                gvUsuarios.DataSource = lista;
            }

            gvUsuarios.DataBind();
        }
        ibBasura.Enabled = string.IsNullOrEmpty(hfUsuarioID.Value) ? false : true;
        ibBasura.ToolTip = ibBasura.Enabled ? "Eliminar usuario del sistema" : "Para eliminar un usuario desde este boton, debe seleccionarlo antes.";

        ibBasura.Attributes.Add("onclick", "return confirm(\"¿Está seguro de querer eliminar este usuario? \");");
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        SaltedHash saltedhass = null;

        if (!Constantes.MASCARA_CONTRASENIA.Equals(txtContrasenia.Text.Trim()))
            saltedhass = new SaltedHash(txtContrasenia.Text.Trim());

        ue.Apellido = txtApellido.Text.Trim();
        ue.ContraseniaHash = (saltedhass == null) ? hfContrasenia.Value : saltedhass.Hash;
        ue.ContraseniaSalt = (saltedhass == null) ? hfSalt.Value : saltedhass.Salt;
        ue.Correo = txtCorreo.Text.Trim();
        ue.Nombre = txtNombre.Text.Trim();
        ue.NombreUsuario = txtUsuario.Text.Trim();
        //ue.IsAdmin = bool.Parse(rblIsAdmin.SelectedValue); 
        ue.Equipo = usuario.Equipo;
        ue.Usuario = usuario.Usuario;
        ue.Fecha = usuario.Fecha;

        try
        {
            if (string.IsNullOrEmpty(hfUsuarioID.Value))
                lista = un.AMUsuarios(ue, Constantes.AGREGAR);
            else
            {
                ue.Usuario_Id = int.Parse(hfUsuarioID.Value);
                lista = un.AMUsuarios(ue, Constantes.ACTUALIZAR);
            }

            if (lista.Count > 0)
            {
                Session[Constantes.SESSION_USUARIOS] = lista;
                gvUsuarios.DataSource = lista;

                LimpiarCampos();

                PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                                "El usuario fue guardado exitosamente.",
                                "Bien."));
            }
        }
        catch (Exception ex)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                        ex.Message,
                        "Error."));
        }

        ibBasura.Enabled = string.IsNullOrEmpty(hfUsuarioID.Value) ? false : true;
        gvUsuarios.DataBind();
    }

    protected void imgBasura_Click(object sender, ImageClickEventArgs e)
    {
        if (RemueveInformacion(int.Parse(hfUsuarioID.Value)))
            LimpiarCampos();
    }

    protected void imgAgregar_Click(object sender, ImageClickEventArgs e)
    {
        LimpiarCampos();

        pnlUsuario.Enabled = true;
        txtUsuario.Focus();
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        LimpiarCampos();
    }

    protected void GvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
        lsesion_ue = new List<Usuario_Entidad>();
        int iUsuarioID = -1;

        if (e.CommandName == Constantes.ACTUALIZAR)
        {
            lsesion_ue = (List<Usuario_Entidad>)Session[Constantes.SESSION_USUARIOS];
            pnlUsuario.Enabled = true;

            iUsuarioID = int.Parse(((Label)row.FindControl("lblID")).Text.Trim());

            hfUsuarioID.Value = iUsuarioID.ToString();
            txtUsuario.Text = lsesion_ue.Where(x => x.Usuario_Id == iUsuarioID).Select(a => a.NombreUsuario).First().ToString();
            txtNombre.Text = lsesion_ue.Where(x => x.Usuario_Id == iUsuarioID).Select(a => a.Nombre).First().Trim();
            txtContrasenia.Attributes.Add("value", Constantes.MASCARA_CONTRASENIA);
            txtConfirmContrasenia.Attributes.Add("value", Constantes.MASCARA_CONTRASENIA);
            hfContrasenia.Value = (lsesion_ue.Where(x => x.Usuario_Id == iUsuarioID).Select(a => a.ContraseniaHash).First().Trim());
            hfSalt.Value = (lsesion_ue.Where(x => x.Usuario_Id == iUsuarioID).Select(a => a.ContraseniaSalt).First().Trim());
            txtApellido.Text = (lsesion_ue.Where(x => x.Usuario_Id == iUsuarioID).Select(a => a.Apellido).First().ToString());
            txtCorreo.Text = (lsesion_ue.Where(x => x.Usuario_Id == iUsuarioID).Select(a => a.Correo).First().ToString());
            //rblIsAdmin.SelectedValue = (lsesion_ue.Where(x => x.Usuario_Id == iUsuarioID).Select(a => a.IsAdmin).First().ToString());

            hfRenglosSelec.Value = row.RowIndex.ToString();
            row.BackColor = Color.FromName("#ededed");
            ((System.Web.UI.WebControls.Image)row.FindControl("imgUser")).ImageUrl = "~/Images/icons/user-go-icon.png";

            ibBasura.Enabled = string.IsNullOrEmpty(hfUsuarioID.Value) ? false : true;
        }
        else if (e.CommandName == Constantes.ELIMINAR)
        {
            if (RemueveInformacion(int.Parse(((Label)row.FindControl("lblID")).Text)))
                LimpiarCampos();
        }
    }

    protected bool RemueveInformacion(int encuesta_id)
    {
        try
        {
            lista = un.RemueveUsuario(encuesta_id);

            if (lista.Count > 0)
            {
                Session[Constantes.SESSION_USUARIOS] = lista;
                gvUsuarios.DataSource = lista;
                gvUsuarios.DataBind();

                if (lista.Where(x => x.Usuario_Id == encuesta_id).Count().Equals(0))
                    PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                                "El usuario fue eliminado correctamente.",
                                "Bien."));
                else
                    PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                "Este usuario no puede ser eliminado.",
                                "Alerta."));

                return true;
            }
            else
                PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                            "El usuario fue eliminado correctamente.",
                            "Alerta."));

            return false;
        }
        catch (Exception ex)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                      ex.Message,
                      "Error."));
        }

        return false;
    }

    protected void LimpiarCampos()
    {
        LimpiaControl(pnlUsuario.Controls);
        pnlUsuario.Enabled = false;
        hfRenglosSelec.Value = string.Empty;
        hfContrasenia.Value = string.Empty;
        hfSalt.Value = string.Empty;
        hfUsuarioID.Value = string.Empty;
        ibBasura.Enabled = string.IsNullOrEmpty(hfUsuarioID.Value) ? false : true;

        txtContrasenia.Attributes.Add("value", string.Empty);
        txtConfirmContrasenia.Attributes.Add("value", string.Empty);

        if (!string.IsNullOrEmpty(hfRenglosSelec.Value))
        {
            gvUsuarios.Rows[int.Parse(hfRenglosSelec.Value)].BackColor = Color.White;
            ((System.Web.UI.WebControls.Image)gvUsuarios.Rows[int.Parse(hfRenglosSelec.Value)].FindControl("imgUser")).ImageUrl = "~/Images/icons/user-icon.png";
        }
    }

    /// <summary>
    /// Metodo para limpiar un control
    /// </summary>
    /// <param name="controles">Control al cual desea limpiar.</param>
    public void LimpiaControl(ControlCollection controles)
    {
        foreach (Control control in controles)
        {
            if (control is TextBox)
                ((TextBox)control).Text = string.Empty;
            else if (control is RadioButtonList)
                ((RadioButtonList)control).ClearSelection();
            else if (control is CheckBoxList)
                ((CheckBoxList)control).ClearSelection();
            else if (control is RadioButton)
                ((RadioButton)control).Checked = false;
            else if (control is CheckBox)
                ((CheckBox)control).Checked = false;
            else if (control.HasControls())
                LimpiaControl(control.Controls);
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