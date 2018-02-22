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

public partial class webs_billboard : System.Web.UI.Page
{
    string email;
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
        String sql = "SELECT * FROM petkitchen.billboard where id = @id";

        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);
        cmd2.Parameters.AddWithValue("@id", search);
        reader = cmd2.ExecuteReader();


        while (reader.Read())
        {

            Label4.Text = DateTime.Parse(reader["time"].ToString()).ToString("yyyy/MM/dd");
            Label6.Text = reader["sort"].ToString();
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

        // Response.Write("顯示cookie物件的單值(cookie.Value)：" + cookie.Value + "<hr/>");

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
            email = reader["email"].ToString();
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
        mamber();
        if (email == null)
        {
            Response.Write("<script>alert('請先登入');location.href='/webs/nologinhome.aspx';</script>");
        }
        else
        {
            if (!Page.IsPostBack)
            {
                mamberData();
               
            }
        }
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("home.aspx" );
    }

   
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("purchase.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("fodder_pet.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {

    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("member.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {

    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("re_member.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("member.aspx");
    }


   
}