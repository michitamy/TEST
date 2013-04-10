<%@ Page Title="Comparación" Language="C#" MasterPageFile="~/Styles/Site.master"
    AutoEventWireup="true" CodeFile="Comparar.aspx.cs" Inherits="Comparar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/style.css" rel="stylesheet" type="text/css" />
    <link href="Styles/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/StyleGEZI.css" rel="stylesheet" type="text/css" />
    <link href="Styles/CompareStyle.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dropotron-1.0.js" type="text/javascript"></script>
    <script src="Scripts/jquery.slidertron-1.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.mousewheel.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.mCustomScrollbar.js" type="text/javascript"></script>
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
    <style type="text/css">
        .clear
        {
            clear: both;
        }
        div.hideSkiplink
        {
            background-color: #EEEEEE;
            width: 100%;
            border-bottom: 1px solid Black;
        }
        
        div.menu
        {
            color: #696969;
            font-family: Helvetica Neue, Lucida Grande, Segoe UI, Arial, Helvetica, Verdana, sans-serif;
            font-size: .80em; /*<-New*/ /*padding: 4px 0px 4px 8px;*/
        }
        
        div.menu ul
        {
            list-style: none;
            margin: 0px;
            padding: 0px;
            width: auto;
        }
        
        div.menu ul li a, div.menu ul li a:visited
        {
            background-color: #EEEEEE;
            border: 1px White solid;
            color: Gray;
            display: block;
            line-height: 1.35em;
            padding: 4px 20px;
            text-decoration: none;
            white-space: nowrap;
        }
        
        div.menu ul li a:hover
        {
            /*background-color: #bfcbd6;color: #465c71;*/
            text-decoration: underline;
        }
        
        div.menu ul li a:active
        {
            background-color: White; /*color: #cfdbe6;*/
            border-left: 1px solid Black;
            border-right: 1px solid Black;
            border-top: 3px solid Black;
            text-decoration: none;
        }
        
        .SelectedStyle
        {
            background-color: orange;
            color: #003300;
            border-bottom: solid 1px #eee;
            z-index: 100;
        }
        .content
        {
            width: 900px;
            height: 500px;
            overflow: auto;
        }
    </style>
    <script>
        (function ($) {
            $(window).load(function () {
                $("#content_1").mCustomScrollbar({
                    set_width: false, /*optional element width: boolean, pixels, percentage*/
                    set_height: false, /*optional element height: boolean, pixels, percentage*/
                    horizontalScroll: false, /*scroll horizontally: boolean*/
                    scrollInertia: 550, /*scrolling inertia: integer (milliseconds)*/
                    scrollEasing: "easeOutCirc", /*scrolling easing: string*/
                    mouseWheel: "auto", /*mousewheel support and velocity: boolean, "auto", integer*/
                    autoDraggerLength: true, /*auto-adjust scrollbar dragger length: boolean*/
                    scrollButtons: { /*scroll buttons*/
                        enable: false, /*scroll buttons support: boolean*/
                        scrollType: "continuous", /*scroll buttons scrolling type: "continuous", "pixels"*/
                        scrollSpeed: 20, /*scroll buttons continuous scrolling speed: integer*/
                        scrollAmount: 40 /*scroll buttons pixels scroll amount: integer (pixels)*/
                    },
                    advanced: {
                        updateOnBrowserResize: true, /*update scrollbars on browser resize (for layouts based on percentages): boolean*/
                        updateOnContentResize: false, /*auto-update scrollbars on content resize (for dynamic content): boolean*/
                        autoExpandHorizontalScroll: false /*auto expand width for horizontal scrolling: boolean*/
                    },
                    callbacks: {
                        onScroll: function () { }, /*user custom callback function on scroll event*/
                        onTotalScroll: function () { }, /*user custom callback function on bottom reached event*/
                        onTotalScrollOffset: 0 /*bottom reached offset: integer (pixels)*/
                    }
                });
            });
        })(jQuery);
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
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <h2>
        Comparación</h2>
    <asp:Panel runat="server" ID="pnlComparacion" Style="padding-bottom: 10px;">
        <table width="100%" cellpadding="0" cellspacing="0" class="font">
            <tr>
                <td colspan="6" class="tlwhitecp">
                    <asp:ImageButton runat="server" ID="lnkFirst" OnClick="lnkFirst_Click" ImageUrl="~/Images/mini/Player FastRev.png" />
                    &nbsp;<asp:ImageButton ID="lnkPrevious" runat="server" ImageUrl="~/Images/mini/Player Previous.png"
                        OnClick="lnkPrevious_Click" />&nbsp;Página&nbsp;<asp:Label runat="server" ID="lblpageNumbers"></asp:Label>
                    &nbsp;de&nbsp;
                    <asp:Label ID="lblTotalPages" runat="server" Font-Bold="true"></asp:Label>
                    &nbsp;<asp:ImageButton ID="lnkNext" runat="server" ImageUrl="~/Images/mini/Player Next.png"
                        OnClick="lnkNext_Click" />
                    &nbsp;<asp:ImageButton runat="server" ID="lnkLast" OnClick="lnkLast_Click" ImageUrl="~/Images/mini/Player FastFwd.png" />
                </td>
            </tr>
            <%--BackColor="Red"--%>
            <tr class="tnp" style="background-color: #eee;">
                <td rowspan="4" class="tnp" style="width: 185px; height: 210px; padding-right: 5px;">
                    <img src="Images/banners/GEZIatribut.gif" />
                    <%-- <div>
                        <center>
                            <asp:ImageButton runat="server" ID="btnAgregarInst" PostBackUrl="~/BuscarEscuelas.aspx"
                                ImageUrl="~/Images/messages/AgregarInst.png" /></center>
                    </div>--%>
                    <%-- <div>
                        <asp:LinkButton runat="server" ID="lbReorganizar" Text="Reorganizar" 
                            PostBackUrl="~/Reorganizar.aspx"></asp:LinkButton></div>--%>
                </td>
                <td class="tlwhitecp" style="width: 149px">
                    <%--Cerrar--%>
                    <div class="cerrar">
                        <asp:ImageButton runat="server" ID="ibCerrar1" ImageUrl="~/Images/mini/close-opacity-42.png"
                            OnClick="ibCerrar1_Click" />
                    </div>
                </td>
                <td class="tlwhitecp" style="width: 149px">
                    <%--Cerrar--%>
                    <div class="cerrar">
                        <asp:ImageButton runat="server" ID="ibCerrar2" ImageUrl="~/Images/mini/close-opacity-42.png"
                            OnClick="ibCerrar2_Click" />
                    </div>
                </td>
                <td class="tlwhitecp" style="width: 149px">
                    <%--Cerrar--%>
                    <div class="cerrar">
                        <asp:ImageButton runat="server" ID="ibCerrar3" ImageUrl="~/Images/mini/close-opacity-42.png"
                            OnClick="ibCerrar3_Click" />
                    </div>
                </td>
                <td class="tlwhitecp" style="width: 149px">
                    <%--Cerrar--%>
                    <div class="cerrar">
                        <asp:ImageButton runat="server" ID="ibCerrar4" ImageUrl="~/Images/mini/close-opacity-42.png"
                            OnClick="ibCerrar4_Click" Style="width: 9px" />
                    </div>
                </td>
                <td class="tlwhitecp" style="width: 149px">
                    <%--Cerrar--%>
                    <div class="cerrar">
                        <asp:ImageButton runat="server" ID="ibCerrar5" ImageUrl="~/Images/mini/close-opacity-42.png"
                            OnClick="ibCerrar5_Click" />
                    </div>
                </td>
            </tr>
            <tr style="background-color: #eee; border: 1px solid #ededed;">
                <td>
                    <%--Imagen--%>
                    <div class="ImagenInst">
                        <asp:Image runat="server" ID="imgInst1" Width="130px" Height="78" ImageUrl="~/Images/logoGezi.png" /></div>
                </td>
                <td>
                    <%--Imagen--%>
                    <div class="ImagenInst">
                        <asp:Image runat="server" ID="imgInst2" Width="130px" Height="78" ImageUrl="~/Images/logoGezi.png" /></div>
                </td>
                <td>
                    <%--Imagen--%>
                    <div class="ImagenInst">
                        <asp:Image runat="server" ID="imgInst3" Width="130px" Height="78" ImageUrl="~/Images/logoGezi.png" /></div>
                </td>
                <td>
                    <%--Imagen--%>
                    <div class="ImagenInst">
                        <asp:Image runat="server" ID="imgInst4" Width="130px" Height="78" ImageUrl="~/Images/logoGezi.png" /></div>
                </td>
                <td>
                    <%--Imagen--%>
                    <div class="ImagenInst">
                        <asp:Image runat="server" ID="imgInst5" Width="130px" Height="78" ImageUrl="~/Images/logoGezi.png" /></div>
                </td>
            </tr>
            <tr class="tnp" style="background-color: #eee; border: 1px solid #ededed;">
                <td>
                    <%--Institucion--%><div>
                        <center>
                            <asp:Label runat="server" ID="lblInstitucion1" ForeColor="#206d9f" Font-Size="10px"
                                Font-Bold="true"></asp:Label></center>
                        <asp:HiddenField runat="server" ID="hfInstitucion_id1"></asp:HiddenField>
                    </div>
                </td>
                <td>
                    <%--Institucion--%>
                    <div>
                        <center>
                            <asp:Label runat="server" ID="lblInstitucion2" ForeColor="#206d9f" Font-Size="10px"
                                Font-Bold="true"></asp:Label></center>
                        <asp:HiddenField runat="server" ID="hfInstitucion_id2"></asp:HiddenField>
                    </div>
                </td>
                <td>
                    <%--Institucion--%>
                    <div>
                        <center>
                            <asp:Label runat="server" ID="lblInstitucion3" ForeColor="#206d9f" Font-Size="10px"
                                Font-Bold="true"></asp:Label></center>
                        <asp:HiddenField runat="server" ID="hfInstitucion_id3"></asp:HiddenField>
                    </div>
                </td>
                <td>
                    <%--Institucion--%>
                    <div>
                        <center>
                            <asp:Label runat="server" ID="lblInstitucion4" ForeColor="#206d9f" Font-Size="10px"
                                Font-Bold="true"></asp:Label></center>
                        <asp:HiddenField runat="server" ID="hfInstitucion_id4"></asp:HiddenField>
                    </div>
                </td>
                <td>
                    <%--Institucion--%>
                    <div>
                        <center>
                            <asp:Label runat="server" ID="lblInstitucion5" ForeColor="#206d9f" Font-Size="10px"
                                Font-Bold="true"></asp:Label></center>
                        <asp:HiddenField runat="server" ID="hfInstitucion_id5"></asp:HiddenField>
                    </div>
                </td>
            </tr>
            <tr class="tnp" style="background-color: #eee; border: 1px solid #ededed;">
                <%-- <td class="tnp" style="width: 185px">
                <div>
                    <asp:Button runat="server" ID="Button1" Text="Agregar Institucion" PostBackUrl="~/BuscarEscuelas.aspx" /></div>
                <div>
                    <asp:LinkButton runat="server" ID="LinkButton1" Text="Reorganizar"></asp:LinkButton></div>
            </td>--%>
                <td class="tlwhitecp" style="width: 149px">
                    <%--Plantel(es)--%>
                    <div>
                        <asp:HiddenField runat="server" ID="hfPlantel_id1"></asp:HiddenField>
                        <asp:HiddenField runat="server" ID="hfCarrera_id1"></asp:HiddenField>
                        <%--<asp:DropDownList runat="server" ID="ddlPlantel1" Font-Size="11px" Width="130px"
                            Visible="false" OnSelectedIndexChanged="ddlPlantel1_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>--%>
                        <center>
                            <asp:ImageButton runat="server" ID="btnAgregarInst1" PostBackUrl="~/BuscarEscuelas.aspx"
                                ImageUrl="~/Images/messages/AgregarInst.png" />
                            <asp:Label runat="server" ID="lblPlantel1" Font-Size="12px" Visible="false">
                            </asp:Label>
                        </center>
                    </div>
                </td>
                <td class="tlwhitecp" style="width: 149px">
                    <%--Plantel(es)--%>
                    <div>
                        <asp:HiddenField runat="server" ID="hfPlantel_id2"></asp:HiddenField>
                        <asp:HiddenField runat="server" ID="hfCarrera_id2"></asp:HiddenField>
                        <%--<asp:DropDownList runat="server" ID="ddlPlantel2" Font-Size="11px" Width="130px"
                            Visible="false" OnSelectedIndexChanged="ddlPlantel2_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>--%>
                        <center>
                            <asp:ImageButton runat="server" ID="btnAgregarInst2" PostBackUrl="~/BuscarEscuelas.aspx"
                                ImageUrl="~/Images/messages/AgregarInst.png" />
                            <asp:Label runat="server" ID="lblPlantel2" Font-Size="12px" Visible="false">
                            </asp:Label>
                        </center>
                    </div>
                </td>
                <td class="tlwhitecp" style="width: 149px">
                    <%--Plantel(es)--%>
                    <div>
                        <asp:HiddenField runat="server" ID="hfPlantel_id3"></asp:HiddenField>
                        <asp:HiddenField runat="server" ID="hfCarrera_id3"></asp:HiddenField>
                        <%--<asp:DropDownList runat="server" ID="ddlPlantel3" Font-Size="11px" Width="130px"
                            Visible="false" OnSelectedIndexChanged="ddlPlantel3_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList> --%>
                        <center>
                            <asp:ImageButton runat="server" ID="btnAgregarInst3" PostBackUrl="~/BuscarEscuelas.aspx"
                                ImageUrl="~/Images/messages/AgregarInst.png" />
                            <asp:Label runat="server" ID="lblPlantel3" Font-Size="12px" Visible="false">
                            </asp:Label>
                        </center>
                    </div>
                </td>
                <td class="tlwhitecp" style="width: 149px">
                    <%--Plantel(es)--%>
                    <div>
                        <asp:HiddenField runat="server" ID="hfPlantel_id4"></asp:HiddenField>
                        <asp:HiddenField runat="server" ID="hfCarrera_id4"></asp:HiddenField>
                        <%--<asp:DropDownList runat="server" ID="ddlPlantel4" Font-Size="11px" Width="130px"
                            Visible="false" OnSelectedIndexChanged="ddlPlantel4_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>--%>
                        <center>
                            <asp:ImageButton runat="server" ID="btnAgregarInst4" PostBackUrl="~/BuscarEscuelas.aspx"
                                ImageUrl="~/Images/messages/AgregarInst.png" />
                            <asp:Label runat="server" ID="lblPlantel4" Font-Size="12px" Visible="false">
                            </asp:Label>
                        </center>
                    </div>
                </td>
                <td class="tlwhitecp" style="width: 149px">
                    <%--Plantel(es)--%>
                    <div>
                        <asp:HiddenField runat="server" ID="hfPlantel_id5"></asp:HiddenField>
                        <asp:HiddenField runat="server" ID="hfCarrera_id5"></asp:HiddenField>
                        <%--<asp:DropDownList runat="server" ID="ddlPlantel5" Font-Size="11px" Width="130px"
                            Visible="false" OnSelectedIndexChanged="ddlPlantel5_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>--%>
                        <center>
                            <asp:ImageButton runat="server" ID="btnAgregarInst5" PostBackUrl="~/BuscarEscuelas.aspx"
                                ImageUrl="~/Images/messages/AgregarInst.png" />
                            <asp:Label runat="server" ID="lblPlantel5" Font-Size="12px" Visible="false">
                            </asp:Label>
                        </center>
                    </div>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <div>
        <%--<div style="margin: 16px; width: 850px; height: 850px">--%>
        <%--<asp:Menu ID="menuComparaciones" Orientation="Horizontal" StaticMenuItemStyle-CssClass="tab"
                OnMenuItemClick="Menu1_MenuItemClick" runat="server" Font-Names="Verdana" BackColor="#0099CC"
                DynamicHorizontalOffset="2" Font-Size="1em" ForeColor="#E8E8E8" StaticSubMenuIndent="10px">
                <DynamicHoverStyle BackColor="Black" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="Green" />
                <DynamicSelectedStyle BackColor="Yellow" />
                <Items>
                    <asp:MenuItem Text="Resumen" Value="0" Selected="True" ImageUrl="~/Images/Menu/application-task.png" />
                    <asp:MenuItem Text="Extras" Value="1" ImageUrl="~/Images/Menu/block.png" />
                    <asp:MenuItem Text="Encuesta" Value="2" ImageUrl="~/Images/Menu/application-wave.png" />
                </Items>
                <StaticHoverStyle BackColor="#006699" ForeColor="#EFEFEF" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px"></StaticMenuItemStyle>
                <StaticSelectedStyle BackColor="#006699" ForeColor="#EFEFEF" />
            </asp:Menu>--%>
        <div class="clear hideSkiplink">
            <asp:Menu ID="menuComparaciones" runat="server" EnableViewState="false" IncludeStyleBlock="false"
                OnMenuItemClick="Menu1_MenuItemClick" CssClass="menu" Orientation="Horizontal">
                <Items>
                    <asp:MenuItem Text="RESUMEN" Value="0" Selected="True" />
                    <%--<asp:MenuItem Text="EXTRAS" Value="1" />--%>
                    <asp:MenuItem Text="ENCUESTA" Value="1" />
                </Items>
            </asp:Menu>
        </div>
        <div id="content_1" class="content">
            <asp:MultiView ID="mvComparaciones" ActiveViewIndex="0" runat="server">
                <asp:View ID="vResumen" runat="server">
                    <asp:PlaceHolder ID="phResumen" runat="server"></asp:PlaceHolder>
                </asp:View>
                <%--  <asp:View ID="vExtras" runat="server">
                    <asp:PlaceHolder ID="phExtras" runat="server"></asp:PlaceHolder>
                </asp:View>--%>
                <asp:View ID="vEncuesta" runat="server">
                    <asp:PlaceHolder ID="phEncuesta" runat="server"></asp:PlaceHolder>
                </asp:View>
            </asp:MultiView>
        </div>
        <br />
        <table width="100%">
            <tr>
                <td>
                    <b>SD</b>&nbsp - Sin Definir
                </td>
            </tr>
        </table>
        <p>
            Nota: La información sobre los programas escolares y servicios prestados por los
            diferentes niveles escolares son otorgados por los mismos plantes a GEZI. Por lo
            tanto, restringir la búsqueda mediante la aplicación de filtros puede excluir a
            algunas escuelas.</p>
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
