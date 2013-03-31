<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GridViewMaestro.aspx.cs" Inherits="inicio.GridViewMaestro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table>
    <tr>
        <td>
            No de Empleado:
        </td>
        <td>
            <asp:TextBox ID="txtNoEmpleado" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Titulo:
        </td>
        <td>
            <asp:DropDownList ID="ddTitulo" runat="server" Height="30px" Width="155px" 
                style="margin-left: 0px">
                <asp:ListItem>M.I.</asp:ListItem>
                <asp:ListItem>M.C.</asp:ListItem>
                <asp:ListItem>Dr.</asp:ListItem>
                <asp:ListItem>Ocean.</asp:ListItem>
                <asp:ListItem>Lic.</asp:ListItem>
                <asp:ListItem>L.C.C</asp:ListItem>
                <asp:ListItem>Ing.</asp:ListItem>
                </asp:DropDownList>
        </td>
     </tr>
     <tr>
        <td>
            Nombre:
        </td>
        <td>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        </td>
     </tr>
     <tr>
        <td>
            Apellido Paterno:
        </td>
        <td>
            <asp:TextBox ID="txtApellidoP" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td>
            Apellido Materno:
        </td>
        <td>
            <asp:TextBox ID="txtApellidoM" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td>
            Carrera a la que pertenece:
        </td>
        <td>
            <asp:TextBox ID="txtCarrera" runat="server"></asp:TextBox>
        </td>
      </tr>
</table>
        <br />

<asp:Button ID="btGuardarMaestro" runat="server" Text="Guardar" />
        <br />
<asp:Label ID="lbAlert" runat="server" Text="Label"></asp:Label>



    <asp:GridView ID="gvMaestro" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="3" style="text-align: center" Width="550px">
        <Columns>
            <asp:TemplateField HeaderText="NoEmpleado">
                <ItemTemplate>
                    <asp:Label ID="lblNoEmpleado" runat="server" Text='<%#Eval("noEmpleado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Titulo">
                <ItemTemplate>
                    <asp:Label ID="lblTitulo" runat="server" Text='<%#Eval("Titulo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Nombre">
                <ItemTemplate>
                    <asp:Label ID="lblNombre" runat="server" Text='<%#Eval("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="ApellidoP">
                <ItemTemplate>
                    <asp:Label ID="lblApellidoP" runat="server" Text='<%#Eval("Apellido") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ApellidoM">
                <ItemTemplate>
                    <asp:Label ID="lblApellidoM" runat="server" Text='<%#Eval("Edad")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Carrera">
                <ItemTemplate>
                    <asp:Label ID="lblCarrera" runat="server" Text='<%#Eval("Carrera")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        </asp:GridView>

</asp:Content>
