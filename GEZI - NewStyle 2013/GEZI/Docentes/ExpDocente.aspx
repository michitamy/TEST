<%@ Page Title="" Language="C#" MasterPageFile="~/Docentes/mpDocentes.master" AutoEventWireup="true" 
CodeFile="ExpDocente.aspx.cs" Inherits="Docentes_ExpDocente" UICulture="en" Culture="en-US"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="smExpDocente" runat="server"/>
    <asp:HiddenField runat="server" ID="hfID" />
    <asp:HiddenField runat="server" ID="hfAccion" />
    <h2>Experiencia Docente</h2>
    <%--Style="display: none;" --%>
    <asp:Panel runat="server" ID="pnlExpDocente" DefaultButton="btnGuardar" Width="400px"
        CssClass="updateProgress font">
        <table width="100%" cellspacing="0" cellpadding="0">
            <tr bgcolor="#006699">
                <td valign="middle" style="width: 850px; padding: 10px 15px 10px 15px; color: White;
                    font-size: 1.3em;">
                    <img src="../Images/Popup/inbox-table.png" />
                    &nbsp;ExpDocente
                </td>
                <td>
                    <center>
                        <asp:ImageButton ID="ibCancelExpDocente" runat="server" ToolTip="Cerrar" ImageURL="~/Images/icons/cerrar24.jpg"
                            CausesValidation="False" />
                    </center>
                </td>
            </tr>
        </table>
    <asp:ValidationSummary ID="vsNuevaExpDocente" runat="server" ValidationGroup="ValidaExpDocente" ForeColor ="Red" />
    <table>
<%--        <tr>
                <td>Titulo</td>
                <td>Campo</td>
                <td>Error</td>
        </tr>--%>
        <tr>
            <td>
                <label>Nombre de la asignatura o unidad de aprendizaje:</label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtNomAsig" MaxLength="200"/>
            </td>
            <td>
                    <asp:RequiredFieldValidator ID="rfvNomAsig" runat="server" ErrorMessage="Es necesario indicar el nombre de la asignatura."
                    ControlToValidate="txtNomAsig" Display="Dynamic" ValidationGroup="ValidaExpDocente"
                    InitialValue="" SetFocusOnError="True">
                        <asp:Image ID="imgNomAsig" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                    </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>Nivel escolar de la asignatura:</label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlNivelEsc"></asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvNivelEsc" runat="server" ErrorMessage="Es necesario que seleccione el nivel escolar."
                ControlToValidate="ddlNivelEsc" Display="Dynamic" ValidationGroup="ValidaExpDocente"
                InitialValue="0" SetFocusOnError="True">
                    <asp:Image ID="imgNivelEsc" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td>
                <label>Institucion donde la impartió:</label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtInstitucion" MaxLength="200"/>
            </td>
            <td>
                    <asp:RequiredFieldValidator ID="rfvInstitucion" runat="server" ErrorMessage="Es necesario que ingrese la institucion."
                    ControlToValidate="txtInstitucion" Display="Dynamic" ValidationGroup="ValidaExpDocente"
                    InitialValue="" SetFocusOnError="True">
                        <asp:Image ID="imgInstitucion" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
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
                    IsValidEmpty="False" ControlToValidate="txtPerInicio" EmptyValueMessage="Introduzca la fecha inicio del periodo"
                    InvalidValueMessage="La fecha del periodo inicial es incorrecta." Display="Dynamic"
                    EmptyValueBlurredText="Requiere Fecha de Inicio" ErrorMessage="Requerido"
                    ForeColor="Red" ValidationGroup="ValidaExpDocente">
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
                <asp:CalendarExtender ID="caDate2" runat="server" Enabled="True" TargetControlID="txtPerFinal">
                </asp:CalendarExtender>
            </td>
            <td>
                <asp:TextBoxWatermarkExtender ID="tbwePerFinal" runat="server" TargetControlID="txtPerFinal"
                    WatermarkText="mm/dd/yyyy" WatermarkCssClass="watermarked" />
                <asp:MaskedEditExtender ID="meePerFinal" runat="server" TargetControlID="txtPerFinal"
                    MaskType="Date" Mask="99/99/9999" MessageValidatorTip="true" CultureName="en-US"
                    OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" ErrorTooltipEnabled="True" />
                <asp:CompareValidator ID="cvPeriodoFinal" runat="server" ControlToValidate="txtPerFinal" Operator="GreaterThanEqual"
                    ControlToCompare="txtPerInicio" ValidationGroup="ValidaExpDocente" ForeColor="Red" Type="Date" Display="Dynamic" 
                    ErrorMessage="Fecha final debe ser mayor a inical."><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:CompareValidator>
                <asp:MaskedEditValidator ID="mevPerFinal" runat="server" ControlExtender="meePerFinal"
                    IsValidEmpty="False" ControlToValidate="txtPerFinal" EmptyValueMessage="Introduzca la fecha final"
                    InvalidValueMessage="La fecha del periodo final es incorrecta." Display="Dynamic"
                    EmptyValueBlurredText="Requiere fecha final" ErrorMessage="Requerido ErrorMessage"
                    ForeColor="Red" ValidationGroup="ValidaExpDocente">
                        <asp:Image ID="imgPerFinal" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>Categoría como docente:</label>
            </td>
            <td>
                <asp:dropdownlist runat="server" ID="ddlCatDoc">
                </asp:dropdownlist>
            </td>
        </tr>
                <tr>
            <td>
                <label>Resultado de la evaluación docente en la asignatura:</label>
            
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtResultado" MaxLength="5"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="fteResulpenlace" runat="server" FilterType="Custom, Numbers"
                ValidChars="." TargetControlID="txtResultado" />
                <asp:RegularExpressionValidator ID="revResulpenlace" runat="server" ControlToValidate="txtResultado"
                ValidationGroup="ValidaExpDocente" Font-Size="10pt" Display="Dynamic" ForeColor="Red"
                ValidationExpression="^\d+(\.\d+)?$" SetFocusOnError="True">Formato incorrecto.</asp:RegularExpressionValidator>
            </td>

        </tr>
                <tr>
            <td>
                <label>Comentarios:</label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtComentarios" MaxLength="500" TextMode="MultiLine" Rows="5" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                    <center>
                        <asp:Button runat="server" ID="btnGuardar" Text="Guardar" ValidationGroup="ValidaExpDocente"
                        OnClick="btnGuardar_Click" />
                        <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" OnClick="btnCancelar_Click" />
                    </center>
                </td>
        </tr>
    </table>
    </asp:Panel>
    <asp:ModalPopupExtender ID="mpeAgregaExpDocente" runat="server" TargetControlID="hfID"
    PopupControlID="pnlExpDocente" DropShadow="true" CancelControlID="ibCancelExpDocente"
    PopupDragHandleControlID="pnlExpDocente" BackgroundCssClass="modalBackground">
    </asp:ModalPopupExtender>
    <asp:Button Text="Nueva Experiencia Laboral" runat="server" ID="btnNuevaExpDocente" onclick="btnNuevaExpDocente_Click" />
    <asp:Label runat="server" ID="lblMensaje" Text="" ForeColor="Red"/>
        <asp:GridView runat="server" ID="gvExpDocente" AutoGenerateColumns="false" EmptyDataText="No hay registros de experiencia docente."
        CssClass="font" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
        OnRowCommand="GvExpDocente_RowCommand" BorderWidth="1px" CellPadding="10">
            <Columns>
                <asp:TemplateField HeaderText="Nombre de la Asignatura" SortExpression="NomAsignatura">
                    <ItemTemplate>
                        <asp:HiddenField runat="server" ID="hfExpDoc_Id" Value='<%# DataBinder.Eval(Container, "DataItem.ExpDoc_Id")%>' />
                        <label><%# DataBinder.Eval(Container, "DataItem.NomAsignatura")%></label>
                    </ItemTemplate>
                    <ItemStyle CssClass="cs" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Institucion donde laboró" SortExpression="Institucion">
                    <ItemTemplate>
                        <label><%# DataBinder.Eval(Container, "DataItem.Institucion")%></label>
                    </ItemTemplate>
                    <ItemStyle CssClass="cs" />
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
                <asp:TemplateField HeaderText="Categoria como docente" SortExpression="Institucion">
                    <ItemTemplate>
                        <label><%# DataBinder.Eval(Container, "DataItem.Institucion")%></label>
                    </ItemTemplate>
                    <ItemStyle CssClass="cs" />
                </asp:TemplateField>
<%--                <asp:TemplateField HeaderText="Resultado de la evaluación docente en la asigantura" SortExpression="ResultEvaluacion">
                    <ItemTemplate>
                        <label><%# DataBinder.Eval(Container, "DataItem.ResultEvaluacion")%></label>
                    </ItemTemplate>
                    <ItemStyle CssClass="cs" />
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comentarios" SortExpression="Comentarios">
                    <ItemTemplate>
                        <label><%# DataBinder.Eval(Container, "DataItem.Comentarios") %></label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
--%>                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="ibEditar" ImageUrl="~/Images/icons/editrow16.png"
                            ToolTip="Editar registro." CausesValidation="false" CommandName="ACTUALIZA" Width="16px"
                            Height="16px"></asp:ImageButton>
                        <asp:Image runat="server" ID="iSeparator" ImageUrl="~/Images/icons/separator.png"/>
                        <asp:ImageButton runat="server" ID="ibEliminar" ImageUrl="~/Images/icons/basura16.png"
                            ToolTip="Eliminar Posgrado." CausesValidation="false" OnClientClick='<%# string.Format("return confirm(\"¿Está seguro de querer eliminar la experiencia docente de {0}? \");", DataBinder.Eval(Container, "DataItem.NomAsignatura")) %>'
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

