using WebAppCas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCas
{
    public partial class signup : System.Web.UI.Page
    {
        dbCon f = new dbCon();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            string v = f.Consulta0("select NoEmpleado from Usuarios where NoEmpleado='" + txtNoUser.Text + "' and Contrasena='" + Kripto.Encrypt(txtPass.Text) + "' and Activo=1");
            if (v == txtNoUser.Text)
            {
                Session["NoEmpleado"] = v;
                Response.Redirect("index.aspx"); 
            }
            else
            {
                Label1.Text = "Usuario invalido";
                Label1.Visible = true;
                return;
            }

        }
    }
}