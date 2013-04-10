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
                decimal dEficterm = -1;
                decimal dDoctsmatria = -1;
                decimal dCostocolra = -1;
                decimal dEgresados = -1;
                decimal dDoctsdocdo = -1;
                decimal dInvesSNI = -1;
                decimal dDoctslibrs = -1;

                int iLabidiomas = -1;
                int iLabComputo = -1;
                int iAcrditaasig = -1;
                int iRevcurriculo = -1;
                int iNoAlumnos = -1;

                string sPosgrados = string.Empty;
                string sDuracion = string.Empty;
                string sNoRVOE = string.Empty;
                string sTipoRVOE = string.Empty;
                string sQueacredit = string.Empty;
                string sOpctitcion = string.Empty;
                string sLabs = string.Empty;
                string sProydinv = string.Empty;
                string sInglesreq = string.Empty;
                string sExadiag = string.Empty;
                string sPrepingr = string.Empty;
                string sServpsco = string.Empty;
                string sActivextracurles = string.Empty;
                string sServevaegre = string.Empty;
                string sConscalif = string.Empty;
                string sProgInterncion = string.Empty;
                string sTutorias = string.Empty;
                string sSistadminclases = string.Empty;
                string sCursosremed = string.Empty;
                string sIntercacadem = string.Empty;
                string sAireacond = string.Empty;
                string sServcomunidad = string.Empty;
                string sSalonesmultim = string.Empty;
                string sEducacontinua = string.Empty;
                string sFormpedagca = string.Empty;
                string sActdisc = string.Empty;
                string sEvaluadoct = string.Empty;
                string sBibcompeint = string.Empty;
                string sBiblvirtual = string.Empty;
                string sFormaEval = string.Empty;
                string sCalfmin = string.Empty;
                string sRazonbaja = string.Empty;
                string sActivextracrs = string.Empty;
                string sFormaEvaluadoct = string.Empty;
                string sRevcurriculo = string.Empty;
                string sCatdocts = string.Empty;
                string sAsocsinst = string.Empty;
                string sEgresados = string.Empty;

                if (ce != null)
                {
                    dCostoinsc = (decimal)ce.Carreras.Costoinsc;
                    dCostocolra = (decimal)ce.Carreras.Costocolra;
                    dEgresados = (decimal)ce.Carreras.Egresados;
                    dEficterm = (decimal)ce.Eficterm;
                    dDoctsmatria = (decimal)ce.Doctsmatria;
                    dDoctsdocdo = (decimal)ce.Doctsdocdo;
                    dInvesSNI = (decimal)ce.InvesSNI;
                    dDoctslibrs = (decimal)ce.Doctslibrs;

                    sDuracion = (string)ce.Carreras.DuracionText;
                    sNoRVOE = (string)ce.Carreras.NoRVOE;
                    sTipoRVOE = (string)ce.Carreras.TipoRVOE.Nombre;
                    sQueacredit = (string)ce.Carreras.Queacredit;
                    sOpctitcion = (string)ce.Carreras.Opctitcion;
                    sProydinv = (string)ce.Carreras.Proydinv;

                    sFormaEval = (string)ce.FormaEval;
                    sCalfmin = (string)ce.Calfmin;
                    sRazonbaja = (string)ce.Razonbaja;
                    sActivextracrs = (string)ce.Activextracrs;
                    sFormaEvaluadoct = (string)ce.FormaEvaluadoct;
                    sAsocsinst = (string)ce.Asocsinst;
                    sCatdocts = (string)ce.Catdocts;

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

                    iLabidiomas = (int)ce.Labidiomas;
                    iLabComputo = (int)ce.LabComputo;
                    iAcrditaasig = (int)ce.Acrditaasig;
                    iRevcurriculo = (int)ce.Revcurriculo;
                    iNoAlumnos = (int)ce.Carreras.NoAlumnos;

                    sInglesreq = ((bool)ce.Carreras.Inglesreq.Equals(null)) ? "-" : (((bool)ce.Carreras.Inglesreq) ? si : no);
                    sLabs = ((bool)ce.Carreras.Labs.Equals(null)) ? "-" : (((bool)ce.Carreras.Labs) ? si : no);
                    sPosgrados = ((bool)ce.Carreras.Postgrados.Equals(null)) ? "-" : (((bool)ce.Carreras.Postgrados) ? si : no);
                }

                #region Resumen superior de la página

                switch (p.Institucion.Nivel.Nivel_id)
                {

                    case (int)Nivel_Entidad.Niveles.Licenciatura:
                        tcOpctitcion.Text = "Opciones de titulación";
                        tcEgresados.Text = "Porcentaje de egresados titulados";

                        trPostgrados.Visible = false;   //El programa de postgrados es de excelencia
                        trProydinv.Visible = false;     //Lineas y proyectos de investigacion
                        break;
                    case (int)Nivel_Entidad.Niveles.Especialidad:
                        trOpctitcion.Visible = false;   //Opciones de titulación
                        trEgresados.Visible = false;    //Porcentaje de egresados titulados
                        trPostgrados.Visible = false;   //El programa de postgrados es de excelencia
                        trProydinv.Visible = false;     //Lineas y proyectos de investigacion
                        trQueacredit.Visible = false;   //Organismo que la acredita

                        trServevaegre.Visible = false;
                        trActdisc.Visible = false;

                        trRevcurriculo.Visible = false;
                        trDoctsmatria.Visible = false;
                        trDoctsdocdo.Visible = false;
                        trInvesSNI.Visible = false;
                        trDoctslibrs.Visible = false;
                        break;
                    case (int)Nivel_Entidad.Niveles.Maestria:
                        tcOpctitcion.Text = "Opciones de obtención de grado";
                        tcEgresados.Text = "Porcentaje de egresados con grado";

                        trQueacredit.Visible = false;   //Organismo que la acredita
                        trServpsco.Visible = false;
                        trActivextracurles.Visible = false;
                        trTutorias.Visible = false;
                        trCursosremed.Visible = false;
                        trServcomunidad.Visible = false;
                        trActdisc.Visible = false;

                        break;
                    case (int)Nivel_Entidad.Niveles.Doctorado:
                        tcOpctitcion.Text = "Opciones de obtención de grado";
                        tcEgresados.Text = "Porcentaje de egresados con grado";

                        trQueacredit.Visible = false;   //Organismo que la acredita
                        trServevaegre.Visible = false;
                        trActdisc.Visible = false;

                        trRevcurriculo.Visible = false;
                        trDoctsmatria.Visible = false;
                        trDoctsdocdo.Visible = false;
                        trInvesSNI.Visible = false;
                        trDoctslibrs.Visible = false;
                        break;
                }
                trNoRVOE.Visible = true;
                trTipoRVOE.Visible = true;
                ((Label)tblResumenSuperior.FindControl("lblCostoinsc" + cont)).Text = dCostoinsc.Equals(-1) ? string.Empty : dCostoinsc.ToString("C", CultureInfo.CreateSpecificCulture("es-MX"));
                ((Label)tblResumenSuperior.FindControl("lblCostocolra" + cont)).Text = dCostocolra.Equals(-1) ? string.Empty : dCostocolra.ToString("C", CultureInfo.CreateSpecificCulture("es-MX"));
                ((Label)tblResumenSuperior.FindControl("lblNoRVOE" + cont)).Text = sNoRVOE;
                ((Label)tblResumenSuperior.FindControl("lblTipoRVOE" + cont)).Text = sTipoRVOE;
                ((Label)tblResumenSuperior.FindControl("lblQueacredit" + cont)).Text = sQueacredit;
                ((Label)tblResumenSuperior.FindControl("lblOpctitcion" + cont)).Text = sOpctitcion;
                ((Label)tblResumenSuperior.FindControl("lblLabs" + cont)).Text = sLabs;
                ((Label)tblResumenSuperior.FindControl("lblPostgrados" + cont)).Text = sPosgrados;
                ((Label)tblResumenSuperior.FindControl("lblProydinv" + cont)).Text = sProydinv;
                ((Label)tblResumenSuperior.FindControl("lblDuracion" + cont)).Text = sDuracion;

                #region Formato para los porcentajes
                sEgresados = dEgresados.Equals(-1) ? "ND" : string.Format("{0}%", dEgresados).Replace(".00", string.Empty);

                ((Label)tblResumenSuperior.FindControl("lblEgresados" + cont)).Text = sEgresados;
                ((Panel)tblResumenSuperior.FindControl("pnlBorde" + cont)).Width = Unit.Percentage(Convert.ToDouble(dEgresados.Equals(-1) ? 0 : dEgresados));
                #endregion

                #endregion Resumen superior de la página

                #region Resumen inferior de la página

                ((Label)tblPlantel.FindControl("lblExadiag" + cont)).Text = sExadiag;
                ((Label)tblPlantel.FindControl("lblPrepingr" + cont)).Text = sPrepingr;
                ((Label)tblPlantel.FindControl("lblServpsco" + cont)).Text = sServpsco;
                ((Label)tblPlantel.FindControl("lblActivextracurles" + cont)).Text = sActivextracurles;
                ((Label)tblPlantel.FindControl("lblServevaegre" + cont)).Text = sServevaegre;
                ((Label)tblPlantel.FindControl("lblProgInterncion" + cont)).Text = sProgInterncion;
                ((Label)tblPlantel.FindControl("lblConscalif" + cont)).Text = sConscalif;
                ((Label)tblPlantel.FindControl("lblSistadminclases" + cont)).Text = sSistadminclases;
                ((Label)tblPlantel.FindControl("lblTutorias" + cont)).Text = sTutorias;
                ((Label)tblPlantel.FindControl("lblCursosremed" + cont)).Text = sCursosremed;
                ((Label)tblPlantel.FindControl("lblIntercacadem" + cont)).Text = sIntercacadem;
                ((Label)tblPlantel.FindControl("lblServcomunidad" + cont)).Text = sServcomunidad;
                ((Label)tblPlantel.FindControl("lblAireacond" + cont)).Text = sAireacond;
                ((Label)tblPlantel.FindControl("lblSalonesmultim" + cont)).Text = sSalonesmultim;
                ((Label)tblPlantel.FindControl("lblEducacontinua" + cont)).Text = sEducacontinua;
                ((Label)tblPlantel.FindControl("lblFormpedagca" + cont)).Text = sFormpedagca;
                ((Label)tblPlantel.FindControl("lblActdisc" + cont)).Text = sActdisc;
                ((Label)tblPlantel.FindControl("lblEvaluadoct" + cont)).Text = sEvaluadoct;
                ((Label)tblPlantel.FindControl("lblBibcompeint" + cont)).Text = sBibcompeint;
                ((Label)tblPlantel.FindControl("lblBiblvirtual" + cont)).Text = sBiblvirtual;
                ((Label)tblPlantel.FindControl("lblInglesreq" + cont)).Text = sInglesreq;

                ((Label)tblPlantel.FindControl("lblLabidiomas" + cont)).Text = iLabidiomas.Equals(-1) ? string.Empty : iLabidiomas.ToString();
                ((Label)tblPlantel.FindControl("lblLabComputo" + cont)).Text = iLabComputo.Equals(-1) ? string.Empty : iLabComputo.ToString();
                ((Label)tblPlantel.FindControl("lblAcrditaasig" + cont)).Text = iAcrditaasig.Equals(-1) ? string.Empty : iAcrditaasig.ToString();
                ((Label)tblPlantel.FindControl("lblRevcurriculo" + cont)).Text = iRevcurriculo.Equals(-1) ? string.Empty : iRevcurriculo.ToString();
                ((Label)tblPlantel.FindControl("lblNoAlumnos" + cont)).Text = iNoAlumnos.Equals(-1) ? string.Empty : iNoAlumnos.ToString();

                ((Label)tblPlantel.FindControl("lblEficterm" + cont)).Text = dEficterm.Equals(-1) ? string.Empty : dEficterm.ToString();

                #region Formato para los porcentajes
                string soctsmatria = dDoctsmatria.Equals(-1) ? "ND" : string.Format("{0}%", dDoctsmatria).Replace(".00", string.Empty);
                string sDoctsdocdo = dDoctsdocdo.Equals(-1) ? "ND" : string.Format("{0}%", dDoctsdocdo).Replace(".00", string.Empty);
                string sInvesSNI1 = dInvesSNI.Equals(-1) ? "ND" : string.Format("{0}%", dInvesSNI).Replace(".00", string.Empty);
                string sDoctslibrs = dDoctslibrs.Equals(-1) ? "ND" : string.Format("{0}%", dDoctslibrs).Replace(".00", string.Empty);

                ((Label)tblPlantel.FindControl("lblDoctsmatria" + cont)).Text = soctsmatria;
                ((Label)tblPlantel.FindControl("lblDoctsdocdo" + cont)).Text = sDoctsdocdo;
                ((Label)tblPlantel.FindControl("lblInvesSNI" + cont)).Text = sInvesSNI1;
                ((Label)tblPlantel.FindControl("lblDoctslibrs" + cont)).Text = sDoctslibrs;

                ((Panel)tblResumenSuperior.FindControl("pnlDoctsmatria" + cont)).Width = Unit.Percentage(Convert.ToDouble(dDoctsmatria.Equals(-1) ? 0 : dDoctsmatria));
                ((Panel)tblResumenSuperior.FindControl("pnlDoctsdocdo" + cont)).Width = Unit.Percentage(Convert.ToDouble(dDoctsdocdo.Equals(-1) ? 0 : dDoctsdocdo));
                ((Panel)tblResumenSuperior.FindControl("pnlInvesSNI" + cont)).Width = Unit.Percentage(Convert.ToDouble(dInvesSNI.Equals(-1) ? 0 : dInvesSNI));
                ((Panel)tblResumenSuperior.FindControl("pnlDoctslibrs" + cont)).Width = Unit.Percentage(Convert.ToDouble(dDoctslibrs.Equals(-1) ? 0 : dDoctslibrs));

                #endregion

                #endregion Resumen inferior de la página

            }

            #region Para limpiar los campos faltantes
            while (cont < 5)
            {
                cont++;

                ((Label)tblResumenSuperior.FindControl("lblCostoinsc" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblCostocolra" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblNoRVOE" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblTipoRVOE" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblQueacredit" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblOpctitcion" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblLabs" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblPostgrados" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblProydinv" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblDuracion" + cont)).Text = "-";
                ((Label)tblResumenSuperior.FindControl("lblEgresados" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblExadiag" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblPrepingr" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblServpsco" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblActivextracurles" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblServevaegre" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblProgInterncion" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblConscalif" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblSistadminclases" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblTutorias" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblCursosremed" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblIntercacadem" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblServcomunidad" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblAireacond" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblSalonesmultim" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblEducacontinua" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblFormpedagca" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblActdisc" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblEvaluadoct" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblBibcompeint" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblBiblvirtual" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblInglesreq" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblLabidiomas" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblLabComputo" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblAcrditaasig" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblRevcurriculo" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblNoAlumnos" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblEficterm" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblDoctsmatria" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblDoctsdocdo" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblInvesSNI" + cont)).Text = "-";
                ((Label)tblPlantel.FindControl("lblDoctslibrs" + cont)).Text = "-";

                ((Panel)tblResumenSuperior.FindControl("pnlBorde" + cont)).Width = Unit.Percentage(0);
                ((Panel)tblResumenSuperior.FindControl("pnlDoctsmatria" + cont)).Width = Unit.Percentage(0);
                ((Panel)tblResumenSuperior.FindControl("pnlDoctsdocdo" + cont)).Width = Unit.Percentage(0);
                ((Panel)tblResumenSuperior.FindControl("pnlInvesSNI" + cont)).Width = Unit.Percentage(0);
                ((Panel)tblResumenSuperior.FindControl("pnlDoctslibrs" + cont)).Width = Unit.Percentage(0);
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