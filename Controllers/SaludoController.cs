using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebAppCas.Controllers
{
    public class SaludoController : ApiController
    {
        dbCon f = new dbCon();
        // GET: api/Saludo
        public string Get()
        {
            string v = f.Consulta0("select top(1) Saludo from Saludo");
            return v;
        }

        

       
    }
}
