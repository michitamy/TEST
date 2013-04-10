<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ingresar a GEZI</title>
    <link href="../Styles/account.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/account.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmLogin" runat="server">
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
                    <h1>
                        <asp:Label runat="server" ID="lblTitle" Text="Ingreso"></asp:Label></h1>
                    <div class="field">
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtUsuario">Usuario:</asp:Label>
                        <div class="boxRound">
                            <asp:TextBox ID="txtUsuario" runat="server" AutoCompleteType="None" CssClass="textEntry"></asp:TextBox>
                        </div>
                    </div>
                    <div class="field">
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="txtContrasenia">Contraseña:</asp:Label>
                        <div class="boxRound">
                            <asp:TextBox ID="txtContrasenia" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="submitButton">
                        <asp:Button ID="LoginButton" runat="server" Text="Aceptar" OnClick="LoginButton_Click" />
                        <asp:PlaceHolder ID="phResetPassword" runat="server"><span>
                            <asp:HyperLink runat="server" ID="linkForgotPassword" Text="Recuperar contraseña"
                                NavigateUrl="~/Admin/RecuperarCuenta.aspx" />
                        </span></asp:PlaceHolder>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
