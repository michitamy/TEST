using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;

public partial class BuscarEscuelas : System.Web.UI.Page
{
    protected Views_Negocio vn = null;
    protected Plantel_Entidad pe = null;
    private List<Plantel_Entidad> listaComparacion = new List<Plantel_Entidad>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                Session[Constantes.SESSION_PLANTELES] = null;

                Nivel_Entidad.Niveles nivel = (Nivel_Entidad.Niveles)int.Parse(Request.QueryString["type"].Split('-')[0]);

                if (nivel.Equals(Nivel_Entidad.Niveles.Universidad))
                {
                    lblCarrera.Visible = true;
                    txtCarrera.Visible = true;
                    lblNivel.Visible = true;
                    ddlNivel.Visible = true;
                    btnBuscar.Text = "Buscar Carreras";
                    btnCompararPlant.Text = "Comparar Carreras";
                }
                else
                {
                    lblCarrera.Visible = false;
                    txtCarrera.Visible = false;
                    lblNivel.Visible = false;
                    ddlNivel.Visible = false;
                    btnBuscar.Text = "Buscar Escuelas";
                    cddNivel.SelectedValue = string.Empty;
                    btnCompararPlant.Text = "Comparar Planteles";
                }

                hfEscuela.Value = ((int)nivel).ToString();
                lblBusqueda.Text = int.Parse(hfEscuela.Value).Equals(5) ? "Búsqueda de carreras" : "Búsqueda de planteles";
            }
            catch
            {
                mpeSelectNivel.Show();
            }

            if (Session[Constantes.SESSION_COMPARA] != null)
            {
                listaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];
                CuentaPlanteles(listaComparacion);
            }
        }

        if (string.IsNullOrEmpty(hfEscuela.Value))
        {
            mpeSelectNivel.Show();
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        if (int.Parse(hfEscuela.Value).Equals(5) && string.IsNullOrEmpty(txtCarrera.Text.Trim()))
        {
            imgCarrera.Visible = true;
            return;
        }
        else if (string.IsNullOrEmpty(ddlNivel.SelectedValue) && int.Parse(hfEscuela.Value).Equals(5))
        {
            imgNivel.Visible = true;
            return;
        }
        else
        {
            imgCarrera.Visible = false;
            imgNivel.Visible = false;
        }

        int escuela = int.Parse(hfEscuela.Value);
        int estado = int.Parse(ddlEstado.SelectedValue);
        int ciudad = int.Parse(ddlCiudad.SelectedValue);
        int nivel = int.Parse(hfEscuela.Value).Equals(5) ? int.Parse(ddlNivel.SelectedValue) : -1;

        List<Plantel_Entidad> lista = new List<Plantel_Entidad>();
        vn = new Views_Negocio();

        lista = vn.RegresaDetallePlanteles(ciudad, escuela, nivel, txtCarrera.Text.Trim());
        pnlMensaje.Visible = lista.Count > 0 ? false : true;
        pnlPlanteles.Visible = lista.Count > 0 ? true : false;

        if (lista.Count > 0)
        {
            Session[Constantes.SESSION_PLANTELES] = lista;

            lblContador.Text = string.Format("{0} registros", lista.Count);
            rptDetallePlantel.DataSource = lista;

            BindRepeater();
        }
        else
        {
            lblMensaje.Text = int.Parse(hfEscuela.Value).Equals(5) ?
                            string.Format("No se han encontrado registros para su búsqueda [{0}] en la ciudad de {1}", txtCarrera.Text, ddlCiudad.SelectedItem.Text) :
                            string.Format("No se han encontrado registros para su búsqueda en la ciudad de {0}", ddlCiudad.SelectedItem.Text);
            divSugerencia.Visible = int.Parse(hfEscuela.Value).Equals(5) ? true : false;
        }


        rptDetallePlantel.DataBind();
    }

    protected void RptDetallePlantel_RowCommand(object sender, RepeaterCommandEventArgs e)
    {
        if (string.IsNullOrEmpty(e.CommandName))
            return;

        RepeaterItem row = (RepeaterItem)(((Button)e.CommandSource).NamingContainer);
        pe = new Plantel_Entidad();
        vn = new Views_Negocio();
        Escuelas_Negocio en = new Escuelas_Negocio();
        List<Plantel_Entidad> listaPlantel = new List<Plantel_Entidad>();

        if (e.CommandName == "Comparar")
        {
            if (Session[Constantes.SESSION_COMPARA] != null)
                listaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];


            pe.Numero_comp = listaComparacion.Count + 1;
            pe.Plantel_id = int.Parse(((HiddenField)row.FindControl("hfPlantel_id")).Value);
            pe.Carrera_id = int.Parse(((HiddenField)row.FindControl("hfCarrera_id")).Value);
            pe.Institucion.Institucion_id = int.Parse(((HiddenField)row.FindControl("hfInstitucion_id")).Value);
            pe.Plantel = ((HiddenField)row.FindControl("hfPlantel")).Value;
            pe.Telefono = ((Label)row.FindControl("lblTelefono")).Text;
            pe.Carrera = ((HiddenField)row.FindControl("hfCarrera")).Value;
            pe.Institucion.Institucion = ((Label)row.FindControl("lblInstitucion")).Text;
            pe.Institucion.Tipo.Nombre = ((HiddenField)row.FindControl("hfTipo")).Value;
            pe.Institucion.Nivel.Nivel_id = string.IsNullOrEmpty(ddlNivel.SelectedValue) ? int.Parse(hfEscuela.Value) : int.Parse(ddlNivel.SelectedValue);
            pe.Institucion.Imagen = ((HiddenField)row.FindControl("hfImagen")).Value;
            pe.Institucion.Web = ((Label)row.FindControl("lblWeb")).Text;
            pe.Estado = ((Label)row.FindControl("lblEstado")).Text;
            pe.Ciudad = ((Label)row.FindControl("lblCiudad")).Text;

            //Se verifica que el nivel escolar que elige el usuario sea el mismo que esta en la lista
            //para el caso de que no pertenezca, se despliega un mensaje donde se lo indica.
            if (!en.PerteneceMismoNivel(listaComparacion, (Nivel_Entidad.Niveles)pe.Institucion.Nivel.Nivel_id))
            {
                Session[Constantes.SESSION_PLANTEL] = pe;

                mpeLimpiarLista.Show();
                return;
            }


            if (listaComparacion.Where(x => x.Plantel_id == pe.Plantel_id).Count() == 0 && pe.Institucion.Nivel.Nivel_id < (int)Nivel_Entidad.Niveles.Universidad)
                listaComparacion.Add(pe);
            else if (listaComparacion.Where(x => x.Carrera_id == pe.Carrera_id).Count() == 0 && pe.Institucion.Nivel.Nivel_id > (int)Nivel_Entidad.Niveles.Universidad)
                listaComparacion.Add(pe);
            else
            {
                if (pe.Carrera_id.Equals(-1))
                    listaComparacion.RemoveAll(x => x.Plantel_id == pe.Plantel_id);
                else
                    listaComparacion.RemoveAll(x => x.Carrera_id == pe.Carrera_id);

                listaComparacion = vn.ActualizaNumeracionList(listaComparacion);
            }

            Session[Constantes.SESSION_COMPARA] = listaComparacion;

            listaPlantel = (List<Plantel_Entidad>)Session[Constantes.SESSION_PLANTELES];
            rptDetallePlantel.DataSource = listaPlantel;
            rptDetallePlantel.DataBind();

            CuentaPlanteles(listaComparacion);
        }
    }

    protected void GvListaPlanteles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        mpeListaPlanteles.Hide();
        GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
        List<Plantel_Entidad> listaPlantel = new List<Plantel_Entidad>();
        vn = new Views_Negocio();
        int plantel_id = -1;
        int carrera_id = -1;

        if (e.CommandName == "QuitarDeLista")
        {
            if (Session[Constantes.SESSION_COMPARA] != null)
                listaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];

            plantel_id = int.Parse(((HiddenField)row.FindControl("hfLPlantel_id")).Value);
            carrera_id = int.Parse(((HiddenField)row.FindControl("hfLCarrera_id")).Value);

            if (carrera_id.Equals(-1))
                listaComparacion.RemoveAll(x => x.Plantel_id == plantel_id);
            else
                listaComparacion.RemoveAll(x => x.Carrera_id == carrera_id);

            listaComparacion = vn.ActualizaNumeracionList(listaComparacion);

            Session[Constantes.SESSION_COMPARA] = listaComparacion;

            listaPlantel = (List<Plantel_Entidad>)Session[Constantes.SESSION_PLANTELES];
            rptDetallePlantel.DataSource = listaPlantel;
            rptDetallePlantel.DataBind();

            CuentaPlanteles(listaComparacion);
        }
        lbListaPlanteles_Click(null, null);
    }

    protected void lbListaPlanteles_Click(object sender, EventArgs e)
    {
        if (Session[Constantes.SESSION_COMPARA] != null)
        {
            listaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];
            gvListaPlanteles.DataSource = listaComparacion;
        }

        gvListaPlanteles.DataBind();
        mpeListaPlanteles.Show();
    }

    protected void CuentaPlanteles(List<Plantel_Entidad> lista)
    {
        lbListaPlanteles.Text = lista.Count != 0 ? string.Format("{0} {1}", lista.Count, (lista.Select(x => x.Carrera_id).First()).Equals(-1) ? "planteles añadidos" : "carreras añadidas") : string.Empty;
    }

    protected string MuestraImagen(int tipo_id)
    {
        return tipo_id.Equals(1) ? "Images/mini/PUbutton.png" : "Images/mini/PVbutton.png";
    }

    protected string MuestraPlantel_Carrera(string plantel, string carrera, int carrera_id)
    {
        if (carrera_id.Equals(-1))
            return plantel;
        else
            return carrera;
    }

    protected bool MuestraImagen(string imagen)
    {
        return string.IsNullOrEmpty(imagen) ? false : true;
    }

    protected bool ExistePlantel(int plantel_id, int carrera_id)
    {
        if (Session[Constantes.SESSION_COMPARA] != null)
        {
            listaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];

            if (listaComparacion.Where(x => x.Carrera_id == carrera_id).Count() > 0 && !carrera_id.Equals(-1))
                return true;
            else if (listaComparacion.Where(x => x.Plantel_id == plantel_id).Count() > 0 && carrera_id.Equals(-1))
                return true;
        }

        return false;
    }

    protected string Comparar(int plantel_id, int carrera_id)
    {
        if (ExistePlantel(plantel_id, carrera_id))
            return "- Quitar de la lista";
        else
            return "+ Añadir a la lista";
    }

    protected string FormatText()
    {
        Nivel_Entidad.Niveles nivel = (Nivel_Entidad.Niveles)int.Parse(Request.QueryString["type"].Split('-')[0]);

        if (nivel.Equals(Nivel_Entidad.Niveles.Universidad))
            return "Comparar Carreras";
        else
            return "Comparar Planteles";
    }

    protected void btnLimpiarLista_Click(object sender, EventArgs e)
    {
        List<Plantel_Entidad> listaPlantel = new List<Plantel_Entidad>();

        pe = new Plantel_Entidad();
        //Limpiar la lista y agregar el nuevo valor.
        pe = (Plantel_Entidad)Session[Constantes.SESSION_PLANTEL];

        Session[Constantes.SESSION_COMPARA] = null;
        listaComparacion.Add(pe);

        Session[Constantes.SESSION_COMPARA] = listaComparacion;

        listaPlantel = (List<Plantel_Entidad>)Session[Constantes.SESSION_PLANTELES];
        rptDetallePlantel.DataSource = listaPlantel;
        rptDetallePlantel.DataBind();

        CuentaPlanteles(listaComparacion);
    }

    #region "Local Variables and Declarations"

    private const bool blnAllowPaging = true;
    private const int iPageSize = 10;

    private static PagedDataSource pgdProducts = new PagedDataSource();

    #endregion

    #region "Page Load Event"

    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    if (!IsPostBack)
    //    {
    //        BindRepeater();
    //    }
    //}

    #endregion

    #region "Footer LinkButtons"

    protected void lnkFirst_Click(object sender, EventArgs e)
    {
        ThisPageNumber = 0;
        BindRepeater();
    }

    protected void lnkPrevious_Click(object sender, EventArgs e)
    {
        --ThisPageNumber;
        BindRepeater();
    }

    protected void lnkNext_Click(object sender, EventArgs e)
    {

        ++ThisPageNumber;
        BindRepeater();
    }

    protected void lnkLast_Click(object sender, EventArgs e)
    {
        ThisPageNumber = pgdProducts.PageCount - 1;
        BindRepeater();
    }

    #endregion

    #region "Footer DropDownList"

    protected void ddlpageNumbers_SelectedIndexChanged(object sender, EventArgs e)
    {
        ThisPageNumber = ddlpageNumbers.SelectedIndex;
        BindRepeater();
    }

    #endregion

    #region "Custom Functions"

    private void BindRepeater()
    {
        pgdProducts.AllowPaging = blnAllowPaging;
        pgdProducts.PageSize = iPageSize;
        pgdProducts.DataSource = GetProductsDataView();

        pgdProducts.CurrentPageIndex = ThisPageNumber;
        lblTotalPages.Text = pgdProducts.PageCount.ToString();
        FillPagesDropDownList(pgdProducts.PageCount);

        int iRows = (iPageSize * (pgdProducts.CurrentPageIndex + 1));
        lblRows.Text = (iRows > pgdProducts.DataSourceCount) ? lblContador.Text : iRows.ToString();
        lblOf.Text = pgdProducts.DataSourceCount.ToString();

        lnkFirst.Enabled = !pgdProducts.IsFirstPage;
        lnkPrevious.Enabled = !pgdProducts.IsFirstPage;
        lnkNext.Enabled = !pgdProducts.IsLastPage;
        lnkLast.Enabled = !pgdProducts.IsLastPage;
        ddlpageNumbers.SelectedIndex = pgdProducts.CurrentPageIndex;

        rptDetallePlantel.DataSource = pgdProducts;
        rptDetallePlantel.DataBind();
    }

    private List<Plantel_Entidad> GetProductsDataView()
    {
        List<Plantel_Entidad> listaPlantel = new List<Plantel_Entidad>();

        return listaPlantel = (List<Plantel_Entidad>)Session[Constantes.SESSION_PLANTELES];

    }

    private void FillPagesDropDownList(int iTotalPages)
    {
        ddlpageNumbers.Items.Clear();
        for (int i = 1; i <= iTotalPages; i++)
        {
            ddlpageNumbers.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
    }

    #endregion

    #region "Properties"

    private int ThisPageNumber
    {
        get
        {
            object obj = ViewState["ThisPageNumber"];
            return (obj == null) ? 0 : (int)obj;
        }
        set
        {
            this.ViewState["ThisPageNumber"] = value;
        }
    }

    #endregion

}