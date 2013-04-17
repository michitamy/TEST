using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Entidades;
using System.Globalization;
using System.Threading;

public partial class Docentes_Posgrado : System.Web.UI.Page
{

    List<Posgrado_Entidad> objListPos = null;
    Docentes_Negocio objDocentes = new Docentes_Negocio();
    List<Pais_Entidad> listaPais = null;
    List<Nivel_Entidad> lista = new List<Nivel_Entidad>();
    Views_Negocio vn = new Views_Negocio();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarListas();
            CargarPosgrados();
            ReiniciarCampos();
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
            Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
        }
    }

    protected void CargarPosgrados()
    {
        
        objListPos = new List<Posgrado_Entidad>();
        objListPos = objDocentes.RegresaPosgrados("TODOS", 0);
        Session[Constantes.SESSION_POSGRADOS] = objListPos;

        gvPosgrado.DataSource = objListPos;
        gvPosgrado.DataBind();
    }

    protected void CargarListas()
    {
        //regreso la lista de niveles
        lista = vn.RegresaNiveles(true);

        ddlNiveles.DataSource = lista;
        ddlNiveles.DataTextField = "Nombre";
        ddlNiveles.DataValueField = "Nivel_id";
        ddlNiveles.DataBind();

        ddlNiveles.Items.Insert(0, new ListItem("Selecciona", "0"));

        //regreso la lista de paises
        listaPais = new List<Pais_Entidad>();
        listaPais = objDocentes.RegresaPais();

        ddlPais.DataSource = listaPais;
        ddlPais.DataTextField = "Pais";
        ddlPais.DataValueField = "Pais_id";
        ddlPais.DataBind();
        ddlPais.Items.Insert(0, new ListItem("Selecciona", "0"));
    }

    protected void ReiniciarCampos()
    {
        btnCancelar.Visible = false;
        hfID.Value = string.Empty;
        hfAccion.Value = Constantes.AGREGAR;
        ddlGradObtenido.SelectedValue = "";
        ddlNiveles.SelectedValue = "0";
        ddlPais.SelectedValue = "0";
        ddlTitGradLegal.SelectedValue = "";

    }

    protected void GvPosgrado_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            int Posgrado_id;
            Posgrado_Entidad objPE = new Posgrado_Entidad();

            if (e.CommandName == Constantes.ACTUALIZAR)
            {
                Posgrado_id = int.Parse(((HiddenField)row.FindControl("hfPosgrado_id")).Value);
                Session["Posgrado_id"] = Posgrado_id;
                hfID.Value = Posgrado_id.ToString();
                hfAccion.Value = Constantes.ACTUALIZAR;
                objListPos = new List<Posgrado_Entidad>();
                objListPos = (List<Posgrado_Entidad>)Session[Constantes.SESSION_POSGRADOS];

                try
                {
                    objPE = objListPos.Single(x => x.Posgrado_id == Posgrado_id);

                    txtCedula.Text = objPE.NoCedula;
                    txtComentarios.Text = objPE.Comentarios;
                    txtDondeEstudio.Text = objPE.UnivDondeEstudio;
                    txtEstudiosEn.Text = objPE.Estudio;
                    txtPerFinal.Text = objPE.PeriodoFinal.ToString("MM/dd/yyyy");
                    txtPerInicio.Text = objPE.PeriodoInicio.ToString("MM/dd/yyyy");
           

                    ddlNiveles.SelectedValue = (objPE.Nivel.Nivel_id != 0) ? objPE.Nivel.Nivel_id.ToString() : "0";
                    ddlPais.SelectedValue = objPE.Pais.Pais_id != 0 ? objPE.Pais.Pais_id.ToString() : "0";
                    ddlTitGradLegal.SelectedValue = objPE.TituloGradoLegal == true ? "True" : "False";
                    ddlGradObtenido.SelectedValue = objPE.Grado == true ? "True" : "False";



                    btnCancelar.Visible = true;
                    mpeAgregarPosgrado.Show();

                }
                catch (Exception ex)
                {
                    lblMensaje.Text = ex.Message;
                }
            }
            else if (e.CommandName == Constantes.ELIMINAR)
            {
                Posgrado_id = int.Parse(((HiddenField)row.FindControl("hfPosgrado_id")).Value);
                Session["Posgrado_id"] = Posgrado_id;
                objListPos = (List<Posgrado_Entidad>)Session[Constantes.SESSION_POSGRADOS];

                try
                {
                    objPE = objListPos.Single(x => x.Posgrado_id == Posgrado_id);
                    objListPos = objDocentes.Posgrado(objPE, Constantes.ELIMINAR);
                    Session[Constantes.SESSION_POSGRADOS] = objListPos;

                    gvPosgrado.DataSource = objListPos;
                    gvPosgrado.DataBind();

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

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        Posgrado_Entidad pos = new Posgrado_Entidad();
        objListPos = new List<Posgrado_Entidad>();

        pos.Nivel.Nivel_id = ddlNiveles.SelectedValue.Equals("0") ? 0 : Convert.ToInt32(ddlNiveles.SelectedValue);
        pos.Estudio = txtEstudiosEn.Text.Trim();
        pos.UnivDondeEstudio = txtDondeEstudio.Text.Trim();
        pos.Pais.Pais_id = ddlPais.SelectedValue.Equals("0") ? 0 : Convert.ToInt32(ddlPais.SelectedValue);
        pos.TituloGradoLegal = bool.Parse(ddlTitGradLegal.SelectedValue);
        pos.PeriodoInicio = DateTime.Parse(txtPerInicio.Text);
        pos.PeriodoFinal = DateTime.Parse(txtPerFinal.Text);
        pos.Grado = bool.Parse(ddlGradObtenido.SelectedValue);
        pos.NoCedula = txtCedula.Text.Trim();
        pos.Comentarios = txtComentarios.Text.Trim();
        pos.Posgrado_id = string.IsNullOrEmpty(hfID.Value) ? 0 : int.Parse(hfID.Value);
        try
        {
            objListPos = hfAccion.Value.Equals(Constantes.AGREGAR)
                        ? objDocentes.Posgrado(pos, Constantes.AGREGAR)
                        : objDocentes.Posgrado(pos, Constantes.ACTUALIZAR);
            Session[Constantes.SESSION_POSGRADOS] = objListPos;

            gvPosgrado.DataSource = objListPos;
            gvPosgrado.DataBind();
            if (hfAccion.Value.Equals(Constantes.ACTUALIZAR))
                lblMensaje.Text = "Modificado Correctamente";
        }
        catch (Exception ex)
        {
            lblMensaje.Text = ex.Message;
        }

    }

    protected void btnNuevoPos_Click(object sender, EventArgs e)
    {
        LimpiaControl(pnlPosgrado.Controls);
        ReiniciarCampos();
        mpeAgregarPosgrado.Show();
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        LimpiaControl(pnlPosgrado.Controls);
        ReiniciarCampos();
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
            else if (control.HasControls())
                LimpiaControl(control.Controls);
            else if (control is Label)
                ((Label)control).Text = string.Empty;

        }
    }

}