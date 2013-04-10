using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using Entidades;
using Negocios;

public partial class Admin_Restaurar : System.Web.UI.Page
{
    private Usuarios_Negocio un = new Usuarios_Negocio();
    private Usuario_Entidad ue = new Usuario_Entidad();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                string[] activacion = Request.QueryString["actcta"].Split(';');

                ue = un.RegresaNoActivacion(int.Parse(activacion[0]), int.Parse(activacion[1]));

                if (ue != null)
                {
                    lblCodigo.Text = ue.Activacion.ToString();
                    lblUserName.Text = ue.Usuario;
                    hfUsuario_ID.Value = ue.Usuario_Id.ToString();
                }
                else
                {
                    SetStatus("warning", "Este numero de activación ya no esta disponible.");
                    CreateUserButton.Enabled = false;
                }
            }
            catch
            {
                SetStatus("warning", "Codigo de activacion invalido.");
                CreateUserButton.Enabled = false;
            }
        }
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

    protected void CreateUserButton_Click(object sender, EventArgs e)
    {
        SaltedHash saltedhass = new SaltedHash(txtContrasenia.Text.Trim());
        List<Usuario_Entidad> lista = new List<Usuario_Entidad>();

        ue.Usuario_Id = int.Parse(hfUsuario_ID.Value);
        ue.ContraseniaHash = saltedhass.Hash;
        ue.ContraseniaSalt = saltedhass.Salt;
        ue.NombreUsuario = lblUserName.Text;
        ue.Activacion = int.Parse(lblCodigo.Text);

        //ue.Equipo = ;
        ue.Usuario = lblUserName.Text;
        ue.Fecha = DateTime.Now;

        try
        {
            lista = un.AMUsuarios(ue, Constantes.RESTAURAR);

            ue = lista.Where(x => x.Usuario_Id == int.Parse(hfUsuario_ID.Value)).First();
            Session[Constantes.SESSION_LOGIN] = ue;

            if (ue != null)
                FormsAuthentication.RedirectFromLoginPage(ResolveUrl("~/Admin/Inicio_Admin.aspx"), false);
        }
        catch
        {
            SetStatus("warning", "Erro al querer restaurar la contraseña");
        }
    }
}