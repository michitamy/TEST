using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Entidades;
using Negocios;
using System.Web.UI.WebControls;

public partial class Reorganizar : System.Web.UI.Page
{
    protected Views_Negocio vn = null;
    private List<Plantel_Entidad> listaComparacion = new List<Plantel_Entidad>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Constantes.SESSION_COMPARA] != null)
        {
            listaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];
            listaComparacion = AsignaListaNumeros(listaComparacion);

            gvListaPlanteles.DataSource = listaComparacion;
        }
        gvListaPlanteles.DataBind();
    }

    protected void GvListaPlanteles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
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

            gvListaPlanteles.DataSource = listaComparacion;
            gvListaPlanteles.DataBind();

        }
    }

    protected List<Plantel_Entidad> AsignaListaNumeros(List<Plantel_Entidad> lista)
    {
        List<int> numeros = new List<int>();

        foreach (Plantel_Entidad p in lista)
        {
            numeros.Add(p.Numero_comp);
        }
        foreach (Plantel_Entidad p in lista)
        {
            p.ListNumero = numeros;
        }

        return lista;
    }

    //protected void ActualizaNumero(object sender, EventArgs e)
    //{
        
    //    //locate the row in which the dropdown value has been changed
    //    GridViewRow gr = (GridViewRow)((DataControlFieldCell)((DropDownList)sender).Parent).Parent;
    //    //find the control in that
    //    DropDownList d1 = (DropDownList)gr.FindControl("dd1");
    //    string selectedvalue = d1.selectedvalue;

    //    //using selectedvalue execute a query like 
    //    //select * from product where brand_id=selectevalue
    //    //get the result in datatable dt

    //    //located the second dropdown(dd2)
    //    DropDownList d2 = (DropDownList)gr.FindControl("dd2");
    //    d2.DataSource = dt;
    //    d2.DataBind();

    //}

    //Public Sub SetDropDownIndex(ByVal sender As Object, ByVal e As System.EventArgs)
    //  Dim ed As System.Web.UI.WebControls.DropDownList
    //  ed = sender
    //  ed.SelectedIndex = ed.Items.IndexOf(ed.Items.FindByText(strCountry))
    //End Sub
}