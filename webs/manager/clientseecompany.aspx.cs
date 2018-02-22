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

public partial class webs_manager_clientseecompany : System.Web.UI.Page
{
    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        /*
         
        String select = "SELECT * FROM petkitchen.member where email='" + Session["email"].ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
                    Label1.Text = reader["nickname"].ToString();
                    Image1.ImageUrl = reader["img"].ToString();
        }
        connStr.Close();
        
        */

        //顯示公告


        connStr.Open();
        String search = Request.QueryString["id"];
        String sql = "SELECT * FROM petkitchen.companymessage where client_id = @id";

        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);
        cmd2.Parameters.AddWithValue("@id", search);
        reader = cmd2.ExecuteReader();


        while (reader.Read())
        {

            Label4.Text = reader["time"].ToString();
            Label8.Text = reader["title"].ToString();
            Label10.Text = reader["content"].ToString();

        }
        connStr.Close();

    }

    private void mamber()
    {
        //
        //TODO 連線到資料庫
        //
        HttpCookie cookie = Request.Cookies["useremail"];
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        String select = "SELECT * FROM petkitchen.member where email='" + cookie.Value.ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            Label1.Text = "您好," + reader["nickname"].ToString();
            if (reader["img"] == null)
            {
                Image1.ImageUrl = "~/img/head.png";
            }
            else
            {
                Image1.ImageUrl = reader["img"].ToString();
            }
        }
        connStr.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

      //  if (!Page.IsPostBack)
     //   {
            mamberData();
        mamber();
       // }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Redirect("/webs/info/askme.aspx");
    }
}