<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CompararExtrasCarrera.ascx.cs"
    Inherits="Extras" %>
<asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
    <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
    <b>
        <asp:Label runat="server" ID="lblTitulo"></asp:Label></b>
    <asp:Label runat="server" ID="lblMensaje"></asp:Label>
    <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
</asp:Panel>
<asp:Table runat="server" ID="tblPlantel" Width="100%" CellPadding="0" CellSpacing="1">
    <asp:TableRow>
        <asp:TableCell CssClass="tlwhitecp">
                <h3>
                    Atributos</h3>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 1--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con laboratorio de idiomas y con cuantos cuenta la Institución Educativa
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabidiomas1" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabidiomas2" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabidiomas3" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabidiomas4" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabidiomas5" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 2--%>
    <asp:TableRow CssClass="tnp">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con laboratorio de cómputo y con cuantos cuenta la Institución Educativa
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabComputo1" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabComputo2" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabComputo3" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabComputo4" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabComputo5" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 3--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Forma en que evalúan el desempeño de los docentes
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEvaluadoct1" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEvaluadoct2" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEvaluadoct3" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEvaluadoct4" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEvaluadoct5" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 4--%>
    <asp:TableRow CssClass="tnp">
        <asp:TableCell CssClass="tnp" Width="185px">
                Tipo de estudios que ofrece
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTipoestudios1" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTipoestudios2" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTipoestudios3" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTipoestudios4" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTipoestudios5" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 5--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Número de RVOE
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoRVOE1" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoRVOE2" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoRVOE3" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoRVOE4" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoRVOE5" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 6--%>
    <asp:TableRow CssClass="tnp">
        <asp:TableCell CssClass="tnp" Width="185px">
               Duración
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblDuracion1" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblDuracion2" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblDuracion3" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblDuracion4" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblDuracion5" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 7--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Organismo que la acredita
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblQueacredit1" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblQueacredit2" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblQueacredit3" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblQueacredit4" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblQueacredit5" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 8--%>
    <asp:TableRow CssClass="tnp">
        <asp:TableCell CssClass="tnp" Width="185px">
                Opciones de titulación
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblOpctitcion1" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblOpctitcion2" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblOpctitcion3" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblOpctitcion4" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblOpctitcion5" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 9--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Número de cursos de ingles como materia en la carrera
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosingles1" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosingles2" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosingles3" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosingles4" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosingles5" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 10--%>
    <asp:TableRow CssClass="tnp">
        <asp:TableCell CssClass="tnp" Width="185px">
                Número de cursos de computacion como materia en la carrera
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursoscompu1" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursoscompu2" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursoscompu3" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursoscompu4" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursoscompu5" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 11--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Lineas y proyectos de investigacion
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProydinv1" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProydinv2" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProydinv3" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProydinv4" Text=""></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProydinv5" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
