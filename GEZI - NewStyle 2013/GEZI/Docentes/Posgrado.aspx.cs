using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Entidades;

public partial class Docentes_Posgrado : System.Web.UI.Page
{

    List<Posgrado_Entidad> objListPos = null;
    Docentes_Negocio objDocentes = new Docentes_Negocio();
    List<Nivel_Entidad> lista = new List<Nivel_Entidad>();
    Views_Negocio vn = new Views_Negocio();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarListas();
            CargarPosgrados();
        }
    }

    protected void CargarListas()
    {
        lista = vn.RegresaNiveles(true);

        ddlNiveles.DataSource = lista;
        ddlNiveles.DataTextField = "Nombre";
        ddlNiveles.DataValueField = "Nivel_id";
        ddlNiveles.DataBind();

        ddlNiveles.Items.Insert(0, new ListItem("Selecciona", "0"));
    }
    protected void CargarPosgrados()
    {
        objListPos = new List<Posgrado_Entidad>();

        objListPos = objDocentes.RegresaPosgrados("TODOS", 0);

        gvPosgrado.DataSource = objListPos;
        gvPosgrado.DataBind();
    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        Posgrado_Entidad pos = new Posgrado_Entidad();
        objListPos = new List<Posgrado_Entidad>();

        pos.Nivel.Nivel_id = ddlNiveles.SelectedValue.Equals("0") ? 0 : Convert.ToInt32(ddlNiveles.SelectedValue);
        pos.Estudio = txtEstudiosEn.Text.Trim();
        pos.UnivDondeEstudio = txtDondeEstudio.Text.Trim();
        pos.Pais = txtPais.Text.Trim();
        pos.TituloGradoLegal = bool.Parse(ddlTitGradLegal.SelectedValue);
        pos.PeriodoInicio = DateTime.Parse(txtPerInicio.Text);
        pos.PeriodoFinal = DateTime.Parse(txtPerFinal.Text);
        pos.Grado = bool.Parse(ddlGradObtenido.SelectedValue);
        pos.NoCedula = txtCedula.Text.Trim();
        pos.Comentarios = txtComentarios.Text.Trim();
        try
        {
            objListPos = objDocentes.Posgrado(pos, Constantes.AGREGAR);

            gvPosgrado.DataSource = objListPos;
            gvPosgrado.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }

    }

}