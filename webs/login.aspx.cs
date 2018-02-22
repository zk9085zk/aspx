using ASPSnippets.GoogleAPI;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using FacebookLoginASPnetWebForms.Models;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;
using System.Threading;

public partial class webs_login : System.Web.UI.Page
{
    string test;
    string str_googleid, str_googlename, str_googleemail, str_googleimg;
    string str_fbid, str_fbname, str_fbemail, str_fbimg;
    Boolean clickfb = true;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["second"] != null) {
            Response.Write("<Script language='JavaScript'>alert('此信箱已註冊！');</Script>");
            Session["second"] = null;
        }
        if (Session["user"] != null)
        {
            HttpCookie cookie = new HttpCookie("useremail");
            //設定單值(這裡只能以字串的方式設定)
            cookie.Value = "";
            //cookie.Values.Add("test2", "shadow");
            //設定過期日(這裡只能針對全體cookie物件設定過期日)
            // cookie.Expires = DateTime.Now.AddDays(2);
            //寫到用戶端
            Response.Cookies.Add(cookie);
            Session["user"] = null;
        }
        }


    protected void Button8_Click(object sender, EventArgs e)
    {

        Login();

    }

    private void Login()
    {
        //
        //TODO 新增會員
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.member where email='" + TextBox5.Text.Trim() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        string password = "";
        string email = "";
        string id = "";
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            email = reader["email"].ToString().Trim();
            password = reader["password"].ToString().Trim();
            id = reader["member_id"].ToString().Trim();

        }
       

        if (email != "")
        {

            if (TextBox6.Text.Equals(password))
            {
                FormsAuthentication.RedirectFromLoginPage(email, true);
                Session["email"] = email;
                //產生一個Cookie物件
                HttpCookie cookie = new HttpCookie("useremail");
                //設定單值(這裡只能以字串的方式設定)
                cookie.Value = email;
                //cookie.Values.Add("test2", "shadow");
                //設定過期日(這裡只能針對全體cookie物件設定過期日)
                cookie.Expires = DateTime.Now.AddDays(2);
                //寫到用戶端
                Response.Cookies.Add(cookie);
              //  Session["isLogin"] = true;        //驗證登入
                Response.Redirect("home.aspx");
                // Response.Redirect("home.aspx?member=" + id);
                
            }
            else
            {
                Label1.Text = "密碼輸入錯誤";
            }
        }
        else
        {
            Label1.Text = "帳號輸入錯誤";
        }
        connStr.Close();


    }

    [WebMethod]
    public static string google(string name, string id, string email, string img)
    {
      
        HttpContext.Current.Session["googleid"] = id;
        int i = 0;
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        string search = "SELECT * FROM petkitchen.member where googleid='" + id + "'";
        connStr.Open();
        MySqlCommand inn = new MySqlCommand(search, connStr);
        reader = inn.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            i = i + 1;
        }
        connStr.Close();

        if (i == 0)
        {
            string select = "INSERT INTO `petkitchen`.`member` (`email`, `name`, `img`, `googleid`, `whereid`, `condition`) VALUES ('" + email+"', '"+name+"', '"+img+"', '"+id+"', 'google', 'False');";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            cmd.ExecuteNonQuery();
            connStr.Close();
            connStr.Dispose();
        }
        return id;
    }

    [WebMethod]
    public static string fb(string name, string id, string img)
    {

        HttpContext.Current.Session["fbid"] = id;
        int i = 0;
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        string search = "SELECT * FROM petkitchen.member where fbid='" + id + "'";
        connStr.Open();
        MySqlCommand inn = new MySqlCommand(search, connStr);
        reader = inn.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            i = i + 1;
        }
        connStr.Close();

        if (i == 0)
        {
            string select = "INSERT INTO `petkitchen`.`member` ( `name`, `img`, `fbid`, `whereid`, `condition`) VALUES ('" + name + "', '" + img + "', '" + id + "', 'fb', 'False');";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            cmd.ExecuteNonQuery();
            connStr.Close();
            connStr.Dispose();
        }
        return id;
    }

}



