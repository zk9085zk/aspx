using Facebook;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_companyseeclient : System.Web.UI.Page
{
    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);


        //顯示公告


        connStr.Open();
        String search = Request.QueryString["id"];
        String sql = "SELECT * FROM petkitchen.clientmessages where reply_id = @id";

        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);
        cmd2.Parameters.AddWithValue("@id", search);
        reader = cmd2.ExecuteReader();


        while (reader.Read())
        {
            Label6.Text= reader["account"].ToString();
            Label4.Text = reader["time"].ToString();
            Label8.Text = reader["title"].ToString();
            Label10.Text = reader["content"].ToString();

        }
        connStr.Close();

    }



    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            mamberData();
        }

        if (Session["email"] != null)
        {
            Label2.Text = "登出";
            mamberData();
            // Label3.Text = Session["fbid"].ToString();
        }
        else
        {
            Label2.Text = "登入";
            // Label3.Text = "null";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Redirect("/webs/manager/content.aspx");
    }
}