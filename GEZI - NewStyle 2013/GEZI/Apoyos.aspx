<%@ Page Title="Apoyos" Language="C#" MasterPageFile="~/Styles/Site.master" AutoEventWireup="true"
    CodeFile="Apoyos.aspx.cs" Inherits="Apoyos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="SliderContent" runat="Server">
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
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="box">
        <h2>
            Bienvenidos a GEZI Servicios Educativos</h2>
        <p>
            GEZI SERVICIOS EDUCATIVOS te da la bienvenida al portal web que te ofrece la búsqueda
            más avanzada de las mejores escuelas privadas en México. Para una búsqueda personalizada
            le invitamos a que haga clic en una de las siguientes categorías:
        </p>
    </div>
    <div class="box" id="content-box1">
        <h3>
            Mauris justo</h3>
        <ul class="section-list">
            <li class="first">
                <img class="pic alignleft" src="Images/pic01.jpg" width="70" height="70" alt="" />
                <span>Condimentum et porttitor tristique nec aliquet magnis pretium quam nibh.</span>
            </li>
            <li>
                <img class="pic alignleft" src="Images/pic02.jpg" width="70" height="70" alt="" />
                <span>Posuere elementum sapien justo tortor nulla fringilla suspendisse nascetur.</span>
            </li>
            <li class="last">
                <img class="pic alignleft" src="Images/pic03.jpg" width="70" height="70" alt="" />
                <span>Ipsum quis vestibulum feugiat congue nunc laoreet volutpat lorem ipsum sociis.</span>
            </li>
        </ul>
    </div>
    <div class="box" id="content-box2">
        <h3>
            Magnis hendrerit erat</h3>
        <p>
            Neque neque ornare penatibus tristique fusce turpis. Purus sagittis euismod at ornare
            suscipit tempus.
        </p>
        <ul class="list">
            <li class="first"><a href="#">Ipsum phasellus ullamcorper</a></li>
            <li><a href="#">Mollis mattis tempus amet</a></li>
            <li><a href="#">Ipsum aliquet dignissim vitae</a></li>
            <li><a href="#">Orci metus curae sed mollis</a></li>
            <li class="last"><a href="#">Tristique amet venenatis</a></li>
        </ul>
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
