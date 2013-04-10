<%@ Page Title="Atributos" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="Caracterisiticas.aspx.cs" Inherits="Admin_Caracterisiticas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/StyleGEZI.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.dropotron-1.0.js" type="text/javascript"></script>
    <%--<script src="../Scripts/jquery.slidertron-1.1.js" type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
        </asp:View>
    </asp:MultiView>
</asp:Content>