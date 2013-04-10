<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.master" AutoEventWireup="true"
    CodeFile="Error404.aspx.cs" Inherits="Errors_Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.dropotron-1.0.js" type="text/javascript"></script>
    <link href="../Styles/Errors.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SliderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="wrapper">
        <div class="errorPage">
            <h2 class="red errorTitle">
                <span>Página no encontrada</span></h2>
            <h1>
                404</h1>
            <span class="bubbles"></span>
            <p>
                Oops! Lo sentimos, ha ocurrido un error. La página solicitada no se encuentra.</p>
            <div class="backToDash">
                <asp:Button runat="server" ID="btnInicio" Text="Página de Inicio" PostBackUrl="~/Default.aspx" /></div>
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
