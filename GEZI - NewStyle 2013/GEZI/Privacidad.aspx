<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.master" AutoEventWireup="true"
    CodeFile="Privacidad.aspx.cs" Inherits="Privacidad" %>

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
    <div id="content-2">
        <div class="box">
            <h2>
                &nbsp;</h2>
            <h2>
                Política de Privacidad GEZI</h2>
            <p>
                Su privacidad es muy importante para nosotros. Por ello, hemos implementado esta
                Pol&iacute;tica de Privacidad para garantizar que la informaci&oacute;n que recogemos
                de usted a trav&eacute;s de Internet es segura. Nos comprometemos a lo siguiente:<br />
                <br />
                <strong>Compromiso de uso<br />
                </strong>Cuando Ud. comparte informaci&oacute;n personal con nosotros, dicha informaci&oacute;n
                se utilizar&aacute; &uacute;nicamente en relaci&oacute;n directa con los fines para
                los cuales se haya facilitado. Si usted solicita informaci&oacute;n o cotizaci&oacute;n,
                eso ser&aacute; lo que obtendr&aacute; - no se encontrar&aacute; en una nueva lista
                de correo o sujeto a ning&uacute;n contrato de ventas. Si pensamos hacer uso adicional
                de sus datos en alguna aplicacion de utilidad para usted o su empresa, se le pedir&aacute;
                espec&iacute;ficamente su autorizaci&oacute;n.<br />
                <br />
                <strong>Compromiso de confidencialidad<br />
                </strong>No compartiremos sus datos con un tercero, a menos que espec&iacute;ficamente
                pidamos su autorizaci&oacute;n. A pesar de que podamos mantener o procesar sus datos
                en varios lugares, los mismos compromisos de confidencialidad siguen vigentes, de
                ser el caso contrario esto daria como respuesta una orden judicial o una obligaci&oacute;n
                de tipo legal.<br />
                <br />
                <strong>Compromiso de seguridad<br />
                </strong>Sus datos personales estar&aacute;n seguros. En GEZI estamos orgullosos
                de nuestra tecnolog&iacute;a y de nuestras pol&iacute;ticas de seguridad, sus datos
                m&aacute;s confidenciales siempre estar&aacute;n a salvo con nosotros.</p>
        </div>
        <br class="clearfix" />
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