using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;
using System.IO;
using System.Web;

public partial class Admin_Inicio_Admin : BasePage
{
    private Mensaje mensaje = new Mensaje();
    private Escuelas_Negocio en = null;
    private Views_Negocio vn = null;
    private Plantel_Entidad sesion_pe = new Plantel_Entidad();
    private Caracteristicas_Entidad sesion_ce = new Caracteristicas_Entidad();

    String sPath = HttpContext.Current.Request.PhysicalApplicationPath;

    protected void Page_Load(object sender, EventArgs e)
    {
        //pnlMensaje.Visible = false;
        pnlMensaje.Style.Add("Display", "none");

        if (!Page.IsPostBack)
        {
            MenuInstitucion.Style.Add("Display", "none");
            MenuPlantel.Style.Add("Display", "none");

            //CargaInstituciones();
            //CargarPlanteles();

            #region Para el despliegue de las notificaciones que se envía desde otra página

            if (Session[Constantes.SESSION_NOTIFICACION] != null)
            {
                string[] notificacion = Session[Constantes.SESSION_NOTIFICACION].ToString().Split(',');

                switch (notificacion[0].Replace("[", string.Empty).Replace("]", string.Empty).Trim())
                {
                    case "Alerta":
                        PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                         notificacion[2],
                         notificacion[1]));
                        break;

                    case "Error":
                        PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                        notificacion[2],
                        notificacion[1]));
                        break;

                    case "Satisfaccion":
                        PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                        notificacion[2],
                        notificacion[1]));
                        break;

                    case "Informacion":
                        PintaPanel(GetMessages(Mensaje.TipoMens.Informacion,
                        notificacion[2],
                        notificacion[1]));
                        break;

                    case "Nota":
                        PintaPanel(GetMessages(Mensaje.TipoMens.Nota,
                        notificacion[2],
                        notificacion[1]));
                        break;
                }
                Session[Constantes.SESSION_NOTIFICACION] = null;
            }

            #endregion Para el despliegue de las notificaciones que se envía desde otra página

            if (Session[Constantes.SESSION_PLANTEL] != null)
            {
                sesion_pe = (Plantel_Entidad)Session[Constantes.SESSION_PLANTEL];
                try
                {
                    CargarEstados(sesion_pe.Estado_Id, sesion_pe.Ciudad_Id);

                    //Se cargan las instituciones y se selecciona el que le corresponda
                    CargaInstituciones();
                    ddlInstitucion.SelectedValue = sesion_pe.Institucion.Institucion_id.ToString();

                    //Se cargan los planteles y se selecciona el que le corresponda
                    CargarPlanteles();
                    ddlPlantel.SelectedValue = sesion_pe.Plantel_id.ToString();

                    txtInstitucion.Text = sesion_pe.Institucion.Institucion;
                    txtPlantel.Text = sesion_pe.Plantel;
                }
                catch
                {
                    PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                 "Ocurrió un error al intentar cargar los campos, intente de nuevo.",
                                 "Alerta. "));
                }
                finally
                {
                    Session[Constantes.SESSION_CARACTERISTICA] = null;
                    Session[Constantes.SESSION_PLANTEL] = null;
                }

                ddlInstitucion_SelectedIndexChanged(null, null);
            }
            else
            {
                CargarEstados(0, 0);
                CargaInstituciones();
                CargarPlanteles();

                ChecaCaracteristica(true);
            }
        }
        else
        {
            if (string.IsNullOrEmpty(ddlInstitucion.SelectedValue))
                ddlInstitucion_SelectedIndexChanged(null, null);
        }

        lbEliminarEncuesta.Attributes.Add("onclick", string.Format("return confirm(\"¿Está seguro de querer eliminar los resultados de la encuesta para el plantel {0}? \");", ddlPlantel.SelectedItem.Text));
        lbEliminar.Attributes.Add("onclick", string.Format("return confirm(\"¿Está seguro de querer eliminar los atributos del plantel {0}? \");", ddlPlantel.SelectedItem.Text));
    }

    protected void btnAgregarInst_Click(object sender, EventArgs e)
    {
        Institucion_Entidad ie = new Institucion_Entidad();
        en = new Escuelas_Negocio();
        string notificacion = string.Empty;

        ie.Institucion = txtInstitucion.Text.Trim();
        ie.Nivel.Nivel_id = int.Parse(ddlNivel.SelectedValue);
        ie.Tipo.Tipo_id = int.Parse(ddlTipo.SelectedValue);
        ie.Clave = txtClave.Text.Trim();
        ie.Telefono = txtTelefono.Text.Trim();
        ie.Web = txtWeb.Text.Trim();
        ie.Area = txtArea.Text.Trim();
        ie.Usuario.Equipo = usuario.Equipo;
        ie.Usuario.Fecha = DateTime.Now;
        ie.Usuario.Usuario = usuario.Usuario;

        #region Cargar imagenes

        if (fuImagenInst.HasFile && !hfImagen.Value.Equals(fuImagenInst.FileName))
        {
            try
            {
                ie.Imagen = LoadImage(fuImagenInst, sPath, "Images\\Instituciones\\");

            }
            catch (Exception ex)
            {
                pnlMensajeInst.Visible = true;
                lblMensajeInst.Text = ex.Message;
                return;
            }
        }
        else if (!string.IsNullOrEmpty(hfImagen.Value))
            ie.Imagen = hfImagen.Value;

        #endregion

        try
        {
            if (string.IsNullOrEmpty(lblInstID.Text))
            {
                hfInstit.Value = en.AMInstitucion(ie, Constantes.AGREGAR).ToString();

                notificacion = "La institución fue agregada correctamente.";
            }
            else
            {
                string[] split = lblInstID.Text.Split(':');

                ie.Institucion_id = int.Parse(split[1].Trim());

                hfInstit.Value = en.AMInstitucion(ie, Constantes.ACTUALIZAR).ToString();

                notificacion = "La institución fue actualizada correctamente.";
            }

            PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion, notificacion, "Bien. "));

            LimpiarNuevaInstitucion();
            CargaInstituciones();
        }
        catch (Exception ex)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                        ex.Message,
                        "Error. "));
        }
        finally
        {
            if (ddlInstitucion.Enabled)
            {
                ddlInstitucion.SelectedValue = !ddlInstitucion.Items.FindByValue(hfInstit.Value).Equals(null) ? hfInstit.Value : string.Empty;
                ddlInstitucion_SelectedIndexChanged(null, null);
            }
            hfImagen.Value = string.Empty;
        }
    }

    protected void btnAgregarPlantel_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(ddlInstitucion.SelectedValue))
            return;

        Plantel_Entidad pe = new Plantel_Entidad();
        en = new Escuelas_Negocio();
        string notificacion = string.Empty;

        pe.Institucion.Institucion_id = int.Parse(ddlInstitucion.SelectedValue);
        pe.Plantel = txtPlantel.Text.Trim();
        pe.Direccion = txtDireccion.Text.Trim();
        pe.Ciudad_Id = int.Parse(ddlCiudad.SelectedValue);
        pe.CP = int.Parse(txtCP.Text.Trim());
        pe.Telefono = txtPlantelTelefono.Text.Trim();
        pe.Contacto = txtContacto.Text.Trim();
        pe.Correo = txtCorreo.Text.Trim();
        pe.Usuario.Equipo = usuario.Equipo;
        pe.Usuario.Fecha = DateTime.Now;
        pe.Usuario.Usuario = usuario.Usuario;

        try
        {
            if (string.IsNullOrEmpty(lblPlantelID.Text))
            {
                hfPlantel.Value = en.AMPlantel(pe, Constantes.AGREGAR).ToString();

                notificacion = "El plantel fue agregado correctamente.";
            }
            else
            {
                string[] split = lblPlantelID.Text.Split(':');

                pe.Plantel_id = int.Parse(split[1].Trim());

                hfPlantel.Value = en.AMPlantel(pe, Constantes.ACTUALIZAR).ToString();

                notificacion = "El plantel fue actualizado correctamente.";
            }

            /*Seleccionar los campos de Ciudad, Estado e Institucion*/
            CargarEstados(int.Parse(ddlEstado.SelectedValue), int.Parse(ddlCiudad.SelectedValue));

            CargarPlanteles();

            PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion, notificacion, "Bien. "));
            LimpiarNuevoPlantel();
        }
        catch (Exception ex)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                        ex.Message,
                        "Error. "));
        }
        finally
        {
            if (ddlPlantel.Enabled)
            {
                ddlPlantel.SelectedValue = !ddlPlantel.Items.FindByValue(hfPlantel.Value).Equals(null) ? hfPlantel.Value : string.Empty;
                ddlPlantel_SelectedIndexChanged(null, null);
            }
        }
    }

    public String LoadImage(FileUpload fUpload, String sPathFolder, String sPath)
    {
        //Boolean FileOK = false;
        String FileExtension = string.Empty;
        String[] sExtencions = { ".jpg", ".png", ".gif", ".bmp", ".jpeg" };
        //String FileName = string.Empty;

        if (fUpload.HasFile)
        {

            hfImagen.Value = fUpload.FileName;
            //FileName = fUpload.FileName;
            FileExtension = Path.GetExtension(hfImagen.Value).ToLower();

            if (!Array.Exists(sExtencions, s => s.Equals(FileExtension)))
                throw new Exception("El formato de la imagen es incorrecto.");
        }

        try
        {
            fUpload.PostedFile.SaveAs((sPathFolder + sPath).Replace("/", @"\") + hfImagen.Value);

            return hfImagen.Value;

        }
        catch
        {
            throw new Exception("Error al intentar cargar la imagen.");
        }

    }

    protected void lbCaract_Click(object sender, EventArgs e)
    {
        try
        {
            Plantel_Entidad pe = new Plantel_Entidad();
            pe.Institucion.Institucion_id = int.Parse(ddlInstitucion.SelectedValue);
            pe.Institucion.Institucion = ddlInstitucion.SelectedItem.Text;
            pe.Plantel_id = int.Parse(ddlPlantel.SelectedValue);
            pe.Plantel = ddlPlantel.SelectedItem.Text;
            pe.Ciudad_Id = string.IsNullOrEmpty(ddlFCiudad.SelectedValue) ? 0 : int.Parse(ddlFCiudad.SelectedValue);
            pe.Estado_Id = ddlFEstado.SelectedValue.Equals("0") ? 0 : int.Parse(ddlFEstado.SelectedValue);

            Session[Constantes.SESSION_PLANTEL] = pe;

            Response.Redirect(Page.ResolveClientUrl("~/Admin/Caracterisiticas.aspx"), false);
        }
        catch
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Informacion,
                                    "Confirme que los campos 'Estado' y 'Ciudad' estén completos e intente de nuevo.",
                                    "Información. "));
        }
    }

    protected void ddlInstitucion_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlInstitucion.SelectedValue))
        {
            MenuInstitucion.Style.Add("Display", "");
            //lblInstSeleccionado.Text = ddlInstitucion.SelectedItem.Text;
            MenuInstitucion.Items[0].Text = ddlInstitucion.SelectedItem.Text;


            //if (string.IsNullOrEmpty(lblInstSeleccionado.Text))
            if (string.IsNullOrEmpty(MenuInstitucion.Items[0].Text))
                ddlPlantel.SelectedValue = string.Empty;
            else
                CargarPlanteles();
        }
        else
        {
            MenuInstitucion.Style.Add("Display", "none");
            //lblInstSeleccionado.Text = string.Empty;
        }

        ddlPlantel_SelectedIndexChanged(null, null);
    }

    protected void ddlFCiudad_SelectedIndexChanged(object sender, EventArgs e)
    {
        CargaInstituciones();
        CargarPlanteles();

        ddlInstitucion_SelectedIndexChanged(null, null);
    }

    protected void ddlFEstado_SelectedIndexChanged(object sender, EventArgs e)
    {
        CargarCiudades(0);
        CargaInstituciones();
        CargarPlanteles();

        ddlInstitucion_SelectedIndexChanged(null, null);
    }

    protected void MenuInstitucion_MenuItemClick(object sender, MenuEventArgs e)
    {
        Institucion_Entidad ie = new Institucion_Entidad();

        switch (MenuInstitucion.SelectedValue)
        {
            case "DETALLE":
                vn = new Views_Negocio();

                try
                {
                    ie = vn.RegresaInstitucion(int.Parse(ddlInstitucion.SelectedValue), Constantes.PORID);

                    lblNombre.Text = ie.Institucion;
                    lblNivel.Text = ie.Nivel.Nombre;
                    lblTipo.Text = ie.Tipo.Nombre;
                    lblClave.Text = ie.Clave;
                    lblDesInstTelefono.Text = ie.Telefono;
                    lblWeb.Text = ie.Web;
                    lblArea.Text = ie.Area;
                    lblDetInstID.Text = string.Format("ID: {0}", ie.Institucion_id);
                    imgLogo.ImageUrl = !string.IsNullOrEmpty(ie.Imagen) ? string.Concat("../Images/Instituciones/", ie.Imagen) : "../Images/empty_image.png";
                    hfImagen.Value = ie.Imagen;

                    mpeDetalleInst.Show();
                }
                catch
                {
                    PintaPanel(GetMessages(Mensaje.TipoMens.Error, "Se produjo un error al intentar traer la institución.", "Error. "));
                }

                break;

            case "MOD":
                vn = new Views_Negocio();

                try
                {
                    ie = vn.RegresaInstitucion(int.Parse(ddlInstitucion.SelectedValue), Constantes.PORID);

                    txtInstitucion.Text = ie.Institucion;
                    cddNivel.SelectedValue = ie.Nivel.Nivel_id.ToString();
                    cddTipo.SelectedValue = ie.Tipo.Tipo_id.ToString();
                    txtClave.Text = ie.Clave;
                    txtTelefono.Text = ie.Telefono;
                    txtWeb.Text = ie.Web;
                    txtArea.Text = ie.Area;
                    lblInstID.Text = string.Format("ID: {0}", ie.Institucion_id);
                    imgLogo.ImageUrl = !string.IsNullOrEmpty(ie.Imagen) ? string.Concat("../Images/Instituciones/", ie.Imagen) : "../Images/empty_image.png";
                    hfImagen.Value = ie.Imagen;

                    mpeAgregarInst.Show();
                }
                catch
                {
                    PintaPanel(GetMessages(Mensaje.TipoMens.Error, "Se produjo un error al intentar traer la institución.", "Error. "));
                }
                break;

            case "ELIM":
                en = new Escuelas_Negocio();
                int resultado = -1;

                try
                {
                    resultado = en.RemueveInstitucion(int.Parse(ddlInstitucion.SelectedValue));

                    if (resultado <= 0)
                        throw new Exception("Verifique que la institución no tenga asignado planteles.");

                    CargaInstituciones();

                    ddlInstitucion.SelectedValue = string.Empty;
                    ddlInstitucion_SelectedIndexChanged(null, null);
                    PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion, "La institución fue removida correctamente", "Bien. "));
                }
                catch (Exception ex)
                {
                    PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                                ex.Message,
                                "Error. "));
                }
                break;
        }
    }

    protected void lbNuevaInst_Click(object sender, EventArgs e)
    {
        LimpiarNuevaInstitucion();
        mpeAgregarInst.Show();
    }

    protected void MenuPlantel_MenuItemClick(object sender, MenuEventArgs e)
    {
        Plantel_Entidad pe = new Plantel_Entidad();

        switch (MenuPlantel.SelectedValue)
        {
            case "DETALLE":

                vn = new Views_Negocio();
                try
                {
                    pe = vn.RegresaPlantel(int.Parse(ddlPlantel.SelectedValue), Constantes.PORPLANTEL);

                    lblPlantel.Text = pe.Plantel;
                    lblDireccion.Text = pe.Direccion;
                    lblEstado.Text = pe.Estado;
                    lblCiudad.Text = pe.Ciudad;
                    lblCP.Text = pe.CP.ToString();
                    lblDesPTelefono.Text = pe.Telefono;
                    lblContacto.Text = pe.Contacto;
                    lblCorreo.Text = pe.Correo;
                    lblDetPlantelID.Text = string.Format("ID: {0}", pe.Plantel_id);

                    mpeDetPlantel.Show();
                }
                catch
                {
                    PintaPanel(GetMessages(Mensaje.TipoMens.Error, "Se produjo un error al intentar traer el plantel.", "Error. "));
                }
                break;

            case "MOD":

                vn = new Views_Negocio();
                try
                {
                    pe = vn.RegresaPlantel(int.Parse(ddlPlantel.SelectedValue), Constantes.PORPLANTEL);

                    txtPlantel.Text = pe.Plantel;
                    txtDireccion.Text = pe.Direccion;
                    cddEstado.SelectedValue = pe.Estado_Id.ToString();
                    cddCiudad.SelectedValue = pe.Ciudad_Id.ToString();
                    txtCP.Text = pe.CP.ToString();
                    txtPlantelTelefono.Text = pe.Telefono;
                    txtContacto.Text = pe.Contacto;
                    txtCorreo.Text = pe.Correo;
                    lblPlantelID.Text = string.Format("ID: {0}", pe.Plantel_id);

                    mpeAgregarPlantel.Show();
                }
                catch
                {
                    PintaPanel(GetMessages(Mensaje.TipoMens.Error, "Se produjo un error al intentar traer los datos del plantel.", "Error. "));
                }
                break;

            case "ELIM":
                en = new Escuelas_Negocio();
                int resultado = -1;

                try
                {
                    resultado = en.RemuevePlantel(int.Parse(ddlPlantel.SelectedValue));

                    if (resultado <= 0)
                        throw new Exception("Verifique que el plantel no tenga asignado algún cuestionario o que tenga llenados sus atributos.");

                    CargarPlanteles();

                    ddlPlantel.SelectedValue = string.Empty;
                    ddlPlantel_SelectedIndexChanged(null, null);
                    PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion, "El plantel fue removido correctamente", "Bien. "));
                }
                catch (Exception ex)
                {
                    PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                                ex.Message,
                                "Error. "));
                }
                break;
        }
    }

    protected void ddlPlantel_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlPlantel.SelectedValue))
        {
            MenuPlantel.Style.Add("Display", "");
            //lblPlantelSelec.Text = ddlPlantel.SelectedItem.Text;
            MenuPlantel.Items[0].Text = ddlPlantel.SelectedItem.Text;

            int iPlantel = int.Parse(ddlPlantel.SelectedValue);
            try
            {
                #region Caracteristica - Verifica si en la base de datos ya se llenaron su atributos

                vn = new Views_Negocio();
                Caracteristicas_Entidad ce = new Caracteristicas_Entidad();


                ce = vn.RegresaCaracteristica(0, iPlantel, Constantes.PORPLANTEL);
                if (ce != null)
                    hfCaracteristica.Value = ce.Caract_id.ToString();
                else
                    hfCaracteristica.Value = string.Empty;

                Session[Constantes.SESSION_CARACTERISTICA] = ce;

                #endregion Caracteristica - Verifica si en la base de datos ya se llenaron su atributos

                #region Plantel - Verifica si el plantel tiene una encuesta asignada en la base de datos

                vn = new Views_Negocio();
                Plantel_Entidad pe = new Plantel_Entidad();

                pe = vn.RegresaPlantel(iPlantel, Constantes.PORPLANTEL);

                if (!pe.Encuesta.GUID.Equals(System.Guid.Empty))
                    hfEncuesta_GUID.Value = pe.Encuesta.GUID != System.Guid.Empty ? pe.Encuesta.GUID.ToString() : string.Empty;
                else
                    hfEncuesta_GUID.Value = string.Empty;

                #endregion Plantel - Verifica si el plantel tiene una encuesta asignada en la base de datos
            }
            catch (Exception ex)
            {
                PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                                ex.Message,
                                "Error. "));
            }

            ChecaCaracteristica(false);
        }
        else
        {
            MenuPlantel.Style.Add("Display", "none");
            //lblPlantelSelec.Text = string.Empty;

            ChecaCaracteristica(true);
        }
    }

    protected void lbNuevoPlantel_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlInstitucion.SelectedValue))
        {
            LimpiarNuevoPlantel();
            mpeAgregarPlantel.Show();
        }
        else
            PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                   "Debe de seleccionar primero una institución",
                                   "Alerta. "));
    }

    protected void lbEliminar_Click(object sender, EventArgs e)
    {
        en = new Escuelas_Negocio();
        int resultado = -1;

        try
        {
            resultado = en.RemueveCaracteristica(int.Parse(hfCaracteristica.Value), int.Parse(ddlPlantel.SelectedValue));

            if (resultado > 0)
            {
                PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                                       "La característica fue eliminada correctamente.",
                                       "Bien. "));
                ddlPlantel_SelectedIndexChanged(null, null);
            }
            else
                PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                       "No se pudo eliminar la característica, actualice la página e intente de nuevo.",
                                       "Alerta. "));
        }
        catch (Exception ex)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                                           ex.Message,
                                           "Error. "));
        }
    }

    protected void lbLlenarEncuesta_Click(object sender, EventArgs e)
    {
        Plantel_Entidad pe = new Plantel_Entidad();
        pe.Institucion.Institucion_id = int.Parse(ddlInstitucion.SelectedValue);
        pe.Institucion.Institucion = ddlInstitucion.SelectedItem.Text;
        pe.Plantel_id = int.Parse(ddlPlantel.SelectedValue);
        pe.Plantel = ddlPlantel.SelectedItem.Text;
        pe.Ciudad_Id = string.IsNullOrEmpty(ddlFCiudad.SelectedValue) ? 0 : int.Parse(ddlFCiudad.SelectedValue);
        pe.Estado_Id = ddlFEstado.SelectedValue.Equals("0") ? 0 : int.Parse(ddlFEstado.SelectedValue);

        Session[Constantes.SESSION_PLANTEL] = pe;

        Response.Redirect(Page.ResolveClientUrl("~/Admin/LlenadoEncuesta.aspx?guid=" + hfEncuesta_GUID.Value), false);
    }

    protected void lbCarrera_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(ddlPlantel.SelectedValue))
            {
                PintaPanel(GetMessages(Mensaje.TipoMens.Informacion,
                                               "Seleccione un plantel antes.",
                                               "Información. "));
                return;
            }

            Plantel_Entidad pe = new Plantel_Entidad();
            pe.Institucion.Institucion_id = int.Parse(ddlInstitucion.SelectedValue);
            pe.Institucion.Institucion = ddlInstitucion.SelectedItem.Text;
            pe.Plantel_id = int.Parse(ddlPlantel.SelectedValue);
            pe.Plantel = ddlPlantel.SelectedItem.Text;
            pe.Ciudad_Id = string.IsNullOrEmpty(ddlFCiudad.SelectedValue) ? 0 : int.Parse(ddlFCiudad.SelectedValue);
            pe.Estado_Id = ddlFEstado.SelectedValue.Equals("0") ? 0 : int.Parse(ddlFEstado.SelectedValue);

            Session[Constantes.SESSION_PLANTEL] = pe;

            Response.Redirect(Page.ResolveClientUrl("~/Admin/Carreras.aspx"), false);
        }
        catch
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Informacion,
                                    "Confirme que los campos 'Estado' y 'Ciudad' estén completos e intente de nuevo.",
                                    "Información. "));
        }
    }

    protected void lbEliminarEncuesta_Click(object sender, EventArgs e)
    {
        en = new Escuelas_Negocio();
        int resultado = -1;

        try
        {
            resultado = en.RemueveResultados(int.Parse(ddlPlantel.SelectedValue));

            if (resultado > 0)
            {
                PintaPanel(GetMessages(Mensaje.TipoMens.Satisfaccion,
                                       "Los resultados de la encuesta fueron eliminados correctamente.",
                                       "Bien. "));

                hfEncuesta_GUID.Value = string.Empty;
                ChecaCaracteristica(false);
            }
            else
                PintaPanel(GetMessages(Mensaje.TipoMens.Alerta,
                                       "No se pudieron eliminar los resultados de la encuesta.",
                                       "Alerta. "));
        }
        catch (Exception ex)
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                                   ex.Message,
                                    "Error. "));
        }
    }

    #region Funciones Necesarias para esta página

    /// <summary>
    /// Limpia el panel que sirve para agregar un plantel
    /// </summary>
    protected void LimpiarNuevoPlantel()
    {
        LimpiaControl(pnlAgregarPlantel.Controls);

        cddCiudad.SelectedValue = string.Empty;
        cddEstado.SelectedValue = string.Empty;
        lblPlantelID.Text = string.Empty;
    }

    /// <summary>
    /// Limpia el panel que sirve para agregar una insitucion
    /// </summary>
    protected void LimpiarNuevaInstitucion()
    {
        LimpiaControl(pnlAgregarInst.Controls);

        cddNivel.SelectedValue = string.Empty;
        cddTipo.SelectedValue = string.Empty;
        lblInstID.Text = string.Empty;
        pnlMensajeInst.Visible = false;

        imgLogo.ImageUrl = "../Images/empty_image.png";
        imgLogo.Width = Unit.Pixel(125);
        imgLogo.Height = Unit.Pixel(150);

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
    /// <param name="mje">Objecto con los datos del mensaje</param>'
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

    /// <summary>
    /// Verifica cual va a se el estado actual del LinkButton Característica.
    /// </summary>
    /// <param name="bEsVacio">Indica que LinkButton Característica se quiere deshabilitado.</param>
    protected void ChecaCaracteristica(bool bEsVacio)
    {
        if (bEsVacio)
        {
            //lbCaract.Text = "Agregar Atributos";
            imgAgregarAtr.Visible = false;
            imgDetalleAtr.Visible = false;
            //lbCaract.Enabled = false;
            lbCaract.Visible = false;
            //lbCaract.ToolTip = "Agregar sus atributos al plantel.";
            lbEliminar.Visible = false;
            imgEliminaAtr.Visible = false;

            lbLlenarEncuesta.Visible = false;
            lbEliminarEncuesta.Visible = false;

            return;
        }
        else if (string.IsNullOrEmpty(hfCaracteristica.Value))
        {
            lbCaract.Text = "Agregar Atributos";
            imgAgregarAtr.Visible = true;
            imgDetalleAtr.Visible = false;
            //lbCaract.Enabled = true;
            lbCaract.Visible = true;
            lbCaract.ToolTip = "Agregar sus atributos al plantel.";
            lbEliminar.Visible = false;
            imgEliminaAtr.Visible = false;
        }
        else
        {
            lbCaract.Text = "Ver Atributos";
            imgAgregarAtr.Visible = false;
            imgDetalleAtr.Visible = true;
            //lbCaract.Enabled = true;
            lbCaract.Visible = true;
            lbCaract.ToolTip = "Ver el detalle para los atributos del plantel.";
            lbEliminar.Visible = true;
            imgEliminaAtr.Visible = true;
        }

        if (string.IsNullOrEmpty(hfEncuesta_GUID.Value))
        {
            List<Encuesta_Entidad> lista = new List<Encuesta_Entidad>();
            vn = new Views_Negocio();

            lista = vn.RegresaEncabezados(ddlPlantel.SelectedValue, Constantes.PORNIVEL);

            if (lista.Count > 0)
            {
                lbLlenarEncuesta.Text = "Llenar Resultados p/ Encuesta";
                lbLlenarEncuesta.Visible = true;
                lbEliminarEncuesta.Visible = false;
                hfEncuesta_GUID.Value = lista.Select(a => a.GUID).First().ToString();

                lblEncuesta.Text = "Encuesta: ";
            }
            else
            {
                lbLlenarEncuesta.Visible = false;
                lbEliminarEncuesta.Visible = false;

                PintaPanel(GetMessages(Mensaje.TipoMens.Nota,
                                    "Para agregar una encuesta debe ir a la opción 'Encuesta' del menú y seleccionar el nivel al que desea " +
                                    "agregar una encuesta." + Environment.NewLine + " Nota: Esa encuesta aplica para todos los planteles con el mismo nivel institucional.",
                                    "No hay un formato de encuesta para el Nivel al que pertenece este plantel. "));

                lblEncuesta.Text = string.IsNullOrEmpty(hfEncuesta_GUID.Value) ? "No hay un formato de encuesta para el Nivel al que pertenece este plantel." : "Encuesta";
            }

            //lbEliminarEncuesta.Visible = false;
        }
        else
        {
            lbLlenarEncuesta.Visible = true;
            lbLlenarEncuesta.Text = "Ver Resultados de Encuesta";
            lbEliminarEncuesta.Visible = true;
        }
    }

    protected void CargaInstituciones()
    {
        List<Institucion_Entidad> lista = new List<Institucion_Entidad>();
        vn = new Views_Negocio();
        try
        {
            int estado = string.IsNullOrEmpty(ddlFCiudad.SelectedValue) ? int.Parse(ddlFEstado.SelectedValue) : 0;
            int ciudad = !string.IsNullOrEmpty(ddlFCiudad.SelectedValue) ? int.Parse(ddlFCiudad.SelectedValue) : 0;

            lista = vn.RegresaInstituciones_PorEstadoMunicipio(estado, ciudad, Constantes.PORMunEst);
            //Group(lista);
            ddlInstitucion.DataSource = lista;
            ddlInstitucion.DataTextField = "Institucion";
            ddlInstitucion.DataValueField = "Institucion_id";
            ddlInstitucion.DataBind();

            if (!ddlInstitucion.Items.Contains(new ListItem("Seleccionar Institución", string.Empty)))
                ddlInstitucion.Items.Insert(0, new ListItem("Seleccionar Institución", string.Empty));

            ddlInstitucion.Enabled = ddlInstitucion.Items.Count > 1 ? true : false;
            //GroupStyle();
        }
        catch
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                                "Error al intentar cargar las instituciones.",
                                "Error. "));
        }
    }

    protected void CargarCiudades(int ciudad)
    {
        List<Plantel_Entidad> lista = new List<Plantel_Entidad>();
        int iCE = -1;
        vn = new Views_Negocio();

        if (!ddlFEstado.SelectedValue.Equals("0"))
        {
            iCE = int.Parse(ddlFEstado.SelectedValue);
            try
            {
                lista = vn.Nacion(iCE, Constantes.CIUDAD);
                ddlFCiudad.DataSource = lista;
                ddlFCiudad.DataTextField = "Ciudad";
                ddlFCiudad.DataValueField = "Ciudad_Id";
                ddlFCiudad.DataBind();

            }
            catch
            {
                PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                                    "Error al intentar cargar las Ciudades.",
                                    "Error. "));
            }
        }
        if (!ddlFCiudad.Items.Contains(new ListItem("Todas las Ciudades", string.Empty)))
            ddlFCiudad.Items.Insert(0, new ListItem("Todas las Ciudades", string.Empty));

        ddlFCiudad.Enabled = (ddlFCiudad.Items.Count > 1 && !ddlFEstado.SelectedValue.Equals("0")) ? true : false;
        ddlFCiudad.SelectedValue = !ciudad.Equals(0) ? ciudad.ToString() : string.Empty;
    }

    protected void CargarEstados(int estado, int ciudad)
    {
        List<Plantel_Entidad> lista = new List<Plantel_Entidad>();
        vn = new Views_Negocio();

        try
        {
            lista = vn.Nacion(-1, Constantes.ESTADO);
            ddlFEstado.DataSource = lista;
            ddlFEstado.DataTextField = "Estado";
            ddlFEstado.DataValueField = "Estado_Id";
            ddlFEstado.DataBind();
        }
        catch
        {
            PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                                "Error al intentar cargar los Estados.",
                                "Error. "));
        }
        if (!ddlFEstado.Items.Contains(new ListItem("Seleccionar Estado", string.Empty)))
            ddlFEstado.Items.Insert(0, new ListItem("Seleccionar Estado", "0"));

        ddlFEstado.Enabled = ddlFEstado.Items.Count > 1 ? true : false;
        ddlFEstado.SelectedValue = !estado.Equals(0) ? estado.ToString() : "0";
        CargarCiudades(ciudad);
    }

    protected void CargarPlanteles()
    {
        List<Plantel_Entidad> lista = new List<Plantel_Entidad>();
        vn = new Views_Negocio();

        if (!string.IsNullOrEmpty(ddlInstitucion.SelectedValue))
        {
            int iIE = int.Parse(ddlInstitucion.SelectedValue);
            try
            {
                lista = vn.RegresaPlanteles(iIE, Constantes.TODOS_PORID);
                ddlPlantel.DataSource = lista;
                ddlPlantel.DataTextField = "Plantel";
                ddlPlantel.DataValueField = "Plantel_id";
                ddlPlantel.DataBind();
            }
            catch
            {
                PintaPanel(GetMessages(Mensaje.TipoMens.Error,
                                    "Error al intentar cargar los planteles.",
                                    "Error. "));
            }

        }

        if (!ddlPlantel.Items.Contains(new ListItem("Seleccionar Plantel", string.Empty)))
            ddlPlantel.Items.Insert(0, new ListItem("Seleccionar Plantel", string.Empty));

        try
        {
            if (ddlPlantel.Items.Count > 1)
            {
                ddlPlantel.Enabled = true;
                lbCarrera.Visible = lista.Select(x => x.Institucion.Nivel.Nivel_id).First().Equals(5) ? true : false;
                imgCarrera.Visible = lista.Select(x => x.Institucion.Nivel.Nivel_id).First().Equals(5) ? true : false;
            }
            else
            {
                ddlPlantel.Enabled = false;
                lbCarrera.Visible = false;
                imgCarrera.Visible = false;
            }
        }
        catch
        {
            ddlPlantel.Enabled = false;
            lbCarrera.Visible = false;
            imgCarrera.Visible = false;
            ddlPlantel.SelectedValue = string.Empty;
            ddlPlantel_SelectedIndexChanged(null, null);
        }
    }

    #endregion Funciones Necesarias para esta página

    #region Funcion para agrupar la lista de las instituciones
    protected void Group(List<Institucion_Entidad> list)
    {
        DropDownList li = new DropDownList();
        int nivel_id = -1;
        //int cont=1;
        string NameGroup = string.Empty;

        foreach (Institucion_Entidad i in list)
        {
            if (!nivel_id.Equals(i.Nivel.Nivel_id))
            {
                nivel_id = i.Nivel.Nivel_id;
                NameGroup = ((Nivel_Entidad.Niveles)(int)i.Nivel.Nivel_id).ToString();
                ddlInstitucion.Items.Add(new ListItem(NameGroup, NameGroup));
            }

            ddlInstitucion.Items.Add(new ListItem(i.Institucion, i.Institucion_id.ToString()));
        }
    }

    protected void GroupStyle()
    {
        for (int i = 0; i < ddlInstitucion.Items.Count; i++)
        {
            if (ddlInstitucion.Items[i].Value.Equals((Nivel_Entidad.Niveles.Preescolar).ToString()) ||
                ddlInstitucion.Items[i].Value.Equals((Nivel_Entidad.Niveles.Primaria).ToString()) ||
                ddlInstitucion.Items[i].Value.Equals((Nivel_Entidad.Niveles.Secundaria).ToString()) ||
                ddlInstitucion.Items[i].Value.Equals((Nivel_Entidad.Niveles.Preparatoria).ToString()) ||
                ddlInstitucion.Items[i].Value.Equals((Nivel_Entidad.Niveles.Universidad).ToString()))
            {
                ddlInstitucion.Items[i].Attributes.Add("style", "font-weight:bold;");
                ddlInstitucion.Items[i].Attributes.Add("disabled", "true");
            }
            else
                ddlInstitucion.Items[i].Attributes.Add("style", "margin-left:1em;");
        }
        //ddlInstitucion.DataBind();
    }
    #endregion
}