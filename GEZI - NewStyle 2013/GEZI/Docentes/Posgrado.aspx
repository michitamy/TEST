<%@ Page Title="" Language="C#" MasterPageFile="~/Docentes/mpDocentes.master" AutoEventWireup="true"
    CodeFile="Posgrado.aspx.cs" Inherits="Docentes_Posgrado" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"/>
        <h2>Posgrado</h2>
        <asp:ValidationSummary ID="vsNuevoPosgrado" runat="server" ValidationGroup="ValidaPosgrado" ForeColor ="Red" />
        <table>
            <tr>
                <td>Titulo</td>
                <td>Campo</td>
                <td>Error</td>
            </tr>
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
                    <label>Universidad donde estudio:</label>
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
                    <label>Pais:</label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPais" MaxLength="30"/>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPais" runat="server" ErrorMessage="Es necesario que ingrese el Pais."
                    ControlToValidate="txtPais" Display="Dynamic" ValidationGroup="ValidaPosgrado"
                    SetFocusOnError="True">
                        <asp:Image ID="imgPais" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Titulo o Grado Legalizado:</label>
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlTitGradLegal">
                        <asp:ListItem Text="Selecciona" Value="" />
                        <asp:ListItem Text="Si" Value="true" />
                        <asp:ListItem Text="No" Value="false" />
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvTitGradLegal" runat="server" ErrorMessage="Es necesario que seleccione si su titulo o grado esta legalizado."
                    ControlToValidate="ddlTitGradLegal" Display="Dynamic" ValidationGroup="ValidaPosgrado"
                    InitialValue="" SetFocusOnError="True">
                        <asp:Image ID="imgTitGradLegal" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
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
                    IsValidEmpty="False" ControlToValidate="txtPerFinal" EmptyValueMessage="Requerido EmptyValueMessage"
                    InvalidValueMessage="La fecha del periodo final es incorrecta." Display="Dynamic"
                    EmptyValueBlurredText="Requerido EmptyValueBlurredText" ErrorMessage="Requerido ErrorMessage"
                    ForeColor="Red" ValidationGroup="ValidaPosgrado">
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
                    IsValidEmpty="False" ControlToValidate="txtPerFinal" EmptyValueMessage="Requerido EmptyValueMessage"
                    InvalidValueMessage="La fecha del periodo final es incorrecta." Display="Dynamic"
                    EmptyValueBlurredText="Requerido EmptyValueBlurredText" ErrorMessage="Requerido ErrorMessage"
                    ForeColor="Red" ValidationGroup="ValidaPosgrado">
                        <asp:Image ID="imgPerFinal" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:MaskedEditValidator>
            </td>
        </tr>
            <tr>
                <td>
                    <label>Grado Obtenido:</label>
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
                    <label>No. de Cedula Profesional:</label>
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
                        <asp:Button runat="server" ID="btnAceptar" Text="Guardar" ValidationGroup="ValidaPosgrado"
                        OnClick="btnAceptar_Click" />
                    </center>
                </td>
            </tr>
        </table>
        <asp:Label runat="server" ID="lblError" Text="" ForeColor="Red"/>
        <asp:GridView runat="server" ID="gvPosgrado" EmptyDataText="No hay registros de posgrado.">
        </asp:GridView>
</asp:Content>
