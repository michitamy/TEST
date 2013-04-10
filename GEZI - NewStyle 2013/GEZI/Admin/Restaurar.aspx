<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Restaurar.aspx.cs" Inherits="Admin_Restaurar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Restaurar Contraseña</title>
    <link href="../Styles/account.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/account.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page">
        <div class="header">
            <div class="title">
                <img alt="BlogEngine.net" src="../Images/LOGO_Login.png" />
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="main">
            <div id="StatusBox">
                <div id="AdminStatus" runat="server" style="display: none">
                </div>
            </div>
            <div class="accountInfo">
                <div class="login">
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="lblUserName">Usuario:</asp:Label>
                        <p class="boxRound">
                            <asp:Label ID="lblUserName" runat="server"></asp:Label>
                        </p>
                    </p>
                    <p>
                        <asp:Label ID="Key" runat="server" AssociatedControlID="lblCodigo">Codigo:</asp:Label>
                        <p class="boxRound">
                            <asp:Label ID="lblCodigo" runat="server"></asp:Label>
                        </p>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="txtContrasenia">Contraseña:</asp:Label>
                        <div class="boxRound">
                            <asp:TextBox ID="txtContrasenia" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        </div>
                    </p>
                    <p>
                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="txtConfirmaContrasenia">Confirmar Contraseña:</asp:Label>
                        <div class="boxRound">
                            <asp:TextBox ID="txtConfirmaContrasenia" runat="server" CssClass="passwordEntry"
                                TextMode="Password"></asp:TextBox>
                        </div>
                        <p>
                            <asp:CompareValidator ID="cvComparaContrasenia" runat="server" ControlToCompare="txtContrasenia"
                                ControlToValidate="txtConfirmaContrasenia" Display="Dynamic" ErrorMessage="Las contraseñas no son idénticas."
                                ValidationGroup="ChecaUsuario" ForeColor="Red"></asp:CompareValidator>
                        </p>
                    </p>
                </div>
                <p class="submitButton">
                    <asp:Button ID="CreateUserButton" runat="server" Text="Aceptar" ValidationGroup="ChecaUsuario"
                        OnClick="CreateUserButton_Click" />
                </p>
                <asp:HiddenField runat="server" ID="hfUsuario_ID" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>