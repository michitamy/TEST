<%@ Page Title="" Language="C#" MasterPageFile="~/Docentes/mpDocentes.master" AutoEventWireup="true"
    CodeFile="Posgrado.aspx.cs" Inherits="Docentes_Posgrado" UICulture="en" Culture="en-US"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="smPosgrado" runat="server"/>
    <asp:HiddenField runat="server" ID="hfID" />
    <asp:HiddenField runat="server" ID="hfAccion" />
    <h2>Posgrado</h2>
    <%--Style="display: none;" --%>
    <asp:Panel runat="server" ID="pnlPosgrado" DefaultButton="btnGuardar" Width="400px"
        CssClass="updateProgress font">
        <table width="100%" cellspacing="0" cellpadding="0">
            <tr bgcolor="#006699">
                <td valign="middle" style="width: 850px; padding: 10px 15px 10px 15px; color: White;
                    font-size: 1.3em;">
                    <img src="../Images/Popup/inbox-table.png" />
                    &nbsp;Posgrado
                </td>
                <td>
                    <center>
                        <asp:ImageButton ID="ibCancelPos" runat="server" ToolTip="Cerrar" ImageUrl="~/Images/icons/cerrar24.jpg"
                            CausesValidation="False" />
                    </center>
                </td>
            </tr>
        </table><asp:ValidationSummary ID="vsNuevoPosgrado" runat="server" ValidationGroup="ValidaPosgrado" ForeColor ="Red" />
    <table>
        <%--<tr>
            <td>Titulo</td>
            <td>Campo</td>
            <td>Error</td>
        </tr>--%>
        <tr>
            <td>
                <label>Nivel:</label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlNiveles"/>
            </td>
        </tr>
        <tr>
            <td>
                <label>Estudios en:</label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtEstudiosEn" MaxLength="200"/>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvEstudiosEn" runat="server" ErrorMessage="Es necesario que ingrese sus estudios."
                ControlToValidate="txtEstudiosEn" Display="Dynamic" ValidationGroup="ValidaPosgrado"
                SetFocusOnError="True">
                    <asp:Image ID="imgEstudiosEn" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>Universidad donde estudió:</label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtDondeEstudio" MaxLength="200"/>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvDondeEstudio" runat="server" ErrorMessage="Es necesario que ingrese la universidad donde estudió."
                ControlToValidate="txtDondeEstudio" Display="Dynamic" ValidationGroup="ValidaPosgrado"
                SetFocusOnError="True">
                    <asp:Image ID="imgDondeEstudio" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
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
                        ControlToValidate="ddlPais" Display="Dynamic" ValidationGroup="ValidaPosgrado"
                        InitialValue="0" SetFocusOnError="True">
                        <asp:Image ID="imgPais" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                    </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>Título o grado legalizado:</label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlTitGradLegal">
                    <asp:ListItem Text="Selecciona" Value="" />
                    <asp:ListItem Text="Si" Value="True" />
                    <asp:ListItem Text="No" Value="False" />
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvTitGradLegal" runat="server" ErrorMessage="Es necesario que seleccione si su título o grado está legalizado."
                ControlToValidate="ddlTitGradLegal" Display="Dynamic" ValidationGroup="ValidaPosgrado"
                InitialValue="" SetFocusOnError="True">
                    <asp:Image ID="imgTitGradLegal" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
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
                IsValidEmpty="False" ControlToValidate="txtPerInicio" EmptyValueMessage="Requiere insertar fecha inicial del periodo."
                InvalidValueMessage="La fecha del periodo final es incorrecta." Display="Dynamic"
                EmptyValueBlurredText="Requerido" ErrorMessage="Requerido ErrorMessage"
                ForeColor="Red" ValidationGroup="ValidaPosgrado">
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
            <asp:CalendarExtender ID="ceDate2" runat="server" Enabled="True" TargetControlID="txtPerFinal">
            </asp:CalendarExtender>
        </td>
        <td>
            <asp:TextBoxWatermarkExtender ID="tbwePerFinal" runat="server" TargetControlID="txtPerFinal"
                WatermarkText="mm/dd/yyyy" WatermarkCssClass="watermarked" />
            <asp:MaskedEditExtender ID="meePerFinal" runat="server" TargetControlID="txtPerFinal"
                MaskType="Date" Mask="99/99/9999" MessageValidatorTip="true" CultureName="en-US"
                OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" ErrorTooltipEnabled="True" />
            <asp:CompareValidator ID="cvPeriodoFinal" runat="server" ControlToValidate="txtPerFinal" Operator="GreaterThanEqual"
                ControlToCompare="txtPerInicio" ValidationGroup="ValidaPosgrado" ForeColor="Red" Type="Date" Display="Dynamic" 
                ErrorMessage="Fecha final debe ser mayor a inical."><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:CompareValidator>
            <asp:MaskedEditValidator ID="mevPerFinal" runat="server" ControlExtender="meePerFinal"
                IsValidEmpty="False" ControlToValidate="txtPerFinal" EmptyValueMessage="Requiere insertar fecha final del periodo."
                InvalidValueMessage="La fecha del periodo final es incorrecta." Display="Dynamic"
                EmptyValueBlurredText="Requerido" ErrorMessage="Requerido fecha final"
                ForeColor="Red" ValidationGroup="ValidaPosgrado">
                    <asp:Image ID="imgPerFinal" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:MaskedEditValidator>
        </td>
    </tr>
        <tr>
            <td>
                <label>Grado obtenido:</label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlGradObtenido">
                    <asp:ListItem Text="Selecciona" Value=""></asp:ListItem>
                    <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvGradObtenido" runat="server" ErrorMessage="Es necesario que seleccione si obtuvo grado."
                ControlToValidate="ddlGradObtenido" Display="Dynamic" ValidationGroup="ValidaPosgrado"
                InitialValue="" SetFocusOnError="True">
                    <asp:Image ID="imgGradObtenido" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>Número de cédula profesional:</label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtCedula" MaxLength="30"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td>
                <label>Comentarios:</label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtComentarios" MaxLength="500"/>
            </td>
                
        </tr>
        <tr>
            <td colspan="3">
                <center>
                    <asp:Button runat="server" ID="btnGuardar" Text="Guardar" ValidationGroup="ValidaPosgrado"
                    OnClick="btnGuardar_Click" />
                    <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" OnClick="btnCancelar_Click" />
                </center>
            </td>
        </tr>
    </table>
    </asp:Panel>
    <asp:ModalPopupExtender ID="mpeAgregarPosgrado" runat="server" TargetControlID="hfID"
        PopupControlID="pnlPosgrado" DropShadow="true" CancelControlID="ibCancelPos"
        PopupDragHandleControlID="pnlPosgrado" BackgroundCssClass="modalBackground">
    </asp:ModalPopupExtender>
    <asp:Button Text="Nuevo Posgrado" runat="server" ID="btnNuevoPos" onclick="btnNuevoPos_Click"/>
    <asp:Label runat="server" ID="lblMensaje" Text="" ForeColor="Red"/>

    <asp:GridView ID="gvPosgrado" runat="server" AutoGenerateColumns="False" EmptyDataText="No hay registros de posgrado."
                    CssClass="font" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                    OnRowCommand="GvPosgrado_RowCommand" BorderWidth="1px" CellPadding="10">
        <Columns>
            <asp:TemplateField HeaderText="Posgrado" SortExpression="Posgrado_id">
                <ItemTemplate>
                    <asp:HiddenField runat="server" ID="hfPosgrado_id" Value='<%# DataBinder.Eval(Container, "DataItem.Posgrado_id")%>'>
                    </asp:HiddenField>
                    <label><%# DataBinder.Eval(Container, "DataItem.Estudio")%></label>
                </ItemTemplate>
                <ItemStyle CssClass="cs" />
            </asp:TemplateField>
            <%--<asp:TemplateField HeaderText="Universidad" SortExpression="UnivDondeEstudio">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.UnivDondeEstudio")%></label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" CssClass="cs" />
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Nivel" SortExpression="Nivel_nombre">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.Nivel.Nombre")%></label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" CssClass="cs" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pais" SortExpression="Pais">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.Pais.Pais") %></label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Titulo o grado legalizado?" SortExpression="TituloGradoLegal">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container,"DataItem.TituloGradoLegal").ToString() == "True" ? "si" : "no" %></label>
                    
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
<%--            <asp:TemplateField HeaderText="Grado obtenido" SortExpression="Grado">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.Grado") %></label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Número de cedula" SortExpression="NoCedula">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.NoCedula") %></label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Comentarios" SortExpression="Comentarios">
                <ItemTemplate>
                    <label><%# DataBinder.Eval(Container, "DataItem.Comentarios") %></label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"/>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:ImageButton runat="server" ID="ibEditar" ImageUrl="~/Images/icons/editrow16.png"
                        ToolTip="Editar registro." CausesValidation="false" CommandName="ACTUALIZA" Width="16px"
                        Height="16px"></asp:ImageButton>
                    <asp:Image runat="server" ID="iSeparator" ImageUrl="~/Images/icons/separator.png"/>
                    <asp:ImageButton runat="server" ID="ibEliminar" ImageUrl="~/Images/icons/basura16.png"
                        ToolTip="Eliminar Posgrado." CausesValidation="false" OnClientClick='<%# string.Format("return confirm(\"¿Está seguro de querer eliminar el posgrado {0}? \");", DataBinder.Eval(Container, "DataItem.Estudio")) %>'
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
</asp:Content>
