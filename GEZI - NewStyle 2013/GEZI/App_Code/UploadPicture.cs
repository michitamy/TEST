using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.IO;

/// <summary>
/// Summary description for UploadPicture
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class UploadPicture : System.Web.Services.WebService
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            string filePath = "uploads//";
            string newFilename = Guid.NewGuid().ToString();

            string nonIEFilename = context.Request.Headers["X-File-Name"];

            if (!string.IsNullOrEmpty(nonIEFilename) || context.Request.Files.Count > 0)
            {
                // if IE
                if (string.IsNullOrEmpty(nonIEFilename))
                {
                    HttpPostedFile file = context.Request.Files[0];
                    string[] filenamesplit = file.FileName.ToLower().Split('.');

                    newFilename = string.Format("{0}.{1}", newFilename, filenamesplit[1]);
                    file.SaveAs(context.Server.MapPath(string.Format("{0}{1}", filePath, newFilename)));
                    context.Response.Write(string.Format("{{\"path\":\"{0}uploads/{1}\"}}", context.Request.Url.AbsoluteUri.Replace("upload.ashx", string.Empty), newFilename));
                }
                else // non IE browsers
                {
                    string[] filenamesplit = nonIEFilename.ToLower().Split('.');
                    newFilename = string.Format("{0}.{1}", newFilename, filenamesplit[1]);

                    using (FileStream filestream = new FileStream(context.Server.MapPath(string.Format("{0}{1}", filePath, newFilename)), FileMode.OpenOrCreate))
                    {
                        Stream inputStream = context.Request.InputStream;
                        inputStream.CopyTo(filestream);
                        context.Response.Write(string.Format("{{\"path\":\"{0}uploads/{1}\"}}", context.Request.Url.AbsoluteUri.Replace("upload.ashx", string.Empty), newFilename));
                    }
                }
            }
        }
        catch (Exception ex)
        {
            //Errors.addError("Upload.ProcessRequest()", ex);
        }
    }

    private bool IsAllowed(string file)
    {
        bool isAllowed = false;

        List<string> allowedExtensionsList = new List<string>();
        allowedExtensionsList.Add("jpg");
        allowedExtensionsList.Add("png");
        allowedExtensionsList.Add("gif");
        allowedExtensionsList.Add("bmp");

        string[] filenamesplit = file.ToLower().Split('.');

        for (int j = 0; j < allowedExtensionsList.Count; j++)
        {
            if (allowedExtensionsList[j] == filenamesplit[1].ToLower())
            {
                isAllowed = true;
            }
        }

        return isAllowed;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}