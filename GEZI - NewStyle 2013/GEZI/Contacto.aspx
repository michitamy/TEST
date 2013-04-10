<%@ Page Title="Contáctanos" Language="C#" MasterPageFile="~/Styles/Site.master" AutoEventWireup="true"
    CodeFile="Contacto.aspx.cs" Inherits="Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dropotron-1.0.js" type="text/javascript"></script>
    <%--<script src="Scripts/jquery.slidertron-1.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#slider').slidertron({
                viewerSelector: '.viewer',
                indicatorSelector: '.indicator span',
                reelSelector: '.reel',
                slidesSelector: '.slide',
                speed: 'slow',
                advanceDelay: 4000
            });
        });
    </script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= pnlMensaje.ClientID %>').delay(8000).slideUp(300);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SliderContent" runat="Server">
    <%--  <div class="viewer">
        <div class="reel">
            <div class="slide">
                <img src="Images/Slider/slide01.jpg" alt="" />
            </div>
            <div class="slide">
                <img src="Images/Slider/slide02.jpg" alt="" />
            </div>
            <div class="slide">
                <img src="Images/Slider/slide03.jpg" alt="" />
            </div>
            <div class="slide">
                <img src="Images/Slider/slide04.jpg" alt="" />
            </div>
            <div class="slide">
                <img src="Images/Slider/slide05.jpg" alt="" />
            </div>
        </div>
    </div>
    <div class="indicator">
        <span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>5</span>
    </div>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="pnlMensaje" CssClass="albox" BorderStyle="Solid" BorderWidth="1px">
        <asp:Image runat="server" ID="imgMensaje" ImageUrl="" CssClass="imgMje" />
        <b>
            <asp:Label runat="server" ID="lblTitulo"></asp:Label></b>
        <asp:Label runat="server" ID="lblMensaje"></asp:Label>
        <asp:ImageButton runat="server" ID="imgClose" CssClass="close" ToolTip="Cerrar" OnClientClick="lunchboxClose()" />
    </asp:Panel>
    <div class="aligntop" id="content-box1">
        <h2>
            &nbsp;</h2>
        <h2>
            Forma de Contacto</h2>
        <p>
            Agradecemos tu visita y estamos a tus ordenes para cualquier duda o aclaración.
            Si deseas contactarte con GEZI a través de un correo electrónico, llena esta simple
            forma en donde puedes solicitar información sobre los servicios de GEZI en general
            y enviar comentarios del sitio. Te daremos respuesta a través del correo electrónico
            que nos proporciones.</p>
    </div>
    <div class="form-submit" id="content-box2">
        <div class="box">
            <p>
                &nbsp;</p>
            <p>
                <label for="txtNombre">
                    Nombre:
                </label>
                <br />
                <asp:TextBox runat="server" ID="txtNombre" Width="250"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Requerido"
                    ControlToValidate="txtNombre" Display="Dynamic" ValidationGroup="ChecaUsuario"
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label for="txtCorreo">
                    Correo Electrónico:</label><br />
                <asp:TextBox runat="server" ID="txtCorreo" Width="250"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ErrorMessage="Requerido"
                    ControlToValidate="txtCorreo" Display="Dynamic" ValidationGroup="ChecaUsuario"
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCorreo" runat="server" ErrorMessage="Correo Invalido"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtCorreo"
                    Display="Dynamic" ValidationGroup="ChecaUsuario" ForeColor="Red"></asp:RegularExpressionValidator>
            </p>
            <p>
                <label for="txtMensaje">
                    Mensaje:</label>
                <br />
                <asp:TextBox runat="server" ID="txtMensaje" Width="350" TextMode="MultiLine" Height="75"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvMensaje" runat="server" ErrorMessage="Requerido"
                    ControlToValidate="txtMensaje" Display="Dynamic" ValidationGroup="ChecaUsuario"
                    SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <asp:Button runat="server" ID="btnEnviar" Text="Enviar" ValidationGroup="ChecaUsuario"
                OnClick="btnEnviar_Click" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BottomContent" runat="Server">
     <div id="page-bottom-content">
        <h3>
            GEZI, un Compromiso con la Educación</h3>
        <img class="pic alignleft" src="images/educMex.png" width="120" height="154" alt="" />
        <p>
            La educación es medio fundamental para adquirir, transmitir y acrecentar la cultura;
            es un proceso permanente que contribuye al desarrollo del individuo y a la transformación
            de la sociedad, y es factor determinante para la adquisición de conocimientos y
            para formar a mujeres y a hombres, de manera que tengan sentido de solidaridad social.
        </p>
    </div>
    <div class="bottom-menu" id="page-bottom-content">
        <p align="right" class="bottom-menu">
            | <a href="http://localhost:58176/GEZI/Default.aspx">Inicio</a> | <a href="http://localhost:58176/GEZI/Nosotros.aspx">
                Nosotros</a> | <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx">Busca tu Escuela</a>
            | <a href="http://localhost:58176/GEZI/Contacto.aspx">Contáctanos</a> | <a href="http://localhost:58176/GEZI/Privacidad.aspx">
                Privacidad</a> |</p>
    </div>
    <div id="page-bottom-sidebar">
        <h3>
            Informes:</h3>
        <ul class="list">
            <li class="first"><a href="http://localhost:58176/GEZI/Nosotros.aspx">Visión y misión
                GEZI</a></li>
            <li><a href="http://localhost:58176/GEZI/Contacto.aspx">Envíanos un e-mail</a></li>
            <li class="last"><a href="http://localhost:58176/GEZI/Default.aspx">Preguntas frecuentes</a><br
                class="clearfix" />
            </li>
        </ul>
    </div>
</asp:Content>