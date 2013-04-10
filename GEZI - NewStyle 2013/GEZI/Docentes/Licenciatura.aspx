<%@ Page Title="" Language="C#" MasterPageFile="~/Docentes/mpDocentes.master" AutoEventWireup="true"
    CodeFile="Licenciatura.aspx.cs" Inherits="Docentes_Licenciatura" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h2>
        Hola Licenciados</h2>
    <asp:ValidationSummary ID="vsNuevaLicenciatura" runat="server" ValidationGroup="ValidaLicencitura"
        ForeColor="Red" />
    <table>
        <tr>
            <td>
                Titulo
            </td>
            <td>
                Campo
            </td>
            <td>
                Error
            </td>
        </tr>
        <tr>
            <td>
                <label>
                    Licenciatura en:
                </label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtLicEn" MaxLength="200"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvLicEn" runat="server" ErrorMessage="Es necesario que ingrese el campo Licenciatura en."
                    ControlToValidate="txtLicEn" Display="Dynamic" ValidationGroup="ValidaLicencitura"
                    SetFocusOnError="True">
                    <asp:Image ID="imgLicEn" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>
                    Univesidad donde estudio:
                </label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtEstudio" MaxLength="200"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvEstudio" runat="server" ErrorMessage="Es necesario que ingrese en donde estudio."
                    ControlToValidate="txtEstudio" Display="Dynamic" ValidationGroup="ValidaLicencitura"
                    SetFocusOnError="True">
                    <asp:Image ID="imgEstudio" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>
                    Pais:
                </label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlPais">
                    <asp:ListItem Text="Selecciona" Value="0"></asp:ListItem>
                    <asp:ListItem Text="México" Value="1"></asp:ListItem>
                    <asp:ListItem Text="EUA" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Canada" Value="3"></asp:ListItem>
                    <asp:ListItem Text="España" Value="4"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvPais" runat="server" ErrorMessage="Es necesario que seleccione un pais."
                    ControlToValidate="ddlPais" Display="Dynamic" ValidationGroup="ValidaLicencitura"
                    InitialValue="0" SetFocusOnError="True">
                    <asp:Image ID="imgPais" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>
                    Titulo Legalizado:
                </label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlTitLegalizado">
                    <asp:ListItem Text="Selecciona" Value=""></asp:ListItem>
                    <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvTitLegalizado" runat="server" ErrorMessage="Es necesario que seleccione si su titulo esta legalizado."
                    ControlToValidate="ddlTitLegalizado" Display="Dynamic" ValidationGroup="ValidaLicencitura"
                    InitialValue="" SetFocusOnError="True">
                    <asp:Image ID="imgTitLegalizado" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>
                    Periodo Inicio:
                </label>
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
                    IsValidEmpty="False" ControlToValidate="txtPerInicio" EmptyValueMessage="Requerido ingrese la fecha de inicio"
                    InvalidValueMessage="La fecha del periodo inicio es incorrecta." Display="Dynamic"
                    ForeColor="Red" ValidationGroup="ValidaLicencitura">
                    <asp:Image ID="imgPerInicio" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>
                    Periodo Final:
                </label>
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
                    IsValidEmpty="False" ControlToValidate="txtPerFinal" InvalidValueMessage="La fecha del periodo final es incorrecta."
                    Display="Dynamic"  ErrorMessage="Requerido ErrorMessage" EmptyValueBlurredImage="imgPerFinal" EmptyValueMessage="Requerido ingrese la fecha final"
                    ForeColor="Red" ValidationGroup="ValidaLicencitura" >
                    <asp:Image ID="imgPerFinal" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                </asp:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>
                    No. de Cedula Profesional:
                </label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtCedula" MaxLength="30"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvCedula" runat="server" ErrorMessage="Es necesario que ingrese el no de cedula."
                    ControlToValidate="txtCedula" Display="Dynamic" ValidationGroup="ValidaLicencitura"
                    SetFocusOnError="True">
                    <asp:Image ID="imgCedula" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <center>
                    <asp:Button runat="server" ID="btnAceptar" Text="Guardar" ValidationGroup="ValidaLicencitura"
                        OnClick="btnAceptar_Click" />
                </center>
            </td>
        </tr>
    </table>
    <asp:Label runat="server" ID="lblError" Text="" ForeColor="Red"></asp:Label>
    <asp:GridView runat="server" ID="gvLicenciaturas" EmptyDataText="No hay registros de licenciatura.">
    </asp:GridView>
</asp:Content>
