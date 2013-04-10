using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;

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
        }
    }
    protected void CargarListas()
    {
        listaNivel = vn.RegresaNiveles(true);

        ddlNivelEsc.DataSource = listaNivel;
        ddlNivelEsc.DataTextField = "Nombre";
        ddlNivelEsc.DataValueField = "Nivel_id";
        ddlNivelEsc.DataBind();

        ddlNivelEsc.Items.Insert(0, new ListItem("Selecciona", "0"));
    }
    protected void CargarPosgrados()
    {
        objListExpDoc = new List<ExpDocente_Entidad>();

        objListExpDoc = objDocentes.RegresaExpDocente("TODOS", 0);

        gvExpDocente.DataSource = objListExpDoc;
        gvExpDocente.DataBind();
    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        ExpDocente_Entidad ede = new ExpDocente_Entidad();
        objListExpDoc = new List<ExpDocente_Entidad>();

        ede.NivelEscolar.Nivel_id = ddlNivelEsc.SelectedValue.Equals("0") ? 0 : Convert.ToInt32(ddlNivelEsc.SelectedValue);
        ede.NomAsignatura = txtNomAsig.Text.Trim();
        ede.Institucion = txtInstitucion.Text.Trim();
        ede.PeriodoInicio = DateTime.Parse(txtPerInicio.Text);
        ede.PeriodoFinal = DateTime.Parse(txtPerFinal.Text);
        ede.CategoriaDoc.CategoDoc_Id = ddlCatDoc.SelectedValue.Equals("0") ? 0 : Convert.ToInt32(ddlCatDoc.SelectedValue);
        ede.ResultEvaluacion = txtResultado.Text.Trim();
        ede.Comentarios = txtComentarios.Text.Trim();
        try
        {
            objListExpDoc = objDocentes.ExpDocente(ede, Constantes.AGREGAR);

            gvExpDocente.DataSource = objListExpDoc;
            gvExpDocente.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }

    }

}