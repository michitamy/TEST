<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Universidad.ascx.cs" Inherits="Admin_Universidad" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<link href="../Styles/StyleGEZI.css" rel="stylesheet" type="text/css" />
<asp:ScriptManager ID="smCaracteristicas" runat="server">
</asp:ScriptManager>
<asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
    <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
    <b>
        <asp:Label runat="server" ID="lblTitulo"></asp:Label></b>
    <asp:Label runat="server" ID="lblMensaje"></asp:Label>
    <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
</asp:Panel>
<asp:HiddenField runat="server" ID="hfCaract" />
<h1>
    Atributos para el nivel Universidad</h1>
<small style="color: #CC0000;">* Campos Obligatorios</small>
<table>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvExadiag" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblExadiag" SetFocusOnError="True">
                <asp:Image ID="imgExadiag" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td style="width: 80%">
            <small style="color: #CC0000;">*</small>Cuenta con examen de selección/diagnostico
            para el ingreso
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblExadiag" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvPrepingr" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblPrepingr" SetFocusOnError="True">
                <asp:Image ID="imgPrepingr" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con curso de preparación para el
            ingreso
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblPrepingr" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvServpsco" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblServpsco" SetFocusOnError="True">
                <asp:Image ID="imgServpsco" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con servicio psicopedagógico
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblServpsco" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvActivextracurles" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblActivextracurles" SetFocusOnError="True">
                <asp:Image ID="imgActivextracurles" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con actividades extracurriculares
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblActivextracurles" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvServevaegre" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblServevaegre" SetFocusOnError="True">
                <asp:Image ID="imgServevaegre" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con servicio de evaluación y seguimiento
            de egresados
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblServevaegre" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvProgInterncion" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblProgInterncion" SetFocusOnError="True">
                <asp:Image ID="imgProgInterncion" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con programa de internacionalización
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblProgInterncion" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvConscalif" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblConscalif" SetFocusOnError="True">
                <asp:Image ID="imgConscalif" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con sistema de consulta de calificaciones
            por internet
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblConscalif" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvSistadminclases" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblSistadminclases" SetFocusOnError="True">
                <asp:Image ID="imgSistadminclases" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con su propio sistema de administración
            de clases por internet para que lo utilicen sus profesores y alumnos
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblSistadminclases" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvTutorias" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblTutorias" SetFocusOnError="True">
                <asp:Image ID="imgTutorias" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con programa de tutorías
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblTutorias" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvCursosremed" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblCursosremed" SetFocusOnError="True">
                <asp:Image ID="imgCursosremed" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con programa de cursos remediales
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblCursosremed" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvIntercacadem" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblIntercacadem" SetFocusOnError="True">
                <asp:Image ID="imgIntercacadem" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con programa de intercambio académico
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblIntercacadem" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvServcomunidad" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblServcomunidad" SetFocusOnError="True">
                <asp:Image ID="imgServcomunidad" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con programa de servicio a la comunidad
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblServcomunidad" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvAireacond" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblAireacond" SetFocusOnError="True">
                <asp:Image ID="imgAireacond" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Los salones cuentan con aire acondicionado
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblAireacond" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvSalonesmultim" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblSalonesmultim" SetFocusOnError="True">
                <asp:Image ID="imgSalonesmultim" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con salones multimedia
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblSalonesmultim" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvBiblioteca" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblBiblioteca" SetFocusOnError="True">
                <asp:Image ID="imgBiblioteca" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con biblioteca la institución educativa
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblBiblioteca" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvBibcompeint" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblBibcompeint" SetFocusOnError="True">
                <asp:Image ID="imgBibcompeint" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Su biblioteca cuenta con computadoras e
            internet
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblBibcompeint" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvBiblvirtual" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblBiblvirtual" SetFocusOnError="True">
                <asp:Image ID="imgBiblvirtual" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con biblioteca virtual
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblBiblvirtual" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Cuenta con programa de educación continua
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblEducacontinua" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvFormpedagca" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblFormpedagca" SetFocusOnError="True">
                <asp:Image ID="imgFormpedagca" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con programa de formación pedagógica
            para sus docentes
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblFormpedagca" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvActdisc" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblActdisc" SetFocusOnError="True">
                <asp:Image ID="imgActdisc" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con programa de actualización disciplinaria
            para sus docentes
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblActdisc" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvEvaluadoct" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="rblEvaluadoct" SetFocusOnError="True">
                <asp:Image ID="imgEvaluadoct" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Se valúa sistemáticamente al docente
        </td>
        <td>
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rblEvaluadoct" runat="server">
                <asp:ListItem Text="Si" Value="True"></asp:ListItem>
                <asp:ListItem Text="No" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvLabidiomas" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="txtLabidiomas" SetFocusOnError="True">
                <asp:Image ID="imgLabidiomas" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con laboratorio de idiomas y con
            cuantos cuenta la Institución Educativa
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtLabidiomas" Text="" Width="100px" MaxLength="3"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteLabidiomas" runat="server" FilterType="Numbers"
                TargetControlID="txtLabidiomas" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvLabComputo" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="txtLabComputo" SetFocusOnError="True">
                <asp:Image ID="imgLabComputo" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Cuenta con laboratorio de computo y con
            cuantos cuenta la Institución Educativa
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtLabComputo" Text="" Width="100px" MaxLength="3"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteLabComputo" runat="server" FilterType="Numbers"
                TargetControlID="txtLabComputo" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Calificación mínima aprobatoria
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtCalfmin" Text="" Width="100px" MaxLength="4"></asp:TextBox>
            <%-- <asp:FilteredTextBoxExtender ID="fteCalfmin" runat="server" FilterType="Custom, Numbers"
                ValidChars="." TargetControlID="txtCalfmin" />
            <asp:RegularExpressionValidator ID="revCalfmin" runat="server" ControlToValidate="txtCalfmin"
                ValidationGroup="validaCarrera" Font-Size="10pt" Display="Dynamic" ValidationExpression="^\d+(\.\d+)?$"
                SetFocusOnError="True" ForeColor="Red">
                        Formato Incorrecto.</asp:RegularExpressionValidator>--%>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Número de alumnos con los que cuenta el plantel
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtNoAlumnos" Text="" Width="100px" MaxLength="5"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteNoAlumnos" runat="server" FilterType="Numbers"
                TargetControlID="txtNoAlumnos" />
            <%--   <asp:RegularExpressionValidator ID="revCalfmin" runat="server" ControlToValidate="txtCalfmin"
                ValidationGroup="validaCarrera" Font-Size="10pt" Display="Dynamic" ValidationExpression="^\d+(\.\d+)?$"
                SetFocusOnError="True" ForeColor="Red">
                        Formato Incorrecto.</asp:RegularExpressionValidator>--%>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Oportunidades para acreditar una asignatura
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtAcrditaasig" Text="" Width="100px" MaxLength="3"
                Height="25px"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteAcrditaasig" runat="server" FilterType="Numbers"
                TargetControlID="txtAcrditaasig" />
        </td>
    </tr>
    <%--<tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvResulpenlace" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="txtResulpenlace">
                <asp:Image ID="imgResulpenlace" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            Resultado en la prueba de enlace
            <br />
            <asp:RegularExpressionValidator ID="revResulpenlace" runat="server" ControlToValidate="txtResulpenlace"
                ValidationGroup="validaCaractca" Font-Size="10pt" Display="Dynamic" ForeColor="Red"
                ValidationExpression="^\d+(\.\d+)?$">Formato incorrecto.</asp:RegularExpressionValidator>
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtResulpenlace" Text="" Width="100px" MaxLength="8"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteResulpenlace" runat="server" FilterType="Custom, Numbers"
                ValidChars="." TargetControlID="txtResulpenlace" />
        </td>
    </tr>--%>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Índice de eficiencia terminal
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtEficterm" Text="" Width="75px" MaxLength="5" CssClass="percent"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteEficterm" runat="server" FilterType="Custom, Numbers"
                ValidChars="." TargetControlID="txtEficterm" />
            <asp:RegularExpressionValidator ID="rfvEficterm" runat="server" ControlToValidate="txtEficterm"
                ValidationGroup="validaCarrera" Font-Size="10pt" Display="Dynamic" ValidationExpression="^\d+(\.\d+)?$"
                SetFocusOnError="True" ForeColor="Red">
                        Formato Incorrecto.</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Cada cuando se revisa el currículo
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtRevcurriculo" Text="" Width="100px" MaxLength="3"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteRevcurriculo" runat="server" FilterType="Numbers"
                TargetControlID="txtRevcurriculo" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Porcentaje de docentes con maestría<br />
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtDoctsmatria" Text="" Width="75px" MaxLength="5"
                CssClass="percent"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteDoctsmatria" runat="server" FilterType="Custom, Numbers"
                ValidChars="." TargetControlID="txtDoctsmatria" />
            <asp:RegularExpressionValidator ID="rfvDoctsmatria" runat="server" ControlToValidate="txtDoctsmatria"
                ValidationGroup="validaCarrera" Font-Size="10pt" Display="Dynamic" ValidationExpression="^\d+(\.\d+)?$"
                SetFocusOnError="True" ForeColor="Red">
                        Formato Incorrecto.</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Porcentaje de docentes con doctorado
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtDoctsdocdo" Text="" Width="75px" MaxLength="5"
                CssClass="percent"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteDoctsdocdo" runat="server" FilterType="Custom, Numbers"
                ValidChars="." TargetControlID="txtDoctsdocdo" />
            <asp:RegularExpressionValidator ID="revDoctsdocdo" runat="server" ControlToValidate="txtDoctsdocdo"
                ValidationGroup="validaCarrera" Font-Size="10pt" Display="Dynamic" ValidationExpression="^\d+(\.\d+)?$"
                SetFocusOnError="True" ForeColor="Red">
                        Formato Incorrecto.</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvInvesSNI" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="txtInvesSNI" SetFocusOnError="True">
                <asp:Image ID="imgInvesSNI" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Porcentaje de investigadores que pertenecen
            al Sistema Nacional de Investigadores
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtInvesSNI" Text="" Width="75px" MaxLength="5" CssClass="percent"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteInvesSNI" runat="server" FilterType="Custom, Numbers"
                ValidChars="." TargetControlID="txtInvesSNI" />
            <asp:RegularExpressionValidator ID="revInvesSNI" runat="server" ControlToValidate="txtInvesSNI"
                ValidationGroup="validaCarrera" Font-Size="10pt" Display="Dynamic" ValidationExpression="^\d+(\.\d+)?$"
                SetFocusOnError="True" ForeColor="Red">
                        Formato Incorrecto.</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvDoctslibrs" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="txtDoctslibrs" SetFocusOnError="True">
                <asp:Image ID="imgDoctslibrs" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Porcentaje de docentes que han publicado
            libros
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtDoctslibrs" Text="" Width="75px" MaxLength="5"
                CssClass="percent"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteDoctslibrs" runat="server" FilterType="Custom, Numbers"
                ValidChars="." TargetControlID="txtDoctslibrs" />
            <asp:RegularExpressionValidator ID="revDoctslibrs" runat="server" ControlToValidate="txtDoctslibrs"
                ValidationGroup="validaCarrera" Font-Size="10pt" Display="Dynamic" ValidationExpression="^\d+(\.\d+)?$"
                SetFocusOnError="True" ForeColor="Red">
                        Formato Incorrecto.</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvCostoinsc" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="txtCostoinsc" SetFocusOnError="True">
                <asp:Image ID="imgCostoinsc" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Costo de inscripción
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtCostoinsc" Text="" Width="75px" MaxLength="8"
                CssClass="money"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteCostoinsc" runat="server" FilterType="Custom, Numbers"
                ValidChars="." TargetControlID="txtCostoinsc" />
            <asp:RegularExpressionValidator ID="revCostoinsc" runat="server" ControlToValidate="txtCostoinsc"
                ValidationGroup="validaCaractca" Font-Size="10pt" Display="Dynamic" ForeColor="Red"
                ValidationExpression="^\d+(\.\d+)?$" SetFocusOnError="True">Formato incorrecto.</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:RequiredFieldValidator ID="rfvCostocolra" runat="server" ValidationGroup="validaCaractca"
                ControlToValidate="txtCostocolra" SetFocusOnError="True">
                <asp:Image ID="imgCostocolra" runat="server" ImageUrl="~/Images/icons/exclamation16.png" />
            </asp:RequiredFieldValidator>
        </td>
        <td>
            <small style="color: #CC0000;">*</small>Costo de colegiatura
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtCostocolra" Text="" Width="75px" MaxLength="8"
                CssClass="money"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteCostocolra" runat="server" FilterType="Custom, Numbers"
                ValidChars="." TargetControlID="txtCostocolra" />
            <asp:RegularExpressionValidator ID="revCostocolra" runat="server" ControlToValidate="txtCostocolra"
                ValidationGroup="validaCaractca" Font-Size="10pt" Display="Dynamic" ForeColor="Red"
                ValidationExpression="^\d+(\.\d+)?$" SetFocusOnError="True">Formato incorrecto.</asp:RegularExpressionValidator>
        </td>
    </tr>
    <%--<tr>
        <td>
              &nbsp;
        </td>
        <td>
            Porcentaje de egresados titulados
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtEgresados" Text="" Width="75px" MaxLength="5"
                CssClass="percent"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="fteEgresados" runat="server" FilterType="Numbers"
                TargetControlID="txtEgresados" />
            <asp:RegularExpressionValidator ID="revEgresados" runat="server" ControlToValidate="txtEgresados"
                ValidationGroup="validaCarrera" Font-Size="10pt" Display="Dynamic" ValidationExpression="^\d+(\.\d+)?$"
                SetFocusOnError="True" ForeColor="Red">
                        Formato Incorrecto.</asp:RegularExpressionValidator>
        </td>
    </tr>--%>
</table>
<table width="100%">
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Forma en que se evalúa el aprendizaje
        </td>
        <td>
            <asp:TextBox ID="txtFormaEval" runat="server" TextMode="MultiLine" Height="75px"
                Width="500px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Razones para la baja académica
        </td>
        <td>
            <asp:TextBox ID="txtRazonbaja" runat="server" TextMode="MultiLine" Height="75px"
                Width="500px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Tipo y frecuencia de actividades extracurriculares
        </td>
        <td>
            <asp:TextBox ID="txtActivextracrs" runat="server" TextMode="MultiLine" Height="75px"
                Width="500px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Forma en que evalúan el desempeño de los docentes
        </td>
        <td>
            <asp:TextBox ID="txtFormaEvaluadoct" runat="server" TextMode="MultiLine" Height="75px"
                Width="500px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Categorías de los docentes
        </td>
        <td>
            <asp:TextBox ID="txtCatdocts" runat="server" TextMode="MultiLine" Height="75px" Width="500px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            Asociaciones a las que pertenece la Institución
        </td>
        <td>
            <asp:TextBox ID="txtAsocsinst" runat="server" TextMode="MultiLine" Height="75px"
                Width="500px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            &nbsp;
        </td>
    </tr>
</table>
<asp:Panel runat="server" ID="pnlGuardar" BackColor="#E4E4E4" BorderColor="#CCCCCC"
    BorderStyle="Solid" Width="50%">
    <asp:ValidationSummary ID="valSum" DisplayMode="List" runat="server" HeaderText="Faltan campos por capturar o algunos de ellos estan incorrectos."
        Font-Names="verdana" Font-Size="12" ValidationGroup="validaCaractca" ShowMessageBox="True"
        ShowSummary="False" />
    <table width="100%" style="color: White; background-color: #006699;" cellpadding="0"
        cellspacing="0">
        <tr>
            <td style="width: 5%">
                <center>
                    <img src="../Images/mini/star.png" />
                </center>
            </td>
            <td style="width: 20%">
                Plantel:
            </td>
            <td style="text-align: left;">
                <asp:Label runat="server" ID="lblPlantel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 5%">
                <center>
                    <img src="../Images/mini/medal.png" />
                </center>
            </td>
            <td style="width: 20%">
                Institución:
            </td>
            <td style="text-align: left;">
                <asp:Label runat="server" ID="lblInstitucion"></asp:Label>
            </td>
        </tr>
    </table>
    <center>
        <asp:Button runat="server" ID="btnGuardar" Text="Guardar" OnClick="btnAceptar_Click"
            ToolTip="Guardar atributos del plantel." ValidationGroup="validaCaractca" />
        &nbsp;<asp:Button runat="server" ID="btnCancelar" Text="Cancelar" PostBackUrl="~/Admin/Inicio_Admin.aspx"
            ToolTip="Cancelar inserción atributos." /></center>
</asp:Panel>
<asp:AlwaysVisibleControlExtender runat="server" ID="avceGuardar" HorizontalSide="Center"
    TargetControlID="pnlGuardar" VerticalSide="Bottom">
</asp:AlwaysVisibleControlExtender>
