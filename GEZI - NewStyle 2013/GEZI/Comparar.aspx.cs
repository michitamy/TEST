using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;
using System.Drawing;

public partial class Comparar : System.Web.UI.Page
{
    private List<Plantel_Entidad> slistaComparacion = new List<Plantel_Entidad>();
    private Views_Negocio vn = new Views_Negocio();
    private Plantel_Entidad pe = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Constantes.SESSION_COMPARADESDE] == null || !Page.IsPostBack)
        {
            Session[Constantes.SESSION_COMPARADESDE] = 0;
            BindRepeater();
            DeshabilitarBotones();
            LoadMultiView();

        }

        if (Request.Form["__EVENTTARGET"] != null)
            if ((Request.Form["__EVENTTARGET"].Equals("ctl00$MainContent$menuComparaciones") && Request.Form["__EVENTARGUMENT"].Equals("0")) ||
                (Request.Form["__EVENTTARGET"].Equals("ctl00$MainContent$menuComparaciones") && Request.Form["__EVENTARGUMENT"].Equals("1")))
            {
                DeshabilitarBotones();
                LoadMultiView();
            }
    }

    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        int index = Int32.Parse(e.Item.Value);
        menuComparaciones.Items[index].Selected = true;

        mvComparaciones.ActiveViewIndex = index;
    }

    protected void ibCerrar1_Click(object sender, ImageClickEventArgs e)
    {
        if (!hfCarrera_id1.Value.Equals(-1) && !string.IsNullOrEmpty(hfCarrera_id1.Value))
            RemueveCarrera(int.Parse(hfCarrera_id1.Value));
        else if (!string.IsNullOrEmpty(hfPlantel_id1.Value))
            RemuevePlantel(int.Parse(hfPlantel_id1.Value));

        BindRepeater();
        //DeshabilitarBotones();
    }

    protected void ibCerrar2_Click(object sender, ImageClickEventArgs e)
    {
        if (!hfCarrera_id2.Value.Equals(-1) && !string.IsNullOrEmpty(hfCarrera_id2.Value))
            RemueveCarrera(int.Parse(hfCarrera_id2.Value));
        else if (!string.IsNullOrEmpty(hfPlantel_id2.Value))
            RemuevePlantel(int.Parse(hfPlantel_id2.Value));

        BindRepeater();
        //DeshabilitarBotones();
    }

    protected void ibCerrar3_Click(object sender, ImageClickEventArgs e)
    {
        if (!hfCarrera_id3.Value.Equals(-1) && !string.IsNullOrEmpty(hfCarrera_id3.Value))
            RemueveCarrera(int.Parse(hfCarrera_id3.Value));
        else if (!string.IsNullOrEmpty(hfPlantel_id3.Value))
            RemuevePlantel(int.Parse(hfPlantel_id3.Value));

        BindRepeater();
        //DeshabilitarBotones();
    }

    protected void ibCerrar4_Click(object sender, ImageClickEventArgs e)
    {
        if (!hfCarrera_id4.Value.Equals(-1) && !string.IsNullOrEmpty(hfCarrera_id4.Value))
            RemueveCarrera(int.Parse(hfCarrera_id4.Value));
        else if (!string.IsNullOrEmpty(hfPlantel_id4.Value))
            RemuevePlantel(int.Parse(hfPlantel_id4.Value));

        BindRepeater();
        //DeshabilitarBotones();
    }

    protected void ibCerrar5_Click(object sender, ImageClickEventArgs e)
    {
        if (!hfCarrera_id5.Value.Equals(-1) && !string.IsNullOrEmpty(hfCarrera_id5.Value))
            RemueveCarrera(int.Parse(hfCarrera_id5.Value));
        else if (!string.IsNullOrEmpty(hfPlantel_id5.Value))
            RemuevePlantel(int.Parse(hfPlantel_id5.Value));

        BindRepeater();
        //DeshabilitarBotones();
    }

    protected void RemuevePlantel(int plantel_id)
    {
        slistaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];

        slistaComparacion.RemoveAll(x => x.Plantel_id == plantel_id);
        slistaComparacion = vn.ActualizaNumeracionList(slistaComparacion);

        Session[Constantes.SESSION_COMPARA] = slistaComparacion;

        #region Limpiar todos los controles para que se cargen cuando se manda llamr la funcion LoadMultiView

        CleanControl(pnlComparacion.Controls);

        //ddlPlantel1.Dispose();
        //ddlPlantel2.Dispose();
        //ddlPlantel3.Dispose();
        //ddlPlantel4.Dispose();
        //ddlPlantel5.Dispose();

        //ddlPlantel1.DataBind();
        //ddlPlantel2.DataBind();
        //ddlPlantel3.DataBind();
        //ddlPlantel4.DataBind();
        //ddlPlantel5.DataBind();

        //ddlPlantel1.Visible = false;
        //ddlPlantel2.Visible = false;
        //ddlPlantel3.Visible = false;
        //ddlPlantel4.Visible = false;
        //ddlPlantel5.Visible = false;

        btnAgregarInst1.Visible = true;
        btnAgregarInst2.Visible = true;
        btnAgregarInst3.Visible = true;
        btnAgregarInst4.Visible = true;
        btnAgregarInst5.Visible = true;

        #endregion Limpiar todos los controles para que se cargen cuando se manda llamr la funcion LoadMultiView

        LoadMultiView();
    }

    protected void RemueveCarrera(int carrera_id)
    {
        slistaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];

        slistaComparacion.RemoveAll(x => x.Carrera_id == carrera_id);
        slistaComparacion = vn.ActualizaNumeracionList(slistaComparacion);

        Session[Constantes.SESSION_COMPARA] = slistaComparacion;

        #region Limpiar todos los controles para que se cargen cuando se manda llamr la funcion LoadMultiView

        CleanControl(pnlComparacion.Controls);

        //ddlPlantel1.Dispose();
        //ddlPlantel2.Dispose();
        //ddlPlantel3.Dispose();
        //ddlPlantel4.Dispose();
        //ddlPlantel5.Dispose();

        //ddlPlantel1.DataBind();
        //ddlPlantel2.DataBind();
        //ddlPlantel3.DataBind();
        //ddlPlantel4.DataBind();
        //ddlPlantel5.DataBind();

        //ddlPlantel1.Visible = false;
        //ddlPlantel2.Visible = false;
        //ddlPlantel3.Visible = false;
        //ddlPlantel4.Visible = false;
        //ddlPlantel5.Visible = false;
        #region Formato para la imagen
        imgInst1.ImageUrl = "Images/logoGezi.png";
        imgInst1.Width = Unit.Pixel(130);
        imgInst1.Height = Unit.Pixel(78);
        imgInst2.ImageUrl = "Images/logoGezi.png";
        imgInst2.Width = Unit.Pixel(130);
        imgInst2.Height = Unit.Pixel(78);
        imgInst3.ImageUrl = "Images/logoGezi.png";
        imgInst3.Width = Unit.Pixel(130);
        imgInst3.Height = Unit.Pixel(78);
        imgInst4.ImageUrl = "Images/logoGezi.png";
        imgInst4.Width = Unit.Pixel(130);
        imgInst4.Height = Unit.Pixel(78);
        imgInst5.ImageUrl = "Images/logoGezi.png";
        imgInst5.Width = Unit.Pixel(130);
        imgInst5.Height = Unit.Pixel(78);
        #endregion

        ibCerrar1.Visible = false;
        ibCerrar2.Visible = false;
        ibCerrar3.Visible = false;
        ibCerrar4.Visible = false;
        ibCerrar5.Visible = false;

        btnAgregarInst1.Visible = true;
        btnAgregarInst2.Visible = true;
        btnAgregarInst3.Visible = true;
        btnAgregarInst4.Visible = true;
        btnAgregarInst5.Visible = true;

        #endregion Limpiar todos los controles para que se cargen cuando se manda llamr la funcion LoadMultiView

        LoadMultiView();
    }

    protected void LoadMultiView()
    {
        if (Session[Constantes.SESSION_COMPARA] != null)
        {
            slistaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];

            int cont = 0;

            foreach (Plantel_Entidad p in
                slistaComparacion.Count <= 5 ?
                slistaComparacion.OrderBy(x => x.Numero_comp).Take(5) :
                slistaComparacion.Where(x => x.Numero_comp >= (int)Session[Constantes.SESSION_COMPARADESDE]).Take(5).OrderBy(x => x.Numero_comp))
            {
                cont++;

                switch (cont)
                {
                    case 1:
                        ibCerrar1.Visible = true;
                        //lblInstitucion1.Text = p.Institucion.Institucion.Length > 17 ? (string)p.Institucion.Institucion.ToString().Substring(0, 17) + "..." : (string)p.Institucion.Institucion;
                        lblInstitucion1.Text = (string)p.Institucion.Institucion;
                        lblInstitucion1.ToolTip = (string)p.Institucion.Institucion;

                        //string inst=string.Format("{0}, Universidad Autonoma de Baja California","UABC");
                        //string plant=string.Format("{0}, Facultad de Ingenieria, Arquitectura y Diseño", "FIAD");
                        //lblInstitucion1.Text = inst.ToString().Length > 17 ? inst.Substring(0, 17) + "..." : inst;

                        #region Formato para la imagen
                        imgInst1.ImageUrl = string.IsNullOrEmpty(p.Institucion.Imagen) ? "Images/logoGezi.png" : string.Concat("Images/Instituciones/", p.Institucion.Imagen);
                        imgInst1.Width = string.IsNullOrEmpty(p.Institucion.Imagen) ? Unit.Pixel(130) : Unit.Pixel(65);
                        imgInst1.Height = string.IsNullOrEmpty(p.Institucion.Imagen) ? Unit.Pixel(78) : Unit.Pixel(78);
                        imgInst1.BorderColor = Color.Silver;
                        imgInst1.BorderStyle = BorderStyle.Solid;
                        imgInst1.BorderWidth = Unit.Pixel(1);
                        #endregion

                        hfInstitucion_id1.Value = p.Institucion.Institucion_id.ToString();
                        hfPlantel_id1.Value = p.Plantel_id.ToString();
                        hfCarrera_id1.Value = p.Carrera_id.ToString();

                        btnAgregarInst1.Visible = false;

                        lblPlantel1.Visible = true;
                        //lblPlantel1.Text = p.Carrera.Length > 31 ? p.Carrera.ToString().Substring(0, 31) + "..." : p.Carrera;
                        lblPlantel1.Text = p.Carrera;
                        lblPlantel1.ToolTip = p.Carrera;
                        break;

                    case 2:

                        ibCerrar2.Visible = true;
                        //lblInstitucion2.Text = p.Institucion.Institucion.Length > 17 ? (string)p.Institucion.Institucion.ToString().Substring(0, 17) + "..." : (string)p.Institucion.Institucion;
                        lblInstitucion2.ToolTip = (string)p.Institucion.Institucion;
                        lblInstitucion2.Text = (string)p.Institucion.Institucion;

                        #region Formato para la imagen
                        imgInst2.ImageUrl = string.IsNullOrEmpty(p.Institucion.Imagen) ? "Images/logoGezi.png" : string.Concat("Images/Instituciones/", p.Institucion.Imagen);
                        imgInst2.Width = string.IsNullOrEmpty(p.Institucion.Imagen) ? Unit.Pixel(130) : Unit.Pixel(65);
                        imgInst2.Height = string.IsNullOrEmpty(p.Institucion.Imagen) ? Unit.Pixel(78) : Unit.Pixel(78);
                        imgInst2.BorderColor = Color.Silver;
                        imgInst2.BorderStyle = BorderStyle.Solid;
                        imgInst2.BorderWidth = Unit.Pixel(1);
                        #endregion

                        hfInstitucion_id2.Value = p.Institucion.Institucion_id.ToString();
                        hfPlantel_id2.Value = p.Plantel_id.ToString();
                        hfCarrera_id2.Value = p.Carrera_id.ToString();

                        btnAgregarInst2.Visible = false;

                        lblPlantel2.Visible = true;
                        //lblPlantel2.Text = p.Carrera.Length > 31 ? p.Carrera.ToString().Substring(0, 31) + "..." : p.Carrera;
                        lblPlantel2.ToolTip = p.Carrera;
                        lblPlantel2.Text = p.Carrera;
                        break;

                    case 3:
                        ibCerrar3.Visible = true;
                        //lblInstitucion3.Text = p.Institucion.Institucion.Length > 17 ? (string)p.Institucion.Institucion.ToString().Substring(0, 17) + "..." : (string)p.Institucion.Institucion;
                        lblInstitucion3.ToolTip = (string)p.Institucion.Institucion;
                        lblInstitucion3.Text = (string)p.Institucion.Institucion;

                        #region Formato para la imagen
                        imgInst3.ImageUrl = string.IsNullOrEmpty(p.Institucion.Imagen) ? "Images/logoGezi.png" : string.Concat("Images/Instituciones/", p.Institucion.Imagen);
                        imgInst3.Width = string.IsNullOrEmpty(p.Institucion.Imagen) ? Unit.Pixel(130) : Unit.Pixel(65);
                        imgInst3.Height = string.IsNullOrEmpty(p.Institucion.Imagen) ? Unit.Pixel(78) : Unit.Pixel(78);
                        imgInst3.BorderColor = Color.Silver;
                        imgInst3.BorderStyle = BorderStyle.Solid;
                        imgInst3.BorderWidth = Unit.Pixel(1);
                        #endregion

                        hfInstitucion_id3.Value = p.Institucion.Institucion_id.ToString();
                        hfPlantel_id3.Value = p.Plantel_id.ToString();
                        hfCarrera_id3.Value = p.Carrera_id.ToString();

                        btnAgregarInst3.Visible = false;

                        lblPlantel3.Visible = true;
                        //lblPlantel3.Text = p.Carrera.Length > 31 ? p.Carrera.ToString().Substring(0, 31) + "..." : p.Carrera;
                        lblPlantel3.Text = p.Carrera;
                        lblPlantel3.ToolTip = p.Carrera;
                        break;

                    case 4:

                        ibCerrar4.Visible = true;
                        //lblInstitucion4.Text = p.Institucion.Institucion.Length > 17 ? (string)p.Institucion.Institucion.ToString().Substring(0, 17) + "..." : (string)p.Institucion.Institucion;
                        lblInstitucion4.ToolTip = (string)p.Institucion.Institucion;
                        lblInstitucion4.Text = (string)p.Institucion.Institucion;

                        #region Formato para la imagen
                        imgInst4.ImageUrl = string.IsNullOrEmpty(p.Institucion.Imagen) ? "Images/logoGezi.png" : string.Concat("Images/Instituciones/", p.Institucion.Imagen);
                        imgInst4.Width = string.IsNullOrEmpty(p.Institucion.Imagen) ? Unit.Pixel(130) : Unit.Pixel(65);
                        imgInst4.Height = string.IsNullOrEmpty(p.Institucion.Imagen) ? Unit.Pixel(78) : Unit.Pixel(78);
                        imgInst4.BorderColor = Color.Silver;
                        imgInst4.BorderStyle = BorderStyle.Solid;
                        imgInst4.BorderWidth = Unit.Pixel(1);
                        #endregion

                        hfInstitucion_id4.Value = p.Institucion.Institucion_id.ToString();
                        hfPlantel_id4.Value = p.Plantel_id.ToString();
                        hfCarrera_id4.Value = p.Carrera_id.ToString();

                        btnAgregarInst4.Visible = false;

                        lblPlantel4.Visible = true;
                        //lblPlantel4.Text = p.Carrera.Length > 31 ? p.Carrera.ToString().Substring(0, 31) + "..." : p.Carrera;
                        lblPlantel4.ToolTip = p.Carrera;
                        lblPlantel4.Text = p.Carrera;

                        break;

                    case 5:

                        ibCerrar5.Visible = true;
                        //lblInstitucion5.Text = p.Institucion.Institucion.Length > 17 ? (string)p.Institucion.Institucion.ToString().Substring(0, 17) + "..." : (string)p.Institucion.Institucion;
                        lblInstitucion5.ToolTip = (string)p.Institucion.Institucion;
                        lblInstitucion5.Text = (string)p.Institucion.Institucion;

                        #region Formato para la imagen
                        imgInst5.ImageUrl = string.IsNullOrEmpty(p.Institucion.Imagen) ? "Images/logoGezi.png" : string.Concat("Images/Instituciones/", p.Institucion.Imagen);
                        imgInst5.Width = string.IsNullOrEmpty(p.Institucion.Imagen) ? Unit.Pixel(130) : Unit.Pixel(65);
                        imgInst5.Height = string.IsNullOrEmpty(p.Institucion.Imagen) ? Unit.Pixel(78) : Unit.Pixel(78);
                        imgInst5.BorderColor = Color.Silver;
                        imgInst5.BorderStyle = BorderStyle.Solid;
                        imgInst5.BorderWidth = Unit.Pixel(1);
                        #endregion

                        hfInstitucion_id5.Value = p.Institucion.Institucion_id.ToString();
                        hfPlantel_id5.Value = p.Plantel_id.ToString();
                        hfCarrera_id5.Value = p.Carrera_id.ToString();

                        btnAgregarInst5.Visible = false;


                        lblPlantel5.Visible = true;
                        //lblPlantel5.Text = p.Carrera.Length > 31 ? p.Carrera.ToString().Substring(0, 31) + "..." : p.Carrera;
                        lblPlantel5.ToolTip = p.Carrera;
                        lblPlantel5.Text = p.Carrera;
                        break;
                }
            }

            int nivel_institucional = slistaComparacion.Count.Equals(0) ? 0 : slistaComparacion.Select(x => x.Institucion.Nivel.Nivel_id).First();

            //Para que cuando se cambie de página en el tab se mantengan los colores, se invierte el numero en el tab seleccionado
            //ya que, para que lo cambia entra al metodo Menu1_MenuItemClick hasta el ultimo, y no te pone los colores correctamente.
            //mvComparaciones.ActiveViewIndex = mvComparaciones.ActiveViewIndex.Equals(1) ? 0 : 1;
            mvComparaciones.ActiveViewIndex = 1;

            Control cResumen = nivel_institucional >= 5 ? Page.LoadControl("./CompararResumenCarrera.ascx") : Page.LoadControl("./CompararResumen.ascx");
            phResumen.Controls.Clear();
            phResumen.Controls.Add(cResumen);

            //Control cExtras = nivel_institucional >= 5 ? Page.LoadControl("./CompararExtrasCarrera.ascx") : Page.LoadControl("./CompararExtras.ascx");
            //phExtras.Controls.Clear();
            //phExtras.Controls.Add(cExtras);

            Control cEncuesta = Page.LoadControl("./CompararEncuesta.ascx");
            phEncuesta.Controls.Clear();
            phEncuesta.Controls.Add(cEncuesta);

            //Se aplica el lo mismo que en la parte superior para regresar el munu a su estado original
            //mvComparaciones.ActiveViewIndex = mvComparaciones.ActiveViewIndex.Equals(1) ? 0 : 1;
            mvComparaciones.ActiveViewIndex = 0;

        }

    }

    //Función que permite limpiar todos los controles de una página Web
    //recursivamente. Útil cuando en la página existen varios controles
    //evita tener que limpiar uno por uno.
    public void CleanControl(ControlCollection controles)
    {
        foreach (Control control in controles)
        {
            if (control is TextBox)
                ((TextBox)control).Text = string.Empty;
            if (control is Label)
                ((Label)control).Text = string.Empty;
            else if (control is RadioButtonList)
                ((RadioButtonList)control).ClearSelection();
            else if (control is CheckBoxList)
                ((CheckBoxList)control).ClearSelection();
            else if (control is RadioButton)
                ((RadioButton)control).Checked = false;
            else if (control is CheckBox)
                ((CheckBox)control).Checked = false;
            else if (control.HasControls())

                //Esta linea detécta un Control que contenga otros Controles
                //Así ningún control se quedará sin ser limpiado.
                CleanControl(control.Controls);
        }
    }

    protected void DeshabilitarBotones()
    {
        #region Control 1
        ibCerrar1.Visible = false;
        imgInst1.ImageUrl = "~/Images/logoGezi.png";
        imgInst1.Width = Unit.Pixel(130);
        imgInst1.Height = Unit.Pixel(78);
        lblInstitucion1.Text = string.Empty;
        lblPlantel1.Text = string.Empty;
        hfInstitucion_id1.Value = string.Empty;
        hfPlantel_id1.Value = string.Empty;
        hfCarrera_id1.Value = string.Empty;
        btnAgregarInst1.Visible = true;
        #endregion
        #region Control 2
        ibCerrar2.Visible = false;
        imgInst2.ImageUrl = "~/Images/logoGezi.png";
        imgInst2.Width = Unit.Pixel(130);
        imgInst2.Height = Unit.Pixel(78);
        lblInstitucion2.Text = string.Empty;
        lblPlantel2.Text = string.Empty;
        hfInstitucion_id2.Value = string.Empty;
        hfPlantel_id2.Value = string.Empty;
        hfCarrera_id2.Value = string.Empty;
        btnAgregarInst2.Visible = true;
        #endregion
        #region Control 3
        ibCerrar3.Visible = false;
        imgInst3.ImageUrl = "~/Images/logoGezi.png";
        imgInst3.Width = Unit.Pixel(130);
        imgInst3.Height = Unit.Pixel(78);
        lblInstitucion3.Text = string.Empty;
        lblPlantel3.Text = string.Empty;
        hfInstitucion_id3.Value = string.Empty;
        hfPlantel_id3.Value = string.Empty;
        hfCarrera_id3.Value = string.Empty;
        btnAgregarInst3.Visible = true;
        #endregion
        #region Control 4
        ibCerrar4.Visible = false;
        imgInst4.ImageUrl = "~/Images/logoGezi.png";
        imgInst4.Width = Unit.Pixel(130);
        imgInst4.Height = Unit.Pixel(78);
        lblInstitucion4.Text = string.Empty;
        lblPlantel4.Text = string.Empty;
        hfInstitucion_id4.Value = string.Empty;
        hfPlantel_id4.Value = string.Empty;
        hfCarrera_id4.Value = string.Empty;
        btnAgregarInst4.Visible = true;
        #endregion
        #region Control 5
        ibCerrar5.Visible = false;
        imgInst5.ImageUrl = "Images/logoGezi.png";
        imgInst5.Width = Unit.Pixel(130);
        imgInst5.Height = Unit.Pixel(78);
        lblInstitucion5.Text = string.Empty;
        lblPlantel5.Text = string.Empty;
        hfInstitucion_id5.Value = string.Empty;
        hfPlantel_id5.Value = string.Empty;
        hfCarrera_id5.Value = string.Empty;
        btnAgregarInst5.Visible = true;
        #endregion
    }

    #region "Local Variables and Declarations"

    private const bool blnAllowPaging = true;
    private const int iPageSize = 5;

    private static PagedDataSource pgdProducts = new PagedDataSource();

    #endregion

    #region "Footer LinkButtons"

    protected void lnkFirst_Click(object sender, EventArgs e)
    {
        ThisPageNumber = 0;
        BindRepeater();
        LoadMultiView();
    }

    protected void lnkPrevious_Click(object sender, EventArgs e)
    {
        --ThisPageNumber;
        BindRepeater();
        LoadMultiView();
    }

    protected void lnkNext_Click(object sender, EventArgs e)
    {

        ++ThisPageNumber;
        BindRepeater();
        LoadMultiView();
    }

    protected void lnkLast_Click(object sender, EventArgs e)
    {
        ThisPageNumber = pgdProducts.PageCount - 1;
        BindRepeater();
        LoadMultiView();
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
        lblpageNumbers.Text = (pgdProducts.CurrentPageIndex + 1).ToString();

        lnkFirst.Enabled = !pgdProducts.IsFirstPage;
        lnkPrevious.Enabled = !pgdProducts.IsFirstPage;
        lnkNext.Enabled = !pgdProducts.IsLastPage;
        lnkLast.Enabled = !pgdProducts.IsLastPage;

        Session[Constantes.SESSION_COMPARADESDE] = (ThisPageNumber * iPageSize) + 1;
        //rptDetallePlantel.DataSource = pgdProducts;
        //rptDetallePlantel.DataBind();
    }

    private List<Plantel_Entidad> GetProductsDataView()
    {
        return slistaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];
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