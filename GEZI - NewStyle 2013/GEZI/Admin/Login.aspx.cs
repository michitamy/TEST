using System;
using System.Web;
using System.Web.Security;
using Entidades;
using Negocios;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUsuario.Focus();
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        Usuario_Entidad ue = new Usuario_Entidad();
        ue = SaltedHash.VerificaUsuario(txtUsuario.Text.Trim());

        if (ue != null)
        {
            if (SaltedHash.Verify(ue.ContraseniaSalt, ue.ContraseniaHash, txtContrasenia.Text.Trim()))
                FormsAuthentication.RedirectFromLoginPage(HttpContext.Current.User.Identity.Name, false);
            else
                SetStatus("warning", "Usuario o contraseña incorrecta.");
        }
        else
            SetStatus("warning", "Usuario o contraseña incorrecta.");

        Session[Constantes.SESSION_LOGIN] = ue;
    }

    public void SetStatus(string status, string msg)
    {
        
        AdminStatus.Attributes.Clear();
        AdminStatus.Attributes.Add("class", status);
        AdminStatus.InnerHtml =
            string.Format(
                "{0}<a href=\"javascript:HideStatus()\" style=\"width:20px;float:right\">X</a>",
                Server.HtmlEncode(msg));
    }
}