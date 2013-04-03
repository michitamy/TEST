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
            objMaestroEntity.Titulo = ddTitulo.Text;
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
    }
}