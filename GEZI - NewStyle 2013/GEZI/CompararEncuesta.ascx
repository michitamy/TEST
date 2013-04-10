<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CompararEncuesta.ascx.cs"
    Inherits="Encuesta" %>
<link href="Styles/CompareStyle.css" rel="stylesheet" type="text/css" />
<asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
    <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
    <b>
        <asp:Label runat="server" ID="lblTitulo"></asp:Label></b>
    <asp:Label runat="server" ID="lblMensaje"></asp:Label>
    <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
</asp:Panel>
<asp:Label runat="server" ID="lblMensRegistros"></asp:Label>
<table class="font" style="width: 100%;" cellpadding="0" cellspacing="1">
    <asp:Repeater runat="server" ID="rptEncuesta">
        <ItemTemplate>
            <tr>
                <td colspan="6" class="tlwhitecp">
                    <asp:HiddenField runat="server" ID="hfEncuesta_id" Value='<%# DataBinder.Eval(Container, "DataItem.Encuesta_id")%>'>
                    </asp:HiddenField>
                    <h4>
                        <asp:Label runat="server" ID="lblPregunta" Text='<%# DataBinder.Eval(Container, "DataItem.Pregunta")%>'></asp:Label>
                    </h4>
                </td>
            </tr>
            <tr class="tnp" style="background-color: <%# GetRowColor() %>;">
                <%--Respuesta "n"--%>
                <td class="tnp" style="width: 185px">
                    <asp:Label runat="server" ID="lblRespuesta1" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta1")%>'></asp:Label>
                </td>
                <%--Total de respuestas "n" 1--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta11" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 2--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta12" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 3--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta13" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 4--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta14" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 5--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta15" Text=""></asp:Label></center>
                </td>
            </tr>
            <tr class="tnp" style="background-color: <%# GetRowColor() %>;">
                <%--Respuesta "n"--%>
                <td class="tnp" style="width: 185px">
                    <asp:Label runat="server" ID="lblRespuesta2" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta2")%>'></asp:Label>
                </td>
                <%--Total de respuestas "n" 1--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta21" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 2--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta22" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 3--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta23" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 4--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta24" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 5--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta25" Text=""></asp:Label></center>
                </td>
            </tr>
            <tr class="tnp" style="background-color: <%# GetRowColor() %>;">
                <%--Respuesta "n"--%>
                <td class="tnp" style="width: 185px">
                    <asp:Label runat="server" ID="lblRespuesta3" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta3")%>'></asp:Label>
                </td>
                <%--Total de respuestas "n" 1--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta31" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 2--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta32" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 3--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta33" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 4--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta34" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 5--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta35" Text=""></asp:Label></center>
                </td>
            </tr>
            <tr class="tnp" style="background-color: <%# GetRowColor() %>;">
                <%--Respuesta "n"--%>
                <td class="tnp" style="width: 185px">
                    <asp:Label runat="server" ID="lblRespuesta4" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta4")%>'></asp:Label>
                </td>
                <%--Total de respuestas "n" 1--%>
                <td class="tlwhitecp" style="width: 149px;">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta41" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 2--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta42" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 3--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta43" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 4--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta44" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 5--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta45" Text=""></asp:Label></center>
                </td>
            </tr>
            <tr class="tnp" style="background-color: <%# GetRowColor() %>;">
                <%--Respuesta "n"--%>
                <td class="tnp" style="width: 185px">
                    <asp:Label runat="server" ID="lblRespuesta5" Text='<%# DataBinder.Eval(Container, "DataItem.Respuesta5")%>'></asp:Label>
                </td>
                <%--Total de respuestas "n" 1--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta51" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 2--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta52" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 3--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta53" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 4--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta54" Text=""></asp:Label></center>
                </td>
                <%--Total de respuestas "n" 5--%>
                <td class="tlwhitecp" style="width: 149px">
                    <center>
                        <asp:Label runat="server" ID="lblTRespuesta55" Text=""></asp:Label></center>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>
