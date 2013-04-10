using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Entidades;

public partial class Docentes_Licenciatura : System.Web.UI.Page
{
    List<Licenciatura_Entidad> objListLic = null;
    Docentes_Negocio objDocentes = new Docentes_Negocio();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarLicenciaturas();
        }
    }

    protected void CargarLicenciaturas()
    {
        objListLic = new List<Licenciatura_Entidad>();

        objListLic = objDocentes.RegresaLicenciaturas("TODOS", 0);

        gvLicenciaturas.DataSource = objListLic;
        gvLicenciaturas.DataBind();
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        Licenciatura_Entidad lic = new Licenciatura_Entidad();
        objListLic = new List<Licenciatura_Entidad>();

        lic.Licenciatura = txtLicEn.Text.Trim();
        lic.DondeEstudio = txtEstudio.Text.Trim();
        lic.Pais = ddlPais.SelectedItem.Text;
        lic.TituloLegalizado = bool.Parse(ddlTitLegalizado.SelectedValue);
        lic.PeriodoInicio = DateTime.Parse(txtPerInicio.Text);
        lic.PeriodoFinal = DateTime.Parse(txtPerFinal.Text);
        lic.NoCedula = txtCedula.Text.Trim();

        try
        {
            objListLic = objDocentes.Licenciatura(lic, Constantes.AGREGAR);

            gvLicenciaturas.DataSource = objListLic;
            gvLicenciaturas.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }

    }
}