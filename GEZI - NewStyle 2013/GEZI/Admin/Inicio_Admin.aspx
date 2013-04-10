<%@ Page Title="Administracion GEZI" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="Inicio_Admin.aspx.cs" Inherits="Admin_Inicio_Admin" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/Admin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/StyleGEZI.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.dropotron-1.0.js" type="text/javascript"></script>
    <%--<script src="../Scripts/jquery.slidertron-1.1.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= pnlMensaje.ClientID %>').delay(8000).slideUp(300);
        });
    </script>
    <style type="text/css">
        .ParaGrids
        {
            padding-bottom: 10px;            
        }
        .PadImagen img
        {
            padding-right: 5px;
        }
    </style>
    <style type="text/css">
        #progressBackgroundFilter
        {
            position: absolute;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            overflow: hidden;
            padding: 0;
            margin: 0;
            background-color: #000;
            filter: alpha(opacity=50);
            opacity: 0.5;
            z-index: 1000;
        }

        #processMessage
        {
            position: absolute;
            top: 30%;
            left: 43%;
            padding: 10px;
            width: 14%;
            z-index: 1001;
            background-color: #fff;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="upAdministracion">
        <ContentTemplate>
            <asp:ToolkitScriptManager ID="tsmInicio_Admin" runat="server">
            </asp:ToolkitScriptManager>
            <asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
                <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
                <b>
                    <asp:Label runat="server" ID="lblTitulo"></asp:Label></b>
                <asp:Label runat="server" ID="lblMensaje"></asp:Label>
                <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
            </asp:Panel>
            <%--Inicio Seccion Institucion--%>
            <asp:Panel runat="server" ID="pnlInstitucion" CssClass="panels">
                <asp:HiddenField runat="server" ID="hfInstit" Value="" />
                <table width="100%">
                    <tr>
                        <td rowspan="5" valign="top" style="width: 25%">
                            <h2>
                                Institución</h2>
                        </td>
                        <td style="border-bottom: 1px solid #ededed;">
                            <%-- <asp:Label runat="server" ID="lblInstSeleccionado"></asp:Label>--%>
                            <asp:Menu ID="MenuInstitucion" runat="server" Font-Names="Verdana" Font-Size="1em"
                                DynamicHorizontalOffset="2" StaticSubMenuIndent="10px" OnMenuItemClick="MenuInstitucion_MenuItemClick"
                                CssClass="PadImagen">
                                <DynamicHoverStyle BackColor="#E4E4E4" ForeColor="#333333" />
                                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                                <DynamicMenuStyle BackColor="White" VerticalPadding="3px" HorizontalPadding="3px"
                                    CssClass="shadowMenu" />
                                <Items>
                                    <asp:MenuItem Value="" ImageUrl="~/Images/icons/setting16.png" ToolTip="Administracion"
                                        Selectable="False">
                                        <asp:MenuItem Text="&nbsp;Ver Detalle" Value="DETALLE" ImageUrl="~/Images/icons/detail16.png"
                                            ToolTip="Ver el detalle de la institucion"></asp:MenuItem>
                                        <asp:MenuItem Text="&nbsp;Editar Institucion" Value="MOD" ImageUrl="~/Images/icons/rename16.png"
                                            ToolTip="Editar Institucion"></asp:MenuItem>
                                        <asp:MenuItem Text="&nbsp;Eliminar Institucion" Value="ELIM" ImageUrl="~/Images/icons/remove16.png"
                                            ToolTip="Eliminar Institucion"></asp:MenuItem>
                                    </asp:MenuItem>
                                </Items>
                                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                            </asp:Menu>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                Puede
                                <asp:LinkButton runat="server" ID="lbNuevaInst" Text="agregar una institución nueva "
                                    OnClick="lbNuevaInst_Click"></asp:LinkButton>
                                o seleccionar una de lista que se muestra a continuación. Las instituciones se van
                                filtrando dependiendo del estado y de la ciudad que se elijan, con excepción de
                                aquellas que aun no tengan relacionado un plantel.</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" AssociatedControlID="ddlFEstado" Text="Estado:"></asp:Label>
                            &nbsp;<asp:DropDownList ID="ddlFEstado" runat="server" Width="300px" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlFEstado_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="ddlFCiudad" Text="Ciudad:"></asp:Label>
                            &nbsp;<asp:DropDownList ID="ddlFCiudad" runat="server" Width="300px" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlFCiudad_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlInstitucion" OnSelectedIndexChanged="ddlInstitucion_SelectedIndexChanged"
                                AutoPostBack="True" Width="500px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <%--Inicio Seccion Poppup Institucion--%>
            <asp:Panel ID="pnlAgregarInst" CssClass="updateProgress font" runat="server" DefaultButton="btnAgregarInst"
                Width="700px" Style="display: none;">
                <table width="100%" cellspacing="0" cellpadding="0">
                    <tr bgcolor="#006699">
                        <td valign="middle" style="width: 600px; padding: 10px 15px 10px 15px; color: White;
                            font-size: 1.3em;">
                            <img src="../Images/Popup/home.png" />
                            &nbsp;Institución
                        </td>
                        <td>
                            <center>
                                <asp:ImageButton ID="ibCancelInst" runat="server" ToolTip="Cerrar" ImageUrl="~/Images/icons/cerrar24.jpg"
                                    CausesValidation="False" /></center>
                        </td>
                    </tr>
                </table>
                <table id="tbAddBrand" width="90%" style="display: block; margin: auto;">
                    <tr>
                        <td colspan="4">
                            <asp:ValidationSummary ID="vsNuevaInstitucion" runat="server" ShowSummary="true"
                                ValidationGroup="ChecaInst" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <small style="color: #CC0000;">* Campos obligatorios</small>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Panel runat="server" ID="pnlMensajeInst" BackColor="#FFFFCC" BorderColor="#FFFF99"
                                BorderStyle="Solid" Visible="false">
                                <asp:Image runat="server" ID="Image4" ImageUrl="~/Images/icons/cross.png" CssClass="imgMjeInst" />
                                <b>&nbsp;<asp:Label runat="server" ID="lblTituloInst" Text="Error"></asp:Label></b>
                                <asp:Label runat="server" ID="lblMensajeInst"></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label runat="server" ID="lblInstID" Text="" Font-Bold="true"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtInstitucion" class="TitleRows">
                                <small style="color: #CC0000;">*</small>Nombre:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtInstitucion" runat="server" Text="" Width="350px" MaxLength="100"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvInstitucions" runat="server" ErrorMessage="El nombre de la Institución es necesario."
                                ControlToValidate="txtInstitucion" Display="Dynamic" ValidationGroup="ChecaInst"
                                SetFocusOnError="True">
                                <asp:Image ID="imgInstitucion" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                        <td valign="top" rowspan="6" style="padding-left: 15px;">
                            <asp:Image ID="imgLogo" runat="server" Width="125px" Height="150px" ImageUrl="../Images/empty_image.png" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="ddlNivel" class="TitleRows">
                                <small style="color: #CC0000;">*</small>Nivel:</label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlNivel" runat="server" Width="350px">
                            </asp:DropDownList>
                            <asp:CascadingDropDown ID="cddNivel" runat="server" Category="Nivel" TargetControlID="ddlNivel"
                                PromptText="-Selecciona un Nivel-" LoadingText="Cargando Niveles..." ServicePath="../WebService/DropDownList.asmx"
                                ServiceMethod="GetNivel">
                            </asp:CascadingDropDown>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Es necesario que elija el nivel de la institución."
                                ControlToValidate="ddlNivel" Display="Dynamic" ValidationGroup="ChecaInst" SetFocusOnError="True">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="ddlTipo" class="TitleRows">
                                <small style="color: #CC0000;">*</small>Tipo:</label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlTipo" runat="server" Width="350px">
                            </asp:DropDownList>
                            <asp:CascadingDropDown ID="cddTipo" runat="server" Category="Tipo" TargetControlID="ddlTipo"
                                PromptText="-Selecciona un Tipo-" LoadingText="Cargando Tipos..." ServicePath="../WebService/DropDownList.asmx"
                                ServiceMethod="GetTipo">
                            </asp:CascadingDropDown>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvTipo" runat="server" ErrorMessage="Es necesario que elija el tipo de institución."
                                ControlToValidate="ddlTipo" Display="Dynamic" ValidationGroup="ChecaInst" SetFocusOnError="True">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtTelefono" class="TitleRows">
                                Teléfono:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTelefono" runat="server" Text="" Width="350px" MaxLength="20"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="fteTelefono" runat="server" FilterType="Custom, Numbers"
                                ValidChars="()-+" TargetControlID="txtTelefono" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtClave" class="TitleRows">
                                <small style="color: #CC0000;">*</small>Clave:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtClave" runat="server" Text="" Width="350px" MaxLength="30"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvClave" runat="server" ErrorMessage="La clave de la institución es necesario."
                                ControlToValidate="txtClave" Display="Dynamic" ValidationGroup="ChecaInst" SetFocusOnError="True">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtWeb" class="TitleRows">
                                Página Web:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtWeb" runat="server" Text="" Width="350px" MaxLength="200"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtArea" class="TitleRows">
                                Área de Contacto:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtArea" runat="server" Text="" Width="350px" MaxLength="200"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="fuImagenInst" class="TitleRows">
                                Cargar Imagen:</label>
                        </td>
                        <td colspan="4">
                            <asp:FileUpload ID="fuImagenInst" runat="server" />
                            <asp:HiddenField runat="server" ID="hfImagen" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <div class="footerPopup">
                    <asp:Button ID="btnAgregarInst" runat="server" Text="Guardar" ValidationGroup="ChecaInst"
                        OnClick="btnAgregarInst_Click" />
                    &nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancelInst" runat="server" Text="Cancelar" />&nbsp;
                </div>
            </asp:Panel>
            <asp:ModalPopupExtender ID="mpeAgregarInst" runat="server" TargetControlID="hfInstit"
                PopupControlID="pnlAgregarInst" DropShadow="true" CancelControlID="ibCancelInst"
                PopupDragHandleControlID="pnlAgregarInst" BackgroundCssClass="modalBackground">
            </asp:ModalPopupExtender>
            <%--Fin Seccion Poppup Institucion--%>
            <%--Inicio Seccion Poppup Detalle Institucion --%>
            <asp:HiddenField runat="server" ID="hfDetalleInst" />
            <asp:Panel ID="pnlDetalleInst" CssClass="updateProgress font" runat="server" Width="400px"
                Style="display: none;">
                <table width="100%" cellspacing="0" cellpadding="0">
                    <tr bgcolor="#006699">
                        <td valign="middle" style="width: 325px; padding: 10px 15px 10px 15px; color: White;
                            font-size: 1.3em;">
                            <img src="../Images/Popup/home.png" />
                            &nbsp;Detalle de Institución
                        </td>
                        <td>
                            <center>
                                <asp:ImageButton ID="ibCancelDetalInst" runat="server" ToolTip="Cerrar" ImageUrl="~/Images/icons/cerrar24.jpg"
                                    CausesValidation="False" /></center>
                        </td>
                    </tr>
                </table>
                <br />
                <table id="Table1" width="90%" style="display: block; margin: auto;">
                    <tr>
                        <td colspan="3">
                            <asp:Label runat="server" ID="lblDetInstID" Text="" Font-Bold="true"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%;">
                            <label for="lblNombre" class="TitleRows">
                                Nombre:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblNivel" class="TitleRows">
                                Nivel:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblNivel" runat="server">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblTipo" class="TitleRows">
                                Tipo:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblTipo" runat="server">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblDesInstTelefono" class="TitleRows">
                                Teléfono:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblDesInstTelefono" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblClave" class="TitleRows">
                                Clave:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblClave" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblWeb" class="TitleRows">
                                Página Web:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblWeb" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblArea" class="TitleRows">
                                Área de Contacto:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblArea" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <div class="footerPopup">
                    <asp:Button ID="btnAceptarInst" runat="server" Text="Aceptar"></asp:Button>&nbsp;
                </div>
            </asp:Panel>
            <asp:ModalPopupExtender ID="mpeDetalleInst" runat="server" TargetControlID="hfDetalleInst"
                PopupControlID="pnlDetalleInst" DropShadow="true" CancelControlID="ibCancelDetalInst"
                OkControlID="btnAceptarInst" BackgroundCssClass="modalBackground" PopupDragHandleControlID="pnlDetalleInst">
            </asp:ModalPopupExtender>
            <%--Fin Seccion Poppup Detalle Institucion--%>
            <%--Fin Seccion Institucion--%>
            <%--Inicio Seccion Plantel--%>
            <br />
            <asp:Panel runat="server" ID="pnlPlantel" CssClass="panels">
                <asp:HiddenField runat="server" ID="hfPlantel" Value="" />
                <table width="100%">
                    <tr>
                        <td rowspan="3" valign="top" style="width: 25%">
                            <h2>
                                Plantel</h2>
                        </td>
                        <td style="border-bottom: 1px solid #ededed;">
                            <%--<asp:Label runat="server" ID="lblPlantelSelec"></asp:Label>--%>
                            <asp:Menu ID="MenuPlantel" runat="server" Font-Names="Verdana" Font-Size="1em" DynamicHorizontalOffset="2"
                                StaticSubMenuIndent="10px" OnMenuItemClick="MenuPlantel_MenuItemClick" CssClass="PadImagen">
                                <DynamicHoverStyle BackColor="#E4E4E4" ForeColor="#333333" />
                                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                                <DynamicMenuStyle BackColor="White" VerticalPadding="3px" HorizontalPadding="3px"
                                    CssClass="shadowMenu" />
                                <Items>
                                    <asp:MenuItem Value="" ImageUrl="~/Images/icons/setting16.png" ToolTip="Administracion"
                                        Selectable="False">
                                        <asp:MenuItem Text="&nbsp;Ver Detalle" Value="DETALLE" ImageUrl="~/Images/icons/detail16.png"
                                            ToolTip="Ver el detalle del plantel"></asp:MenuItem>
                                        <asp:MenuItem Text="&nbsp;Editar Plantel" Value="MOD" ImageUrl="~/Images/icons/rename16.png"
                                            ToolTip="Editar Plantel"></asp:MenuItem>
                                        <asp:MenuItem Text="&nbsp;Eliminar Plantel" Value="ELIM" ImageUrl="~/Images/icons/remove16.png"
                                            ToolTip="Eliminar Plantel"></asp:MenuItem>
                                    </asp:MenuItem>
                                </Items>
                                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                            </asp:Menu>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                Puede
                                <asp:LinkButton runat="server" ID="lbNuevoPlantel" Text="agregar un nuevo plantel"
                                    OnClick="lbNuevoPlantel_Click"></asp:LinkButton>
                                &nbsp;o seleccionar uno de lista que se muestra a continuación.</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlPlantel" OnSelectedIndexChanged="ddlPlantel_SelectedIndexChanged"
                                AutoPostBack="true" Width="500px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <%--Inicio Seccion Poppup Institucion"--%>
            <asp:Panel ID="pnlAgregarPlantel" CssClass="updateProgress font" runat="server" Width="500"
                DefaultButton="btnAgregarPlantel" Style="display: none;">
                <table width="100%" cellspacing="0" cellpadding="0">
                    <tr bgcolor="#006699">
                        <td valign="middle" style="width: 375px; padding: 10px 15px 10px 15px; color: White;
                            font-size: 1.3em;">
                            <img src="../Images/Popup/bell.png" />
                            &nbsp;Plantel
                        </td>
                        <td>
                            <center>
                                <asp:ImageButton ID="ibCancelPlantel" runat="server" ToolTip="Cerrar" ImageUrl="~/Images/icons/cerrar24.jpg"
                                    CausesValidation="False" /></center>
                        </td>
                    </tr>
                </table>
                <table id="tbPlantel" width="90%" style="display: block; margin: auto;">
                    <tr>
                        <td colspan="3">
                            <asp:ValidationSummary ID="vsAgregarPlantel" runat="server" ShowSummary="true" ValidationGroup="ChecaPlantel"
                                ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <small style="color: #CC0000;">* Campos Obligatorios</small>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label runat="server" ID="lblPlantelID" Text="" Font-Bold="true"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtPlantel" class="TitleRows">
                                <small style="color: #CC0000;">*</small>Nombre Plantel:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPlantel" runat="server" Text="" Width="300px" MaxLength="200"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvPlantel" runat="server" ErrorMessage="El nombre del Plantel es necesario."
                                ControlToValidate="txtPlantel" Display="Dynamic" ValidationGroup="ChecaPlantel"
                                SetFocusOnError="True">
                                <asp:Image ID="imgPlantel" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtDireccion" class="TitleRows">
                                <small style="color: #CC0000;">*</small>Dirección:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDireccion" runat="server" Width="300px" MaxLength="100">
                            </asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tbweDireccion" runat="server" TargetControlID="txtDireccion"
                                WatermarkText="Calle y Numero" WatermarkCssClass="watermarked" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ErrorMessage="Es necesario que ingrese una dirección."
                                ControlToValidate="txtDireccion" Display="Dynamic" ValidationGroup="ChecaPlantel"
                                SetFocusOnError="True">
                                <asp:Image ID="imgDireccion" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="ddlEstado" class="TitleRows">
                                <small style="color: #CC0000;">*</small>Estado:</label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlEstado" runat="server" Width="300px">
                            </asp:DropDownList>
                            <asp:CascadingDropDown ID="cddEstado" runat="server" Category="Estado" TargetControlID="ddlEstado"
                                PromptText="-Selecciona un Estado-" LoadingText="Cargando Estados..." ServicePath="../WebService/DropDownList.asmx"
                                ServiceMethod="GetEstado">
                            </asp:CascadingDropDown>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvEstado" runat="server" ErrorMessage="Es necesario que elija un estado."
                                ControlToValidate="ddlEstado" Display="Dynamic" ValidationGroup="ChecaPlantel"
                                SetFocusOnError="True">
                                <asp:Image ID="imgEstado" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="ddlCiudad" class="TitleRows">
                                <small style="color: #CC0000;">*</small>Ciudad:</label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCiudad" runat="server" Width="300px">
                            </asp:DropDownList>
                            <asp:CascadingDropDown ID="cddCiudad" runat="server" Category="Ciudad" TargetControlID="ddlCiudad"
                                PromptText="-Selecciona una Ciudad-" LoadingText="Cargando Ciudades..." ServicePath="../WebService/DropDownList.asmx"
                                ServiceMethod="GetCiudad" ParentControlID="ddlEstado">
                            </asp:CascadingDropDown>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvCiudad" runat="server" ErrorMessage="Es necesario que elija una ciudad."
                                ControlToValidate="ddlCiudad" Display="Dynamic" ValidationGroup="ChecaPlantel"
                                SetFocusOnError="True">
                                <asp:Image ID="imgCiudad" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtCP" class="TitleRows">
                                <small style="color: #CC0000;">*</small>Código Postal:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCP" runat="server" Text="" Width="150px" MaxLength="5"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="fteCP" runat="server" FilterType="Numbers" TargetControlID="txtCP" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvCP" runat="server" ErrorMessage="Es necesario que ingrese el código postal."
                                ControlToValidate="txtCP" Display="Dynamic" ValidationGroup="ChecaPlantel" SetFocusOnError="True">
                                <asp:Image ID="imgCP" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtPlantelTelefono" class="TitleRows">
                                Teléfono:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPlantelTelefono" runat="server" Text="" Width="150px" MaxLength="20"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="ftePlantelTel" runat="server" FilterType="Custom, Numbers"
                                ValidChars="()-+" TargetControlID="txtPlantelTelefono" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtContacto" class="TitleRows">
                                Contacto:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtContacto" runat="server" Text="" Width="300px" MaxLength="200"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtCorreo" class="TitleRows">
                                Correo Electrónico:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCorreo" runat="server" Text="" Width="300px" MaxLength="75"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <div class="footerPopup">
                    <asp:Button ID="btnAgregarPlantel" runat="server" Text="Guardar" ValidationGroup="ChecaPlantel"
                        OnClick="btnAgregarPlantel_Click" />
                    &nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancelPlantel" runat="server" Text="Cancelar" />&nbsp;
                </div>
            </asp:Panel>
            <asp:ModalPopupExtender ID="mpeAgregarPlantel" runat="server" TargetControlID="hfPlantel"
                PopupControlID="pnlAgregarPlantel" DropShadow="true" CancelControlID="ibCancelPlantel"
                BackgroundCssClass="modalBackground" PopupDragHandleControlID="pnlAgregarPlantel">
            </asp:ModalPopupExtender>
            <%--Fin Seccion Poppup Institucion--%>
            <%--Inicio Seccion Poppup Detalle del Plantel--%>
            <asp:HiddenField runat="server" ID="hfDetPlantel" />
            <asp:Panel ID="pnlDetPlantel" CssClass="updateProgress font" runat="server" Width="450"
                Style="display: none;">
                <table width="100%" cellspacing="0" cellpadding="0">
                    <tr bgcolor="#006699">
                        <td valign="middle" style="width: 375px; padding: 10px 15px 10px 15px; color: White;
                            font-size: 1.3em;">
                            <img src="../Images/Popup/bell.png" />
                            &nbsp;Detalle del Plantel
                        </td>
                        <td>
                            <center>
                                <asp:ImageButton ID="ibCancelDetPlantel" runat="server" ToolTip="Cerrar" ImageUrl="~/Images/icons/cerrar24.jpg"
                                    CausesValidation="False" /></center>
                        </td>
                    </tr>
                </table>
                <table id="Table2" width="90%" style="display: block; margin: auto;">
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label runat="server" ID="lblDetPlantelID" Text="" Font-Bold="true"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%;">
                            <label for="lblPlantel" class="TitleRows">
                                Nombre Plantel:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblPlantel" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblDireccion" class="TitleRows">
                                Dirección:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblDireccion" runat="server">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblEstado" class="TitleRows">
                                Estado:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblEstado" runat="server">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblCiudad" class="TitleRows">
                                Ciudad:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblCiudad" runat="server">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblCP" class="TitleRows">
                                Código Postal:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblCP" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblDesPTelefono" class="TitleRows">
                                Teléfono:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblDesPTelefono" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblContacto" class="TitleRows">
                                Contacto:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblContacto" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="lblCorreo" class="TitleRows">
                                Correo Electrónico:</label>
                        </td>
                        <td>
                            <asp:Label ID="lblCorreo" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <div class="footerPopup">
                    <asp:Button ID="btnAceptarPlant" runat="server" Text="Aceptar"></asp:Button>&nbsp;
                </div>
            </asp:Panel>
            <asp:ModalPopupExtender ID="mpeDetPlantel" runat="server" TargetControlID="hfDetPlantel"
                PopupControlID="pnlDetPlantel" DropShadow="true" CancelControlID="ibCancelDetPlantel"
                OkControlID="btnAceptarPlant" BackgroundCssClass="modalBackground" PopupDragHandleControlID="pnlDetPlantel">
            </asp:ModalPopupExtender>
            <%--Inicio Seccion Poppup Detalle del Plantel--%>
            <%--Fin Seccion Plantel--%>
            <%--Inicio Seccion Caracteristicas--%>
            <br />
            <asp:Panel runat="server" ID="pnlCaracteristica" CssClass="panels">
                <asp:HiddenField runat="server" ID="hfCaracteristica" Value="" />
                <asp:HiddenField runat="server" ID="hfEncuesta_GUID" Value="" />
                <asp:HiddenField runat="server" ID="hfNombreEncuesta" Value="" />
                <table width="100%">
                    <tr>
                        <td rowspan="3" valign="top" style="width: 25%">
                            <h2>
                                Atributos / Carreras</h2>
                        </td>
                        <td style="text-align: right; border-bottom: 1px solid #ededed;">
                            <asp:Image runat="server" ID="imgDetalleAtr" ImageUrl="../Images/icons/detail16.png" />
                            <asp:Image runat="server" ID="imgAgregarAtr" ImageUrl="../Images/icons/plus-icon16.png" />&nbsp;
                            <asp:LinkButton runat="server" ID="lbCaract" Text="Agregar Atributos" OnClick="lbCaract_Click"></asp:LinkButton>&nbsp;
                            <asp:Image runat="server" ID="imgEliminaAtr" ImageUrl="../Images/icons/basura16.png" />&nbsp;
                            <asp:LinkButton runat="server" ID="lbEliminar" Text="Eliminar" ToolTip="Eliminar sus atributos"
                                OnClick="lbEliminar_Click"></asp:LinkButton>&nbsp;
                            <asp:Image runat="server" ID="imgCarrera" ImageUrl="../Images/Menu/block.png" />&nbsp;
                            <asp:LinkButton runat="server" ID="lbCarrera" Text="Carreras" OnClick="lbCarrera_Click"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                Los "atributos" consisten en una serie de preguntas, con las cuales se evalúa la
                                institución. Para las "carreras", se van anexando todas aquellas carreras que pertenezcan
                                a un mismo plantel.</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblEncuesta" Text=""></asp:Label>
                            &nbsp;<asp:LinkButton runat="server" ID="lbLlenarEncuesta" Text="Llenar Resultados p/ Encuesta"
                                ValidationGroup="SeleccionaEncuesta" OnClick="lbLlenarEncuesta_Click"></asp:LinkButton>
                            &nbsp;<asp:LinkButton runat="server" ID="lbEliminarEncuesta" Text="Eliminar Resultados"
                                ToolTip="Eliminar resultados de la encuesta." OnClick="lbEliminarEncuesta_Click"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <%--Fin Seccion Caracteristicas--%>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAgregarInst" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdateProgress AssociatedUpdatePanelID="upAdministracion" ID="upAdministracionLoading" runat="server">
        <ProgressTemplate>
            <div id="progressBackgroundFilter">
            </div>
            <div id="processMessage">
                Cargando…<br />
                <br />
                <img alt="Loading" src="../Images/loading_dark.gif" /></div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
