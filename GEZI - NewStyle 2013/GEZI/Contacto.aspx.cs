using System;
using Entidades;
using System.Net.Mail;
using System.Configuration;
using System.Web;
using System.Web.UI;

public partial class Contacto : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlMensaje.Visible = false;
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        string cmEmail = ConfigurationManager.AppSettings["Email"].ToString();
        string cmSMTP = ConfigurationManager.AppSettings["SMTP"].ToString();
        string cmUser = ConfigurationManager.AppSettings["User"].ToString();
        string cmPass = ConfigurationManager.AppSettings["Pass"].ToString();
        MailMessage mMailMessage = new MailMessage(txtCorreo.Text, HttpUtility.HtmlEncode(cmEmail));

        string sBody = string.Empty;

        sBody += @"<html><head><title></title></head>";
        sBody += @"<body style='font-family: Arial'>";
        sBody += @"<div><h1>GEZI</h1>";
        sBody += @"<table>";
        sBody += @"<tr>";
        sBody += @"<td>";
        sBody += @"<label style='font-weight: bold;'>";
        sBody += @"Fecha:</label>";
        sBody += @"</td><td>";
        sBody += DateTime.Now.ToString();
        sBody += @"</td></tr>";
        sBody += @"<tr>";
        sBody += @"<td>";
        sBody += @"<label style='font-weight: bold;'>";
        sBody += @"Nombre:</label>";
        sBody += @"</td><td>";
        sBody += txtNombre.Text.Trim();
        sBody += @"</td></tr>";
        sBody += @"<tr>";
        sBody += @"<td>";
        sBody += @"<label style='font-weight: bold;'>";
        sBody += @"Correo:</label>";
        sBody += @"</td><td>";
        sBody += txtCorreo.Text.Trim();
        sBody += @"</td></tr><tr><td>";
        sBody += @"<label style='font-weight: bold;'>";
        sBody += @"Mensaje:</label>";
        sBody += @"</td><td>";
        sBody += txtMensaje.Text;
        sBody += @"</td></tr>";
        sBody += @"</table></div>";
        sBody += @"</body></html>";


        mMailMessage.Subject = HttpUtility.HtmlEncode(txtCorreo.Text.Trim()) + "-" + HttpUtility.HtmlDecode("Contacto");

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
            PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                       "El correo fue enviado correctamente. ",
                       "Bien. "));
        }
        catch
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                       "Error al intentar enviar el correo. ",
                       "Alerta. "));
        }
    }

    /// <summary>
    /// Para darle formato al control que muestra las notificaciones en pantalla
    /// </summary>
    /// <param name="mje">Objecto con los datos del mensaje</param>
    protected void PintaPanel(Mensaje mje)
    {

        string jScript;
        jScript = "function lunchboxClose() {" +
          "document.getElementById('pnlMensaje').style.display = 'none';" +
          "}";

        ScriptManager.RegisterStartupScript(this, typeof(Page), "CloseScript", jScript, true);

        pnlMensaje.Style.Add("Display", "inherit");

        pnlMensaje.BorderColor = mje.ColorBorde;
        pnlMensaje.BackColor = mje.ColorFondo;

        lblTitulo.Text = mje.Titulo;
        lblMensaje.Text = mje.Notificacion;

        imgMensaje.ImageUrl = mje.Icono;
    }
}