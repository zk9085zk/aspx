using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_member : System.Web.UI.Page
{

    string email;

    protected void Page_Load(object sender, EventArgs e)
    {

        check();
        if (email ==null)
        {
            Response.Write("<script>alert('請先登入');location.href='/webs/nologinhome.aspx';</script>");

        }
        else
        {

            mamberData();

        }
    }

    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //
      
            int i = 0;
            //連線到MySql資料庫
            MySqlDataReader reader;
            MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
            //String id = Request.QueryString["member"];
            String select = "SELECT * FROM petkitchen.member where email ='" + email + "';";
           // String select = "SELECT * FROM petkitchen.member where member_id = @id";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            //cmd.Parameters.AddWithValue("@id", id);
            reader = cmd.ExecuteReader();

            //將資料庫中資料存入陣列
            while (reader.Read())
            {
                
                email= reader["email"].ToString();
                Label1.Text = "您好," + reader["nickname"].ToString();
                Label3.Text = reader["name"].ToString();
                Label4.Text = reader["email"].ToString();
                Label5.Text = reader["cellphone1"].ToString();
                Label6.Text = reader["birthday"].ToString();
                Label7.Text = reader["postalCode"].ToString();
                Label8.Text = reader["counties"].ToString();
                Label16.Text = reader["area"].ToString();
                Label18.Text = reader["address"].ToString();
                if (reader["img"] == null)
                {
                    Image1.ImageUrl = "~/img/head.png";
                }
                else {
                    Image1.ImageUrl = reader["img"].ToString();
                }
                   
            }
            connStr.Close();
           
      

    }

    private void check()
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

           
            email = reader["email"].ToString();
           
        }
        connStr.Close();


    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("editmember.aspx?");
    }
}