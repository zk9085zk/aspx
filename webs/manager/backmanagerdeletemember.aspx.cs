using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_backmanagerdeletemember : System.Web.UI.Page
{
    private void search()
    {
        /*搜尋*/

        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
        String email = Request.QueryString["email"];
        String name = Request.QueryString["name"];
        String sql = "SELECT * FROM member where email = @email or name = @name";

        MySqlCommand cmd = new MySqlCommand(sql, connStr);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@name", name);
        reader = cmd.ExecuteReader();


        while (reader.Read())
        {

            Label4.Text = "姓名：" + reader["name"].ToString();
            Label3.Text = "信箱：" + reader["email"].ToString();
            Label5.Text = "密碼：" + reader["password"].ToString();
            Label6.Text = "手機：" + reader["cellphone1"].ToString();
            Label7.Text = "生日：" + reader["birthday"].ToString();
            Label8.Text = "性別：" + reader["sex"].ToString();
            Label9.Text = "地址：" + reader["postalCode"].ToString() + reader["counties"].ToString() + reader["address"].ToString();
            Label10.Text = "帳號來自於：" + reader["whereid"].ToString();
            Image2.ImageUrl = reader["img"].ToString();


        }
        connStr.Close();
    }

    private void delete()
    {
        /*刪除*/
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        String email = Request.QueryString["email"];
        String name = Request.QueryString["name"];
        string delete = string.Format("DELETE FROM member WHERE email = @email or name = @name ");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Parameters.AddWithValue("@email", email);
        deleteCmd.Parameters.AddWithValue("@name", name);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            search();
        }
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagerdeletemember.aspx?email=" + TextBox1.Text + "&name=" + TextBox2.Text);

    }

    protected void Button14_Click(object sender, EventArgs e)
    {
        delete();
        Response.Redirect("backmanagerdeletemember.aspx");

    }
}