using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_backmanagerupdatemember : System.Web.UI.Page
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

            Label1.Text = "姓名：" + reader["name"].ToString();
            Label3.Text = "帳號：" + reader["email"].ToString();
            Label15.Text = "手機：" + reader["cellphone1"].ToString();
            Label17.Text = "信箱：" + reader["email"].ToString();
            Label19.Text = "地址：" + reader["address"].ToString(); 
            Image2.ImageUrl = reader["img"].ToString();

            Image4.ImageUrl = reader["img"].ToString();
            TextBox3.Text= reader["name"].ToString();
            TextBox5.Text = reader["cellphone1"].ToString();
            TextBox4.Text = reader["email"].ToString();
            TextBox6.Text = reader["address"].ToString();
        }
        connStr.Close();
    }

    private void update()
    {
        /*更新*/
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        String email = Request.QueryString["email"];
        String name = Request.QueryString["name"];
        string update = string.Format("update member set name='{0}', cellphone1='{1}', email='{2}', address='{3}' where email=@email or name=@name", TextBox3.Text, TextBox5.Text, TextBox4.Text, TextBox6.Text);
        MySqlCommand updateCmd = new MySqlCommand(update, connStr);
        updateCmd.Parameters.AddWithValue("@email", email);
        updateCmd.Parameters.AddWithValue("@name", name);
        updateCmd.Connection = connStr;
        //執行更新
        updateCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            search();
        }
    }

    protected void Button15_Click(object sender, EventArgs e)
    {
        update();
        Response.Redirect("/webs/manager/backmanagerupdatemember.aspx?email=" + TextBox4.Text + "&name=" + TextBox3.Text);
    }

    protected void Button16_Click(object sender, EventArgs e)
    {
        Response.Redirect("/webs/manager/backmanagerupdatemember.aspx");

    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagerupdatemember.aspx?email=" + TextBox1.Text + "&name=" + TextBox2.Text);
    }
}