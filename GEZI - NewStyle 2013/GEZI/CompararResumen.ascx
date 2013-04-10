<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CompararResumen.ascx.cs"
    Inherits="Resumen" %>
<asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
    <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
    <b>
        <asp:Label runat="server" ID="lblTitulo"></asp:Label></b>
    <asp:Label runat="server" ID="lblMensaje"></asp:Label>
    <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
</asp:Panel>
<asp:Table runat="server" ID="tblResumenSuperior" Width="100%" CellPadding="0" CellSpacing="1" CssClass="font">
    <asp:TableRow>
        <asp:TableCell CssClass="tlwhitecp">
                <h3>
                    Atributos</h3>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 1--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trNoRVOE">
        <asp:TableCell CssClass="tnp" Width="185px">
                Laboratorios de idiomas con los que cuenta.
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabidiomas1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabidiomas2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabidiomas3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabidiomas4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabidiomas5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 2--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trTipoRVOE">
        <asp:TableCell CssClass="tnp" Width="185px">
                Laboratorios de computo con los que cuenta.
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabComputo1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabComputo2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabComputo3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabComputo4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabComputo5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 3--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trDuracion">
        <asp:TableCell CssClass="tnp" Width="185px">
                Costo de inscripcion
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCostoinsc1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCostoinsc2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCostoinsc3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCostoinsc4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCostoinsc5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 4--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trPostgrados">
        <asp:TableCell CssClass="tnp" Width="185px">
                Costo de colegiatura
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCostocolra1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCostocolra2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCostocolra3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCostocolra4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCostocolra5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 5--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trBiblvirtual">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con biblioteca virtual
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblvirtual1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblvirtual2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblvirtual3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblvirtual4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblvirtual5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 6--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trNoAlumnos">
        <asp:TableCell CssClass="tnp" Width="185px">
                Número de alumnos con los que cuenta la carrera.
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoAlumnos1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoAlumnos2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoAlumnos3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoAlumnos4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoAlumnos5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 7--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trCostoinsc">
        <asp:TableCell CssClass="tnp" Width="185px">
                 Cuenta con salones multimedia
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSalonesmultim1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSalonesmultim2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSalonesmultim3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSalonesmultim4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSalonesmultim5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 8--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trCostocolra">
        <asp:TableCell CssClass="tnp" Width="185px">
                Se valua sistematicamente al docente
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEvaluadoct1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEvaluadoct2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEvaluadoct3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEvaluadoct4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEvaluadoct5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 9--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trOpctitcion">
        <asp:TableCell CssClass="tnp" Width="185px" runat="server" ID="tcOpctitcion">
                Cuenta con un sistema de consulta de calificaciones por internet
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblConscalif1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblConscalif2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblConscalif3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblConscalif4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblConscalif5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<asp:Table runat="server" ID="tblPlantel" Width="100%" CellPadding="0" CellSpacing="1" CssClass="font">
    <asp:TableRow>
        <asp:TableCell CssClass="tlwhitecp">
                <h3>
                    Mas Detalles</h3>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 1--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con examen de selección/diagnostico para el ingreso
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblExadiag1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblExadiag2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblExadiag3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblExadiag4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblExadiag5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 2--%>
    <asp:TableRow CssClass="tnp">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con curso de preparación para el ingreso
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblPrepingr1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblPrepingr2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblPrepingr3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblPrepingr4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblPrepingr5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 3--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con servicio psicopedagógico
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServpsco1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServpsco2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServpsco3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServpsco4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServpsco5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 4--%>
    <asp:TableRow CssClass="tnp">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con actividades extracurriculares
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblActivextracurles1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblActivextracurles2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblActivextracurles3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblActivextracurles4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblActivextracurles5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 5--%>
    <%--<asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con servicio de evaluación y seguimiento de egresados
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServevaegre1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServevaegre2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServevaegre3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServevaegre4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServevaegre5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>--%>
    <%--Atributo 6--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trProgInterncion">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con programa de internacionalización
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProgInterncion1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProgInterncion2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProgInterncion3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProgInterncion4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProgInterncion5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 7--%>
    <%--<asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con sistema de consulta de calificaciones por internet
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblConscalif1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblConscalif2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblConscalif3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblConscalif4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblConscalif5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>--%>
    <%--Atributo 8--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trSistadminclases">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con su propio sistema de administración de clases por internet para que lo
                utilicen sus profesores y alumnos
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSistadminclases1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSistadminclases2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSistadminclases3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSistadminclases4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSistadminclases5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 9--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con programa de tutorías
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTutorias1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTutorias2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTutorias3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTutorias4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTutorias5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 10--%>
    <asp:TableRow CssClass="tnp">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con programa de cursos remediales
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosremed1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosremed2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosremed3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosremed4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosremed5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 11--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trIntercacadem">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con programa de intercambio académico
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblIntercacadem1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblIntercacadem2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblIntercacadem3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblIntercacadem4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblIntercacadem5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 12--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trServcomunidad">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con programa de servicio a la comunidad
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServcomunidad1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServcomunidad2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServcomunidad3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServcomunidad4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblServcomunidad5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 13--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Los salones cuentan con aire acondicionado
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAireacond1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAireacond2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAireacond3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAireacond4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAireacond5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 14--%>
    <%--<asp:TableRow CssClass="tnp">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con salones multimedia
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSalonesmultim1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSalonesmultim2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSalonesmultim3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSalonesmultim4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblSalonesmultim5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>--%>
    <%--Atributo 15--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con biblioteca la institución educativa
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblioteca1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblioteca2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblioteca3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblioteca4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblioteca5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 16--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trBibcompeint">
        <asp:TableCell CssClass="tnp" Width="185px">
                Su biblioteca cuenta con computadoras e internet
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBibcompeint1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBibcompeint2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBibcompeint3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBibcompeint4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBibcompeint5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 17--%>
    <%--<asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con biblioteca virtual
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblvirtual1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblvirtual2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblvirtual3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblvirtual4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblBiblvirtual5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>--%>
    <%--Atributo 18--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trEducacontinua">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con programa de educación continua
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEducacontinua1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEducacontinua2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEducacontinua3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEducacontinua4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEducacontinua5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 19--%>
    <asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con programa de formación pedagógica para sus docentes
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormpedagca1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormpedagca2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormpedagca3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormpedagca4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormpedagca5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 20--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trActdisc">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con programa de actualización disciplinaria para sus docentes
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblActdisc1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblActdisc2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblActdisc3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblActdisc4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblActdisc5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 21--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trResulpenlace">
        <asp:TableCell CssClass="tnp" Width="185px">
                Resultado en la prueba de enlace
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblResulpenlace1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblResulpenlace2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblResulpenlace3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblResulpenlace4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblResulpenlace5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 22--%>
    <%--<asp:TableRow CssClass="tnp">
        <asp:TableCell CssClass="tnp" Width="185px">
                Se valúa sistemáticamente al docente
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEvaluadoct1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEvaluadoct2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEvaluadoct3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEvaluadoct4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEvaluadoct5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>--%>
    <%--Atributo 23--%>
    <%--<asp:TableRow CssClass="tnp" BackColor="#F2F2F2">
        <asp:TableCell CssClass="tnp" Width="185px">
                ¿Esta acreditada la licenciatura?
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLicacredit1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLicacredit2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLicacredit3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLicacredit4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLicacredit5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>--%>
    <%--Atributo 24--%>
    <%--<asp:TableRow CssClass="tnp">
        <asp:TableCell CssClass="tnp" Width="185px">
                ¿El inglés es un requisito de titulación?
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblInglesreq1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblInglesreq2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblInglesreq3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblInglesreq4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblInglesreq5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>--%>
</asp:Table>
