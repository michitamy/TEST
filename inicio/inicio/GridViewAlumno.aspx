<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GridViewAlumno.aspx.cs" Inherits="inicio.GridViewAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<table>
    <tr>
        <td>
        Matricula:
        </td>
        <td>
            <asp:TextBox ID="txtMat" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
        Nombre:
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
        Apellido:
        </td>
        <td>
            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
        Edad:
        </td>
        <td>
            <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
        Activo:
        </td>
        <td>
            <asp:CheckBox ID="cbActive" runat="server" 
                 />
        </td>
    </tr>
</table>
    <asp:Button ID="btSave" runat="server" Text="Guardar!" onclick="btSave_Click" />
    <br />
    <asp:Label ID="lbAlert" runat="server" Text=""></asp:Label>


    <asp:GridView ID="gvMich" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="3" style="text-align: center" Width="550px">
        <Columns>
            <asp:TemplateField HeaderText="Matricula">
                <ItemTemplate>
                    <asp:Label ID="lblMat" runat="server" Text='<%#Eval("Matricula") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Nombre">
                <ItemTemplate>
                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Apellido">
                <ItemTemplate>
                    <asp:Label ID="lblLastName" runat="server" Text='<%#Eval("Apellido") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edad">
                <ItemTemplate>
                    <asp:Label ID="lblAge" runat="server" Text='<%#Eval("Edad")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Activo">
                <ItemTemplate>
                    <asp:Label ID="lblActive" runat="server" Text='<%#((bool)Eval("Activo"))?"SI":"NO"%>'></asp:Label>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#(bool)Eval("Activo")%>' Enabled="false"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
</asp:Content>
