using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;
using System.Threading;
using System.Globalization;

public partial class Docentes_ExpDocente : System.Web.UI.Page
{

    List<ExpDocente_Entidad> objListExpDoc = null;
    Docentes_Negocio objDocentes = new Docentes_Negocio();
    List<Nivel_Entidad> listaNivel = new List<Nivel_Entidad>();
    Views_Negocio vn = new Views_Negocio();
    List<CategoriaDoc_Entidad> listaCatego = new List<CategoriaDoc_Entidad>();
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarListas();
            CargarExpDocente();
            ReiniciarCampos();
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
            Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
        }
    }
    protected void CargarListas()
    {
        //regreso lista niveles
        listaNivel = vn.RegresaNiveles(false);

        ddlNivelEsc.DataSource = listaNivel;
        ddlNivelEsc.DataTextField = "Nombre";
        ddlNivelEsc.DataValueField = "Nivel_id";
        ddlNivelEsc.DataBind();

        ddlNivelEsc.Items.Insert(0, new ListItem("Selecciona", "0"));
        
        //regreso lista categoria docentes
        listaCatego = objDocentes.RegresaCategoria();
        ddlCatDoc.DataSource = listaCatego;
        ddlCatDoc.DataTextField = "Descripcion";
        ddlCatDoc.DataValueField = "CategoDoc_Id";
        ddlCatDoc.DataBind();
        ddlCatDoc.Items.Insert(0, new ListItem("Selecciona", "0"));
    }
    protected void CargarExpDocente()
    {
        objListExpDoc = new List<ExpDocente_Entidad>();
        objListExpDoc = objDocentes.RegresaExpDocente("TODOS", 0);
        Session[Constantes.SESSION_EXPDOCENTES] = objListExpDoc;
        gvExpDocente.DataSource = objListExpDoc;
        gvExpDocente.DataBind();
    }

    protected void GvExpDocente_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            int ExpDoc_Id;
            ExpDocente_Entidad objExpDoc = new ExpDocente_Entidad();

            if (e.CommandName == Constantes.ACTUALIZAR)
            {
                ExpDoc_Id = int.Parse(((HiddenField)row.FindControl("hfExpDoc_Id")).Value);
                Session["ExpDoc_Id"] = ExpDoc_Id;
                hfID.Value = ExpDoc_Id.ToString();
                hfAccion.Value = Constantes.ACTUALIZAR;
                objListExpDoc = new List<ExpDocente_Entidad>();
                objListExpDoc = (List<ExpDocente_Entidad>)Session[Constantes.SESSION_EXPDOCENTES];

                try
                {
                    objExpDoc = objListExpDoc.Single(x => x.ExpDoc_Id == ExpDoc_Id);

                    txtComentarios.Text = objExpDoc.Comentarios;
                    txtInstitucion.Text = objExpDoc.Institucion;
                    txtNomAsig.Text = objExpDoc.NomAsignatura;
                    txtPerFinal.Text = objExpDoc.PeriodoFinal.ToString("MM/dd/yyyy");
                    txtPerInicio.Text = objExpDoc.PeriodoInicio.ToString("MM/dd/yyyy");
                    txtResultado.Text = objExpDoc.ResultEvaluacion.ToString();

                    ddlCatDoc.SelectedValue = (objExpDoc.CategoriaDoc.CategoDoc_Id != 0) ? objExpDoc.CategoriaDoc.CategoDoc_Id.ToString() : "0";
                    ddlNivelEsc.SelectedValue = (objExpDoc.NivelEscolar.Nivel_id != 0) ? objExpDoc.NivelEscolar.Nivel_id.ToString() : "0";

                    btnCancelar.Visible = true;
                    mpeAgregaExpDocente.Show();
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = ex.Message;
                }
            }

            else if (e.CommandName == Constantes.ELIMINAR)
            {
                ExpDoc_Id = int.Parse(((HiddenField)row.FindControl("hfExpDoc_Id")).Value);
                Session["ExpDoc_Id"] = ExpDoc_Id;
                objListExpDoc = (List<ExpDocente_Entidad>)Session[Constantes.SESSION_EXPDOCENTES];

                try
                {
                    objExpDoc = objListExpDoc.Single(x => x.ExpDoc_Id == ExpDoc_Id);
                    objListExpDoc = objDocentes.ExpDocente(objExpDoc, Constantes.ELIMINAR);
                    Session[Constantes.SESSION_EXPDOCENTES] = objListExpDoc;

                    gvExpDocente.DataSource = objListExpDoc;
                    gvExpDocente.DataBind();

                    lblMensaje.Text = "Eliminado correctamente";
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
        ExpDocente_Entidad ede = new ExpDocente_Entidad();
        objListExpDoc = new List<ExpDocente_Entidad>();

        ede.NivelEscolar.Nivel_id = ddlNivelEsc.SelectedValue.Equals("0") ? 0 : Convert.ToInt32(ddlNivelEsc.SelectedValue);
        ede.NomAsignatura = txtNomAsig.Text.Trim();
        ede.Institucion = txtInstitucion.Text.Trim();
        ede.PeriodoInicio = DateTime.Parse(txtPerInicio.Text);
        ede.PeriodoFinal = DateTime.Parse(txtPerFinal.Text);
        ede.CategoriaDoc.CategoDoc_Id = ddlCatDoc.SelectedValue.Equals("0") ? 0 : Convert.ToInt32(ddlCatDoc.SelectedValue);
        ede.ResultEvaluacion = string.IsNullOrEmpty(txtResultado.Text) ? (decimal?)null : decimal.Parse(txtResultado.Text);
        ede.Comentarios = txtComentarios.Text.Trim();
        ede.ExpDoc_Id = string.IsNullOrEmpty(hfID.Value) ? 0 : int.Parse(hfID.Value);
        try
        {
            objListExpDoc = hfAccion.Value.Equals(Constantes.AGREGAR)
                ? objDocentes.ExpDocente(ede, Constantes.AGREGAR)
                : objDocentes.ExpDocente(ede, Constantes.ACTUALIZAR);
            Session[Constantes.SESSION_EXPDOCENTES] = objListExpDoc;

            gvExpDocente.DataSource = objListExpDoc;
            gvExpDocente.DataBind();
            if(hfAccion.Value.Equals(Constantes.ACTUALIZAR))
                lblMensaje.Text = "Modificado correctamente";
        }
        catch (Exception ex)
        {
            lblMensaje.Text = ex.Message;
        }

    }
    protected void ReiniciarCampos()
    {
        btnCancelar.Visible = false;
        hfID.Value = string.Empty;
        hfAccion.Value = Constantes.AGREGAR;
        ddlCatDoc.SelectedValue = "0";
        ddlNivelEsc.SelectedValue = "0";
    }
    protected void btnNuevaExpDocente_Click(object sender, EventArgs e)
    {
        LimpiaControl(pnlExpDocente.Controls);
        ReiniciarCampos();
        mpeAgregaExpDocente.Show();
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        LimpiaControl(pnlExpDocente.Controls);
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