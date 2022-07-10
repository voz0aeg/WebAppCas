//using Newtonsoft.Json;
//using RestSharp;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebAppCas
{
    public partial class WebForm1 : System.Web.UI.Page
    {
    
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl li1 = (HtmlGenericControl)Page.Master.FindControl("menu").FindControl("li1");
            li1.Attributes["class"] = "active";

            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            res.Text = url.Replace("index.aspx","api/saludo"); 

            Saludo();
        }

        void Saludo()
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            url = url.Replace("index.aspx", "api/saludo");
            var httpRequest = (HttpWebRequest)WebRequest.Create(url);
            var httpResponse = (HttpWebResponse)httpRequest.GetResponse();
            var streamReader = new StreamReader(httpResponse.GetResponseStream());
            var result = streamReader.ReadToEnd();
            lblSaludo.InnerText = result.ToString();
        }

        

    }
}