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
    public partial class Usuarios : System.Web.UI.Page
    {
        dbCon f = new dbCon();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
            string User = Request.QueryString["User"];
            if (User == "0")
            {
                UserEdita.Visible = true;
                lblNoUser.Text = "0";
            }
            else if (User != null)
            {
                UserEdita.Visible = true;
                lblNoUser.Text = User;
                CargaDatos();
            }
            else
            {
                UserEdita.Visible = false;
            }

            DataTable t = f.Consulta2("select NoEmpleado, nombre, YEAR(GETDATE())-YEAR(fNacimiento) Edad, r.rol from Usuarios e  inner  join cat_rol r on e.Rol = r.idrol");
            GridView1.DataSource = t;
            GridView1.DataBind();

            t = f.Consulta2("select * from cat_Rol");
            txtRol.DataSource = t;
            txtRol.DataValueField = "idRol";
            txtRol.DataTextField = "Rol";
            txtRol.DataBind();

        }

        private void CargaDatos()
        {
            DataRow r = f.Consulta1("select *, CONVERT(nvarchar, fNacimiento,103)fNacimiento2 from Usuarios where NoEmpleado='" + lblNoUser.Text + "'");
            txtNombre.Text = r["nombre"].ToString();
            txtApellidos.Text = r["apellidos"].ToString();
            txtDireccion.Text = r["direccion"].ToString();
            txtRol.Text = r["rol"].ToString();
            txtContrasena.Text = Kripto.Decrypt(r["Contrasena"].ToString());
            txtfNacimiento.Text = r["fnacimiento2"].ToString();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx?User=0");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!ValidaText(txtNombre))return;
            if (!ValidaText(txtApellidos)) return;
            if (!ValidaText(txtDireccion)) return;
            if (!ValidaText(txtfNacimiento)) return;
            if (!ValidaText(txtContrasena)) return;

            if (lblNoUser.Text=="0")
            {
                f.Guardar("INSERT INTO Usuarios(Nombre,Apellidos,Direccion,Rol,fNacimiento,Contrasena, activo) " +
                "VALUES('" + txtNombre.Text + "', '" + txtApellidos.Text + "', '" + txtDireccion.Text + "', '" + txtRol.Text + "', Convert(date,'" + txtfNacimiento.Text + "'), '" + Kripto.Encrypt(txtContrasena.Text) + "',1)");
            }
            else
            {
                f.Guardar("UPDATE Usuarios " +
                "SET Nombre = '" + txtNombre.Text + "'" +
                ", Apellidos = '" + txtApellidos.Text + "'" +
                ", Direccion = '" + txtDireccion.Text + "'" +
                ", Rol = '" + txtRol.Text + "'" +
                ", fNacimiento = Convert(date,'" + txtfNacimiento.Text + "',103)" +
                ", Contrasena = '" + Kripto.Encrypt(txtContrasena.Text) + "'" +
                "WHERE NoEmpleado='" + lblNoUser.Text + "'");
            }
            Response.Redirect("Usuarios.aspx");
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = ((GridView)sender).Rows[e.RowIndex].Cells[1].Text;
            f.Guardar("delete Usuarios where NoEmpleado='" + id + "'");
            Response.Redirect("Usuarios.aspx");
        }
    }
}