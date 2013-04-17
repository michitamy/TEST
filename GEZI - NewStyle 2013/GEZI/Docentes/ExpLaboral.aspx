<%@ Page Title="" Language="C#" MasterPageFile="~/Docentes/mpDocentes.master" AutoEventWireup="true" CodeFile="ExpLaboral.aspx.cs" Inherits="Docentes_ExpLaboral" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ScriptManager ID="smExpLaboral" runat="server" />
<asp:HiddenField runat="server" ID="hfID" />
<asp:HiddenField runat="server" ID="hfAccion" />
<h2>Experiencia Laboral</h2>
<%--Style="display: none;" --%>
<asp:Panel runat="server" ID="pnlExpLaboral" DefaultButton="bntGuardar" Whit="350"
CssClass="updateProgress font">
    <table width="100%" cellspacing="0" cellpadding="0">
        <tr bgcolor='#006699'>
            <td valing='middle' style="width: 850px; padding: 10px 15px 10px 15px; color: White;
                    font-size: 1.3em;">
                <img src="../Images/Popup/inbox-table.png" />
                &nbsp;ExpLaboral
            </td>
            <td>
                <center>
                <asp:ImageButton ID="ibCancelExpLaboral" runat="server" ToolTip="Cerrar" ImageUrl="~/Images/icons/cerrar24.jpg"
                CausesValidation="False" />
                </center>
            </td>
        </tr>

    </table>
    <asp:ValidationSummary ID="vsNuevaExpLab" runat="server" ValidationGroup="ValidaExpLab"
    ForeColor="Red" />
    <table>
        <tr>
            <td>Titulo</td>
            <td>Campo</td>
            <td>Error</td>
        </tr>
        <tr>
            <td>
                <label></label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtNomPuesto" MaxLength="200"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfv" runat="server" ErrorMessage="Es necesario que..."
                        ControlToValidate="txtNomPuesto" Display="Dynamic" ValidationGroup="ValidaExpLab"
                        SetFocusOnError="True">
                        <asp:Image ID="img" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                 </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label></label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="TextBox1" MaxLength="2"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Es necesario que..."
                        ControlToValidate="txt" Display="Dynamic" ValidationGroup="ValidaExpLab"
                        SetFocusOnError="True">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                 </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label></label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="TextBox2" MaxLength="4"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Es necesario que..."
                        ControlToValidate="txt" Display="Dynamic" ValidationGroup="ValidaExpLab"
                        SetFocusOnError="True">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                 </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label></label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="TextBox3" MaxLength="4"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Es necesario que..."
                        ControlToValidate="txt" Display="Dynamic" ValidationGroup="ValidaExpLab"
                        SetFocusOnError="True">
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                 </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label></label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="TextBox4" MaxLength="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <label></label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="TextBox5" MaxLength="4"></asp:TextBox>
            </td>
       
        </tr>
    </table>
</asp:Panel>
</asp:Content>

