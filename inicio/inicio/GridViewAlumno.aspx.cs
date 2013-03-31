using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;
using System.Data;

namespace inicio
{
    public partial class GridViewAlumno : System.Web.UI.Page
    {
        BusinessAlumno objAlumnoBusiness = new BusinessAlumno();
        EntityAlumno objAlumnoEntity = new EntityAlumno();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvMichBind();
        }
        protected bool gvMichBind()
        {
            DataSet dsItems = objAlumnoBusiness.AlumnoDS(objAlumnoEntity, "Select");

            if (dsItems.Tables.Count > 0)
            {
                if (dsItems.Tables[0].Rows.Count > 0)
                {
                    gvMich.DataSource = dsItems.Tables[0];
                }
                else
                    return false;
            
            }
            else
                return false;

            gvMich.DataBind();

            return true;
        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            objAlumnoEntity.Matricula = txtMat.Text;
            objAlumnoEntity.Nombre = txtName.Text;
            objAlumnoEntity.Apellido = txtLastName.Text;
            objAlumnoEntity.Edad = Convert.ToInt32(txtAge.Text);
            objAlumnoEntity.Activo = cbActive.Checked;
            objAlumnoEntity.ModifyBy = "Michelle";

            int insert = objAlumnoBusiness.Alumno(objAlumnoEntity, "Insert");

            if (insert > 0)
            {

                lbAlert.Text = "Insercion Correcta";
                gvMichBind();
            }
            else
            {
                lbAlert.Text = "Insercion Fallida";
            }

            txtMat.Text = "";
            txtName.Text = "";
            txtLastName.Text = "";
            txtAge.Text = "";
            cbActive.Checked = false;
            }
    }
}