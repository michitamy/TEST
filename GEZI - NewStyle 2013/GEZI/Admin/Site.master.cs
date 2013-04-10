using System;
using System.Web.Security;
using System.Web.UI;
using Entidades;

public partial class Admin_Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Usuario_Entidad usuario = new Usuario_Entidad();

        if (!Page.IsPostBack)
        {
            if (Session[Constantes.SESSION_LOGIN] != null)
            {
                usuario = (Usuario_Entidad)Session[Constantes.SESSION_LOGIN];
                lblUsuario.Text = usuario.Usuario;
                registro.Visible = usuario.IsAdmin.Equals(true) ? true : false;
            }
            else
                Response.Redirect(Page.ResolveClientUrl("~/Admin/Login.aspx"), false);


        }
    }

    protected void lbSalir_Click(object sender, EventArgs e)
    {
        Session[Constantes.SESSION_LOGIN] = null;

        lblUsuario.Text = string.Empty;

        FormsAuthentication.SignOut();
        Response.Redirect(Page.ResolveClientUrl("~/Admin/Login.aspx"), false);
    }
}