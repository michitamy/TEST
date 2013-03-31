using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;

namespace inicio
{
    public partial class _Default : System.Web.UI.Page
    {
        BusinessMyEntity objMyEntityBusiness = new BusinessMyEntity();
        MyEntity objMyEntity = new MyEntity();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //salvar info cuando se presiona el boton

        protected void btnSave_Click(object sender, EventArgs e)
        {
            BusinnesCatalogos ObjetoCatalogo = new BusinnesCatalogos();
            EntityNivel Nivel = new EntityNivel();

            Nivel.Nombre = TxtNombre.Text;
            Nivel.Creadopor = TxtCreadopor.Text;
            Nivel.Creadodesde = TxtCreadodesde.Text;
            Nivel.Modfdesde = TxtModificadodesde.Text;
            Nivel.Modifpor = TxtModificadopor.Text;

            int Resultado = -1;
            try
            {
                Resultado=ObjetoCatalogo.nuevoNivel(Nivel);
                if (Resultado > 0)
                {
                    Mensaje.Text = "Guardado correctamente";

                }
                else
                {
                    Mensaje.Text = "Error al guardar";
                }
            }
            catch (Exception Ex)
            {
                Mensaje.Text = Ex.Message;
            }
        }

        protected void btMich_Click(object sender, EventArgs e)
        {
            objMyEntity.Name = txtMich.Text;
            objMyEntity.Apellido = txtMich2.Text;

            string x = objMyEntityBusiness.myMethodToString(objMyEntity, ddlOp.SelectedValue);

            txtRes.Text = x;
        }
    }
}
