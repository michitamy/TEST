<%@ Page Title="Busca tu Escuela" Language="C#" MasterPageFile="~/Styles/Site.master"
    AutoEventWireup="true" CodeFile="BuscarEscuelas.aspx.cs" Inherits="BuscarEscuelas"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <%--<link href="../Styles/style.css" rel="stylesheet" type="text/css" />--%>
    <link href="../Styles/StyleGEZI.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dropotron-1.0.js" type="text/javascript"></script>
    <script src="Scripts/jquery.slidertron-1.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#slider').slidertron({
                viewerSelector: '.viewer',
                indicatorSelector: '.indicator span',
                reelSelector: '.reel',
                slidesSelector: '.slide',
                speed: 'slow',
                advanceDelay: 4000
            });
        });
    </script>
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
<asp:Content ID="Content2" ContentPlaceHolderID="SliderContent" runat="Server">
    <div class="viewer">
        <div class="reel">
            <div class="slide">
                <img src="Images/Slider/slide01.jpg" alt="" />
            </div>
            <div class="slide">
                <img src="Images/Slider/slide02.jpg" alt="" />
            </div>
            <div class="slide">
                <img src="Images/Slider/slide03.jpg" alt="" />
            </div>
            <div class="slide">
                <img src="Images/Slider/slide04.jpg" alt="" />
            </div>
            <div class="slide">
                <img src="Images/Slider/slide05.jpg" alt="" />
            </div>
        </div>
    </div>
    <div class="indicator">
        <span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>5</span>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>
        <asp:Label runat="server" ID="lblBusqueda" Text=""></asp:Label></h2>
    <asp:UpdatePanel runat="server" ID="upBusquedaPlanteles">
        <ContentTemplate>
            <asp:ToolkitScriptManager ID="tScriptManager" runat="server">
            </asp:ToolkitScriptManager>
            <table width="100%" class="font" style="background-color: #F3F3F3; border: 1px solid #ededed;
                padding: 8px 10px 10px;">
                <%--<tr>
                    <td>
                        <label for="ddlNivel" class="TitleRows">
                            Escuela:</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEscuela" runat="server" Width="150px">
                        </asp:DropDownList>
                        <asp:CascadingDropDown ID="cddEscuela" runat="server" Category="Escuela" TargetControlID="ddlEscuela"
                            PromptText="-Selecciona una Escuela-" LoadingText="Cargando Escuelas..." ServicePath="~/WebService/DropDownList.asmx"
                            ServiceMethod="GetNivel">
                        </asp:CascadingDropDown>
                        <asp:RequiredFieldValidator ID="rfvEscuela" runat="server" ErrorMessage="Es necesario que elija una escuela."
                            ControlToValidate="ddlEscuela" Display="Dynamic" ValidationGroup="ChecaBusqueda"
                            SetFocusOnError="True">
                            <asp:Image ID="imgEscuela" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                    </td>
                </tr>--%>
                <tr>
                    <td>
                        <asp:Label runat="server" Font-Bold="true" Text="Nivel:" ID="lblNivel"> </asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:DropDownList ID="ddlNivel" runat="server" Width="250px">
                        </asp:DropDownList>
                        <asp:CascadingDropDown ID="cddNivel" runat="server" Category="Nivel" TargetControlID="ddlNivel"
                            PromptText="-Selecciona un Nivel-" LoadingText="Cargando Niveles..." ServicePath="~/WebService/DropDownList.asmx"
                            ServiceMethod="GetNivelCarrera">
                        </asp:CascadingDropDown>
                        <asp:Image ID="imgNivel" runat="server" Visible="false" ImageUrl="~/Images/icons/exclamation16.png" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Font-Bold="true" runat="server" Text="Estado:" AssociatedControlID="ddlEstado" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEstado" runat="server" Width="250px">
                        </asp:DropDownList>
                        <asp:CascadingDropDown ID="cddEstado" runat="server" Category="Estado" TargetControlID="ddlEstado"
                            PromptText="-Selecciona un Estado-" LoadingText="Cargando Estados..." ServicePath="~/WebService/DropDownList.asmx"
                            ServiceMethod="GetEstado">
                        </asp:CascadingDropDown>
                        <asp:RequiredFieldValidator ID="rfvEstado" runat="server" ErrorMessage="Es necesario que elija un estado."
                            ControlToValidate="ddlEstado" Display="Dynamic" ValidationGroup="ChecaBusqueda"
                            SetFocusOnError="True">
                            <asp:Image ID="imgEstado" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Label Font-Bold="true" runat="server" Text="Ciudad:" AssociatedControlID="ddlCiudad" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCiudad" runat="server" Width="300px">
                        </asp:DropDownList>
                        <asp:CascadingDropDown ID="cddCiudad" runat="server" Category="Ciudad" TargetControlID="ddlCiudad"
                            PromptText="-Selecciona una Ciudad-" LoadingText="Cargando Ciudades..." ServicePath="~/WebService/DropDownList.asmx"
                            ServiceMethod="GetCiudad" ParentControlID="ddlEstado">
                        </asp:CascadingDropDown>
                        <asp:RequiredFieldValidator ID="rfvCiudad" runat="server" ErrorMessage="Es necesario que elija una ciudad."
                            ControlToValidate="ddlCiudad" Display="Dynamic" ValidationGroup="ChecaBusqueda"
                            SetFocusOnError="True">
                            <asp:Image ID="imgCiudad" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCarrera" runat="server" Font-Bold="true" Text="Carrera:"> </asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox runat="server" ID="txtCarrera" Text="" Width="447px"></asp:TextBox>
                        <asp:Image ID="imgCarrera" runat="server" ImageUrl="~/Images/icons/exclamation16.png"
                            Visible="false" />
                    </td>
                    <td align="right">
                        <asp:Button runat="server" ID="btnBuscar" Text="Buscar Escuelas" ValidationGroup="ChecaBusqueda"
                            OnClick="btnBuscar_Click" />
                        <asp:HiddenField runat="server" ID="hfEscuela" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button runat="server" ID="btnCompararPlant" Text="Comparar Planteles" PostBackUrl="~/Comparar.aspx" />
                        &nbsp;<asp:LinkButton runat="server" ID="lbListaPlanteles" Text="" OnClick="lbListaPlanteles_Click"></asp:LinkButton>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Panel runat="server" ID="pnlMensaje" Visible="false">
                <asp:Label runat="server" ID="lblMensaje" Font-Bold="False" Font-Size="Large" ForeColor="Black"></asp:Label>
                <div runat="server" id="divSugerencia">
                    Sugerencias:
                    <ul>
                        <li>Asegúrese de que todas las palabras estén escritas correctamente.</li>
                        <li>Intenta usar palabras diferentes o menos.</li>
                        <li>Intenta usar palabras más generales.</li>
                    </ul>
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlPlanteles" Visible="false">
                <table width="100%">
                    <tr>
                        <td>
                            Página&nbsp;
                            <asp:DropDownList ID="ddlpageNumbers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlpageNumbers_SelectedIndexChanged">
                            </asp:DropDownList>
                            &nbsp;de&nbsp;
                            <asp:Label ID="lblTotalPages" runat="server"></asp:Label>&nbsp;Páginas.
                        </td>
                        <td style="text-align: right;">
                        </td>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblContador"></asp:Label>
                            </td>
                            <td style="text-align: right;">
                            </td>
                        </tr>
                    </tr>
                </table>
                <asp:Repeater ID="rptDetallePlantel" runat="server" OnItemCommand="RptDetallePlantel_RowCommand">
                    <ItemTemplate>
                        <%--background-color: <%# GetRowColor() %>;--%>
                        <div style="margin: 10px;">
                            <table cellpadding="0" cellspacing="0" width="100%" style="font-family: Calibri;
                                border: 1px solid #ededed;">
                                <tr>
                                    <td style="width: 45%; padding-right: 5px;">
                                        <%--Carrera-Plantel--%>
                                        <asp:Label runat="server" ID="lblPlantel" Text='<%# MuestraPlantel_Carrera((string)DataBinder.Eval(Container, "DataItem.Plantel"),(string)DataBinder.Eval(Container, "DataItem.Carrera"),(int)DataBinder.Eval(Container, "DataItem.Carrera_id")) %>'
                                            ForeColor="#003366" Font-Size="14pt"></asp:Label>
                                        <asp:HiddenField ID="hfCarrera_id" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.Carrera_id")%>' />
                                        <asp:HiddenField ID="hfPlantel_id" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.Plantel_id")%>' />
                                        <asp:HiddenField ID="hfPlantel" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.Plantel")%>' />
                                        <asp:HiddenField ID="hfCarrera" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.Carrera")%>' />
                                        <asp:HiddenField ID="hfInstitucion_id" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.Institucion.Institucion_id")%>' />
                                    </td>
                                    <td style="width: 24px;">
                                        <%--Tipo Plantel--%>
                                        <asp:Image runat="server" Width="24px" ID="imgTipoPlantel" ImageUrl='<%# MuestraImagen((int)DataBinder.Eval(Container, "DataItem.Institucion.Tipo.Tipo_id")) %>' />
                                        <asp:HiddenField ID="hfTipo" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.Institucion.Tipo.Nombre") %>' />
                                    </td>
                                    <td style="width: 35%; padding-right: 5px; padding-left: 10px;">
                                        <%--Página Web--%><asp:Label ID="lblWeb" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Institucion.Web") %>' />
                                    </td>
                                    <td rowspan="5" style="margin: auto; vertical-align: top; text-align: right; padding: 5px;">
                                        <asp:Image runat="server" ID="imgInstitucion" Width="60px" Height="70px" ImageUrl='<%# string.Format("~/Images/Instituciones/{0}", DataBinder.Eval(Container, "DataItem.Institucion.Imagen")) %>'
                                            Visible='<%# MuestraImagen((string)DataBinder.Eval(Container, "DataItem.Institucion.Imagen")) %>' />
                                        <asp:HiddenField runat="server" ID="hfImagen" Value='<%# DataBinder.Eval(Container, "DataItem.Institucion.Imagen") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%--Institucion--%>
                                        <asp:Label runat="server" ID="lblInstitucion" Text='<%# DataBinder.Eval(Container, "DataItem.Institucion.Institucion") %>'
                                            ForeColor="#999999" Font-Size="10pt"></asp:Label>
                                    </td>
                                    <td rowspan="4">
                                        &nbsp;
                                    </td>
                                    <td style="width: 25%; padding-right: 5px; padding-left: 10px;">
                                        <%--Telefono--%>
                                        <asp:Label runat="server" ID="lblTelefono" Text='<%# DataBinder.Eval(Container, "DataItem.Telefono") %>'
                                            ForeColor="#666666"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td rowspan="3">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="lblDireccion" Text='<%# DataBinder.Eval(Container, "DataItem.Direccion") %>'
                                            ForeColor="#666666" Font-Size="11pt"></asp:Label>
                                        <asp:Label ID="lblCP" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CP") %>'
                                            ForeColor="#666666" Font-Size="11pt" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%--Estado-Ciudad--%>
                                        <asp:Label runat="server" ID="lblEstado" Text='<%# DataBinder.Eval(Container, "DataItem.Estado") %>'
                                            ForeColor="#666666" Font-Size="11pt"></asp:Label>
                                        <asp:Label ID="lblCiudad" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Ciudad") %>'
                                            ForeColor="#666666" Font-Size="11pt" />
                                    </td>
                                </tr>
                                <tr style="background-color: #EEE; height: 55px;">
                                    <td style="padding-left: 15px;" colspan="4">
                                        <div style="float: left;">
                                            <asp:Button ID="btnComparar" runat="server" CommandName="Comparar" Text='<%# Comparar((int)DataBinder.Eval(Container, "DataItem.Plantel_id"),(int)DataBinder.Eval(Container, "DataItem.Carrera_id")) %>' /></div>
                                        <div style="float: left; padding-left: 100px;">
                                            <%--<asp:Image runat="server" ID="imgCompara" ImageUrl="~/Images/mini/Stats 3.png" />&nbsp;<asp:LinkButton
                                                runat="server" ID="lbComparar" Text="Ir a la comparación" PostBackUrl="~/Comparar.aspx"></asp:LinkButton>--%>
                                            <asp:Button runat="server" ID="btnCompararPtl" Text='<%# FormatText() %>' PostBackUrl="~/Comparar.aspx" />
                                        </div>
                                        <%--  <div style="float: left; padding-left: 25px;">
                                        <asp:Image runat="server" ID="Image1" ImageUrl="~/Images/mini/Direction Horz.png" />&nbsp;<asp:LinkButton
                                            runat="server" ID="lbOrganizar" Text="Organizar" PostBackUrl="~/Comparar.aspx"></asp:LinkButton></div>--%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <%--Inicio del páginado del repeater--%>
                <table width="100%">
                    <tr style="border-bottom: 1px solid #ededed;">
                        <td style="text-align: right;">
                            <asp:LinkButton ID="lnkFirst" runat="server" ForeColor="Black" Text="Primero" OnClick="lnkFirst_Click">
                            </asp:LinkButton>&nbsp;<asp:LinkButton ID="lnkPrevious" runat="server" ForeColor="Black"
                                Text="Anterior" OnClick="lnkPrevious_Click">&nbsp;</asp:LinkButton>&nbsp;&nbsp;
                            <asp:Label runat="server" ID="lblRows"></asp:Label>
                            &nbsp;de&nbsp;
                            <asp:Label ID="lblOf" runat="server" Font-Bold="true"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="lnkNext" runat="server" ForeColor="Black" Text="Siguiente" OnClick="lnkNext_Click">&nbsp;</asp:LinkButton>&nbsp;
                            <asp:LinkButton ID="lnkLast" runat="server" ForeColor="Black" Text="Ultimo" OnClick="lnkLast_Click"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="Images/mini/PUbutton.png" width="24px" alt="" />&nbsp Escuela publica
                            &nbsp&nbsp<img src="Images/mini/PVbutton.png" width="24px" />&nbsp Escuela privada
                        </td>
                    </tr>
                </table>
                <p>
                    Nota: La información sobre los programas escolares y servicios prestados por los
                    diferentes niveles escolares son otorgados por los mismos plantes a GEZI. Por lo
                    tanto, restringir la búsqueda mediante la aplicación de filtros puede excluir a
                    algunas escuelas.</p>
            </asp:Panel>
            <%--Fin del páginado del repeater--%>
            </span>
            <%--Inicio Seccion Poppup Detalle Institucion --%>
            <asp:HiddenField runat="server" ID="hfListaPlanteles" />
            <asp:Panel ID="pnlListaPlanteles" runat="server" Width="450" CssClass="updateProgress"
                Style="display: none;">
                <table width="100%" cellspacing="0" cellpadding="0">
                    <tr bgcolor="#006699">
                        <td valign="middle" style="width: 375px; padding: 10px 15px 10px 15px; color: White;
                            font-size: 1.3em;">
                            <img src="Images/Popup/document-text.png" />
                            &nbsp;Lista de Planteles a Comparar
                        </td>
                        <td>
                            <center>
                                <asp:ImageButton ID="ibCancelListaPlant" runat="server" ToolTip="Cerrar ventana"
                                    ImageUrl="~/Images/icons/cerrar24.jpg" CausesValidation="False" /></center>
                        </td>
                    </tr>
                </table>
                <br />
                <center>
                    <asp:GridView runat="server" ID="gvListaPlanteles" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="#666666"
                        Font-Names="Calibri" GridLines="Vertical" Width="90%" OnRowCommand="GvListaPlanteles_RowCommand"
                        EmptyDataText="No hay planteles para comparar." ShowHeader="false">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfLCarrera_id" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.Carrera_id")%>' />
                                    <asp:HiddenField runat="server" ID="hfLPlantel_id" Value='<%# DataBinder.Eval(Container, "DataItem.Plantel_id")%>' />
                                    <asp:ImageButton runat="server" ID="imgQuitaLista" CommandName="QuitarDeLista" ImageUrl="~/Images/icons/cross.png"
                                        ToolTip="Quitar plantel o carrera de la lista." />
                                </ItemTemplate>
                                <ItemStyle Width="20px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <label>
                                        <%# DataBinder.Eval(Container, "DataItem.Numero_comp")%></label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="Plantel">
                                <ItemTemplate>
                                    <label>
                                        <%# string.Format("{0} ({1}) {2}",  DataBinder.Eval(Container, "DataItem.Plantel"),  DataBinder.Eval(Container, "DataItem.Institucion.Institucion"),  DataBinder.Eval(Container, "DataItem.Carrera")) %></label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </center>
                <br />
            </asp:Panel>
            <asp:ModalPopupExtender ID="mpeListaPlanteles" runat="server" TargetControlID="hfListaPlanteles"
                PopupControlID="pnlListaPlanteles" DropShadow="true" CancelControlID="ibCancelListaPlant"
                BackgroundCssClass="modalBackground" PopupDragHandleControlID="pnlListaPlanteles"
                RepositionMode="None">
            </asp:ModalPopupExtender>
            <%--Fin Seccion Poppup Detalle Institucion--%>
            <%--Inicio Seccion Poppup para limpiar la lista de comparación--%>
            <asp:HiddenField runat="server" ID="hfLimpiarLista" />
            <asp:Panel ID="pnlLimpiarLista" runat="server" Width="700px" CssClass="updateProgress"
                Style="display: none;">
                <table width="100%" cellspacing="0" cellpadding="0">
                    <tr bgcolor="#006699">
                        <td valign="middle" style="width: 600px; padding: 10px 15px 10px 15px; color: White;
                            font-size: 1.3em;">
                            <img src="Images/Popup/information.png" />
                            &nbsp;Notificación
                        </td>
                        <td>
                            <center>
                                <asp:ImageButton ID="ibCancelarLimpiarLista" runat="server" ToolTip="Cerrar ventana"
                                    ImageUrl="~/Images/icons/cerrar24.jpg" CausesValidation="False" /></center>
                        </td>
                    </tr>
                </table>
                <br />
                <p style="padding: 5px 15px;">
                    El plantel o carrera que desea agregar no pertenece al mismo nivel institucional
                    de la lista que se está comparando. Desea borrar la lista que tiene e iniciar una
                    nueva.</p>
                <div class="footerPopup">
                    <asp:Button runat="server" ID="btnLimpiarLista" Text="Aceptar" OnClick="btnLimpiarLista_Click" />
                    &nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancelarLimpiaLista" runat="server" Text="Cancelar" />&nbsp;
                </div>
            </asp:Panel>
            <asp:ModalPopupExtender ID="mpeLimpiarLista" runat="server" TargetControlID="hfLimpiarLista"
                PopupControlID="pnlLimpiarLista" DropShadow="true" CancelControlID="ibCancelarLimpiarLista"
                BackgroundCssClass="modalBackground">
            </asp:ModalPopupExtender>
            <%--Fin Seccion Poppup Detalle Institucion--%>
            <%--Inicio Seccion Poppup para limpiar la lista de comparación  --%>
            <asp:HiddenField runat="server" ID="hfEligeNivel" />
            <asp:Panel ID="pnlSelectNivel" runat="server" Width="890px" CssClass="updateProgress"
                Style="display: none;">
                <table width="100%" cellspacing="0" cellpadding="0">
                    <tr bgcolor="#006699">
                        <td valign="middle" style="width: 375px; padding: 10px 15px 10px 15px; color: White;
                            font-size: 1.3em;">
                            <img src="Images/Popup/magnifier-left.png" />
                            &nbsp;Niveles
                        </td>
                    </tr>
                </table>
                <br />
                <div class="box" id="content-box3">
                    <p>
                        <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=5-Universidad">
                            <img src="Images/Button01.jpg" border="0" align="absmiddle" /></a> <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=4-Preparatoria">
                                <img src="Images/Button02.jpg" border="0" align="absmiddle" /></a> <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=3-Secundaria">
                                    <img src="Images/Button03.jpg" border="0" align="absmiddle" /></a> <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=2-Primaria">
                                        <img src="Images/Button04.jpg" border="0" align="absmiddle" /></a>
                        <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=1-Preescolar">
                            <img src="images/Button05.jpg" border="0" align="absmiddle" /></a>
                    </p>
                </div>
            </asp:Panel>
            <asp:ModalPopupExtender ID="mpeSelectNivel" runat="server" TargetControlID="hfEligeNivel"
                PopupControlID="pnlSelectNivel" DropShadow="true" BackgroundCssClass="modalBackground"
                PopupDragHandleControlID="pnlSelectNivel">
            </asp:ModalPopupExtender>
            <%--Fin Seccion Poppup Detalle Institucion--%>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress AssociatedUpdatePanelID="upBusquedaPlanteles" ID="upBusquedaLoading"
        runat="server">
        <ProgressTemplate>
            <div id="progressBackgroundFilter">
            </div>
            <div id="processMessage">
                Cargando…<br />
                <br />
                <img alt="Loading" src="Images/loading_dark.gif" /></div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BottomContent" runat="Server">
    <div id="page-bottom-content">
        <h3>
            GEZI, un Compromiso con la Educación</h3>
        <img class="pic alignleft" src="images/educMex.png" width="120" height="154" alt="" />
        <p>
            La educación es medio fundamental para adquirir, transmitir y acrecentar la cultura;
            es un proceso permanente que contribuye al desarrollo del individuo y a la transformación
            de la sociedad, y es factor determinante para la adquisición de conocimientos y
            para formar a mujeres y a hombres, de manera que tengan sentido de solidaridad social.
        </p>
    </div>
    <div class="bottom-menu" id="page-bottom-content">
        <p align="right" class="bottom-menu">
            | <a href="http://localhost:58176/GEZI/Default.aspx">Inicio</a> | <a href="http://localhost:58176/GEZI/Nosotros.aspx">
                Nosotros</a> | <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx">Busca tu Escuela</a>
            | <a href="http://localhost:58176/GEZI/Contacto.aspx">Contáctanos</a> | <a href="http://localhost:58176/GEZI/Privacidad.aspx">
                Privacidad</a> |</p>
    </div>
    <div id="page-bottom-sidebar">
        <h3>
            Informes:</h3>
        <ul class="list">
            <li class="first"><a href="http://localhost:58176/GEZI/Nosotros.aspx">Visión y misión
                GEZI</a></li>
            <li><a href="http://localhost:58176/GEZI/Contacto.aspx">Envíanos un e-mail</a></li>
            <li class="last"><a href="http://localhost:58176/GEZI/Default.aspx">Preguntas frecuentes</a><br
                class="clearfix" />
            </li>
        </ul>
    </div>
</asp:Content>
