<%@ Page Title="Llenado de encuesta" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="LlenadoEncuesta.aspx.cs" Inherits="Admin_LlenadoEncuesta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/StyleGEZI.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.dropotron-1.0.js" type="text/javascript"></script>
    <%--<script src="../Scripts/jquery.slidertron-1.1.js" type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <h1>
        <asp:Label runat="server" ID="lblEncuesta"></asp:Label></h1>
    <asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
        <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
        <b>
            <asp:Label runat="server" ID="lblTitulo"></asp:Label></b>
        <asp:Label runat="server" ID="lblMensaje"></asp:Label>
        <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
    </asp:Panel>
    <table width="95%" style="margin: 15px;">
        <asp:Repeater ID="rptLlenaEncuesta" runat="server" OnItemCommand="RptLlenaEncuesta_ItemCommand">
            <HeaderTemplate>
                <tr>
                    <td colspan="10">
                        <asp:Button runat="server" ID="btnGuardarEncuesta" Text="Guardar Encuesta" ValidationGroup="LlenaEncuesta" />
                        &nbsp;<asp:Button runat="server" ID="btnCancelar" Text="Cancelar" PostBackUrl="~/Admin/Inicio_Admin.aspx" />
                        <br />
                        <small style="color: #CC0000;">Todos los campos son obligatorios</small>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr style="background-color: <%# GetRowColor() %>; padding-left: 15px; padding-right: 15px;">
                    <td colspan="10">
                        <asp:HiddenField runat="server" ID="hfEncuesta_id" Value='<%# DataBinder.Eval(Container, "DataItem.Encuesta_id")%>' />
                        <asp:Label runat="server" ID="lblPregunta" Text='<%# String.Format("{0}. {1}", DataBinder.Eval(Container, "DataItem.PreguntaNo"), DataBinder.Eval(Container, "DataItem.Pregunta"))%>'
                            Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                <tr style="background-color: <%# GetRowColor() %>; padding-left: 15px; padding-right: 15px;">
                    <td>
                        <asp:Label runat="server" ID="lblRespuesta1" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta1")%>'></asp:Label>
                    </td>
                    <td>
                        <asp:HiddenField runat="server" ID="hfRespuesta1" Value='<%# int.Equals(-1,DataBinder.Eval(Container, "DataItem.TRespuesta1")) ? "" : DataBinder.Eval(Container, "DataItem.TRespuesta1")%>' />
                        <asp:TextBox runat="server" ID="txtRespuesta1" Text='<%# int.Equals(-1,DataBinder.Eval(Container, "DataItem.TRespuesta1")) ? "" : DataBinder.Eval(Container, "DataItem.TRespuesta1")%>'
                            Columns="4" MaxLength="4"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="fteRespuesta1" runat="server" FilterType="Numbers"
                            TargetControlID="txtRespuesta1" />
                        <asp:RequiredFieldValidator ID="rfvtRespuesta1" runat="server" ControlToValidate="txtRespuesta1"
                            Display="Dynamic" ValidationGroup="LlenaEncuesta" SetFocusOnError="True" ForeColor="Red">
                            <asp:Image ID="iRespuesta1" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblRespuesta2" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta2")%>'></asp:Label>
                    </td>
                    <td>
                        <asp:HiddenField runat="server" ID="hfRespuesta2" Value='<%# int.Equals(-1,DataBinder.Eval(Container, "DataItem.TRespuesta2")) ? "" : DataBinder.Eval(Container, "DataItem.TRespuesta2")%>' />
                        <asp:TextBox runat="server" ID="txtRespuesta2" Text='<%# int.Equals(-1,DataBinder.Eval(Container, "DataItem.TRespuesta2")) ? "" : DataBinder.Eval(Container, "DataItem.TRespuesta2")%>'
                            Columns="4" MaxLength="4"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="fteRespuesta2" runat="server" FilterType="Numbers"
                            TargetControlID="txtRespuesta2" />
                        <asp:RequiredFieldValidator ID="rfvtRespuesta2" runat="server" ControlToValidate="txtRespuesta2"
                            Display="Dynamic" ValidationGroup="LlenaEncuesta" SetFocusOnError="True" ForeColor="Red">
                            <asp:Image ID="iRespuesta2" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblRespuesta3" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta3")%>'></asp:Label>
                    </td>
                    <td>
                        <asp:HiddenField runat="server" ID="hfRespuesta3" Value='<%# int.Equals(-1,DataBinder.Eval(Container, "DataItem.TRespuesta3")) ? "" : DataBinder.Eval(Container, "DataItem.TRespuesta3")%>' />
                        <asp:TextBox runat="server" ID="txtRespuesta3" Text='<%# int.Equals(-1,DataBinder.Eval(Container, "DataItem.TRespuesta3")) ? "" : DataBinder.Eval(Container, "DataItem.TRespuesta3")%>'
                            Columns="4" MaxLength="4" Visible='<%# String.IsNullOrEmpty(DataBinder.Eval(Container, "DataItem.Respuesta3").ToString()) ? false : true%>'></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="fteRespuesta3" runat="server" FilterType="Numbers"
                            TargetControlID="txtRespuesta3" />
                        <asp:RequiredFieldValidator ID="rfvRespuesta3" runat="server" ControlToValidate="txtRespuesta3"
                            Display="Dynamic" ValidationGroup="LlenaEncuesta" SetFocusOnError="True" ForeColor="Red"
                            Visible='<%# String.IsNullOrEmpty(DataBinder.Eval(Container, "DataItem.Respuesta3").ToString()) ? false : true%>'>
                            <asp:Image ID="iRespuesta3" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblRespuesta4" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta4")%>'></asp:Label>
                    </td>
                    <td>
                        <asp:HiddenField runat="server" ID="hfRespuesta4" Value='<%# int.Equals(-1,DataBinder.Eval(Container, "DataItem.TRespuesta4")) ? "" : DataBinder.Eval(Container, "DataItem.TRespuesta4")%>' />
                        <asp:TextBox runat="server" ID="txtRespuesta4" Text='<%# int.Equals(-1,DataBinder.Eval(Container, "DataItem.TRespuesta4")) ? "" : DataBinder.Eval(Container, "DataItem.TRespuesta4")%>'
                            Columns="4" MaxLength="4" Visible='<%# String.IsNullOrEmpty(DataBinder.Eval(Container, "DataItem.Respuesta4").ToString()) ? false : true%>'></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="fteRespuesta4" runat="server" FilterType="Numbers"
                            TargetControlID="txtRespuesta4" />
                        <asp:RequiredFieldValidator ID="rfvRespuesta4" runat="server" ControlToValidate="txtRespuesta4"
                            Display="Dynamic" ValidationGroup="LlenaEncuesta" SetFocusOnError="True" ForeColor="Red"
                            Visible='<%# String.IsNullOrEmpty(DataBinder.Eval(Container, "DataItem.Respuesta4").ToString()) ? false : true%>'>
                            <asp:Image ID="iRespuesta4" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblRespuesta5" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta5")%>'></asp:Label>
                    </td>
                    <td>
                        <asp:HiddenField runat="server" ID="hfRespuesta5" Value='<%# int.Equals(-1,DataBinder.Eval(Container, "DataItem.TRespuesta5")) ? "" : DataBinder.Eval(Container, "DataItem.TRespuesta5")%>' />
                        <asp:TextBox runat="server" ID="txtRespuesta5" Text='<%# int.Equals(-1,DataBinder.Eval(Container, "DataItem.TRespuesta5")) ? "" : DataBinder.Eval(Container, "DataItem.TRespuesta5")%>'
                            Columns="4" MaxLength="4" Visible='<%# String.IsNullOrEmpty(DataBinder.Eval(Container, "DataItem.Respuesta5").ToString()) ? false : true%>'></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="fteRespuesta5" runat="server" FilterType="Numbers"
                            TargetControlID="txtRespuesta5" />
                        <asp:RequiredFieldValidator ID="rfvRespuesta5" runat="server" ControlToValidate="txtRespuesta5"
                            Display="Dynamic" ValidationGroup="LlenaEncuesta" SetFocusOnError="True" ForeColor="Red"
                            Visible='<%# String.IsNullOrEmpty(DataBinder.Eval(Container, "DataItem.Respuesta5").ToString()) ? false : true%>'>
                            <asp:Image ID="iRespuesta5" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</asp:Content>