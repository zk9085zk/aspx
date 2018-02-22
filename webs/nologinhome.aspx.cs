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

public partial class webs_nologinhome : System.Web.UI.Page
{

    string test;
    string str_googleid, str_googlename, str_googleemail, str_googleimg;
    string str_fbid, str_fbname, str_fbemail, str_fbimg;
    Boolean clickfb = true;
    string[] str_petname = new string[100];//商品名稱
    string[] str_commodity = new string[100];//名字
    string[] str_memberid = new string[100];//ID
    string[] str_img = new string[100];//圖片
    int int_pet = 0;//寵物數量
    string password = "";
    string email = "";
    string id = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["second"] != null)
        {
            Response.Write("<Script language='JavaScript'>alert('此信箱已註冊！');</Script>");
            Session["second"] = null;
        }
        if (Session["user"] != null)
        {
            Application["email"] = "";
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
        SelectPet();
        DynamicPetObject();
    }

    protected void Button1_Click(object sender, EventArgs e)
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
        String select = "SELECT * FROM petkitchen.member where email='" + TextBox1.Text.Trim() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
      
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

            if (TextBox2.Text.Equals(password))
            {
                FormsAuthentication.RedirectFromLoginPage(email, true);
               // Session["email"] = email;
              //  Application["email"] = email;
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

                if (id=="1")
                {
                   
                    Response.Redirect("/webs/manager/backmanagerbillboard.aspx");
                   
                }
                else
                {
                    Response.Redirect("/webs/home.aspx");
                   
                }
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
            string select = "INSERT INTO `petkitchen`.`member` (`email`, `name`, `img`, `googleid`, `whereid`, `condition`) VALUES ('" + email + "', '" + name + "', '" + img + "', '" + id + "', 'google', 'False');";
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


    private void SelectPet()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.commodity;";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            str_memberid[int_pet] = reader["id"].ToString().Trim();
            str_petname[int_pet] = reader["discount"].ToString().Trim();
            str_commodity[int_pet] = reader["commodity"].ToString().Trim();
            str_img[int_pet] = reader["photourl"].ToString().Trim();

            int_pet++;
        }
        connStr.Close();
    }
    private void DynamicPetObject()
    {
        //
        //TODO 動態生成寵物選擇物件
        //

        for (int i = 0; i < int_pet; i++)
        {

            logoutcommodity civ_item = new logoutcommodity();
            civ_item.int_gd = 3;
            civ_item.str_name = str_petname[i];
            civ_item.str_imgurl = str_img[i];
            civ_item.srt_commodity = str_commodity[i];
            civ_item.init();
            //   civ_item._btn_img.ID = i.ToString().Trim();
            //  civ_item._btn_img.Click +=_btn_img_Click;
            civ_item._btn_choice.ID = i.ToString().Trim();//ID
            civ_item._btn_choice.Click += _btn_choice_Click;//事件
            UpdatePanel1.ContentTemplateContainer.Controls.Add(civ_item);

        }
    }
    private void _btn_choice_Click(object sender, EventArgs e)
    {
        //
        //TODO 選擇按鈕按下時
        //

        for (int i = 0; i < int_pet; i++)
        {

            if (((LinkButton)sender).ID == i.ToString().Trim())
            {
                //Session["email"] = email;
               // Application["email"] = email;
                Response.Redirect("commodity2.aspx?id=" + str_memberid[i]);
            }
        }
    }


    protected void CKEditorControl1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            TextBox4.Text = CKEditorControl1.Text;
            TextBox5.Text = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
            insert();
            SendMail();
           
            Response.AddHeader("Refresh", "0");
        }
        catch
        {

        }
    }
    private void insert()
    {


        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        String AddNew = string.Format("INSERT INTO clientmessages(account,title ,content ,time) VALUES('{0}','{1}','{2}','{3}')", TextBox3.Text, TextBox6.Text, TextBox4.Text, TextBox5.Text);
        MySqlCommand AddNewCmd = new MySqlCommand(AddNew, connStr);
        AddNewCmd.Connection = connStr;
        //執行新增
        AddNewCmd.ExecuteNonQuery();
        connStr.Close();
    }

    public void SendMail()
    {
       
        //建立 SmtpClient 物件 並設定 Gmail的smtp主機及Port  
        System.Net.Mail.SmtpClient MySmtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);

        //設定你的帳號密碼
        MySmtp.Credentials = new System.Net.NetworkCredential("b11157123x@gmail.com", "boy37201");

        //Gmial 的 smtp 必需要使用 SSL
        MySmtp.EnableSsl = true;

        //發送Email
        MySmtp.Send("b11157123x@gmail.com", TextBox3.Text, "寵物廚房留言",  "您的留言對我們來說非常重要，我們會盡快回覆您的. \n" + "\n\n\n\n" + "注意：本郵件是由寵物廚房系統自動產生與發送，請勿直接回覆"); MySmtp.Dispose();
        TextBox3.Text = "";
        TextBox6.Text = "";
        CKEditorControl1.Text = "";
    }
}