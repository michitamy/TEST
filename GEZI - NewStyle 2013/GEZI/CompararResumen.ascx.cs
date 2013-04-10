using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;
using System.Web.UI;

public partial class Resumen : BaseUserControl
{
    private List<Plantel_Entidad> listaComparacion = new List<Plantel_Entidad>();
    private Views_Negocio vn = new Views_Negocio();
    private Caracteristicas_Entidad ce = new Caracteristicas_Entidad();

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlMensaje.Visible = false;
        if (Session[Constantes.SESSION_COMPARA] != null)
        {
            listaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];

            string si = "SI";
            string no = "NO";
            int cont = 0;

            foreach (Plantel_Entidad p in
               listaComparacion.Count <= 5 ?
               listaComparacion.OrderBy(x => x.Numero_comp).Take(5) :
                listaComparacion.Where(x => x.Numero_comp >= (int)Session[Constantes.SESSION_COMPARADESDE]).Take(5).OrderBy(x => x.Numero_comp))
            {
                try
                {
                    ce = vn.RegresaDetalleResumen(p.Plantel_id, p.Carrera_id);
                }
                catch
                {
                    PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                       "Error al intentar traer los registros a comparar.",
                                       "Alerta."));
                }
                cont++;

                decimal dCostoinsc = -1;
                decimal dCostocolra = -1;
                decimal dResulpenlace = -1;

                int iNoAlumnos = -1;

                string sLabs = string.Empty;

                string sExadiag = string.Empty;
                string sPrepingr = string.Empty;
                string sServpsco = string.Empty;
                string sActivextracurles = string.Empty;
                string sServevaegre = string.Empty;
                string sProgInterncion = string.Empty;
                string sConscalif = string.Empty;
                string sSistadminclases = string.Empty;
                string sTutorias = string.Empty;
                string sCursosremed = string.Empty;
                string sIntercacadem = string.Empty;
                string sServcomunidad = string.Empty;
                string sAireacond = string.Empty;
                string sSalonesmultim = string.Empty;
                string sBiblioteca = string.Empty;
                string sBibcompeint = string.Empty;
                string sBiblvirtual = string.Empty;
                string sEducacontinua = string.Empty;
                string sFormpedagca = string.Empty;
                string sActdisc = string.Empty;
                string sEvaluadoct = string.Empty;

                if (ce != null)
                {
                    dCostoinsc = (decimal)ce.Costoinsc;
                    dCostocolra = (decimal)ce.Costocolra;

                    iNoAlumnos = (int)ce.NoAlumnos;

                    sExadiag = ((bool)ce.Exadiag.Equals(null)) ? "-" : (((bool)ce.Exadiag) ? si : no);
                    sPrepingr = ((bool)ce.Prepingr.Equals(null)) ? "-" : (((bool)ce.Prepingr) ? si : no);
                    sServpsco = ((bool)ce.Servpsco.Equals(null)) ? "-" : (((bool)ce.Servpsco) ? si : no);
                    sActivextracurles = ((bool)ce.Activextracurles.Equals(null)) ? "-" : (((bool)ce.Activextracurles) ? si : no);
                    sServevaegre = ((bool)ce.Servevaegre.Equals(null)) ? "-" : (((bool)ce.Servevaegre) ? si : no);
                    sProgInterncion = ((bool)ce.ProgInterncion.Equals(null)) ? "-" : (((bool)ce.ProgInterncion) ? si : no);
                    sConscalif = ((bool)ce.Conscalif.Equals(null)) ? "-" : (((bool)ce.Conscalif) ? si : no);
                    sSistadminclases = ((bool)ce.Sistadminclases.Equals(null)) ? "-" : (((bool)ce.Sistadminclases) ? si : no);
                    sTutorias = ((bool)ce.Tutorias.Equals(null)) ? "-" : (((bool)ce.Tutorias) ? si : no);
                    sCursosremed = ((bool)ce.Cursosremed.Equals(null)) ? "-" : (((bool)ce.Cursosremed) ? si : no);
                    sIntercacadem = ((bool)ce.Intercacadem.Equals(null)) ? "-" : (((bool)ce.Intercacadem) ? si : no);
                    sServcomunidad = ((bool)ce.Servcomunidad.Equals(null)) ? "-" : (((bool)ce.Servcomunidad) ? si : no);
                    sAireacond = ((bool)ce.Aireacond.Equals(null)) ? "-" : (((bool)ce.Aireacond) ? si : no);
                    sSalonesmultim = ((bool)ce.Salonesmultim.Equals(null)) ? "-" : (((bool)ce.Salonesmultim) ? si : no);
                    sEducacontinua = ((bool)ce.Educacontinua.Equals(null)) ? "-" : (((bool)ce.Educacontinua) ? si : no);
                    sFormpedagca = ((bool)ce.Formpedagca.Equals(null)) ? "-" : (((bool)ce.Formpedagca) ? si : no);
                    sActdisc = ((bool)ce.Actdisc.Equals(null)) ? "-" : (((bool)ce.Actdisc) ? si : no);
                    sEvaluadoct = ((bool)ce.Evaluadoct.Equals(null)) ? "-" : (((bool)ce.Evaluadoct) ? si : no);
                    sBibcompeint = ((bool)ce.Bibcompeint.Equals(null)) ? "-" : (((bool)ce.Bibcompeint) ? si : no);
                    sBiblvirtual = ((bool)ce.Biblvirtual.Equals(null)) ? "-" : (((bool)ce.Biblvirtual) ? si : no);
                }

                #region Resumen superior de la página

                switch (p.Institucion.Nivel.Nivel_id)
                {
                    case (int)Nivel_Entidad.Niveles.Preescolar:
                        trProgInterncion.Visible = false;
                        trSistadminclases.Visible = false;
                        trIntercacadem.Visible = false;
                        trServcomunidad.Visible = false;
                        trBibcompeint.Visible = false;
                        trBiblvirtual.Visible = false;
                        trEducacontinua.Visible = false;
                        trActdisc.Visible = false;
                        trResulpenlace.Visible = false;
                        break;

                    case (int)Nivel_Entidad.Niveles.Primaria:
                        trProgInterncion.Visible = false;
                        trSistadminclases.Visible = false;
                        trIntercacadem.Visible = false;
                        trServcomunidad.Visible = false;
                        trEducacontinua.Visible = false;
                        trActdisc.Visible = false;
                        break;

                    case (int)Nivel_Entidad.Niveles.Secundaria:
                        trProgInterncion.Visible = false;
                        break;

                    case (int)Nivel_Entidad.Niveles.Preparatoria:
                        break;
                }

                ((Label)tblResumenSuperior.FindControl("lblCostoinsc" + cont)).Text = dCostoinsc.Equals(-1) ? string.Empty : dCostoinsc.ToString("C", CultureInfo.CreateSpecificCulture("es-MX"));
                ((Label)tblResumenSuperior.FindControl("lblCostocolra" + cont)).Text = dCostocolra.Equals(-1) ? string.Empty : dCostocolra.ToString("C", CultureInfo.CreateSpecificCulture("es-MX"));
                ((Label)tblResumenSuperior.FindControl("lblLabidiomas" + cont)).Text = sExadiag;
                ((Label)tblResumenSuperior.FindControl("lblLabComputo" + cont)).Text = sExadiag;
                ((Label)tblResumenSuperior.FindControl("lblBiblvirtual" + cont)).Text = sBiblvirtual;
                ((Label)tblResumenSuperior.FindControl("lblSalonesmultim" + cont)).Text = sSalonesmultim;
                ((Label)tblResumenSuperior.FindControl("lblEvaluadoct" + cont)).Text = sEvaluadoct;
                ((Label)tblResumenSuperior.FindControl("lblConscalif" + cont)).Text = sConscalif;

                #endregion Resumen superior de la página

                #region Resumen inferior de la página

                ((Label)tblPlantel.FindControl("lblExadiag" + cont)).Text = sExadiag;
                ((Label)tblPlantel.FindControl("lblPrepingr" + cont)).Text = sPrepingr;
                ((Label)tblPlantel.FindControl("lblServpsco" + cont)).Text = sServpsco;
                ((Label)tblPlantel.FindControl("lblActivextracurles" + cont)).Text = sActivextracurles;
                ((Label)tblPlantel.FindControl("lblProgInterncion" + cont)).Text = sProgInterncion;
                ((Label)tblPlantel.FindControl("lblSistadminclases" + cont)).Text = sSistadminclases;
                ((Label)tblPlantel.FindControl("lblTutorias" + cont)).Text = sTutorias;
                ((Label)tblPlantel.FindControl("lblCursosremed" + cont)).Text = sCursosremed;
                ((Label)tblPlantel.FindControl("lblIntercacadem" + cont)).Text = sIntercacadem;
                ((Label)tblPlantel.FindControl("lblServcomunidad" + cont)).Text = sServcomunidad;
                ((Label)tblPlantel.FindControl("lblAireacond" + cont)).Text = sAireacond;
                ((Label)tblPlantel.FindControl("lblBiblioteca" + cont)).Text = sBiblioteca;
                ((Label)tblPlantel.FindControl("lblBibcompeint" + cont)).Text = sBibcompeint;
                ((Label)tblPlantel.FindControl("lblEducacontinua" + cont)).Text = sEducacontinua;
                ((Label)tblPlantel.FindControl("lblFormpedagca" + cont)).Text = sFormpedagca;
                ((Label)tblPlantel.FindControl("lblActdisc" + cont)).Text = sActdisc;
                ((Label)tblPlantel.FindControl("lblResulpenlace" + cont)).Text = dResulpenlace.Equals(-1) ? string.Empty : dResulpenlace.ToString();
                ((Label)tblPlantel.FindControl("lblNoAlumnos" + cont)).Text = iNoAlumnos.Equals(-1) ? string.Empty : iNoAlumnos.ToString();

                #endregion Resumen inferior de la página
            }

            #region Para limpiar los campos faltantes
            while (cont < 5)
            {
                cont++;

                ((Label)tblResumenSuperior.FindControl("lblCostoinsc" + cont)).Text = "-";

                ((Label)tblResumenSuperior.FindControl("lblCostoinsc" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblCostocolra" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblLabidiomas" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblLabComputo" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblBiblvirtual" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblSalonesmultim" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblEvaluadoct" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblConscalif" + cont)).Text = "-";

                ((Label)tblPlantel.FindControl("lblExadiag" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblPrepingr" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblServpsco" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblActivextracurles" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblProgInterncion" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblSistadminclases" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblTutorias" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblCursosremed" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblIntercacadem" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblServcomunidad" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblAireacond" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblBiblioteca" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblBibcompeint" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblEducacontinua" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblFormpedagca" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblActdisc" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblResulpenlace" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblNoAlumnos" + cont)).Text = "-";
            }
            #endregion

        }

        DisenioTabla();
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

    protected void DisenioTabla()
    {

        int counter = 0;
        foreach (TableRow r in tblPlantel.Rows)
        {
            if (r.Visible.Equals(false))
                continue;

            if (counter++ % 2 == 0)
                r.BackColor = Color.FromName("#FFFFFF");
            else
                r.BackColor = Color.FromName("#F2F2F2");
        }

        counter = 0;
        foreach (TableRow r in tblResumenSuperior.Rows)
        {
            if (r.Visible.Equals(false))
                continue;

            if (counter++ % 2 == 0)
                r.BackColor = Color.FromName("#FFFFFF");
            else
                r.BackColor = Color.FromName("#F2F2F2");
        }
    }
}