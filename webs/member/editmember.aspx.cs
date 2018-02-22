using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_member_editmember : System.Web.UI.Page
{
    int i = 0;
    string member_id = "";
    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //
        HttpCookie cookie = Request.Cookies["useremail"];
        if (Request.Cookies["useremail"] != null)
        {
            int k = 0;
            //連線到MySql資料庫
            MySqlDataReader reader;
            MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
            //String id = Request.QueryString["member"];
            //String select = "SELECT * FROM petkitchen.member where member_id = @id";
            String select = "SELECT * FROM petkitchen.member where email ='" + cookie.Value.ToString() + "';";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
           // cmd.Parameters.AddWithValue("@id", id);
            reader = cmd.ExecuteReader();

            //將資料庫中資料存入陣列
            while (reader.Read())
            {
                k = 1;
                Label1.Text = "您好," + reader["nickname"].ToString();
                member_id = reader["member_id"].ToString();
                Label3.Text = reader["name"].ToString();
                Label4.Text = reader["email"].ToString();
                TextBox1.Text = reader["cellphone1"].ToString();
                TextBox2.Text = reader["birthday"].ToString();
                TextBox3.Text = reader["postalCode"].ToString();
                TextBox4.Text = reader["counties"].ToString();
                TextBox5.Text = reader["area"].ToString();
                TextBox6.Text = reader["address"].ToString();

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
            if (k == 1)
            {
                Label12.Text = "登出";
            }
        }
        }

    private void update()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        /*更新*/
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        //String id = Request.QueryString["member"];
        string update = string.Format("update member set cellphone1='{0}', birthday='{1}', postalCode='{2}', counties='{3}', area='{4}', address='{5}' where email ='" + cookie.Value.ToString() + "';", TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text);
        MySqlCommand updateCmd = new MySqlCommand(update, connStr);
        //updateCmd.Parameters.AddWithValue("@id", member_id);
        updateCmd.Connection = connStr;
        //執行更新
        updateCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["useremail"].Value == "")
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

    protected void Button8_Click(object sender, EventArgs e)
    {
        update();
       
            Response.Redirect("member.aspx");

     

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       

        Response.Redirect("member.aspx");



    }
}