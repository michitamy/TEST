<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecuperarCuenta.aspx.cs"
    Inherits="Admin_RecuperarCuenta" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recuperar Cuenta</title>
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
                    <div>
                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="txtEmail">Correo:</asp:Label>
                        <div class="boxRound">
                            <asp:TextBox ID="txtEmail" runat="server" AutoCompleteType="None" CssClass="textEntry"></asp:TextBox>
                        </div>
                    </div>
                    <p class="submitButton">
                        <asp:Button ID="LoginButton" runat="server" Text="Enviar" OnClick="LoginButton_Click" />
                        <span>
                            <asp:HyperLink runat="server" ID="linkForgotPassword" Text="Ingresar a GEZI" NavigateUrl="~/Admin/Login.aspx" /></span>
                    </p>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>