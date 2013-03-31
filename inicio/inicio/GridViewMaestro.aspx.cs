using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocios;
using Entidades;

namespace inicio
{
    public partial class GridViewMaestro : System.Web.UI.Page
    {
        BusinessMaestro objMaestroBusiness = new BusinessMaestro();
        EntityMaestro objMaestroEntity = new EntityMaestro();

        protected void Page_Load(object sender, EventArgs e)
        {
            gvMaestroBind();
        }
        protected bool gvMaestroBind()
        {
            DataSet dsItems = objMaestroBusiness.MaestroDS(objMaestroEntity, "Select");

            if (dsItems.Tables.Count > 0)
            {
                if (dsItems.Tables[0].Rows.Count > 0)
                {
                    gvMaestro.DataSource = dsItems.Tables[0];
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
            objMaestroEntity.Carrera = txtCarrera.Text;//Convert.ToInt32(txtAge.Text);
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
    }
}