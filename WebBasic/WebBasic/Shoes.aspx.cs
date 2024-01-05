using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web;
using System.Windows;

namespace WebBasic
{
    public partial class Shoes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

            }
            GetData();

        }

        public void GetData()
        {
            // dùng lớp connection để tạo chuỗi kết nối
            SqlConnection connection = new SqlConnection();

            // gọi chuỗi kết nối ở file App.config bằng CongigurationManager
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["testsql"].ConnectionString;

            try
            {

                // Mở chuỗi kết nối
                connection.Open();


                // dùng sql data adapter để viết các câu query
                SqlDataAdapter dataAdapter = new SqlDataAdapter("Get_All_Shoes", connection);


                // tao data table de lay du lieu theo kieu bang de dien vao cac truong tuong ung
                DataTable dtTable = new DataTable();

                //Fill dữ liệu từ adapter vào data table
                dataAdapter.Fill(dtTable);

                //  Lấy data cho gridview từ datatable
                GridView1.DataSource = dtTable;

                // cập nhật giao diện cho gridview sau khi gán dữ liệu
                GridView1.DataBind();

            }
            catch
            {
                // Đóng chuỗi kết nối
                connection.Close();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection sql = new SqlConnection();
            sql.ConnectionString = ConfigurationManager.ConnectionStrings["testsql"].ConnectionString;

            int shoesid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SqlCommand com = new SqlCommand("Delete_Shoes", sql);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Id", shoesid);

            sql.Open();

            com.ExecuteNonQuery();

            sql.Close();

            GetData();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel3.GetType(), "ShowAddDialog", "$('#divPopUp').modal('toggle'); $('.modal-scrollable').appendTo('form1');", true);

            string idGCS = ((LinkButton)sender).CommandArgument.Trim();
            string[] tempParam = idGCS.Split('/');


            IdShoes.Value = tempParam[0].ToString();
            txtName.Text = tempParam[1].ToString();
            txtTitle.Text = tempParam[2].ToString();

        }

        protected void btnSave_Click_Click(object sender, EventArgs e)
        {

            SqlConnection sql = new SqlConnection();
            sql.ConnectionString = ConfigurationManager.ConnectionStrings["testsql"].ConnectionString;

            SqlCommand sqlCommand = new SqlCommand("Update_Shoes", sql);
            sqlCommand.CommandType = CommandType.StoredProcedure;

            sqlCommand.Parameters.AddWithValue("@Id", Convert.ToInt32(IdShoes.Value));

            sqlCommand.Parameters.AddWithValue("@Name", txtName.Text);
            sqlCommand.Parameters.AddWithValue("@Title", txtTitle.Text);

            sql.Open();

            sqlCommand.ExecuteNonQuery();

            sql.Close();
            GetData();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel3.GetType(), "ShowAddDialog", "$('#divPopUp2').modal('toggle'); $('.modal-scrollable').appendTo('form1');", true);


        }

        protected void btnCreate1_Click1(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["testsql"].ConnectionString;
            connection.Open();

            if (TextBox1.Text != "" && TextBox2.Text != "")
            {
                SqlCommand cmd = new SqlCommand("Insert_Shoes", connection);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text.ToString());
                cmd.Parameters.AddWithValue("@Title", TextBox2.Text.ToString());

                cmd.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Insert thanh cong!!!");

            }
            else
            {
                MessageBox.Show("Khong the insert");

            }
            GetData();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetData();
        }

        private void Clear()
        {
            txtSname.Text = "";
            txtStitle.Text = "";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
            GetData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {


            if (txtSname.Text == "" && txtStitle.Text == "")
            {
                MessageBox.Show("Khong co du lieu duoc nhap vao!!!");
                GetData();

            }
            else
            {

                SqlConnection sql = new SqlConnection();
                sql.ConnectionString = ConfigurationManager.ConnectionStrings["testsql"].ConnectionString;

                sql.Open();
             
                SqlCommand cmd = new SqlCommand("Search_Shoes", sql);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Name", txtSname.Text.Trim());
                cmd.Parameters.AddWithValue("@Title", txtStitle.Text.Trim());                

                SqlDataAdapter adt = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                adt.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
                sql.Close();
            }
        }
    }

}


