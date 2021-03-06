﻿using System;
using System.Web.UI;
using Entidades;
using Negocios;

public partial class Admin_Universidad : BaseUserControl
{
    private Caracteristicas_Entidad ce = null;
    private Escuelas_Negocio en = null;
    private Plantel_Entidad sesion_pe = new Plantel_Entidad();
    private Caracteristicas_Entidad sesion_ce = new Caracteristicas_Entidad();
    private Views_Negocio views = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlMensaje.Visible = false;

        if (Session[Constantes.SESSION_PLANTEL] != null)
        {
            sesion_pe = (Plantel_Entidad)Session[Constantes.SESSION_PLANTEL];
            lblPlantel.Text = sesion_pe.Plantel;
            lblInstitucion.Text = sesion_pe.Institucion.Institucion;
        }
        else
            Response.Redirect("~/Admin/Inicio_Admin.aspx", false);

        if (Session[Constantes.SESSION_CARACTERISTICA] != null)
            CargarCaracteristicas();
        else
            hfCaract.Value = string.Empty;
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        int iCID = -1;
        ce = new Caracteristicas_Entidad();
        en = new Escuelas_Negocio();

        ce.Plantel.Plantel_id = sesion_pe.Plantel_id;

        ce.Usuario.Equipo = usuario.Equipo;
        ce.Usuario.Usuario = usuario.Usuario;
        ce.Usuario.Fecha = usuario.Fecha;

        ce.Prepingr = bool.Parse(rblPrepingr.SelectedValue);
        ce.Servpsco = bool.Parse(rblServpsco.SelectedValue);
        ce.Activextracurles = bool.Parse(rblActivextracurles.SelectedValue);
        ce.Servevaegre = bool.Parse(rblServevaegre.SelectedValue);
        ce.ProgInterncion = bool.Parse(rblProgInterncion.SelectedValue);
        ce.Conscalif = bool.Parse(rblConscalif.SelectedValue);
        ce.Sistadminclases = bool.Parse(rblSistadminclases.SelectedValue);
        ce.Tutorias = bool.Parse(rblTutorias.SelectedValue);
        ce.Cursosremed = bool.Parse(rblCursosremed.SelectedValue);
        ce.Intercacadem = bool.Parse(rblIntercacadem.SelectedValue);
        ce.Servcomunidad = bool.Parse(rblServcomunidad.SelectedValue);
        ce.Aireacond = bool.Parse(rblAireacond.SelectedValue);
        ce.Salonesmultim = bool.Parse(rblSalonesmultim.SelectedValue);
        ce.Biblioteca = bool.Parse(rblBiblioteca.SelectedValue);
        ce.Bibcompeint = bool.Parse(rblBibcompeint.SelectedValue);
        ce.Biblvirtual = bool.Parse(rblBiblvirtual.SelectedValue);
        ce.Formpedagca = bool.Parse(rblFormpedagca.SelectedValue);
        ce.Actdisc = bool.Parse(rblActdisc.SelectedValue);
        ce.Evaluadoct = bool.Parse(rblEvaluadoct.SelectedValue);

        ce.Exadiag = bool.Parse(rblExadiag.SelectedValue);

        #region Campos no obligatorios

        if (!string.IsNullOrEmpty(rblEducacontinua.SelectedValue))
            ce.Educacontinua = bool.Parse(rblEducacontinua.SelectedValue);

        #endregion Campos no obligatorios

        ce.FormaEval = txtFormaEval.Text.Trim();
        ce.Calfmin = txtCalfmin.Text.Trim();
        ce.Razonbaja = txtRazonbaja.Text.Trim();
        ce.Activextracrs = txtActivextracrs.Text.Trim();
        ce.FormaEvaluadoct = txtFormaEvaluadoct.Text.Trim();
        ce.Catdocts = txtCatdocts.Text.Trim();
        ce.Asocsinst = txtAsocsinst.Text.Trim();

        ce.Labidiomas = !string.IsNullOrEmpty(txtLabidiomas.Text) ? int.Parse(txtLabidiomas.Text.Trim()) : -1;
        ce.LabComputo = !string.IsNullOrEmpty(txtLabComputo.Text) ? int.Parse(txtLabComputo.Text.Trim()) : -1;
        ce.Acrditaasig = !string.IsNullOrEmpty(txtAcrditaasig.Text) ? int.Parse(txtAcrditaasig.Text.Trim()) : -1;
        ce.Revcurriculo = !string.IsNullOrEmpty(txtRevcurriculo.Text) ? int.Parse(txtRevcurriculo.Text.Trim()) : -1;
        ce.NoAlumnos = !string.IsNullOrEmpty(txtNoAlumnos.Text) ? int.Parse(txtNoAlumnos.Text.Trim()) : -1;

        ce.Costoinsc = !string.IsNullOrEmpty(txtCostoinsc.Text) ? decimal.Parse(txtCostoinsc.Text.Trim()) : -1;
        ce.Costocolra = !string.IsNullOrEmpty(txtCostocolra.Text) ? decimal.Parse(txtCostocolra.Text.Trim()) : -1;

        ce.Eficterm = !string.IsNullOrEmpty(txtEficterm.Text) ? decimal.Parse(txtEficterm.Text.Trim()) : -1;
        ce.Doctsmatria = !string.IsNullOrEmpty(txtDoctsmatria.Text) ? decimal.Parse(txtDoctsmatria.Text.Trim()): -1;
        ce.Doctsdocdo = !string.IsNullOrEmpty(txtDoctsdocdo.Text) ? decimal.Parse(txtDoctsdocdo.Text.Trim()) : -1;
        ce.InvesSNI = !string.IsNullOrEmpty(txtInvesSNI.Text) ? decimal.Parse(txtInvesSNI.Text.Trim())  : -1;
        ce.Doctslibrs = !string.IsNullOrEmpty(txtDoctslibrs.Text) ? decimal.Parse(txtDoctslibrs.Text.Trim()) : -1;

        try
        {
            if (string.IsNullOrEmpty(hfCaract.Value))
                iCID = en.AMCaracteristica(ce, Constantes.AGREGAR);
            else
            {
                ce.Caract_id = int.Parse(hfCaract.Value);
                iCID = en.AMCaracteristica(ce, Constantes.ACTUALIZAR);
            }

            Plantel_Entidad pe = new Plantel_Entidad();
            pe.Institucion.Institucion_id = sesion_pe.Institucion.Institucion_id;
            pe.Institucion.Institucion = sesion_pe.Institucion.Institucion;
            pe.Plantel_id = sesion_pe.Plantel_id;
            pe.Plantel = sesion_pe.Plantel;
            pe.Estado_Id = sesion_pe.Estado_Id;
            pe.Ciudad_Id = sesion_pe.Ciudad_Id;

            ce = new Caracteristicas_Entidad();
            ce.Caract_id = iCID;

            Session[Constantes.SESSION_PLANTEL] = pe;
            Session[Constantes.SESSION_CARACTERISTICA] = ce;

            Session[Constantes.SESSION_NOTIFICACION] = "Satisfaccion,Bien.,Los atributos del plantel fueron almacenados correctamente. ";

            Response.Redirect(Page.ResolveClientUrl("~/Admin/Inicio_Admin.aspx"), false);
        }
        catch (Exception ex)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error, "No pudo se agregado correctamente. " + ex.Message, "Error."));
        }
    }

    protected void CargarCaracteristicas()
    {
        Caracteristicas_Entidad ce = new Caracteristicas_Entidad();
        ce = (Caracteristicas_Entidad)Session[Constantes.SESSION_CARACTERISTICA];

        hfCaract.Value = ce.Caract_id.ToString();

        rblPrepingr.SelectedValue = ce.Prepingr.ToString();
        rblServpsco.SelectedValue = ce.Servpsco.ToString();
        rblActivextracurles.SelectedValue = ce.Activextracurles.ToString();
        rblServevaegre.SelectedValue = ce.Servevaegre.ToString();
        rblProgInterncion.SelectedValue = ce.ProgInterncion.ToString();
        rblConscalif.SelectedValue = ce.Conscalif.ToString();
        rblSistadminclases.SelectedValue = ce.Sistadminclases.ToString();
        rblTutorias.SelectedValue = ce.Tutorias.ToString();
        rblCursosremed.SelectedValue = ce.Cursosremed.ToString();
        rblIntercacadem.SelectedValue = ce.Intercacadem.ToString();
        rblServcomunidad.SelectedValue = ce.Servcomunidad.ToString();
        rblAireacond.SelectedValue = ce.Aireacond.ToString();
        rblSalonesmultim.SelectedValue = ce.Salonesmultim.ToString();
        rblBiblioteca.SelectedValue = ce.Biblioteca.ToString();
        rblBibcompeint.SelectedValue = ce.Bibcompeint.ToString();
        rblBiblvirtual.SelectedValue = ce.Biblvirtual.ToString();
        rblFormpedagca.SelectedValue = ce.Formpedagca.ToString();
        rblActdisc.SelectedValue = ce.Actdisc.ToString();
        rblEvaluadoct.SelectedValue = ce.Evaluadoct.ToString();
        rblExadiag.SelectedValue = ce.Exadiag.ToString();

        rblEducacontinua.SelectedValue = ce.Educacontinua.ToString();

        txtFormaEval.Text = ce.FormaEval.Replace("\r\n", Environment.NewLine);
        txtCalfmin.Text = ce.Calfmin.Replace("\r\n", Environment.NewLine);
        txtRazonbaja.Text = ce.Razonbaja.Replace("\r\n", Environment.NewLine);
        txtActivextracrs.Text = ce.Activextracrs.Replace("\r\n", Environment.NewLine);
        txtFormaEvaluadoct.Text = ce.FormaEvaluadoct.Replace("\r\n", Environment.NewLine);
        txtCatdocts.Text = ce.Catdocts.Replace("\r\n", Environment.NewLine);
        txtAsocsinst.Text = ce.Asocsinst.Replace("\r\n", Environment.NewLine);

        txtLabidiomas.Text = ce.Labidiomas.ToString();
        txtLabComputo.Text = ce.LabComputo.ToString();
        txtAcrditaasig.Text = ce.Acrditaasig.ToString();
        txtRevcurriculo.Text = ce.Revcurriculo.ToString();

        txtCostoinsc.Text = ce.Costoinsc.ToString();
        txtCostocolra.Text = ce.Costocolra.ToString();

        txtEficterm.Text = ce.Eficterm.Equals(-1) ? string.Empty : ce.Eficterm.ToString();
        txtDoctsmatria.Text = ce.Doctsmatria.Equals(-1) ? string.Empty : ce.Doctsmatria.ToString();
        txtDoctsdocdo.Text = ce.Doctsdocdo.Equals(-1) ? string.Empty : ce.Doctsdocdo.ToString();
        txtInvesSNI.Text = ce.InvesSNI.Equals(-1) ? string.Empty : ce.InvesSNI.ToString();
        txtDoctslibrs.Text = ce.Doctslibrs.Equals(-1) ? string.Empty : ce.Doctslibrs.ToString();
        txtNoAlumnos.Text = ce.NoAlumnos.Equals(-1) ? string.Empty : ce.NoAlumnos.ToString();
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