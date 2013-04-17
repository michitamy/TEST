using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Entidades;

public partial class Docentes_Licenciatura : BasePage
{
    List<Licenciatura_Entidad> objListLic = null;
    Docentes_Negocio objDocentes = new Docentes_Negocio();
    List<Pais_Entidad> listaPais = new List<Pais_Entidad>();

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlMensaje.Style.Add("Display", "none");

        if (!IsPostBack)
        {
            CargarLicenciaturas();
            CargarListaPais();
            ReiniciarCampos();
            

        }
    }

    protected void CargarLicenciaturas()
    {
        objListLic = new List<Licenciatura_Entidad>();

        objListLic = objDocentes.RegresaLicenciaturas("TODOS", 0);
        Session[Constantes.SESSION_LICENCIATURAS] = objListLic;

        gvLicenciaturas.DataSource = objListLic;
        gvLicenciaturas.DataBind();
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        Licenciatura_Entidad lic = new Licenciatura_Entidad();
        objListLic = new List<Licenciatura_Entidad>();

        lic.Licenciatura_id = string.IsNullOrEmpty(hfID.Value) ? 0 : int.Parse(hfID.Value);
        lic.Licenciatura = txtLicEn.Text.Trim();
        lic.DondeEstudio = txtEstudio.Text.Trim();
        lic.Pais.Pais_id = ddlPais.SelectedValue.Equals("0") ? 0 : Convert.ToInt32(ddlPais.SelectedValue);
        lic.TituloLegalizado = bool.Parse(ddlTitLegalizado.SelectedValue);
        lic.PeriodoInicio = DateTime.Parse(txtPerInicio.Text);
        lic.PeriodoFinal = DateTime.Parse(txtPerFinal.Text);
        lic.NoCedula = txtCedula.Text.Trim();
        

        try
        {
            objListLic = hfAccion.Value.Equals(Constantes.AGREGAR)
                        ? objDocentes.Licenciatura(lic, Constantes.AGREGAR)
                        : objDocentes.Licenciatura(lic, Constantes.ACTUALIZAR);

            Session[Constantes.SESSION_LICENCIATURAS] = objListLic;

            gvLicenciaturas.DataSource = objListLic;
            gvLicenciaturas.DataBind();
            //if (hfAccion.Value.Equals(Constantes.ACTUALIZAR))
            //    lblMensaje.Text = "Modificado Correctamente";

            PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                                "Registro guardado correctamente.",
                                "Correcto."));
            //Response.Write(@"<script language='javascript'>alert('Guardado Exitosamente')</script>");  mensaje de pop-up//
        }
        catch (Exception ex)
        {
            //lblMensaje.Text = ex.Message;

            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                                ex.Message,
                                "Error"));
        }

    }

    protected void GvLicenciaturas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            int Licenciatura_id;
            Licenciatura_Entidad objLE = new Licenciatura_Entidad();

            if (e.CommandName == Constantes.ACTUALIZAR)
            {
                Licenciatura_id = int.Parse(((HiddenField)row.FindControl("hfLicenciatura_id")).Value);
                Session["Licenciatura_id"] = Licenciatura_id;
                hfID.Value = Licenciatura_id.ToString();
                hfAccion.Value = Constantes.ACTUALIZAR;
                objListLic = new List<Licenciatura_Entidad>();

                objListLic = (List<Licenciatura_Entidad>)Session[Constantes.SESSION_LICENCIATURAS];

                try
                {
                    objLE = objListLic.Single(x => x.Licenciatura_id == Licenciatura_id);

                    txtCedula.Text = objLE.NoCedula;
                    txtEstudio.Text = objLE.DondeEstudio;
                    txtLicEn.Text = objLE.Licenciatura;
                    txtPerFinal.Text = objLE.PeriodoFinal.ToString("MM/dd/yyyy");
                    txtPerInicio.Text = objLE.PeriodoInicio.ToString("MM/dd/yyyy");

                    ddlPais.SelectedValue = (objLE.Pais.Pais_id != 0) ? objLE.Pais.Pais_id.ToString() : "0";
                    ddlTitLegalizado.SelectedValue = objLE.TituloLegalizado == true ? "True" : "False";

                    btnCancelar.Visible = true;
                    mpeAgregarLicenciatura.Show();
                    
                }
                catch(Exception ex)
                {
                    lblMensaje.Text = ex.Message;
                }
            }
            else if (e.CommandName == Constantes.ELIMINAR)
            {
                Licenciatura_id = int.Parse(((HiddenField)row.FindControl("hfLicenciatura_id")).Value);
                Session["Licenciatura_id"] = Licenciatura_id;
                objListLic = (List<Licenciatura_Entidad>)Session[Constantes.SESSION_LICENCIATURAS];

                try
                {
                    objLE = objListLic.Single(x => x.Licenciatura_id == Licenciatura_id);

                    objListLic = objDocentes.Licenciatura(objLE, Constantes.ELIMINAR);
                    Session[Constantes.SESSION_LICENCIATURAS] = objListLic;

                    gvLicenciaturas.DataSource = objListLic;
                    gvLicenciaturas.DataBind();

                    lblMensaje.Text = "Eliminado Correctamente.";
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = ex.Message;
                }
            }
        }
        catch
        {
            return;
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        LimpiaControl(pnlLicenciaturas.Controls);
        ReiniciarCampos();

        ddlPais.SelectedValue = "0";
        ddlTitLegalizado.SelectedValue = "";
    }

    protected void ReiniciarCampos()
    {
        btnCancelar.Visible = false;
        hfID.Value = string.Empty;
        hfAccion.Value = Constantes.AGREGAR;
    }

    protected void CargarListaPais()
    {

        listaPais = objDocentes.RegresaPais();
        ddlPais.DataSource = listaPais;
        ddlPais.DataTextField = "Pais";
        ddlPais.DataValueField = "Pais_id";
        ddlPais.DataBind();
        ddlPais.Items.Insert(0, new ListItem("Selecciona", "0"));
        
    }

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
            else if (control is Label)
                ((Label)control).Text = string.Empty;
            else if (control.HasControls())
                LimpiaControl(control.Controls);
            

        }
    }

    protected void btnNuevaLic_Click(object sender, EventArgs e)
    {

        
        LimpiaControl(pnlLicenciaturas.Controls);
        ReiniciarCampos();
        mpeAgregarLicenciatura.Show();
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