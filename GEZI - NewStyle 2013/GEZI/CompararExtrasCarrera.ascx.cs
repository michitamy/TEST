using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;
using System.Web.UI;

public partial class Extras : BaseUserControl
{
    private List<Plantel_Entidad> listaComparacion = new List<Plantel_Entidad>();
    private Views_Negocio vn = new Views_Negocio();
    private Caracteristicas_Entidad ce = new Caracteristicas_Entidad();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
        if (Session[Constantes.SESSION_COMPARA] != null)
        {
            listaComparacion = (List<Plantel_Entidad>)Session[Constantes.SESSION_COMPARA];

            int cont = 0;

            /*
              foreach (Plantel_Entidad p in
               listaComparacion.Count <= 5 ?
               listaComparacion.OrderBy(x => x.Numero_comp) :
               listaComparacion.Where(x => x.Numero_comp >= 2).OrderBy(x => x.Numero_comp))
            {
                lista = vn.RegresaDetalleEncuesta(p.Plantel_id);
                cont++;

                if (lista.Count == 0)
                    continue;
                else if (cont.Equals(6))
                    return;
             */
            foreach (Plantel_Entidad p in
              listaComparacion.Count <= 5 ?
              listaComparacion.OrderBy(x => x.Numero_comp).Take(5) :
                listaComparacion.Where(x => x.Numero_comp >= (int)Session[Constantes.SESSION_COMPARADESDE]).Take(5).OrderBy(x => x.Numero_comp))
            {
                try{
                ce = vn.RegresaDetalleExtras(p.Plantel_id, p.Carrera_id);
                }
                catch
                {
                    PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                       "Error al intentar traer los registros a comparar.",
                                       "Alerta."));
                }
                cont++;

                //if (cont.Equals(6))
                //    return;

                #region Llenado de los campos de la tabla Comparacion Extras

                int iLabidiomas = -1;
                int iLabComputo = -1;
                int iCursosingles = -1;
                int iCursoscompu = -1;

                string sFormaEvaluadoct = string.Empty;
                string sTipoestudios = string.Empty;
                string sNoRVOE = string.Empty;
                string sDuracion = string.Empty;
                string sQueacredit = string.Empty;
                string sOpctitcion = string.Empty;
                string sProydinv = string.Empty;

                if (ce != null)
                {
                    iLabidiomas = (int)ce.Labidiomas;
                    iLabComputo = (int)ce.LabComputo;
                    sFormaEvaluadoct = (string)ce.FormaEvaluadoct;
                    
                    sNoRVOE = (string)ce.Carreras.NoRVOE;
                    sDuracion = (string)ce.Carreras.DuracionText;
                    sQueacredit = (string)ce.Carreras.Queacredit;
                    sOpctitcion = (string)ce.Carreras.Opctitcion;
                    iCursosingles = (int)ce.Carreras.Cursosingles;
                    iCursoscompu = (int)ce.Carreras.Cursoscompu;
                    sProydinv = (string)ce.Carreras.Proydinv;
                }

                ((Label)tblPlantel.FindControl("lblLabidiomas" + cont)).Text = iLabidiomas.Equals(-1) ? string.Empty : iLabidiomas.ToString();
                ((Label)tblPlantel.FindControl("lblLabComputo" + cont)).Text = iLabComputo.Equals(-1) ? string.Empty : iLabComputo.ToString();
                ((Label)tblPlantel.FindControl("lblFormaEvaluadoct" + cont)).Text = sFormaEvaluadoct;

                ((Label)tblPlantel.FindControl("lblTipoestudios" + cont)).Text = sTipoestudios;
                ((Label)tblPlantel.FindControl("lblNoRVOE" + cont)).Text = sNoRVOE;
                ((Label)tblPlantel.FindControl("lblDuracion" + cont)).Text = sDuracion;
                ((Label)tblPlantel.FindControl("lblQueacredit" + cont)).Text = sQueacredit;
                ((Label)tblPlantel.FindControl("lblOpctitcion" + cont)).Text = sOpctitcion;
                ((Label)tblPlantel.FindControl("lblCursosingles" + cont)).Text = iCursosingles.Equals(-1) ? string.Empty : iCursosingles.ToString();
                ((Label)tblPlantel.FindControl("lblCursoscompu" + cont)).Text = iCursoscompu.Equals(-1) ? string.Empty : iCursoscompu.ToString();
                ((Label)tblPlantel.FindControl("lblProydinv" + cont)).Text = sProydinv;

                #endregion Llenado de los campos de la tabla Comparacion Extras
            }
        }

        //}
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