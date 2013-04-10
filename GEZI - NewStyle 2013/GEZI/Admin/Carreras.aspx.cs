using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;
using System.Data;
using System.ComponentModel;
using System.Drawing;

public partial class Admin_Carreras : BasePage
{
    private Escuelas_Negocio en = null;
    private Views_Negocio vn = null;

    //List<Encuesta_Entidad> lsesion_ee = null;
    private List<Carreras_Entidad> lista = null;

    private Carreras_Entidad ce = null;
    private Plantel_Entidad sesion_pe = new Plantel_Entidad();

    protected void Page_Load(object sender, EventArgs e)
    {
        //pnlMensaje.Visible = false;
        pnlMensaje.Style.Add("Display", "none");

        if (Session[Constantes.SESSION_PLANTEL] != null)
        {
            sesion_pe = (Plantel_Entidad)Session[Constantes.SESSION_PLANTEL];
            lblPlantel.Text = sesion_pe.Plantel;
            lblInstitucion.Text = sesion_pe.Institucion.Institucion;
        }
        else
        {
            Response.Redirect("~/Admin/Inicio_Admin.aspx", false);
            return;
        }

        if (!Page.IsPostBack)
        {
            hfAccion.Value = Constantes.AGREGAR;
            lista = new List<Carreras_Entidad>();
            vn = new Views_Negocio();
            lista = vn.RegresaCarreras(sesion_pe.Plantel_id, Constantes.PORPLANTEL);

            int tipoPlantel = vn.RegresaTipoPlanteles(sesion_pe.Plantel_id, Constantes.TIPOPLANTEL);
            hfTipoInst.Value = tipoPlantel.Equals(-1) ? string.Empty : tipoPlantel.ToString();

            if (lista.Count > 0)
            {
                #region Llenado del dropdownlist de niveles disponibles en las carreras del plantel seleccionado
                List<Carreras_Entidad> NivelesCarreras = new List<Carreras_Entidad>();
                NivelesCarreras = lista.GroupBy(x => x.Nivel.Nivel_id).Select(x => x.First()).ToList();

                ddlNivelesDCarrera.DataTextField = "Nombre";
                ddlNivelesDCarrera.DataValueField = "Nombre";
                ddlNivelesDCarrera.DataSource = from a in NivelesCarreras select new { a.Nivel.Nombre };

                ddlNivelesDCarrera.DataBind();

                ddlNivelesDCarrera.Items.Insert(0, new ListItem("Todos", string.Empty));

                #endregion

                Session[Constantes.SESSION_CARRERA] = lista;
                gvCarrera.DataSource = lista;
            }
            else
                Session[Constantes.SESSION_CARRERA] = null;

            gvCarrera.DataBind();

            LimpiarCampos();
            LoadControlsList();
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        mpeAgregarCarrera.Hide();
        //LimpiarCampos();
        LimpiaControl(pnlCarrera.Controls);
        mpeAgregarCarrera.Show();
    }

    protected void LimpiarCampos()
    {
        btnCancelar.Visible = false;
        hfID.Value = string.Empty;
        hfAccion.Value = Constantes.AGREGAR;
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        lista = new List<Carreras_Entidad>();

        lista = (List<Carreras_Entidad>)Session[Constantes.SESSION_CARRERA];

        gvCarrera.DataSource = lista;
        gvCarrera.DataBind();

        LimpiarCampos();
        LimpiaControl(pnlCarrera.Controls);
    }

    protected void GvCarrera_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            int Carrera_id;
            System.Nullable<bool> bLabs;
            System.Nullable<bool> bPostgrados;


            if (e.CommandName == Constantes.ACTUALIZAR)
            {
                Carrera_id = int.Parse(((HiddenField)row.FindControl("hfCarrera_id")).Value);
                hfID.Value = Carrera_id.ToString();
                hfAccion.Value = Constantes.ACTUALIZAR;
                lista = new List<Carreras_Entidad>();

                lista = (List<Carreras_Entidad>)Session[Constantes.SESSION_CARRERA];
                string nivel = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Nivel.Nivel_id).First().ToString();

                ddlTipoRVOE.SelectedValue = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.TipoRVOE.TipoRVOE_id).First().ToString();
                cddNivel.SelectedValue = nivel;

                rblLicacredit.SelectedValue = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Licacredit).First().ToString();
                rblInglesreq.SelectedValue = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Inglesreq).First().ToString();

                bLabs = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Labs).First();
                bPostgrados = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Postgrados).First();

                rblLabs.SelectedValue = bLabs != null ? bLabs.ToString() : string.Empty;
                rblPostgrados.SelectedValue = bPostgrados != null ? bPostgrados.ToString() : string.Empty;
                rblPostgrados.Enabled = nivel.Equals("7") ? false : true;

                txtTipoestudios.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Tipoestudios).First();
                txtNoRVOE.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.NoRVOE).First();
                txtQueacredit.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Queacredit).First();
                txtOpctitcion.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Opctitcion).First();
                txtProydinv.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Proydinv).First();
                txtProydinv.Enabled = nivel.Equals("7") ? false : true;

                txtDAnios.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Duracion).First().ToString().Split('.')[0];
                txtDMeses.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Duracion).First().ToString().Split('.')[1];
                txtColegiatura.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Costocolra).First().ToString();
                txtInscripcion.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Costoinsc).First().ToString();
                txtCursosingles.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Cursosingles).First().ToString();
                txtCursoscompu.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Cursoscompu).First().ToString();
                txtEgresados.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.Egresados).First().ToString();
                txtNoAlumnos.Text = lista.Where(x => x.Carrera_ID == Carrera_id).Select(x => x.NoAlumnos).First().ToString();

                btnCancelar.Visible = true;
                mpeAgregarCarrera.Show();
            }
            else if (e.CommandName == Constantes.ELIMINAR)
            {
                if (RemueveInformacion(int.Parse(((HiddenField)row.FindControl("hfCarrera_id")).Value), sesion_pe.Plantel_id))
                {
                    LimpiaControl(pnlCarrera.Controls);

                    hfAccion.Value = Constantes.AGREGAR;
                    btnCancelar.Visible = false;
                }
            }
        }
        catch
        {
            return;
        }
    }

    protected void lbEliminarEnc_Click(object sender, EventArgs e)
    {
        //if (RemueveInformacion(hfEncuesta_GUID.Value, -1, Constantes.PORENCUESTA))
        //    LimpiarCampos(true);
    }

    /// <summary>
    /// Funcion para remover una carrera de la base de datos
    /// </summary>
    /// <param name="carrera_id">Numero de identificacion de la carrera que se desea eliminar.</param>
    /// <param name="plantel_id">Numero de identificacion del plantel que sirve para traer las carreras que
    /// estan disponibles hasta este momento.</param>
    /// <returns>Regresa si fue correcto la eliminacion de la carrera.</returns>
    protected bool RemueveInformacion(int carrera_id, int plantel_id)
    {
        en = new Escuelas_Negocio();
        lista = new List<Carreras_Entidad>();

        try
        {
            lista = en.RemueveCarrera(carrera_id, plantel_id);
            gvCarrera.DataSource = lista;
            gvCarrera.DataBind();

            if (lista.Count > 0)
            {
                Session[Constantes.SESSION_CARRERA] = lista;

                gvCarrera.DataSource = lista;
                gvCarrera.DataBind();

                if (lista.Where(x => x.Carrera_ID == carrera_id).Count().Equals(0))
                    PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                            "La carrera fue eliminada correctamente",
                            "Bien."));
                else
                    PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                "No se pudo eliminar la carrera, verifique la información e intente de nuevo.",
                                "Alerta."));

                return true;
            }
            else
                PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                             "La carrera fue eliminada correctamente",
                             "Bien."));

            return true;
        }
        catch (Exception ex)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
             ex.Message,
              "Error."));
        }

        return false;
    }

    /// <summary>
    /// Metodo para limpiar un control
    /// </summary>
    /// <param name="controles">Control al cual desea limpiar.</param>
    public void LimpiaControl(ControlCollection controles)
    {
        foreach (Control control in controles)
        {
            if (control is TextBox)
                ((TextBox)control).Text = string.Empty;
            else if (control is RadioButtonList)
                ((RadioButtonList)control).ClearSelection();
            else if (control is CheckBoxList)
                ((CheckBoxList)control).ClearSelection();
            else if (control is RadioButton)
                ((RadioButton)control).Checked = false;
            else if (control is CheckBox)
                ((CheckBox)control).Checked = false;
            else if (control.HasControls())
                LimpiaControl(control.Controls);
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

    protected void LoadControlsList()
    {
        List<TipoRVOE_Entidad> lista = new List<TipoRVOE_Entidad>();
        vn = new Views_Negocio();

        lista = vn.RegresaTiposRVOEs();

        ddlTipoRVOE.DataSource = lista;
        ddlTipoRVOE.DataTextField = "Nombre";
        ddlTipoRVOE.DataValueField = "TipoRVOE_id";
        ddlTipoRVOE.DataBind();

        ddlTipoRVOE.Items.Insert(0, new ListItem("Seleccione un Tipo de RVOE", ""));
    }

    protected void Duracion_ServerValidate(Object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
    {
        if (string.IsNullOrEmpty(txtDAnios.Text) && string.IsNullOrEmpty(txtDMeses.Text))
            args.IsValid = false;
        else
            args.IsValid = true;
    }

    protected void btnAgregarCarrera_Click(object sender, EventArgs e)
    {
        ce = new Carreras_Entidad();
        en = new Escuelas_Negocio();
        string notificacion = string.Empty;
        lista = new List<Carreras_Entidad>();

        ce.Carrera_ID = string.IsNullOrEmpty(hfID.Value) ? 0 : int.Parse(hfID.Value);
        ce.Plantel.Plantel_id = sesion_pe.Plantel_id;
        ce.Usuario.Equipo = usuario.Equipo;
        ce.Usuario.Usuario = usuario.Usuario;
        ce.Usuario.Fecha = usuario.Fecha;

        ce.TipoRVOE.TipoRVOE_id = int.Parse(ddlTipoRVOE.SelectedValue);
        ce.Nivel.Nivel_id = int.Parse(ddlNivel.SelectedValue);
        ce.Licacredit = bool.Parse(rblLicacredit.SelectedValue);
        ce.Inglesreq = bool.Parse(rblInglesreq.SelectedValue);

        #region Campos no obligatorios

        if (!string.IsNullOrEmpty(rblLabs.SelectedValue))
            ce.Labs = bool.Parse(rblLabs.SelectedValue);

        if (!string.IsNullOrEmpty(rblPostgrados.SelectedValue))
            ce.Postgrados = bool.Parse(rblPostgrados.SelectedValue);

        #endregion Campos no obligatorios

        ce.Tipoestudios = txtTipoestudios.Text.Trim();
        ce.NoRVOE = txtNoRVOE.Text.Trim();
        ce.Queacredit = txtQueacredit.Text.Trim();
        ce.Opctitcion = txtOpctitcion.Text.Trim();
        ce.Proydinv = txtProydinv.Text.Trim();

        ce.Duracion = decimal.Parse(string.Format("{0}.{1}", txtDAnios.Text, Views_Negocio.FormatoDecimal(txtDMeses.Text).ToString("N2").Split('.')[1]));
        ce.Costocolra = decimal.Parse(txtColegiatura.Text.Trim());
        ce.Costoinsc = decimal.Parse(txtInscripcion.Text.Trim());
        ce.Egresados = !string.IsNullOrEmpty(txtEgresados.Text) ? decimal.Parse(txtEgresados.Text.Trim()) : 0;

        ce.Cursosingles = !string.IsNullOrEmpty(txtCursosingles.Text) ? int.Parse(txtCursosingles.Text.Trim()) : 0;
        ce.Cursoscompu = !string.IsNullOrEmpty(txtCursoscompu.Text) ? int.Parse(txtCursoscompu.Text.Trim()) : 0;
        ce.NoAlumnos = !string.IsNullOrEmpty(txtNoAlumnos.Text) ? int.Parse(txtNoAlumnos.Text.Trim()) : 0;

        try
        {
            lista = (hfAccion.Value.Equals(Constantes.AGREGAR)) ? en.AMCarrera(ce, Constantes.AGREGAR) : en.AMCarrera(ce, Constantes.ACTUALIZAR);

            if (lista.Count > 0 && (hfAccion.Value.Equals(Constantes.ACTUALIZAR) || lista.Count > gvCarrera.Rows.Count))
            {
                #region Llenado del dropdownlist de niveles disponibles en las carreras del plantel seleccionado
                List<Carreras_Entidad> NivelesCarreras = new List<Carreras_Entidad>();
                NivelesCarreras = lista.GroupBy(x => x.Nivel.Nivel_id).Select(x => x.First()).ToList();

                ddlNivelesDCarrera.DataTextField = "Nombre";
                ddlNivelesDCarrera.DataValueField = "Nombre";
                ddlNivelesDCarrera.DataSource = from a in NivelesCarreras select new { a.Nivel.Nombre };

                ddlNivelesDCarrera.DataBind();

                ddlNivelesDCarrera.Items.Insert(0, new ListItem("Todos", string.Empty));

                #endregion

                Session[Constantes.SESSION_CARRERA] = lista;
                gvCarrera.DataSource = lista;

                PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                    string.Format("Los datos para la carrera {0} fueron guardados correctamente.", txtTipoestudios.Text.Trim()),
                    "Bien."));

                LimpiarCampos();
                LimpiaControl(pnlCarrera.Controls);

                gvCarrera.DataBind();
            }
            else
                PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                       "No se pudo guardar la carrera, verifique la información e intente de nuevo.",
                                       "Alerta."));
        }
        catch (Exception ex)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
              ex.Message,
              "Error."));
        }

        txtTipoestudios.Focus();
    }

    protected void btnBuscar_Click1(object sender, EventArgs e)
    {
        if (Session[Constantes.SESSION_CARRERA] == null)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Informacion,
              "No ahí carreras disponibles para este plantel.",
              "Información."));

            return;
        }

        List<Carreras_Entidad> ListaCarreras = new List<Carreras_Entidad>();
        lista = new List<Carreras_Entidad>();
        lista = (List<Carreras_Entidad>)Session[Constantes.SESSION_CARRERA];

        if (gvCarrera.Rows.Count.Equals(0) && lista.Count.Equals(0))
        {
            gvCarrera.DataBind();
            return;
        }
        else if (string.IsNullOrEmpty(txtBuscar.Text) && ddlNivelesDCarrera.SelectedIndex.Equals(0))
            ListaCarreras = lista;
        else if (!string.IsNullOrEmpty(txtBuscar.Text) && ddlNivelesDCarrera.SelectedIndex.Equals(0))
            ListaCarreras = lista.Where(x => x.Tipoestudios.ToLower().Contains(txtBuscar.Text.ToLower().Trim())).ToList();
        else if (string.IsNullOrEmpty(txtBuscar.Text) && !ddlNivelesDCarrera.SelectedIndex.Equals(0))
            ListaCarreras = lista.Where(x => x.Nivel.Nombre.Equals(ddlNivelesDCarrera.SelectedItem.Text)).ToList();
        else
            ListaCarreras = lista.Where(x => x.Nivel.Nombre.Equals(ddlNivelesDCarrera.SelectedItem.Text) && x.Tipoestudios.ToLower().Contains(txtBuscar.Text.ToLower().Trim())).ToList();

        gvCarrera.DataSource = ListaCarreras;
        gvCarrera.DataBind();

    }

    protected void ibAgregar_Click(object sender, ImageClickEventArgs e)
    {
        LimpiarCampos();
        LimpiaControl(pnlCarrera.Controls);
        mpeAgregarCarrera.Show();
    }
}