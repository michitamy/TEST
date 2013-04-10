using System.Collections.Generic;
using System.Web.Services;
using AjaxControlToolkit;
using Entidades;
using Negocios;

/// <summary>
/// Summary description for AutoCompleteService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
[System.Web.Script.Services.ScriptService]
public class AutoCompleteService : System.Web.Services.WebService
{
    private Views_Negocio vn = new Views_Negocio();

    public AutoCompleteService()
    {
        //Uncomment the following line if using designed components
        //InitializeComponent();
    }

    [WebMethod]

    #region Encuestas

    public string[] BuscaEncuesta(string prefixText, int count)
    {
        List<string> responses = new List<string>();
        List<Encuesta_Entidad> lista = new List<Encuesta_Entidad>();

        lista = vn.RegresaEncabezados(prefixText, Constantes.PORNOMBRE);

        foreach (Encuesta_Entidad ee in lista)
            responses.Add(AutoCompleteExtender.CreateAutoCompleteItem(ee.Nombre, ee.GUID.ToString()));

        //if (responses.Count == count)
        //    return responses.ToArray();

        return responses.ToArray();
    }

    #endregion Encuestas
}