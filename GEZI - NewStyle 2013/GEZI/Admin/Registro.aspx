<%@ Page Title="Registro" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="Registro.aspx.cs" Inherits="Admin_Registro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/StyleGEZI.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.dropotron-1.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= pnlMensaje.ClientID %>').delay(8000).slideUp(300);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SliderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
        <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
        <b>
            <asp:Label runat="server" ID="lblTitulo"></asp:Label></b>
        <asp:Label runat="server" ID="lblMensaje"></asp:Label>
        <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
    </asp:Panel>
    <h2>
        Usuarios</h2>
    <div style="float: left; width: 55%; padding-right: 15px;">
        <asp:HiddenField runat="server" ID="hfRenglosSelec" />
        <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="false" EmptyDataText="No ahí registros para esta consulta." CssClass="font"
            Width="100%" OnRowCommand="GvUsuarios_RowCommand" >
            <Columns>
                <asp:TemplateField Visible="false">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblID" Text='<%# DataBinder.Eval(Container, "DataItem.Usuario_Id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image runat="server" ID="imgUser" ImageUrl="~/Images/icons/user-icon.png" ToolTip='<%# string.Format("{0} {1}", DataBinder.Eval(Container, "DataItem.Nombre"),DataBinder.Eval(Container, "DataItem.Apellido"))%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField SortExpression="NombreUsuario" DataField="NombreUsuario" HeaderText="Usuario" />--%>
                <asp:TemplateField HeaderText="Usuario" SortExpression="NombreUsuario">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblUsuario" Text='<%# DataBinder.Eval(Container, "DataItem.NombreUsuario") %>'
                            ToolTip='<%# string.Format("{0} {1}", DataBinder.Eval(Container, "DataItem.Nombre"),DataBinder.Eval(Container, "DataItem.Apellido"))%>'>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Correo" SortExpression="Correo">
                    <ItemTemplate>
                        <label>
                            <%# DataBinder.Eval(Container, "DataItem.Correo").ToString() %></label>
                    </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acciones" SortExpression="Acciones">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="ibEditar" ImageUrl="~/Images/icons/editrow16.png"
                            ToolTip="Editar registro." CausesValidation="false" CommandName="ACTUALIZA" Width="16px"
                            Height="16px"></asp:ImageButton>
                        <asp:Image runat="server" ID="iSeparator" ImageUrl="~/Images/icons/separator.png">
                        </asp:Image>
                        <asp:ImageButton runat="server" ID="ibEliminar" ImageUrl="~/Images/icons/basura16.png"
                            ToolTip="Eliminar usuario." CausesValidation="false" OnClientClick='<%# string.Format("return confirm(\"¿Está seguro de querer eliminar al usuario {0}? \");", DataBinder.Eval(Container, "DataItem.NombreUsuario")) %>'
                            CommandName="ELIMINA" Width="16px" Height="16px"></asp:ImageButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="font" style="float: left; width: 40%;">
        <fieldset>
            <div>
                <asp:ImageButton runat="server" ID="ibAgregar" ImageUrl="~/Images/messages/NuevoUsuario.png"
                    OnClick="imgAgregar_Click" />
                &nbsp;
                <asp:ImageButton runat="server" ID="ibBasura" ImageUrl="~/Images/messages/EliminarUsuario.png"
                    OnClick="imgBasura_Click" />
                <asp:HiddenField runat="server" ID="hfUsuarioID" />
            </div>
            <br />
            <div>
                <small style="color: #CC0000;">* Campos Obligatorios</small>
                <asp:ValidationSummary ID="vsNuevaUsuario" runat="server" ShowSummary="true" ValidationGroup="ChecaUsuario"
                    DisplayMode="BulletList" ForeColor="Red" />
            </div>
            <br />
            <asp:Panel runat="server" ID="pnlUsuario">
                <ul>
                    <li>
                        <label for="txtUsuario">
                            <small style="color: #CC0000;">*</small>Nombre de usuario:</label>
                        <asp:TextBox runat="server" ID="txtUsuario" Text="" AutoCompleteType="None" MaxLength="15"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ErrorMessage="Es necesario que ingrese el nombre de usuario"
                            ControlToValidate="txtUsuario" Display="Dynamic" ValidationGroup="ChecaUsuario"
                            SetFocusOnError="True">
                            <asp:Image ID="imgUsuario" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <label for="txtContrasenia">
                            <small style="color: #CC0000;">*</small>Contraseña:</label>
                        <asp:TextBox runat="server" ID="txtContrasenia" Text="" TextMode="Password" MaxLength="20"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvContrasenia" runat="server" ErrorMessage="Es necesario que ingrese la contraseña."
                            ControlToValidate="txtContrasenia" Display="Dynamic" ValidationGroup="ChecaUsuario"
                            SetFocusOnError="True">
                            <asp:Image ID="imgContrasenia" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        <asp:HiddenField runat="server" ID="hfContrasenia" />
                        <asp:HiddenField runat="server" ID="hfSalt" />
                    </li>
                    <li>
                        <label for="txtConfirmContrasenia">
                            <small style="color: #CC0000;">*</small>Confirmar contraseña:</label>
                        <asp:TextBox runat="server" ID="txtConfirmContrasenia" Text="" TextMode="Password"
                            MaxLength="20"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvConfirmContrasenia" runat="server" ErrorMessage="Es necesario que confirme la contraseña."
                            ControlToValidate="txtConfirmContrasenia" Display="Dynamic" ValidationGroup="ChecaUsuario"
                            SetFocusOnError="True">
                            <asp:Image ID="imgConfirmContrasenia" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvComparaContrasenia" runat="server" ControlToCompare="txtContrasenia"
                            ControlToValidate="txtConfirmContrasenia" Display="Dynamic" ErrorMessage="Las contraseñas no son idénticas."
                            ValidationGroup="ChecaUsuario">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:CompareValidator>
                    </li>
                    <li>
                        <label for="txtNombre">
                            <small style="color: #CC0000;">*</small>Nombre:</label>
                        <asp:TextBox runat="server" ID="txtNombre" Text="" MaxLength="75"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Es necesario que ingrese el Nombre"
                            ControlToValidate="txtNombre" Display="Dynamic" ValidationGroup="ChecaUsuario"
                            SetFocusOnError="True">
                            <asp:Image ID="imgNombre" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <label for="txtApellido">
                            <small style="color: #CC0000;">*</small>Apellido</label>
                        <asp:TextBox runat="server" ID="txtApellido" Text="" MaxLength="100"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvApellido" runat="server" ErrorMessage="Es necesario que ingrese el Apellido."
                            ControlToValidate="txtApellido" Display="Dynamic" ValidationGroup="ChecaUsuario"
                            SetFocusOnError="True">
                            <asp:Image ID="imgApellido" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <label for="txtCorreo">
                            <small style="color: #CC0000;">*</small>Correo</label>
                        <asp:TextBox runat="server" ID="txtCorreo" Text="" MaxLength="100"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ErrorMessage="Es necesario que ingrese un Correo valido."
                            ControlToValidate="txtCorreo" Display="Dynamic" ValidationGroup="ChecaUsuario"
                            SetFocusOnError="True">
                            <asp:Image ID="imgCorreo" runat="server" ImageUrl="~/Images/icons/exclamation16.png" /></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revCorreo" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtCorreo" ValidationGroup="ChecaUsuario" SetFocusOnError="True"
                            ForeColor="Red">
                            El correo no es valido.</asp:RegularExpressionValidator>
                    </li>
                    <li>
                        <center>
                            <asp:Button runat="server" ID="btnGuardar" Text="Guardar" OnClick="btnGuardar_Click"
                                ValidationGroup="ChecaUsuario" />
                            <asp:LinkButton runat="server" ID="btnCancelar" Text="Cancelar" OnClick="btnCancelar_Click" />
                        </center>
                    </li>
                </ul>
            </asp:Panel>
        </fieldset>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BottomContent" runat="Server">
</asp:Content>
