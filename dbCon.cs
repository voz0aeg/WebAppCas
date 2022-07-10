using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
//using System.Data.SqlClient;
//using System.Data;

namespace WebAppCas
{
    public class dbCon
    {
        public static SqlConnection Conexion = new SqlConnection("Data Source=localhost; Initial Catalog = app3; User Id = User1; Password=User1");

        public bool Guardar(string q)
        {
            try
            {
                Conexion.Open();
                SqlCommand Comando;
                Comando = new SqlCommand(q, Conexion);

                Comando.ExecuteNonQuery();
                Conexion.Close();
                return true;
            }
            catch (Exception ex)
            {
                Conexion.Close();
                return false;
            }
        }

        public DataTable Consulta2(string q)
        {
            try
            {
                DataTable t = new DataTable();
                var Adaptador = new SqlDataAdapter(q, Conexion);
                DataSet ds = new DataSet();
                Adaptador.Fill(ds);
                t = ds.Tables[0];
                return t;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataRow Consulta1(string q)
        {
            try
            {
                var Adaptador = new SqlDataAdapter(q, Conexion);
                var ds = new DataSet();
                Adaptador.Fill(ds);
                DataRow fila;

                if (ds.Tables[0].Rows.Count > 0)
                    fila = ds.Tables[0].Rows[0];
                else
                    fila = null;
                return fila;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public string Consulta0(string q)
        {
            try
            {
                Conexion.Open();
                SqlCommand cmd = new SqlCommand(q, Conexion);
                var re = cmd.ExecuteScalar();
                Conexion.Close();

                if (re == null)
                {
                    return "";
                }
                else
                {
                    return re.ToString();
                }

            }
            catch (Exception ex)
            {
                return "";
            }
        }



    }
}
