using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocios;
using Entidades;
using System.Text;

namespace inicio
{
    public partial class GridViewMaestro : System.Web.UI.Page
    {
        BusinessMaestro objMaestroBusiness = new BusinessMaestro();
        EntityMaestro objMaestroEntity = new EntityMaestro();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["TaskTable"] = null;
                gvMaestroBind();
            }
        }
        protected bool gvMaestroBind()
        {
            DataSet dsItems = objMaestroBusiness.MaestroDS(objMaestroEntity, "Select");

            if (dsItems.Tables.Count > 0)
            {
                if (dsItems.Tables[0].Rows.Count > 0)
                {
                    gvMaestro.DataSource = dsItems.Tables[0];
                    Session["TaskTable"] = dsItems.Tables[0];
                    //Session["myRow"] = dsItems.Tables[0].Rows[0];
                }
                else
                    return false;

            }
            else
                return false;

            gvMaestro.DataBind();

            return true;
        }
        protected void btSave_Click(object sender, EventArgs e)
        {
            objMaestroEntity.NoEmpleado = txtNoEmpleado.Text;
            objMaestroEntity.Titulo = ddTitulo.SelectedItem.Text;
            objMaestroEntity.Nombre = txtNombre.Text;
            objMaestroEntity.ApellidoP = txtApellidoP.Text;
            objMaestroEntity.ApellidoM = txtApellidoM.Text;
            objMaestroEntity.Carrera = txtCarrera.Text;
            objMaestroEntity.ModifyBy = "Michelle";

            int insert = objMaestroBusiness.Maestro(objMaestroEntity, "Insert");

            if (insert > 0)
            {

                lbAlert.Text = "Insercion Correcta";
                gvMaestroBind();
            }
            else
            {
                lbAlert.Text = "Insercion Fallida";
            }

            txtNoEmpleado.Text = "";
            ddTitulo.Text = "";
            txtNombre.Text = "";
            txtApellidoP.Text = "";
            txtApellidoM.Text = "";
            txtCarrera.Text = "";
        }

        protected void ibToExcel_Click1(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["TaskTable"];
            //DataRow dr = (DataRow)Session["myRow"];
          

            string attachment = "attachment; filename=Model.xls";

            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.ms-excel";
            Response.ContentEncoding = Encoding.Default;

            string tab = "";

            foreach (DataColumn dc in dt.Columns)
            {
                Response.Write(tab + dc.ColumnName);
                tab = "\t";
            }

            Response.Write("\n");

            int i;

            foreach (DataRow dr in dt.Rows)
            {
                tab = "";
                for (i = 0; i < dt.Columns.Count; i++)
                {
                    Response.Write(tab + dr[i].ToString());
                    tab = "\t";
                }

                Response.Write("\n");
            }
            Response.End();
        }

        protected void gvMaestro_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvMaestro_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMaestro.EditIndex = -1;
            gvMaestroBind();
        }

        protected void gvMaestro_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int flag = -1;

            try {

                objMaestroEntity.Id = Convert.ToInt32(((HiddenField)gvMaestro.Rows[e.RowIndex].FindControl("hfEITId")).Value);

                objMaestroEntity.NoEmpleado = ((TextBox)gvMaestro.Rows[e.RowIndex].FindControl("txtEITNoEmpleado")).Text;
                objMaestroEntity.Titulo = ((DropDownList)gvMaestro.Rows[e.RowIndex].FindControl("ddlEITTitulo")).SelectedItem.Text;
                objMaestroEntity.Nombre = ((TextBox)gvMaestro.Rows[e.RowIndex].FindControl("txtEITNombre")).Text;
                objMaestroEntity.ApellidoP = ((TextBox)gvMaestro.Rows[e.RowIndex].FindControl("txtEITApellidoP")).Text;
                objMaestroEntity.ApellidoM = ((TextBox)gvMaestro.Rows[e.RowIndex].FindControl("txtEITApellidoM")).Text;
                objMaestroEntity.Carrera = ((TextBox)gvMaestro.Rows[e.RowIndex].FindControl("txtEITCarrera")).Text;
                objMaestroEntity.ModifyBy = "Michelle";

                flag = objMaestroBusiness.Maestro(objMaestroEntity, "Update");

                if (flag > 0 && gvMaestroBind())
                {

                    lbAlert.Text = "Actualizacion Correcta";
                    gvMaestro.EditIndex = -1;
                    gvMaestro.DataBind();
                    
                }
                else
                {
                    lbAlert.Text = "Actualizacion Fallida";
                    gvMaestro.EditIndex = -1;
                    gvMaestroBind();
                }
            
            }
            catch (Exception ex)
            {
                lbAlert.Text = "Error: " + ex.Message;
                gvMaestro.EditIndex = -1;
                gvMaestroBind();
            }
        }

        protected void gvMaestro_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMaestro.EditIndex = e.NewEditIndex;
            gvMaestroBind();
        }

        protected void gvMaestro_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int flag = -1;

            try
            {

                objMaestroEntity.Id = Convert.ToInt32(((HiddenField)gvMaestro.Rows[e.RowIndex].FindControl("hfId")).Value);

                flag = objMaestroBusiness.Maestro(objMaestroEntity, "Delete");

                if (flag > 0)
                {

                    lbAlert.Text = "Eliminacion Correcta";
                    gvMaestroBind();
                }
                else
                {
                    lbAlert.Text = "Eliminacion Fallida";
                }

            }
            catch(Exception ex) {
                lbAlert.Text = "Error: " + ex.Message;
            }
        }
    }
}