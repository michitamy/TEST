<%@ Page Title="" Language="C#" MasterPageFile="~/Docentes/mpDocentes.master" AutoEventWireup="true"
    CodeFile="Licenciatura.aspx.cs" Inherits="Docentes_Licenciatura" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Styles/StyleGEZI.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () 
        {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_initializeRequest(InitializeRequest);
            prm.add_endRequest(EndRequest);

            // Place here the first init of the autocomplete
            TimerMessage();
        });

        function InitializeRequest(sender, args) { }

        function EndRequest(sender, args) 
        {
            // after update occur on UpdatePanel re-init the Autocomplete
            TimerMessage();
        }

        function TimerMessage()
        {  $('#<%= pnlMensaje.ClientID %>').delay(8000).slideUp(300);}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="smLicenciatura" runat="server" />
    <asp:HiddenField runat="server" ID="hfID" />
    <asp:HiddenField runat="server" ID="hfAccion" />
    <%--Incio para los mensajes--%>
    <asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
        <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
        <b>
            <asp:Label runat="server" ID="lblTitulo"></asp:Label>
        </b>
        <asp:Label runat="server" ID="Label1"></asp:Label>
        <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
    </asp:Panel>
    <%--Fin para los mensajes--%>
    
    <h2>Licenciatura</h2>
    <%--Style="display: none;" --%>
    <asp:Panel runat="server" ID="pnlLicenciaturas" DefaultButton="btnGuardar" Width="400px"
        CssClass="updateProgress font">
        <table width="100%" cellspacing="0" cellpadding="0">
            <tr bgcolor="#006699">
                <td valign="middle" style="width: 850px; padding: 10px 15px 10px 15px; color: White;
                    font-size: 1.3em;">
                    <img src="../Images/Popup/inbox-table.png" />
                    &nbsp;Licenciatura
                </td>
                <td>
                    <center>
                        <asp:ImageButton ID="ibCancelLic" runat="server" ToolTip="Cerrar" ImageUrl="~/Images/icons/cerrar24.jpg"
                            CausesValidation="False" />
                    </center>
               </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="vsNuevaLicenciatura" runat="server" ValidationGroup="ValidaLicencitura"
            ForeColor="Red" />
            <table>
                <tr>
                    <td>
                        <label>Licenciatura en:</label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtLicEn" MaxLength="200"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvLicEn" runat="server" ErrorMessage="Es necesario que ingrese el campo de Licenciatura en."
                            ControlToValidate="txtLicEn" Display="Dynamic" ValidationGroup="ValidaLicencitura"
                            SetFocusOnError="True">
                            <asp:Image ID="imgLicEn" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Univesidad donde estudió:</label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtEstudio" MaxLength="200"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvEstudio" runat="server" ErrorMessage="Es necesario que ingrese la universidad donde estudió."
                            ControlToValidate="txtEstudio" Display="Dynamic" ValidationGroup="ValidaLicencitura"
                            SetFocusOnError="True">
                            <asp:Image ID="imgEstudio" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>País:</label>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="ddlPais">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPais" runat="server" ErrorMessage="Es necesario que seleccione un país."
                            ControlToValidate="ddlPais" Display="Dynamic" ValidationGroup="ValidaLicencitura"
                            InitialValue="0" SetFocusOnError="True">
                            <asp:Image ID="imgPais" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Título Legalizado:</label>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="ddlTitLegalizado">
                            <asp:ListItem Text="Selecciona" Value=""></asp:ListItem>
                            <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                            <asp:ListItem Text="No" Value="False"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvTitLegalizado" runat="server" ErrorMessage="Es necesario que seleccione si su título esta legalizado."
                            ControlToValidate="ddlTitLegalizado" Display="Dynamic" ValidationGroup="ValidaLicencitura"
                            InitialValue="" SetFocusOnError="True">
                            <asp:Image ID="imgTitLegalizado" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Periodo inicio:</label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtPerInicio" MaxLength="10"></asp:TextBox>
                        <asp:CalendarExtender ID="ceDate" runat="server" Enabled="True" TargetControlID="txtPerInicio">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        <asp:TextBoxWatermarkExtender ID="tbwePerInicio" runat="server" TargetControlID="txtPerInicio"
                            WatermarkText="mm/dd/yyyy" WatermarkCssClass="watermarked" />
                        <asp:MaskedEditExtender ID="meePerInicio" runat="server" TargetControlID="txtPerInicio"
                            MaskType="Date" Mask="99/99/9999" MessageValidatorTip="true" CultureName="en-US"
                            OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" ErrorTooltipEnabled="True" />
                        <asp:MaskedEditValidator ID="mevPerInicio" runat="server" ControlExtender="meePerInicio"
                            IsValidEmpty="False" ControlToValidate="txtPerInicio" EmptyValueMessage="Se requiere que ingrese la fecha inicio del periodo"
                            InvalidValueMessage="La fecha del periodo inicio es incorrecta." Display="Dynamic"
                            ForeColor="Red" ValidationGroup="ValidaLicencitura">
                            <asp:Image ID="imgPerInicio" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:MaskedEditValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Periodo final:</label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtPerFinal" MaxLength="10"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtPerFinal">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        <asp:TextBoxWatermarkExtender ID="tbwePerFinal" runat="server" TargetControlID="txtPerFinal"
                            WatermarkText="mm/dd/yyyy" WatermarkCssClass="watermarked" />
                        <asp:MaskedEditExtender ID="meePerFinal" runat="server" TargetControlID="txtPerFinal"
                            MaskType="Date" Mask="99/99/9999" MessageValidatorTip="true" CultureName="en-US"
                            OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" ErrorTooltipEnabled="True" />
                        <asp:CompareValidator ID="cvPeriodoFinal" runat="server" ControlToValidate="txtPerFinal"
                            Operator="GreaterThanEqual" ControlToCompare="txtPerInicio" ValidationGroup="ValidaLicencitura"
                            ForeColor="Red" Type="Date" Display="Dynamic" ErrorMessage="Fecha final debe ser mayor a inical.">
                            <asp:Image ID="imgPerFinalError" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:CompareValidator>
                        <asp:MaskedEditValidator ID="mevPerFinal" runat="server" ControlExtender="meePerFinal"
                            IsValidEmpty="False" ControlToValidate="txtPerFinal" InvalidValueMessage="La fecha del periodo final es incorrecta."
                            Display="Dynamic" ErrorMessage="Requerido ErrorMessage" EmptyValueMessage="Requere ingresar la fecha final del periodo"
                            ForeColor="Red" ValidationGroup="ValidaLicencitura">
                            <asp:Image ID="imgPerFinal" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:MaskedEditValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Número de cédula profesional:</label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtCedula" MaxLength="30"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvCedula" runat="server" ErrorMessage="Es necesario que ingrese el número de cédula."
                            ControlToValidate="txtCedula" Display="Dynamic" ValidationGroup="ValidaLicencitura"
                            SetFocusOnError="True">
                            <asp:Image ID="imgCedula" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <center>
                            <asp:Button runat="server" ID="btnGuardar" Text="Guardar" ValidationGroup="ValidaLicencitura"
                                OnClick="btnGuardar_Click" />
                            <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" OnClick="btnCancelar_Click" />
                        </center>
                    </td>
                </tr>
            </table>
    </asp:Panel>
    <asp:ModalPopupExtender ID="mpeAgregarLicenciatura" runat="server" TargetControlID="hfID"
        PopupControlID="pnlLicenciaturas" DropShadow="true" CancelControlID="ibCancelLic"
        PopupDragHandleControlID="pnlLicenciaturas" BackgroundCssClass="modalBackground">
    </asp:ModalPopupExtender>
    <asp:Button Text="Nueva Licenciatura" runat="server" ID="btnNuevaLic" OnClick="btnNuevaLic_Click" ToolTip="Crea nueva licenciatura."/>
    <asp:Label runat="server" ID="lblMensaje" Text="" ForeColor="Red"></asp:Label>
    <asp:GridView ID="gvLicenciaturas" runat="server" AutoGenerateColumns="False" EmptyDataText="No hay registros de licenciatura."
        CssClass="font" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
        OnRowCommand="GvLicenciaturas_RowCommand" BorderWidth="1px" CellPadding="10">
        <Columns>
            <asp:TemplateField HeaderText="Licenciatura" SortExpression="Licenciatura_id">
                <ItemTemplate>
                    <asp:HiddenField runat="server" ID="hfLicenciatura_id" Value='<%# DataBinder.Eval(Container, "DataItem.Licenciatura_id")%>'></asp:HiddenField>
                    <label><%# DataBinder.Eval(Container, "DataItem.Licenciatura")%></label>
                </ItemTemplate>
                <ItemStyle CssClass="cs" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Donde estudió" SortExpression="DondeEstudio">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.DondeEstudio")%></label>
                </ItemTemplate>
                <ItemStyle CssClass="cs" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="País" SortExpression="Pais">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.Pais.Pais")%></label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" CssClass="cs" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="¿Titulo Legalizado?" SortExpression="TituloLegalizado">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.TituloLegalizado").ToString() == "True" ? "si" : "no"%></label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Periodo Inicio" SortExpression="PeriodoInicio">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.PeriodoInicio","{0:dd/MMM/yyyy}") %></label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Periodo Final" SortExpression="PeriodoFinal">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.PeriodoFinal","{0:dd/MMM/yyyy}") %></label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Número  de cédula" SortExpression="NoCedula">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.NoCedula") %></label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:ImageButton runat="server" ID="ibEditar" ImageUrl="~/Images/icons/editrow16.png"
                        ToolTip="Editar licenciatura." CausesValidation="false" CommandName="ACTUALIZA" Width="16px"
                        Height="16px">
                    </asp:ImageButton>
                    <asp:Image runat="server" ID="iSeparator" ImageUrl="~/Images/icons/separator.png">
                    </asp:Image>
                    <asp:ImageButton runat="server" ID="ibEliminar" ImageUrl="~/Images/icons/basura16.png"
                        ToolTip="Eliminar licenciatura." CausesValidation="false" OnClientClick='<%# string.Format("return confirm(\"¿Está seguro de querer eliminar la licenciatura {0}? \");", DataBinder.Eval(Container, "DataItem.Licenciatura")) %>'
                        CommandName="ELIMINA" Width="16px" Height="16px">
                    </asp:ImageButton>
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
</asp:Content>
