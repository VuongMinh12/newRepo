using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows;
using System.Data;

namespace WebBasic
{
    public partial class CreateShoes : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["testsql"].ConnectionString;
            connection.Open();

         

            if (TextBox1 != null && TextBox2 != null)
            {
               


                SqlCommand cmd = new SqlCommand("Insert_Shoes", connection);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text.ToString());
                cmd.Parameters.AddWithValue("@Title", TextBox2.Text.ToString());

                cmd.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Insert thanh cong!!!");
                TextBox1.Text = "";
                TextBox2.Text = "";

         
            }
            else
            {
                MessageBox.Show("Khong the insert");
            }
        }
    }
}