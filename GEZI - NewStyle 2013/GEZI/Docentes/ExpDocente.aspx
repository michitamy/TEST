<%@ Page Title="" Language="C#" MasterPageFile="~/Docentes/mpDocentes.master" AutoEventWireup="true" 
CodeFile="ExpDocente.aspx.cs" Inherits="Docentes_ExpDocente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"/>
    <h2>Experiencia Docente</h2>
    <asp:ValidationSummary ID="vsNuevaExpDocente" runat="server" ValidationGroup="ValidaExpDocente" ForeColor ="Red" />
    <table>
        <tr>
                <td>Titulo</td>
                <td>Campo</td>
                <td>Error</td>
        </tr>
        <tr>
            <td>
                <label>Nombre de la Asignatura o Unidad de Aprendizaje:</label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtNomAsig" MaxLength="200"/>
            </td>
            <td>
                    <asp:RequiredFieldValidator ID="rfvNomAsig" runat="server" ErrorMessage="Es necesario Indicar el nombre de la asignatura."
                    ControlToValidate="txtNomAsig" Display="Dynamic" ValidationGroup="ValidaExpDocente"
                    InitialValue="" SetFocusOnError="True">
                        <asp:Image ID="imgNomAsig" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                    </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>Nivel Escolar de la Asignatura:</label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlNivelEsc"></asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvNivelEsc" runat="server" ErrorMessage="Es necesario que seleccione el nivel escolar."
                ControlToValidate="ddlNivelEsc" Display="Dynamic" ValidationGroup="ValidaExpDocente"
                InitialValue="" SetFocusOnError="True">
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
                    <label>Periodo Inicio:</label>
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
                    IsValidEmpty="False" ControlToValidate="txtPerInicio" EmptyValueMessage="Introduzca la fecha de inicio"
                    InvalidValueMessage="La fecha del periodo final es incorrecta." Display="Dynamic"
                    EmptyValueBlurredText="Requiere Fecha de Inicio" ErrorMessage="Requerido ErrorMessage"
                    ForeColor="Red" ValidationGroup="ValidaExpDocente">
                        <asp:Image ID="imgPerInicio" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:MaskedEditValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Periodo Final:</label>
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
                <asp:MaskedEditValidator ID="mevPerFinal" runat="server" ControlExtender="meePerFinal"
                    IsValidEmpty="False" ControlToValidate="txtPerFinal" EmptyValueMessage="Introduzca la fecha final"
                    InvalidValueMessage="La fecha del periodo final es incorrecta." Display="Dynamic"
                    EmptyValueBlurredText="Requiere Fecha Final" ErrorMessage="Requerido ErrorMessage"
                    ForeColor="Red" ValidationGroup="ValidaExpDocente">
                        <asp:Image ID="imgPerFinal" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>Categoria como docente:</label>
            </td>
            <td>
                <asp:dropdownlist runat="server" ID="ddlCatDoc">
                </asp:dropdownlist>
            </td>
        </tr>
                <tr>
            <td>
                <label>Resultado de la evaluacion docente en la asignatura:</label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtResultado" MaxLength="200"></asp:TextBox>
            </td>
        </tr>
                <tr>
            <td>
                <label>Comentarios:</label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtComentarios" MaxLength="200"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                    <center>
                        <asp:Button runat="server" ID="btnAceptar" Text="Guardar" ValidationGroup="ValidaExpDocente"
                        OnClick="btnAceptar_Click" />
                    </center>
                </td>
        </tr>
    </table>
    <asp:Label runat="server" ID="lblError" Text="" ForeColor="Red"/>
        <asp:GridView runat="server" ID="gvExpDocente" EmptyDataText="No hay registros de experiencia docente."/>
</asp:Content>

