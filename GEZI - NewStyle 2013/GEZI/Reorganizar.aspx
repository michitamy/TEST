<%@ Page Title="" Language="C#" MasterPageFile="~/Styles/Site.master" AutoEventWireup="true"
    CodeFile="Reorganizar.aspx.cs" Inherits="Reorganizar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/StyleGEZI.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dropotron-1.0.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SliderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:GridView runat="server" ID="gvListaPlanteles" AutoGenerateColumns="False" BackColor="White"
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="#666666"
        Font-Names="Calibri" GridLines="Vertical" Width="90%" OnRowCommand="GvListaPlanteles_RowCommand"
        EmptyDataText="No hay planteles para reorganizar." ShowHeader="false">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField ID="hfLCarrera_id" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.Carrera_id")%>' />
                    <asp:HiddenField runat="server" ID="hfLPlantel_id" Value='<%# DataBinder.Eval(Container, "DataItem.Plantel_id")%>' />
                    <asp:ImageButton runat="server" ID="imgQuitaLista" CommandName="QuitarDeLista" ImageUrl="~/Images/icons/cross.png"
                        ToolTip="Quitar plantel o carrera de la lista." />
                </ItemTemplate>
                <ItemStyle Width="20px" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <label>
                        <asp:DropDownList runat="server" ID="ddlNumeros" DataSource='<%# DataBinder.Eval(Container, "DataItem.ListNumero")%>'
                            SelectedValue='<%# DataBinder.Eval(Container, "DataItem.Numero_comp")%>' AutoPostBack="true"
                            DataValueField="Numero_comp">
                        </asp:DropDownList>
                        <%--<asp:DropDownList id="ddlCountry"
                           DataSource="<%# BindTheCountry() %>" 
                           OnPreRender="SetDropDownIndex"
                           DataTextField="Country"
                           DataValueField="Country"
                           runat="server" />--%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField SortExpression="Plantel">
                <ItemTemplate>
                    <label>
                        <%# string.Format("{0} ({1}) {2}",  DataBinder.Eval(Container, "DataItem.Plantel"),  DataBinder.Eval(Container, "DataItem.Institucion.Institucion"),  DataBinder.Eval(Container, "DataItem.Carrera")) %></label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BottomContent" runat="Server">
</asp:Content>
