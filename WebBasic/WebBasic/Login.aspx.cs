using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace WebBasic
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection sql = new SqlConnection();
             sql.ConnectionString = ConfigurationManager.ConnectionStrings["testsql"].ConnectionString;

            SqlCommand cmd = new SqlCommand("Login", sql);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);     

            sql.Open();

            int usercount = (Int32)cmd.ExecuteScalar();


            if (usercount == 1)  // comparing users from table 
            {
                Response.Redirect("Shoes.aspx");  //for sucsseful login
            }
            else
            {
                sql.Close();
                lblMessage.Text = "Invalid User Name or Password";  //for invalid login
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}