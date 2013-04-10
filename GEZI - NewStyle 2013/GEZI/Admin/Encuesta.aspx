<%@ Page Title="Encuesta" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="Encuesta.aspx.cs" Inherits="Admin_Encuesta" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
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
    <%--<script type="text/javascript" language="javascript">
        function SeleccionaEncuesta(sender, eventArgs) {
            __doPostBack("AutoCompleteExtender", sender._element.value);
        }
    </script>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SliderContent" runat="Server">
    <%--<asp:Panel ID="pnlHeader" runat="server" DefaultButton="btnBuscar" CssClass="alignPanel clear"
        Width="100%">
        <asp:TextBox ID="txtBuscaEncuesta" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBuscaEncuesta"
            ValidationGroup="busqueda" SetFocusOnError="True">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
        <asp:AutoCompleteExtender ID="aceBuscaEncuesta" runat="server" MinimumPrefixLength="1"
            ServiceMethod="BuscaEncuesta" ServicePath="~/WebService/AutoCompleteService.asmx"
            TargetControlID="txtBuscaEncuesta" CompletionSetCount="10" CompletionInterval="200"
            FirstRowSelected="true" OnClientItemSelected="SeleccionaEncuesta">
        </asp:AutoCompleteExtender>
        <asp:TextBoxWatermarkExtender ID="tbwmeBuscaEncuesta" runat="server" TargetControlID="txtBuscaEncuesta"
            WatermarkText="Nombre de la encuesta" WatermarkCssClass="watermarked">
        </asp:TextBoxWatermarkExtender>
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar Encuesta" OnClick="btnBuscar_Click"
            ValidationGroup="busqueda" />
    </asp:Panel>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
        <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
        <b>
            <asp:Label runat="server" ID="lblTitulo"></asp:Label></b>
        <asp:Label runat="server" ID="lblMensaje"></asp:Label>
        <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
    </asp:Panel>
    <%--inicio prueba para fieldset--%>
    <h2>
        Crear encuesta</h2>
    <small style="color: #CC0000;">* Campos Obligatorios</small>
    <asp:Panel runat="server" ID="pnlEncuesta" DefaultButton="btnAgregarPregunta">
        <asp:ValidationSummary ID="vsNuevaInstitucion" runat="server" ShowSummary="true"
            ValidationGroup="ChecaEncuesta" ForeColor="Red" />
        <fieldset>
            <asp:HiddenField runat="server" ID="hfID" />
            <asp:HiddenField runat="server" ID="hfEncuesta_GUID" />
            <asp:HiddenField runat="server" ID="hfAccion" />
            <legend>Información</legend>
            <ul>
                <li>
                    <label for="txtNombre">
                        <small style="color: #CC0000;">*</small> Nivel:</label>
                    <asp:DropDownList ID="ddlNivel" runat="server" Width="300px" OnSelectedIndexChanged="ddlNivel_SelectedIndexChanged"
                        AutoPostBack="true">
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="cddNivel" runat="server" Category="Nivel" TargetControlID="ddlNivel"
                        PromptText="-Selecciona un Nivel-" LoadingText="Cargando Niveles..." ServicePath="../WebService/DropDownList.asmx"
                        ServiceMethod="GetNivel">
                    </asp:CascadingDropDown>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvNivel" runat="server" ErrorMessage="Falta que seleccione el Nivel."
                        ControlToValidate="ddlNivel" Display="Dynamic" ValidationGroup="ChecaEncuesta"
                        SetFocusOnError="True">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                </li>
                <li>
                    <label for="txtNombre">
                        <small style="color: #CC0000;">*</small> Nombre de la Encuesta:</label>
                    <asp:TextBox ID="txtNombre" runat="server" Text="" Width="300px" MaxLength="200"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="El nombre para la encuesta es necesario."
                        ControlToValidate="txtNombre" Display="Dynamic" ValidationGroup="ChecaEncuesta"
                        SetFocusOnError="True">
                        <asp:Image ID="imgNombre" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                </li>
                <li>
                    <label for="txtPreguntaNo">
                        Numero de Pregunta:</label><asp:TextBox runat="server" ID="txtPreguntaNo" Text="1"
                            Columns="3" MaxLength="3"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="ftePreguntaNo" runat="server" FilterType="Numbers"
                        TargetControlID="txtPreguntaNo" />
                </li>
                <li>
                    <label for="txtPregunta">
                        <small style="color: #CC0000;">*</small> Pregunta:</label>
                    <asp:TextBox ID="txtPregunta" runat="server" Text="" Width="300px" TextMode="MultiLine"
                        Height="46px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvPregunta" runat="server" ErrorMessage="Es necesario que se ingrese una pregunta."
                        ControlToValidate="txtPregunta" Display="Dynamic" ValidationGroup="ChecaEncuesta"
                        SetFocusOnError="True">
                        <asp:Image ID="imgPregunta" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                </li>
                <li>
                    <label for="txtRespuesta1">
                        <small style="color: #CC0000;">*</small> Respuesta 1:</label>
                    <asp:TextBox ID="txtRespuesta1" runat="server" Text="" Width="250px" MaxLength="30"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvClave" runat="server" ErrorMessage="El campo Respuesta 1 es necesario."
                        ControlToValidate="txtRespuesta1" Display="Dynamic" ValidationGroup="ChecaEncuesta"
                        SetFocusOnError="True">
                        <asp:Image ID="imgRespuesta1" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                </li>
                <li>
                    <label for="txtRespuesta2">
                        <small style="color: #CC0000;">*</small> Respuesta 2:</label>
                    <asp:TextBox ID="txtRespuesta2" runat="server" Text="" Width="250px" MaxLength="200"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvRespuesta2" runat="server" ErrorMessage="El campo Respuesta 2 es necesario."
                        ControlToValidate="txtRespuesta2" Display="Dynamic" ValidationGroup="ChecaEncuesta"
                        SetFocusOnError="True">
                        <asp:Image ID="imgRespuesta2" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                </li>
                <li>
                    <label for="txtRespuesta3">
                        Respuesta 3:</label>
                    <asp:TextBox ID="txtRespuesta3" runat="server" Text="" Width="250px" MaxLength="200"></asp:TextBox>
                </li>
                <li>
                    <label for="txtRespuesta4">
                        Respuesta 4:</label>
                    <asp:TextBox ID="txtRespuesta4" runat="server" Text="" Width="250px" MaxLength="30"></asp:TextBox>
                </li>
                <li>
                    <label for="txtRespuesta5">
                        Respuesta 5:</label>
                    <asp:TextBox ID="txtRespuesta5" runat="server" Text="" Width="250px" MaxLength="30"></asp:TextBox>
                </li>
                <li>
                    <label for="cbLimpiar">
                        &nbsp;
                    </label>
                    <asp:CheckBox runat="server" ID="cbLimpiar" Font-Size="12px" Font-Bold="false" Text="Limpiar los campos de respuesta después de agregar una pregunta." />
                </li>
                <li>&nbsp;</li>
                <li>
                    <label for="btnAgregarPregunta">
                        &nbsp;
                    </label>
                    <asp:Button ID="btnAgregarPregunta" runat="server" Text="Agregar" ValidationGroup="ChecaEncuesta"
                        OnClick="btnAgregarPregunta_Click" />
                    &nbsp;<asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click" />
                    &nbsp;<asp:LinkButton ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"
                        ToolTip="Cancelar modificacion de la pregunta." />
                </li>
                <li>
                    <asp:LinkButton runat="server" ID="lbEliminarEnc" Text="Eliminar todas las preguntas"
                        OnClientClick="return confirm('¿Está seguro de querer eliminar todas las preguntas de la encuesta?');return false;"
                        OnClick="lbEliminarEnc_Click"></asp:LinkButton></li>
            </ul>
        </fieldset>
    </asp:Panel>
    <%--fin prueba para fieldset--%>
    <asp:GridView ID="gvEncuesta" runat="server" AutoGenerateColumns="False" OnRowCommand="GvEncuesta_RowCommand"
        EmptyDataText="No hay preguntas actualmente para esta encuesta." Width="100%"
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
        CellPadding="3">
        <Columns>
            <asp:TemplateField HeaderText="#" SortExpression="PreguntaNo">
                <ItemTemplate>
                    <asp:HiddenField runat="server" ID="hfEncuesta_id" Value='<%# DataBinder.Eval(Container, "DataItem.Encuesta_id")%>'>
                    </asp:HiddenField>
                    <asp:HiddenField runat="server" ID="hfGUID" Value='<%# DataBinder.Eval(Container, "DataItem.GUID")%>'>
                    </asp:HiddenField>
                    <asp:HiddenField runat="server" ID="hfNombre" Value='<%# DataBinder.Eval(Container, "DataItem.Nombre")%>'>
                    </asp:HiddenField>
                    <asp:Label runat="server" ID="lblPreguntaNo" Text='<%# DataBinder.Eval(Container, "DataItem.PreguntaNo")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pregunta" SortExpression="Pregunta">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblPregunta" Text='<%# DataBinder.Eval(Container, "DataItem.Pregunta")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Respuesta1" SortExpression="Respuesta1">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblRespuesta1" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Respuesta2" SortExpression="Respuesta2">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblRespuesta2" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Respuesta3" SortExpression="Respuesta3">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblRespuesta3" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta3") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Respuesta4" SortExpression="Respuesta4">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblRespuesta4" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta4") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Respuesta5" SortExpression="Respuesta5">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblRespuesta5" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta5") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Acciones" SortExpression="Acciones">
                <ItemTemplate>
                    <asp:ImageButton runat="server" ID="ibEditar" ImageUrl="~/Images/icons/editrow16.png"
                        ToolTip="Editar registro." CausesValidation="false" CommandName="ACTUALIZA" Width="16px"
                        Height="16px"></asp:ImageButton>
                    <asp:Image runat="server" ID="iSeparator" ImageUrl="~/Images/icons/separator.png">
                    </asp:Image>
                    <asp:ImageButton runat="server" ID="ibEliminar" ImageUrl="~/Images/icons/basura16.png"
                        ToolTip="Eliminar pregunta." CausesValidation="false" OnClientClick='<%# string.Format("return confirm(\"¿Está seguro de querer eliminar la pregunta {0} de la encuesta {1}? \");", DataBinder.Eval(Container, "DataItem.PreguntaNo"),DataBinder.Eval(Container, "DataItem.Nombre")) %>'
                        CommandName="ELIMINA" Width="16px" Height="16px"></asp:ImageButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="100px" />
                <HeaderStyle HorizontalAlign="Center" Width="100px" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <%--Inicio Seccion Poppup Institucion--%>
    <%----%>
    <%-- <asp:Panel ID="pnlListaEncuestas" CssClass="updateProgress" runat="server" Width="350"
        Style="display: none;">
        <table width="100%">
            <tr>
                <td style="padding-left: 5px">
                    <h2>
                        Encuestas</h2>
                </td>
                <td align="right">
                    <asp:ImageButton ID="ibCancelEncuestas" runat="server" ToolTip="Cerrar" ImageUrl="~/Images/icons/cerrar24.jpg"
                        CausesValidation="False" />
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView runat="server" ID="gvListaEncuestas" AutoGenerateColumns="False" Width="100%"
            OnRowCommand="GvListaEncuestas_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="GUID" SortExpression="GUID" Visible="false">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblGUID" Text='<%# DataBinder.Eval(Container, "DataItem.GUID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Encuesta" SortExpression="Nombre">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblNombre" Text='<%# DataBinder.Eval(Container, "DataItem.Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lbEditar" Text="Seleccionar" ToolTip="Seleccionar encuesta."
                            CausesValidation="false" CommandName="SELECCIONA">
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:ModalPopupExtender ID="mpeListaEncuestas" runat="server" TargetControlID="hfAccion"
        PopupControlID="pnlListaEncuestas" DropShadow="true" CancelControlID="ibCancelEncuestas"
        BackgroundCssClass="modalBackground" PopupDragHandleControlID="pnlListaEncuestas">
    </asp:ModalPopupExtender>--%>
    <%--Fin Seccion Poppup Institucion--%>
</asp:Content>
