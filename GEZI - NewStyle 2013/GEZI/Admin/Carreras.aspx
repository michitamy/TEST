<%@ Page Title="Carreras" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true"
    CodeFile="Carreras.aspx.cs" Inherits="Admin_Carreras" EnableEventValidation="false" %>

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
    <%--<script type="text/javascript">

        ValidatorHookupControlID("<%= txtDAnios.ClientID %>",
     document.all["<%= cvDuracion.ClientID %>"]);
        ValidatorHookupControlID("<%= txtDMeses.ClientID %>",
     document.all["<%= cvDuracion.ClientID %>"]);
    </script>--%>
    <script type="text/javascript">
        function Duracion_ClientValidate(source, args) {
            var errorMsg = "";
            var sAnios = document.getElementById("<%= txtDAnios.ClientID %>").value;
            var sMeses = document.getElementById("<%= txtDMeses.ClientID %>").value;

            if (sAnios == "" && sMeses == "") {
                errorMsg = "Es necesaria la duración de la carrera.";

                args.IsValid = false;
                alert(errorMsg);

                return;
            }

            if (sAnios != "") {
                if (sAnios > 10) {
                    errorMsg = "El número de años para una carrera no puede ser mayor a 10 años.";

                    args.IsValid = false;
                    alert(errorMsg);

                    return;
                }
            }

            if (sMeses != "") {
                if (sMeses > 11) {
                    errorMsg = "El número para el mes no puede ser mayor a 11.";

                    args.IsValid = false;
                    alert(errorMsg);

                    return;
                }
            }

            args.IsValid = true;
        }
    </script>
    <script type="text/javascript">
        function NoRVOE_ClientValidate(source, args) {
            var NoRVOE = document.getElementById("<%= txtNoRVOE.ClientID %>").value;
            var TipoInst = document.getElementById("<%= hfTipoInst.ClientID %>").value;

            if (TipoInst == "2" && NoRVOE == "")
                args.IsValid = false;
            else
                args.IsValid = true;
        }
        function DisableTextBox(ddlId) {
            var ControlName = document.getElementById(ddlId.id);

            if (ControlName.value == 7)  //it depends on which value Selection do u want to hide or show your textbox
            {
                $("*[name$='txtProydinv']").attr("disabled", "disabled");
                $("*[name$='rblPostgrados']").attr("disabled", "disabled");

            }
            else {
                $("*[name$='txtProydinv']").removeAttr('disabled');
                $("*[name$='rblPostgrados']").removeAttr('disabled');
            }
        }
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
        
        .cs
        {
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SliderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="upCarreras">
        <ContentTemplate>
            <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
            <asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
                <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
                <b>
                    <asp:Label runat="server" ID="lblTitulo"></asp:Label></b>
                <asp:Label runat="server" ID="lblMensaje"></asp:Label>
                <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
            </asp:Panel>
            <%--inicio prueba para fieldset--%>
            <h2>
                Administración de Carreras</h2>
            <%--fin prueba para fieldset--%>
            <table width="100%" style="color: #006699;" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 5%">
                        <center>
                            <img src="../Images/mini/star.png" />
                        </center>
                    </td>
                    <td style="width: 20%">
                        Plantel:
                    </td>
                    <td style="text-align: left;">
                        <asp:Label runat="server" ID="lblPlantel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 5%">
                        <center>
                            <img src="../Images/mini/medal.png" />
                        </center>
                    </td>
                    <td style="width: 20%">
                        Institución:
                    </td>
                    <td style="text-align: left;">
                        <asp:Label runat="server" ID="lblInstitucion"></asp:Label>
                    </td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td style="width: 25%">
                        <asp:ImageButton runat="server" ID="ibAgregar" ImageUrl="~/Images/messages/NuevaCarrera.png"
                            OnClick="ibAgregar_Click" />
                    </td>
                    <td>
                        Niveles:
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="ddlNivelesDCarrera">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtBuscar" Width="200px"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="tbweCarrera" runat="server" TargetControlID="txtBuscar"
                            WatermarkText="Nombre de la carrera" WatermarkCssClass="watermarked" />
                    </td>
                    <td>
                        <asp:Button runat="server" ID="btnBuscar" Text="Buscar Carreras" OnClick="btnBuscar_Click1" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gvCarrera" runat="server" AutoGenerateColumns="False" OnRowCommand="GvCarrera_RowCommand"
                EmptyDataText="No hay carreras actualmente para este plantel." CssClass="font"
                Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                CellPadding="10">
                <Columns>
                    <asp:TemplateField HeaderText="Nivel" SortExpression="Nombre">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hfCarrera_id" Value='<%# DataBinder.Eval(Container, "DataItem.Carrera_ID")%>'>
                            </asp:HiddenField>
                            <asp:Label runat="server" ID="lblNivel" Text='<%# DataBinder.Eval(Container, "DataItem.Nivel.Nombre")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="cs" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Carrera" SortExpression="Tipoestudios">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblTipoestudios" Text='<%# DataBinder.Eval(Container, "DataItem.Tipoestudios")%>'></asp:Label>
                            <%--<asp:Label runat="server" ID="lblTipoestudios" Text='<%# DataBinder.Eval(Container, "DataItem.Tipoestudios").ToString().Length > 30 ? DataBinder.Eval(Container, "DataItem.Tipoestudios").ToString().Substring(0,30) + "..." : DataBinder.Eval(Container, "DataItem.Tipoestudios") %>'></asp:Label>--%>
                        </ItemTemplate>
                        <ItemStyle CssClass="cs" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RVOE" SortExpression="NoRVOE">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblNoRVOE" Text='<%# DataBinder.Eval(Container, "DataItem.NoRVOE")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" CssClass="cs" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Duración de la Carrera" SortExpression="DuracionText">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblDuracion" Text='<%# DataBinder.Eval(Container, "DataItem.DuracionText") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Costo Inscripción" SortExpression="Costoinsc">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCostoinsc" Text='<%# DataBinder.Eval(Container, "DataItem.Costoinsc","{0:c}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Costo Colegiatura" SortExpression="Costocolra">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCostocolra" Text='<%# DataBinder.Eval(Container, "DataItem.Costocolra","{0:c}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="ibEditar" ImageUrl="~/Images/icons/editrow16.png"
                                ToolTip="Editar registro." CausesValidation="false" CommandName="ACTUALIZA" Width="16px"
                                Height="16px"></asp:ImageButton>
                            <asp:Image runat="server" ID="iSeparator" ImageUrl="~/Images/icons/separator.png">
                            </asp:Image>
                            <asp:ImageButton runat="server" ID="ibEliminar" ImageUrl="~/Images/icons/basura16.png"
                                ToolTip="Eliminar carrera." CausesValidation="false" OnClientClick='<%# string.Format("return confirm(\"¿Está seguro de querer eliminar la carrera {0}? \");", DataBinder.Eval(Container, "DataItem.Tipoestudios")) %>'
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
            <asp:HiddenField runat="server" ID="hfCarreras" />
            <asp:Panel runat="server" ID="pnlCarrera" DefaultButton="btnAgregarCarrera" Width="950px"
                Style="display: none;" CssClass="updateProgress font">
                <table width="100%" cellspacing="0" cellpadding="0">
                    <tr bgcolor="#006699">
                        <td valign="middle" style="width: 850px; padding: 10px 15px 10px 15px; color: White;
                            font-size: 1.3em;">
                            <img src="../Images/Popup/inbox-table.png" />
                            &nbsp;Nueva Carrera
                        </td>
                        <td>
                            <center>
                                <asp:ImageButton ID="ibCancelCarrera" runat="server" ToolTip="Cerrar" ImageUrl="~/Images/icons/cerrar24.jpg"
                                    CausesValidation="False" /></center>
                        </td>
                    </tr>
                </table>
                <table width="95%" style="display: block; margin: auto;">
                    <tr>
                        <td colspan="6">
                            <asp:ValidationSummary ID="vsNuevaInstitucion" runat="server" ShowSummary="false"
                                HeaderText="Faltan Campos por llenar" ValidationGroup="validaCarrera" ForeColor="Red" />
                            <asp:HiddenField runat="server" ID="hfID" />
                            <%--<asp:HiddenField runat="server" ID="hfEncuesta_GUID" />--%>
                            <asp:HiddenField runat="server" ID="hfAccion" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <small style="color: #CC0000;">* Campos Obligatorios</small>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h5>
                                Detalles</h5>
                            <hr />
                        </td>
                        <td>
                        </td>
                        <td colspan="3">
                            <h5>
                                Atributos</h5>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="El nombre para la carrera es necesario."
                                ControlToValidate="txtTipoestudios" Display="Dynamic" ValidationGroup="validaCarrera"
                                SetFocusOnError="True">
                                <asp:Image ID="imgNombre" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <label for="txtTipoestudios">
                                <small style="color: #CC0000;">*</small>Nombre de la Carrera</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTipoestudios" runat="server" Width="350px" MaxLength="100" TabIndex="1"></asp:TextBox>
                        </td>
                        <td rowspan="10" style="border-right: 1px solid #ededed;">
                            &nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvLicacredit" runat="server" ValidationGroup="validaCarrera"
                                ControlToValidate="rblLicacredit" ErrorMessage="Es necesario que indique se esta acreditada la carrera"
                                SetFocusOnError="True">
                                <asp:Image ID="imgLicacredit" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                            </asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <label for="rblLicacredit">
                                <small style="color: #CC0000;">*</small>¿Esta acreditada la licenciatura?</label>
                        </td>
                        <td>
                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblLicacredit" runat="server"
                                TabIndex="11">
                                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                                <asp:ListItem Text="No" Value="False"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvNivel" runat="server" ErrorMessage="Es necesario que seleccione el nivel al que pertenece la carrera."
                                ControlToValidate="ddlNivel" Display="Dynamic" ValidationGroup="validaCarrera"
                                SetFocusOnError="True">
                                <asp:Image ID="imgNivel" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <label for="ddlNivel">
                                <small style="color: #CC0000;">*</small>Nivel:</label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlNivel" runat="server" Width="300px" TabIndex="2" onchange="DisableTextBox(this);">
                            </asp:DropDownList>
                            <asp:CascadingDropDown ID="cddNivel" runat="server" Category="Nivel" TargetControlID="ddlNivel"
                                PromptText="-Selecciona un Nivel-" LoadingText="Cargando Niveles..." ServicePath="../WebService/DropDownList.asmx"
                                ServiceMethod="GetNivelCarrera">
                            </asp:CascadingDropDown>
                        </td>
                        <td>
                        </td>
                        <td>
                            <label for="rblLabs">
                                ¿Cuenta con laboratorios de la carrera?</label>
                        </td>
                        <td>
                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblLabs" runat="server" TabIndex="12">
                                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                                <asp:ListItem Text="No" Value="False"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvTipoRVOE" runat="server" ErrorMessage="Es necesario que seleccione el Tipo de RVOE"
                                ControlToValidate="ddlTipoRVOE" Display="Dynamic" ValidationGroup="validaCarrera"
                                SetFocusOnError="True">
                                <asp:Image ID="imgTipoRVOE" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <label for="ddlTipoRVOE">
                                <small style="color: #CC0000;">*</small>Tipo de RVOE</label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlTipoRVOE" runat="server" Width="300px" TabIndex="3">
                            </asp:DropDownList>
                        </td>
                        <td>
                        </td>
                        <td>
                            <label for="rblPostgrados">
                                ¿El programa de postgrados es de excelencia?</label>
                        </td>
                        <td>
                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblPostgrados" runat="server"
                                TabIndex="13">
                                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                                <asp:ListItem Text="No" Value="False"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CustomValidator ID="cvNoRVOE" runat="server" ErrorMessage="El número de RVOE es obligatorio para instituciones privadas."
                                ValidationGroup="validaCarrera" Display="Dynamic" ClientValidationFunction="NoRVOE_ClientValidate">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:CustomValidator>
                        </td>
                        <td>
                            <label for="txtNoRVOE">
                                Número de RVOE</label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtNoRVOE" Text="" Width="100px" MaxLength="15" TabIndex="4"></asp:TextBox>
                            <asp:HiddenField runat="server" ID="hfTipoInst"></asp:HiddenField>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvInglesreq" runat="server" ValidationGroup="validaCarrera"
                                ControlToValidate="rblInglesreq" ErrorMessage="Es necesario que indique, si el idioma inglés es un requisito de titulación."
                                SetFocusOnError="True">
                                <asp:Image ID="imgInglesreq" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                            </asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <label for="rblInglesreq">
                                <small style="color: #CC0000;">*</small>¿El idioma inglés es un requisito de titulación?</label>
                        </td>
                        <td>
                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblInglesreq" runat="server"
                                TabIndex="14">
                                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                                <asp:ListItem Text="No" Value="False"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            Número de alumnos con los que cuenta la carrera
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtNoAlumnos" Text="" Width="100px" MaxLength="5"
                                TabIndex="5"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="fteNoAlumnos" runat="server" FilterType="Numbers"
                                TargetControlID="txtNoAlumnos" />
                            <%--   <asp:RegularExpressionValidator ID="revCalfmin" runat="server" ControlToValidate="txtCalfmin"
                ValidationGroup="validaCarrera" Font-Size="10pt" Display="Dynamic" ValidationExpression="^\d+(\.\d+)?$"
                SetFocusOnError="True" ForeColor="Red">
                        Formato Incorrecto.</asp:RegularExpressionValidator>--%>
                        </td>
                        <td>
                        </td>
                        <td>
                            <label for="txtCursosingles">
                                Número de cursos de inglés como materia en la carrera:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCursosingles" runat="server" MaxLength="3" Text="" Width="100px"
                                TabIndex="15"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="fteCursosingles" runat="server" FilterType="Numbers"
                                TargetControlID="txtCursosingles" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CustomValidator ID="cvDuracion" runat="server" ErrorMessage="Error en la duración de la carrera."
                                ValidationGroup="validaCarrera" Display="Dynamic" ClientValidationFunction="Duracion_ClientValidate">
                                <asp:Image ID="imgDuracion" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:CustomValidator>
                        </td>
                        <td>
                            <label for="txtDAnios">
                                <small style="color: #CC0000;">*</small>Duración</label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtDAnios" Text="" MaxLength="2" Columns="3" TabIndex="6"></asp:TextBox><asp:Label
                                ID="Label1" runat="server" AssociatedControlID="txtDAnios" Text="Año(s)"></asp:Label>
                            <asp:TextBox runat="server" ID="txtDMeses" Text="" MaxLength="2" Columns="3" TabIndex="7"></asp:TextBox><asp:Label
                                ID="Label2" AssociatedControlID="txtDMeses" runat="server" Text="Mes(es)"></asp:Label>
                            <asp:FilteredTextBoxExtender ID="fteDMeses" runat="server" FilterType="Numbers" TargetControlID="txtDAnios" />
                            <asp:FilteredTextBoxExtender ID="fteDAnios" runat="server" FilterType="Numbers" TargetControlID="txtDMeses" />
                        </td>
                        <td>
                        </td>
                        <td>
                            <label for="txtCursoscompu">
                                Número de cursos de computación como materia en la carrera:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCursoscompu" runat="server" MaxLength="3" Text="" Width="100px"
                                TabIndex="16"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="fteCursoscompu" runat="server" FilterType="Numbers"
                                TargetControlID="txtCursoscompu" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <label for="txtProydinv">
                                Líneas y proyectos de investigación</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtProydinv" runat="server" Width="350px" MaxLength="100" TabIndex="8"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                        <td>
                            <label for="txtEgresados">
                                Porcentaje de egresados titulados:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEgresados" runat="server" CssClass="percent" MaxLength="5" Text=""
                                Width="75px" TabIndex="17"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="fteEgresados" runat="server" FilterType="Custom, Numbers"
                                ValidChars="." TargetControlID="txtEgresados" />
                            &nbsp;
                            <asp:RegularExpressionValidator ID="revEgresados" runat="server" ControlToValidate="txtEgresados"
                                Display="Dynamic" Font-Size="10pt" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d+(\.\d+)?$"
                                ValidationGroup="validaCarrera">
                        Formato Incorrecto.</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvOpctitcion" runat="server" ValidationGroup="validaCarrera"
                                ControlToValidate="txtOpctitcion" ErrorMessage="Es necesario que ingrese las opciones de titulación."
                                SetFocusOnError="True">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                            </asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <label for="txtOpctitcion">
                                <small style="color: #CC0000;">*</small>Opciones de titulación</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOpctitcion" runat="server" Width="350px" MaxLength="100" TabIndex="9"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvInscripcion" runat="server" ControlToValidate="txtInscripcion"
                                ErrorMessage="Es necesario que de el costo de la inscripción." SetFocusOnError="True"
                                ValidationGroup="validaCarrera">
                                <asp:Image ID="imgInscripcion" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                            </asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <label for="txtInscripcion">
                                <small style="color: #CC0000;">*</small>Costo de la inscripción:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtInscripcion" runat="server" CssClass="money" MaxLength="8" Text=""
                                Width="75px" TabIndex="18"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="fteInscripcion" runat="server" FilterType="Custom, Numbers"
                                ValidChars="." TargetControlID="txtInscripcion" />
                            &nbsp;
                            <asp:RegularExpressionValidator ID="revCostoinsc" runat="server" ControlToValidate="txtInscripcion"
                                Display="Dynamic" Font-Size="10pt" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d+(\.\d+)?$"
                                ValidationGroup="validaCarrera">
                        Formato Incorrecto.</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <label for="txtQueacredit">
                                Organismo que la acredita:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQueacredit" runat="server" Width="350px" MaxLength="100" TabIndex="10"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvColegiatura" runat="server" ControlToValidate="txtColegiatura"
                                ErrorMessage="Es necesario que de el costo de la colegiatura." SetFocusOnError="True"
                                ValidationGroup="validaCarrera">
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                            </asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <label for="txtColegiatura">
                                <small style="color: #CC0000;">*</small>Costo de la colegiatura</label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtColegiatura" runat="server" CssClass="money" MaxLength="8" Width="75px"
                                TabIndex="19"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="fteColegiatura" runat="server" FilterType="Custom, Numbers"
                                ValidChars="." TargetControlID="txtColegiatura" />
                            &nbsp;<asp:RegularExpressionValidator ID="revColegiatura" runat="server" ControlToValidate="txtColegiatura"
                                Display="Dynamic" Font-Size="10pt" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d+(\.\d+)?$"
                                ValidationGroup="validaCarrera">
                        Formato Incorrecto.</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
                <div class="footerPopup">
                    <asp:Button ID="btnAgregarCarrera" runat="server" Text="Guardar" ValidationGroup="validaCarrera"
                        OnClick="btnAgregarCarrera_Click" TabIndex="20" />
                    &nbsp;<asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click"
                        TabIndex="21" />
                    &nbsp;<asp:LinkButton ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"
                        TabIndex="21" />&nbsp;&nbsp;
                </div>
            </asp:Panel>
            <asp:ModalPopupExtender ID="mpeAgregarCarrera" runat="server" TargetControlID="hfCarreras"
                PopupControlID="pnlCarrera" DropShadow="true" CancelControlID="ibCancelCarrera"
                PopupDragHandleControlID="pnlCarrera" BackgroundCssClass="modalBackground">
            </asp:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress AssociatedUpdatePanelID="upCarreras" ID="upCarreraLoading" runat="server">
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
