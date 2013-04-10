<%@ Page Title="Inicio" Language="C#" MasterPageFile="Styles/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <%--<link href="../Styles/StyleGEZI.css" rel="stylesheet" type="text/css" />--%>
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dropotron-1.0.js" type="text/javascript"></script>
    <script src="Scripts/jquery.slidertron-1.1.js" type="text/javascript"></script>
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
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SliderContent" runat="Server">
    <div class="viewer">
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
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>
        Bienvenidos</h2>
    <div class="box" id="content-box3">
        <p>
            GEZI SERVICIOS EDUCATIVOS te da la bievenida a su portal web, el cual te ofrece
            la búsqueda más avanzada de las mejores instituciones educativas privadas en la
            región Noroeste de México. Para una búsqueda personalizada te invitamos a que hagas
            click en una de las siguientes categorias:
        </p>
        <p>
            <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=5-Universidad">
                <img src="images/Button01v2.jpg" alt="" border="0" align="absmiddle" /></a>
            <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=4-Preparatoria">
                <img src="images/Button02v2.jpg" alt="" border="0" align="absmiddle" /></a>
            <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=3-Secundaria">
                <img src="images/Button03v2.jpg" alt="" border="0" align="absmiddle" /></a>
            <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=2-Primaria">
                <img src="images/Button04v2.jpg" alt="" border="0" align="absmiddle" /></a>
            <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=1-Preescolar">
                <img src="images/Button05v2.jpg" alt="" border="0" align="absmiddle" /></a></p>
    </div>
    <%--<div class="box" id="content-box3">
        <p>
            GEZI SERVICIOS EDUCATIVOS te da la bienvenida al portal web que te ofrece la búsqueda
            más avanzada de las mejores escuelas privadas en México. Para una búsqueda personalizada
            le invitamos a que haga clic en una de las siguientes categorías:
        </p>
        <p>
            <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=5-Universidad">
                <img src="Images/Button01.jpg" border="0" align="absmiddle" /></a> <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=4-Preparatoria">
                    <img src="Images/Button02.jpg" border="0" align="absmiddle" /></a> <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=3-Secundaria">
                        <img src="Images/Button03.jpg" border="0" align="absmiddle" /></a> <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=2-Primaria">
                            <img src="Images/Button04.jpg" border="0" align="absmiddle" /></a>
            <a href="http://localhost:58176/GEZI/BuscarEscuelas.aspx?type=1-Preescolar">
                <img src="images/Button05.jpg" border="0" align="absmiddle" /></a>
        </p>
    </div>--%>
    <br class="clearfix" />
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
            <li class="first"><a href="http://localhost:58176/GEZI/Nosotros.aspx">Visión y misión GEZI</a></li>
            <li><a href="http://localhost:58176/GEZI/Contacto.aspx">Envíanos un e-mail</a></li>
            <li class="last"><a href="http://localhost:58176/GEZI/Default.aspx">Preguntas frecuentes</a><br
                class="clearfix" />
            </li>
        </ul>
    </div>
</asp:Content>
