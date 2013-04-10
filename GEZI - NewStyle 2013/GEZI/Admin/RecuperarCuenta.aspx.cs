using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Mail;
using System.Web;
using Entidades;
using Negocios;

public partial class Admin_RecuperarCuenta : System.Web.UI.Page
{
    private Usuarios_Negocio un = new Usuarios_Negocio();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string cmEmail = ConfigurationManager.AppSettings["Email"].ToString();
        string cmSMTP = ConfigurationManager.AppSettings["SMTP"].ToString();
        string cmUser = ConfigurationManager.AppSettings["User"].ToString();
        string cmPass = ConfigurationManager.AppSettings["Pass"].ToString();

        List<Usuario_Entidad> lista = new List<Usuario_Entidad>();
        string sBody = string.Empty;
        int iNoActivacion = Usuarios_Negocio.NoActivacion();

        lista = un.RegresaUsuarios(txtEmail.Text.Trim(), iNoActivacion, Constantes.RECUPERAR);

        if (lista.Count > 0)
        {
            foreach (Usuario_Entidad u in lista)
            {
                //A quien se le envia el correo
                //u.Correo;

                sBody += @"<html><head><title></title></head>";
                sBody += @"<body style='font-family: Arial'>";
                sBody += @"<div><h1>GEZI</h1>";
                sBody += @"<table>";
                sBody += @"<tr>";
                sBody += @"<td>";
                sBody += @"<label style='font-weight: bold;'>";
                sBody += @"Usuario:</label>";
                sBody += @"</td><td>";
                sBody += u.NombreUsuario;
                sBody += @"</td></tr><tr><td>";
                sBody += @"<label style='font-weight: bold;'>";
                sBody += @"Numero de activacion:</label>";
                sBody += @"</td><td>";
                sBody += iNoActivacion.ToString();
                sBody += @"</td></tr><tr>";
                sBody += @"<td colspan='2'>";
                sBody += @"Ingrese al siguiente link para que recupere su contraseña";
                sBody += @"</td></tr><tr>";
                sBody += @"<td colspan='2'>";
                sBody += @"<a href=";
                sBody += String.Format("http://{0}{1}?actcta={2};{3}", Request.Url.Authority, Request.Path.Replace("RecuperarCuenta", "Restaurar"), u.Usuario_Id, u.Activacion);//ACTivaCuenTA
                sBody += @">Recuperar contraseña</a>";
                sBody += @"</td></tr></table></div>";
                sBody += @"</body></html>";

                MailMessage mMailMessage = new MailMessage(cmEmail, HttpUtility.HtmlEncode(u.Correo));

                mMailMessage.Subject = HttpUtility.HtmlEncode(u.NombreUsuario) + "-" + HttpUtility.HtmlDecode("Recuperación de contraseña");

                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(sBody, null, "text/html");

                mMailMessage.AlternateViews.Add(htmlView);
                mMailMessage.IsBodyHtml = true;
                mMailMessage.Priority = MailPriority.Normal;
                
                SmtpClient mSmtpClient = new SmtpClient(cmSMTP);
                mSmtpClient.Credentials = new System.Net.NetworkCredential(cmUser, cmPass);
                mSmtpClient.Port = 25;
                mSmtpClient.EnableSsl = false;

                try
                {
                    mSmtpClient.Send(mMailMessage);
                }
                catch
                {
                    SetStatus("warning", "Error al intentar enviar el correo.");
                }
            }
            SetStatus("success", "Se te ha enviado un correo con el que podrás recuperar tu contraseña.");
        }
        else
            SetStatus("warning", "No hay registro para este correo.");
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