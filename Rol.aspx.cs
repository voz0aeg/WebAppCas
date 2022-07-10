using WebAppCas;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppCas
{
    public partial class Rol : System.Web.UI.Page
    {
        dbCon f = new dbCon();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (IsPostBack)
            {
                return;
            }
            
            string User = Request.QueryString["idRol"];
            if (User == "0")
            {
                Edita.Visible = true;
                lblId.Text = "0";
                msg1.Visible = true;
            }
            else if (User != null)
            {
                Edita.Visible = true;
                lblId.Text = User;
                msg1.Visible = false;
                CargaDatos();
            }
            else
            {
                Edita.Visible = false;
            }

            CargaCatRol();

            DataTable t = f.Consulta2("select * from cat_Menu");
            txtMenu.DataSource = t;
            txtMenu.DataValueField = "id";
            txtMenu.DataTextField = "menu";
            txtMenu.DataBind();
        }

        private void CargaDatos()
        {
            DataRow r = f.Consulta1("select * from cat_Rol where idRol='" + lblId.Text + "'");
            txtNombre.Text = r["rol"].ToString();

            CargaRolMenu();
        }

        private void CargaCatRol()
        {
            DataTable t = f.Consulta2("select * from cat_Rol");
            GridView1.DataSource = t;
            GridView1.DataBind();
        }

        private void CargaRolMenu()
        {
            DataTable t = f.Consulta2("select rm.id, m.menu " +
            "from RolMenu rm " +
            "inner join cat_Rol r on rm.idRol = r.idRol " +
            "inner join cat_Menu m on rm.idMenu = m.id  " +
            "where r.idRol = '" + lblId.Text + "'");

            GridView2.DataSource = t;
            GridView2.DataBind();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rol.aspx?idRol=0");
        }

        protected void btnAdda_Click(object sender, EventArgs e)
        {
            f.Guardar("insert into RolMenu values('" + lblId.Text  + "','" + txtMenu.Text + "')");
            CargaRolMenu();
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id =GridView2.DataKeys[e.RowIndex].Value.ToString();
            f.Guardar("delete RolMenu where id='" + id + "'");
            CargaRolMenu();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            f.Guardar("delete RolMenu where idRol='" + id + "'");
            f.Guardar("delete cat_Rol where idRol='" + id + "'");
            Response.Redirect("Rol.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!ValidaText(txtNombre)) return;

            if (lblId.Text == "0")
            {
                string v = f.Consulta0("select rol from cat_Rol where rol='" + txtNombre.Text + "'");
                if (v != txtNombre.Text)
                {
                    f.Guardar("insert into cat_Rol values('" + txtNombre.Text.Trim() + "')");
                    lblId.Text = f.Consulta1("select max(idrol) from cat_Rol")[0].ToString();
                    CargaCatRol();
                    msg1.Visible = false;
                }
            }
            else
            {
                f.Guardar("update cat_Rol set rol='" + txtNombre.Text.Trim() + "' where idRol='" + lblId.Text + "'");
                CargaCatRol();
            }
                      

        }
        private bool ValidaText(TextBox control)
        {
            if (control.Text == "")
            {
                control.CssClass = "form-control cssFalta";
                control.Focus();
                return false;
            }
            else
            {
                control.CssClass = "form-control";
                return true;
            }

        }
    }
}