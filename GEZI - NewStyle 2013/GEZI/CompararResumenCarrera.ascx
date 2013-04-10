<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CompararResumenCarrera.ascx.cs"
    Inherits="Resumen" %>
<asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
    <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
    <b>
        <asp:Label runat="server" ID="lblTitulo"></asp:Label></b>
    <asp:Label runat="server" ID="lblMensaje"></asp:Label>
    <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
</asp:Panel>
<asp:Table runat="server" ID="tblResumenSuperior" Width="100%" CellPadding="0" CellSpacing="1"
    CssClass="font">
    <asp:TableRow runat="server">
        <asp:TableCell CssClass="tlwhitecp">
                <h3>
                    Atributos</h3>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 1--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trNoRVOE">
        <asp:TableCell CssClass="tnp" Width="185px">
                Número  de RVOE.
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoRVOE1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoRVOE2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoRVOE3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoRVOE4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblNoRVOE5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 2--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trTipoRVOE">
        <asp:TableCell CssClass="tnp" Width="185px">
                Tipo de RVOE
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTipoRVOE1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTipoRVOE2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTipoRVOE3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTipoRVOE4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblTipoRVOE5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 3--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trDuracion">
        <asp:TableCell CssClass="tnp" Width="185px">
                Duración
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblDuracion1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblDuracion2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblDuracion3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblDuracion4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblDuracion5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 4--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trPostgrados">
        <asp:TableCell CssClass="tnp" Width="185px">
                Postgrado de excelencia
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblPostgrados1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblPostgrados2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblPostgrados3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblPostgrados4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblPostgrados5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 5--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trQueacredit">
        <asp:TableCell CssClass="tnp" Width="185px">
                Organismo que acredita la carrera
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblQueacredit1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblQueacredit2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblQueacredit3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblQueacredit4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblQueacredit5" Text="-"></asp:Label>
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
                Costo de inscripción
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
    <%--Atributo 8--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trCostocolra">
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
    <%--Atributo 9--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trOpctitcion">
        <asp:TableCell CssClass="tnp" Width="185px" runat="server" ID="tcOpctitcion">
                Opciones de titulación
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblOpctitcion1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblOpctitcion2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblOpctitcion3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblOpctitcion4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblOpctitcion5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 10--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trProydinv">
        <asp:TableCell CssClass="tnp" Width="185px">
                Líneas y proyectos de investigación
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProydinv1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProydinv2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProydinv3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProydinv4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblProydinv5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 11--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trLabs">
        <asp:TableCell CssClass="tnp" Width="185px">
                ¿Cuenta con laboratorios?
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabs1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabs2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabs3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabs4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblLabs5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 12--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trEgresados">
        <asp:TableCell CssClass="tnp" Width="185px" runat="server" ID="tcEgresados">
                Porcentaje de egresados titulados
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlBorde1" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblEgresados1" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlBorde2" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblEgresados2" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlBorde3" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblEgresados3" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlBorde4" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblEgresados4" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlBorde5" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblEgresados5" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<asp:Table runat="server" ID="tblPlantel" Width="100%" CellPadding="0" CellSpacing="1"
    CssClass="font">
    <asp:TableRow>
        <asp:TableCell CssClass="tlwhitecp">
                <h3>
                    Mas Detalles</h3>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 1--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trExadiag">
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
    <asp:TableRow CssClass="tnp" runat="server" ID="trPrepingr">
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
    <asp:TableRow CssClass="tnp" runat="server" ID="trLabidiomas">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con laboratorio de idiomas y con cuantos cuenta la Institución Educativa
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
    <%--Atributo 4--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trLabComputo">
        <asp:TableCell CssClass="tnp" Width="185px">
                Cuenta con laboratorio de computo y con cuantos cuenta la Institución Educativa
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
    <%--Atributo 5--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trlBibcompeint">
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
    <%--Atributo 6--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trlBiblvirtual">
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
    <%--Atributo 7--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trTutorias">
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
    <%--Atributo 8--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trCursosremed">
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
    <%--Atributo 9--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trServpsco">
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
    <%--Atributo 10--%>
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
    <%--Atributo 11--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trConscalif">
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
    </asp:TableRow>
    <%--Atributo 12--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trSistadminclases">
        <asp:TableCell CssClass="tnp" Width="185px">
               Cuenta con su propio sistema de administración de clases por internet para que lo utilicen sus profesores 
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
    <%--Atributo 13--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trFormaEval">
        <asp:TableCell CssClass="tnp" Width="185px">
                Forma en que se evalúa el aprendizaje
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEval1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEval2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEval3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEval4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEval5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 14--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trCalfmin">
        <asp:TableCell CssClass="tnp" Width="185px">
                Calificación mínima aprobatoria
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCalfmin1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCalfmin2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCalfmin3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCalfmin4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCalfmin5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 15--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trAcrditaasig">
        <asp:TableCell CssClass="tnp" Width="185px">
               Oportunidades para acreditar una asignatura
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAcrditaasig1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAcrditaasig2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAcrditaasig3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAcrditaasig4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAcrditaasig5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 16--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trRazonbaja">
        <asp:TableCell CssClass="tnp" Width="185px">
                Razones para la baja académica
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblRazonbaja1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblRazonbaja2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblRazonbaja3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblRazonbaja4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblRazonbaja5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 17--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trCursosingles">
        <asp:TableCell CssClass="tnp" Width="185px">
                Número de cursos de inglés como materia en la carrera
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosingles1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosingles2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosingles3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosingles4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursosingles5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 18--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trCursoscompu">
        <asp:TableCell CssClass="tnp" Width="185px">
                Número de cursos de computacion como materia en la carrera
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursoscompu1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursoscompu2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursoscompu3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursoscompu4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCursoscompu5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 19--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trInglesreq">
        <asp:TableCell CssClass="tnp" Width="185px">
                ¿El idioma inglés es un requisito de titulación?
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
    </asp:TableRow>
    <%--Atributo 20--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trActivextracurles">
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
    <%--Atributo 21--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trAireacond">
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
    <%--Atributo 22--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trSalonesmultim">
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
    <%--Atributo 23--%>
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
    <%--Atributo 24--%>
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
    <%--Atributo 25--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trEficterm">
        <asp:TableCell CssClass="tnp" Width="185px">
                Índice de eficiencia terminal
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEficterm1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEficterm2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEficterm3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEficterm4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblEficterm5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 26--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trDoctsmatria">
        <asp:TableCell CssClass="tnp" Width="185px">
                Porcentaje de docentes con maestría
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctsmatria1" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctsmatria1" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctsmatria2" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctsmatria2" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctsmatria3" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctsmatria3" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctsmatria4" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctsmatria4" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctsmatria5" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctsmatria5" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 27--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trDoctsdocdo">
        <asp:TableCell CssClass="tnp" Width="185px">
                Porcentaje de docentes con doctorado
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctsdocdo1" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctsdocdo1" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctsdocdo2" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctsdocdo2" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctsdocdo3" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctsdocdo3" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctsdocdo4" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctsdocdo4" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctsdocdo5" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctsdocdo5" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 28--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trEvaluadoct">
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
    </asp:TableRow>
    <%--Atributo 29--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trFormaEvaluadoct">
        <asp:TableCell CssClass="tnp" Width="185px">
                Forma en que evalúan el desempeño de los docentes
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEvaluadoct1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEvaluadoct2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEvaluadoct3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEvaluadoct4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblFormaEvaluadoct5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 30--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trServevaegre">
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
    </asp:TableRow>
    <%--Atributo 31--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trRevcurriculo">
        <asp:TableCell CssClass="tnp" Width="185px">
               Cada cuando se revisa el currículo
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblRevcurriculo1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblRevcurriculo2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblRevcurriculo3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblRevcurriculo4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblRevcurriculo5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 32--%>
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
    <%--Atributo 33--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trFormpedagca">
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
    <%--Atributo 34--%>
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
    <%--Atributo 35--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trCatdocts">
        <asp:TableCell CssClass="tnp" Width="185px">
               Categorías de los docentes
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCatdocts1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCatdocts2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCatdocts3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCatdocts4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblCatdocts5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 36--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trInvesSNI">
        <asp:TableCell CssClass="tnp" Width="185px">
               Porcentaje de investigadores que pertenecen al Sistema Nacional de Investigadores
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlInvesSNI1" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblInvesSNI1" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlInvesSNI2" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblInvesSNI2" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlInvesSNI3" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblInvesSNI3" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlInvesSNI4" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblInvesSNI4" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlInvesSNI5" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblInvesSNI5" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 37--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trDoctslibrs">
        <asp:TableCell CssClass="tnp" Width="185px">
               Porcentaje de docentes que han publicado libros
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctslibrs1" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctslibrs1" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctslibrs2" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctslibrs2" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctslibrs3" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctslibrs3" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctslibrs4" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctslibrs4" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px">
            <div style="border: 1px solid #006666; padding: 2px; width: 90%;">
                <asp:Panel runat="server" ID="pnlDoctslibrs5" Width="0%" BackColor="#009999">
                    <asp:Label ID="lblDoctslibrs5" runat="server" Text="-" ForeColor="#333333"></asp:Label>
                </asp:Panel>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <%--Atributo 38--%>
    <asp:TableRow CssClass="tnp" runat="server" ID="trAsocsinst">
        <asp:TableCell CssClass="tnp" Width="185px">
               Asociaciones a las que pertenece la institucion
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAsocsinst1" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAsocsinst2" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAsocsinst3" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAsocsinst4" Text="-"></asp:Label>
        </asp:TableCell>
        <asp:TableCell CssClass="tlwhitecp" Width="149px" HorizontalAlign="Center">
            <asp:Label runat="server" ID="lblAsocsinst5" Text="-"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
