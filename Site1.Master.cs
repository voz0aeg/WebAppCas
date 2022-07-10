using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCas
{
    public partial class Master : System.Web.UI.MasterPage
    {
        dbCon f = new dbCon();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NoEmpleado"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            NoEmpleado.Value = (string)Session["NoEmpleado"];
            DataRow r = f.Consulta1("select Nombre, rol from Usuarios where NoEmpleado='" + NoEmpleado.Value + "'");
            lblNombreUser.Text = r["Nombre"].ToString();

            DataTable t = f.Consulta2("select m.menu " +
            "from RolMenu rm " +
            "inner join cat_Rol r on rm.idRol = r.idRol " +
            "inner join cat_Menu m on rm.idMenu = m.id  " +
            "where r.idRol = '" + r["rol"].ToString() + "'");

            foreach (DataRow rr in t.Rows)
            {
                string menu = rr["menu"].ToString();
                switch (menu)
                {
                    case "USUARIOS":
                        a2.Visible = true;
                        break;

                    case "ROLES":
                        a3.Visible = true;
                        break;

                    case "VENTA":
                        a4.Visible = true;
                        break;

                    case "INVENTARIO":
                        a5.Visible = true;
                        break;

                    case "FACTURACION":
                        a6.Visible = true;
                        break;

                    default:
                        Response.Redirect("Login.aspx");
                        break;
                }
            }

        }

        protected void a1_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void a2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }

        protected void a3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rol.aspx");
        }

        protected void a7_Click(object sender, EventArgs e)
        {
            Session["NoEmpleado"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}