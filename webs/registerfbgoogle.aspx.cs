using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_registerfbgoogle : System.Web.UI.Page
{
    /*資料參數*/
    string str_city;//city
    string str_country;//country
    string str_barcode;
    string str_email = "", str_password;
    string str_name, str_nickname;
    string str_phone, str_cellphone1, str_cellphone2;
    string str_counties, str_area, str_address, str_postalCode;
    string str_sex;
    string str_birthday;
    string str_img = "";
    string str_idcard;
    string member_id = "";
    string str_whereid;
    Boolean bol_okmail = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        //
        //TODO 頁面載入
        //

        if (Session["googleid"] != null)
        {
            selectgoogle();
        }
        else if (Session["fbid"] != null)
        {
            selectfb();
        }

        TextboxName();
        //取消使用UnobtrusiveValidationMode驗證
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }

    protected void Button13_Click1(object sender, EventArgs e)
    {
        //
        //TODO 按下按鈕時
        //



        if (bol_okmail)
        {
            string[] address = TextBox6.Text.Split('|'); ;
            str_postalCode = address[0];
            str_counties = address[1];
            str_area = address[2];
            Session["email"] = str_email;
            //產生一個Cookie物件
            HttpCookie cookie = new HttpCookie("useremail");
            //設定單值(這裡只能以字串的方式設定)
            cookie.Value = str_email;
            //cookie.Values.Add("test2", "shadow");
            //設定過期日(這裡只能針對全體cookie物件設定過期日)
            cookie.Expires = DateTime.Now.AddDays(2);
            //寫到用戶端
            Response.Cookies.Add(cookie);
            UpdateMember();
            SendMail();
            //Save_img();
            //Response.Write("<Script language='JavaScript'>alert('我跳！');</Script>");
            Response.Redirect("home.aspx");
        }


    }

    private void UpdateMember()
    {
        //
        //TODO 新增會員
        //

        //資料庫連結修改

        MySqlConnection msc_conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        msc_conn.Open();
        string update = "";
        if (Session["fbid"] != null)
        {
            update = "UPDATE `petkitchen`.`member` SET `barcode`='" + str_barcode + "', `email`='" + str_email + "', `password`='" + null + "', `name`='" + str_name + "', `nickname`='" + str_nickname + "', `phone`='" + str_phone + "', `cellphone1`='" + str_cellphone1 + "', `cellphone2`='" + str_cellphone2 + "', `birthday`='" + str_birthday + "', `sex`='" + str_sex + "', `img`='" + str_img + "', `postalCode`='" + str_postalCode + "', `counties`='" + str_counties + "', `area`='" + str_area + "', `address`='" + str_address + "', `fbid`='" + Session["fbid"].ToString() + "', `googleid`='" + null + "', `whereid`='fb', `condition`='False' WHERE `member_id`='" + member_id + "';";
        }
        else if (Session["googleid"] != null)
        {
            update = "UPDATE `petkitchen`.`member` SET `barcode`='" + str_barcode + "', `email`='" + str_email + "', `password`='" + null + "', `name`='" + str_name + "', `nickname`='" + str_nickname + "', `phone`='" + str_phone + "', `cellphone1`='" + str_cellphone1 + "', `cellphone2`='" + str_cellphone2 + "', `birthday`='" + str_birthday + "', `sex`='" + str_sex + "', `img`='" + str_img + "', `postalCode`='" + str_postalCode + "', `counties`='" + str_counties + "', `area`='" + str_area + "', `address`='" + str_address + "', `fbid`='" + null + "', `googleid`='" + Session["googleid"].ToString() + "', `whereid`='google', `condition`='False' WHERE `member_id`='" + member_id + "';";
        }
        MySqlCommand cmd = new MySqlCommand(update, msc_conn);

        cmd.ExecuteReader();

        msc_conn.Close();

    }

    private void TextboxName()
    {
        //
        //TODO 設定Textbox文字
        //
        str_barcode = "1-23-45-6789";
        str_name = TextBox1.Text;
        str_nickname = TextBox2.Text;
        str_phone = TextBox3.Text;
        str_cellphone1 = TextBox9.Text;
        str_cellphone2 = TextBox4.Text;
        str_birthday = TextBox5.Text;
        str_postalCode = TextBox6.Text;
        str_address = TextBox11.Text;


    }

    public void saveClick(Object o, EventArgs e)
    {
        if (Request["RadioButtonList1"].ToString() == "m")
        {
            str_sex = "男";
        }
        else if (Request["RadioButtonList1"].ToString() == "f")
        {
            str_sex = "女";
        }
        else if (Request["RadioButtonList1"].ToString() == "o")
        {
            str_sex = "其他";
        }
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
        MySmtp.Send("b11157123x@gmail.com", str_email, "C# 柚子私房菜認證信件", "點選下列網址進行認證\n" + "http://140.127.22.34:82/webs/registeremail.aspx?aa=" + member_id); MySmtp.Dispose();
    }

    public void selectfb()
    {
        string area = "";
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.member where fbid='" + Session["fbid"] + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();
        //將資料庫中資料存入陣列

        while (reader.Read())
        {
            TextBox1.Text = reader["name"].ToString();
            Image1.ImageUrl = reader["img"].ToString();
            str_img = reader["img"].ToString();
            member_id = reader["member_id"].ToString();
            str_whereid = reader["whereid"].ToString();
            area = reader["area"].ToString().Trim();
            str_email = reader["email"].ToString().Trim();
        }
        connStr.Close();
        if (!area.Equals(""))
        {
            Session["email"] = str_email;
            //產生一個Cookie物件
            HttpCookie cookie = new HttpCookie("useremail");
            //設定單值(這裡只能以字串的方式設定)
            cookie.Value = str_email;
            //cookie.Values.Add("test2", "shadow");
            //設定過期日(這裡只能針對全體cookie物件設定過期日)
            cookie.Expires = DateTime.Now.AddDays(2);
            //寫到用戶端
            Response.Cookies.Add(cookie);
            Response.Redirect("home.aspx");
        }

        str_email = TextBox10.Text;

        checkmail();
    }

    public void selectgoogle()
    {
        string area = "";
        Panel1.Controls.Clear();
        Label tx = new Label();
        tx.ID = "email";
        Panel1.Controls.Add(tx);
        Label tx_email = (Label)this.Panel1.FindControl("email");
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.member where googleid='" + Session["googleid"] + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();
        //將資料庫中資料存入陣列

        while (reader.Read())
        {
            TextBox1.Text = reader["name"].ToString();
            Image1.ImageUrl = reader["img"].ToString();
            str_img = reader["img"].ToString();
            member_id = reader["member_id"].ToString();
            tx_email.Text = reader["email"].ToString();
            str_whereid = reader["whereid"].ToString();
            area = reader["area"].ToString().Trim();
        }

        connStr.Close();
        str_email = tx_email.Text;

        if (!area.Equals(""))
        {
            Session["email"] = str_email;
            //產生一個Cookie物件
            HttpCookie cookie = new HttpCookie("useremail");
            //設定單值(這裡只能以字串的方式設定)
            cookie.Value = str_email;
            //cookie.Values.Add("test2", "shadow");
            //設定過期日(這裡只能針對全體cookie物件設定過期日)
            cookie.Expires = DateTime.Now.AddDays(2);
            //寫到用戶端
            Response.Cookies.Add(cookie);
            Response.Redirect("home.aspx");
        }
        checkmail();

    }
    public void checkmail()
    {
        int i = 0;
        bol_okmail = true;
        string str_checkid;
        string str_checkwhere = "";
        if (!str_email.Equals(""))
        {
            MySqlDataReader reader;
            MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
            String select = "SELECT * FROM petkitchen.member where email='" + str_email + "';";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            reader = cmd.ExecuteReader();
            //將資料庫中資料存入陣列
            while (reader.Read())
            {
                i = i + 1;
                str_checkid = reader["member_id"].ToString().Trim();
                str_checkwhere = reader["whereid"].ToString().Trim();
            }
            connStr.Close();
            //Response.Write("<Script language='JavaScript'>alert('111111111！');</Script>");
            if (i != 0)
            {
                //Response.Write("<Script language='JavaScript'>alert('2222222！');</Script>");
                bol_okmail = false;
                if (!str_whereid.Equals(str_checkwhere))
                {
                    if (str_whereid.Equals("fb"))
                    {
                        TextBox10.Text = "";
                        Response.Write("<Script language='JavaScript'>alert('此信箱"+ str_email + "已註冊！');</Script>");

                    }
                    /*else if (str_whereid.Equals("google"))
                    {
                        //Response.Redirect("login.aspx");
                        Response.Write("<Script language='JavaScript'>alert('333333！');</Script>");
                    }*/
                    //Response.Write("<Script language='JavaScript'>alert('此信箱已註冊！');</Script>");
                }
                else if (str_whereid.Equals(str_checkwhere) && i == 1)
                {
                    bol_okmail = true;
                    //Response.Write("<Script language='JavaScript'>alert('444444！');</Script>");
                }
                else
                {
                    delete();
                    Session["second"] = "2";
                   // Response.Write("<Script language='JavaScript'>alert('此信箱已註冊22！');</Script>");
                    Response.Redirect("login.aspx");
                }
            }
           
        }

    }
    public void delete()
    {
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "DELETE FROM `petkitchen`.`member` WHERE `member_id`='" + member_id + "';";

        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        cmd.ExecuteReader();

        connStr.Close();
    }

}