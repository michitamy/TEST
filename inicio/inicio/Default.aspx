<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="inicio._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to 
    </h2>

    <p>
        Prueba michel desde 27 marzo 2013
    </p>
    Nombre             <asp:TextBox runat="server" ID="TxtNombre"></asp:TextBox><br />
    Creado por         <asp:TextBox runat="server" ID="TxtCreadopor"></asp:TextBox><br />
    Creado desde       <asp:TextBox runat="server" ID="TxtCreadodesde"></asp:TextBox><br />
    Modificado por     <asp:TextBox runat="server" ID="TxtModificadopor"></asp:TextBox><br />
    Modificado desde   <asp:TextBox runat="server" ID="TxtModificadodesde"></asp:TextBox><br />
    
    <asp:Button runat="server" ID="btnSave" Text="Guardar" 
        onclick="btnSave_Click" />

        <asp:Label runat="server" ID="Mensaje"></asp:Label>

        <br />
        <br />

    <asp:TextBox ID="txtMich" runat="server" Width="119px"></asp:TextBox>
    &nbsp; 
    <asp:DropDownList ID="ddlOp" runat="server">
    <asp:ListItem Value="normal">Normal</asp:ListItem>
    <asp:ListItem Value="reversa">Reversa</asp:ListItem>
    </asp:DropDownList>
    &nbsp;
    <asp:TextBox ID="txtMich2" runat="server" Width="120px"></asp:TextBox>
    <br />
    <asp:TextBox ID="txtRes" runat="server" Width="221px"></asp:TextBox>
    <asp:Button ID="btMich" runat="server" Text="Click Me!" 
        onclick="btMich_Click" />

</asp:Content>
