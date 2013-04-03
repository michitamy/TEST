<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="GridViewMaestro.aspx.cs" Inherits="inicio.GridViewMaestro" %>

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
                <asp:DropDownList ID="ddTitulo" runat="server" Height="30px" Width="155px" Style="margin-left: 0px">
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
    <asp:Button ID="btGuardarMaestro" runat="server" Text="Guardar" OnClick = "btSave_Click"/>
    <br />
    <asp:Label ID="lbAlert" runat="server" Text="Label"></asp:Label>
    <asp:GridView ID="gvMaestro" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="3" Style="text-align: center"
        Width="550px" onrowcancelingedit="gvMaestro_RowCancelingEdit" 
        onrowcommand="gvMaestro_RowCommand" onrowdeleting="gvMaestro_RowDeleting" 
        onrowediting="gvMaestro_RowEditing" onrowupdating="gvMaestro_RowUpdating">
        <Columns>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="false" CommandName="Edit"
                                ImageUrl="~/Img/edit.png" ToolTip="Editar Maestro" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="false" CommandName="Update" ToolTip="Actualizar Maestro"  Text ="Actualizar" ImageUrl="~/Img/ok-icon.png" />
                    <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="false" CommandName="Cancel" ToolTip="Cancelar Maestro" Text ="Cancelar" ImageUrl="~/Img/cancel-icon.png" />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="NoEmpleado">
                <ItemTemplate>
                    <asp:Label ID="lblNoEmpleado" runat="server" Text='<%#Eval("noEmpleado") %>'></asp:Label>
                    <asp:HiddenField ID="hfId" runat="server" Value='<%#Eval("Id") %>'/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEITNoEmpleado" runat="server" Text='<%#Bind("noEmpleado") %>'></asp:TextBox>
                    <asp:HiddenField ID="hfEITId" runat="server" Value='<%#Eval("Id") %>'/>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Titulo">
                <ItemTemplate>
                    <asp:Label ID="lblTitulo" runat="server" Text='<%#Eval("Titulo") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                <asp:HiddenField ID="hfEITTitulo" runat="server" Value='<%#Eval("Titulo") %>'/>
                     <asp:DropDownList ID="ddlEITTitulo" runat="server" Height="30px" Width="155px" Style="margin-left: 0px">
                        <asp:ListItem>M.I.</asp:ListItem>
                        <asp:ListItem>M.C.</asp:ListItem>
                        <asp:ListItem>Dr.</asp:ListItem>
                        <asp:ListItem>Ocean.</asp:ListItem>
                        <asp:ListItem>Lic.</asp:ListItem>
                        <asp:ListItem>L.C.C</asp:ListItem>
                        <asp:ListItem>Ing.</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre">
                <ItemTemplate>
                    <asp:Label ID="lblNombre" runat="server" Text='<%#Eval("Nombre") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEITNombre" runat="server" Text='<%#Bind("Nombre") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ApellidoP">
                <ItemTemplate>
                    <asp:Label ID="lblApellidoP" runat="server" Text='<%#Eval("ApellidoP") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEITApellidoP" runat="server" Text='<%#Bind("ApellidoP") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ApellidoM">
                <ItemTemplate>
                    <asp:Label ID="lblApellidoM" runat="server" Text='<%#Eval("ApellidoM")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEITApellidoM" runat="server" Text='<%#Bind("ApellidoM") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Carrera">
                <ItemTemplate>
                    <asp:Label ID="lblCarrera" runat="server" Text='<%#Eval("Carrera")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEITCarrera" runat="server" Text='<%#Bind("Carrera") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
            <ItemTemplate>
                <asp:ImageButton ID="ibDelete" runat="server" CausesValidation="false" CommandName="Delete"
                    OnClientClick='<%# string.Format("return confirm(\"Desea eliminar el maestro {0}?\");", Eval("noEmpleado")) %>'
                    ImageUrl="~/Img/delete-icon.png" ToolTip="Eliminar modelo" />
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:Button ID="btExportarLista" runat="server" BackColor="#00CC66" BorderStyle="None"
        ForeColor="#003300" Text="Exportar a Excel" OnClick="ibToExcel_Click1" />
    <br />
</asp:Content>
