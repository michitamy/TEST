using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web.Services;
using AjaxControlToolkit;
using Entidades;
using Negocios;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
[System.Web.Script.Services.ScriptService]
public class DropDownList : System.Web.Services.WebService
{
    private Views_Negocio views = new Views_Negocio();

    public DropDownList()
    {
        //Uncomment the following line if using designed components
        //InitializeComponent();
    }

    [WebMethod]

    #region Tipos

    public CascadingDropDownNameValue[] GetTipo(string knownCategoryValues, string category)
    {
        List<Tipo_Entidad> lista = new List<Tipo_Entidad>();

        lista = views.RegresaTipos();

        List<CascadingDropDownNameValue> tipos = new List<CascadingDropDownNameValue>();
        foreach (Tipo_Entidad te in lista)
            tipos.Add(new CascadingDropDownNameValue(te.Nombre, te.Tipo_id.ToString()));

        return tipos.ToArray();
    }

    #endregion Tipos

    [WebMethod]

    #region Nivel

    public CascadingDropDownNameValue[] GetNivel(string knownCategoryValues, string category)
    {
        List<Nivel_Entidad> lista = new List<Nivel_Entidad>();

        lista = views.RegresaNiveles(false);

        List<CascadingDropDownNameValue> niveles = new List<CascadingDropDownNameValue>();
        foreach (Nivel_Entidad ne in lista)
            niveles.Add(new CascadingDropDownNameValue(ne.Nombre, ne.Nivel_id.ToString()));

        return niveles.ToArray();
    }

    #endregion Nivel

    [WebMethod]

    #region Niveles para busqueda por carrera

    public CascadingDropDownNameValue[] GetNivelCarrera(string knownCategoryValues, string category)
    {
        List<Nivel_Entidad> lista = new List<Nivel_Entidad>();

        lista = views.RegresaNiveles(true);

        List<CascadingDropDownNameValue> niveles = new List<CascadingDropDownNameValue>();
        foreach (Nivel_Entidad ne in lista)
            niveles.Add(new CascadingDropDownNameValue(ne.Nombre, ne.Nivel_id.ToString()));

        return niveles.ToArray();
    }

    #endregion Niveles para busqueda por carrera

    [WebMethod]

    #region Estado

    public CascadingDropDownNameValue[] GetEstado(string knownCategoryValues, string category)
    {
        List<Plantel_Entidad> lista = new List<Plantel_Entidad>();

        lista = views.Nacion(-1, Constantes.ESTADO);

        List<CascadingDropDownNameValue> niveles = new List<CascadingDropDownNameValue>();
        foreach (Plantel_Entidad pe in lista)
            niveles.Add(new CascadingDropDownNameValue(pe.Estado, pe.Estado_Id.ToString()));

        return niveles.ToArray();
    }

    #endregion Estado

    [WebMethod]

    #region Ciudad

    public CascadingDropDownNameValue[] GetCiudad(string knownCategoryValues, string category)
    {
        List<Plantel_Entidad> lista = new List<Plantel_Entidad>();
        int iCE = -1;

        StringDictionary kv = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        iCE = int.Parse(kv["Estado"]);

        lista = views.Nacion(iCE, Constantes.CIUDAD);

        List<CascadingDropDownNameValue> niveles = new List<CascadingDropDownNameValue>();
        foreach (Plantel_Entidad pe in lista)
            niveles.Add(new CascadingDropDownNameValue(pe.Ciudad, pe.Ciudad_Id.ToString()));

        return niveles.ToArray();
    }

    #endregion Ciudad    

    [WebMethod]

    #region Tipo de RVOE

    public CascadingDropDownNameValue[] GetTRVOE(string knownCategoryValues, string category)
    {
        List<TipoRVOE_Entidad> lista = new List<TipoRVOE_Entidad>();

        lista = views.RegresaTiposRVOEs();

        List<CascadingDropDownNameValue> niveles = new List<CascadingDropDownNameValue>();
        foreach (TipoRVOE_Entidad rvoee in lista)
            niveles.Add(new CascadingDropDownNameValue(rvoee.Nombre, rvoee.TipoRVOE_id.ToString()));

        return niveles.ToArray();
    }

    #endregion Tipo de RVOE
}