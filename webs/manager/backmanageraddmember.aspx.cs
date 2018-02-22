using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.IO;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.Security;

public partial class webs_backmanageraddmember : System.Web.UI.Page
{
    /*資料參數*/
    string str_city;//city
    string str_country;//country
    string str_barcode;
    string str_email, str_password;
    string str_name, str_nickname;
    string str_phone, str_cellphone1, str_cellphone2;
    string str_counties, str_area, str_address, str_postalCode;
    string str_sex;
    string str_birthday;
    string str_img = "";
    string str_getId;

    protected void Page_Load(object sender, EventArgs e)
    {
        //
        //TODO 頁面載入
        //
        TextboxName();

    }



    protected void Button13_Click1(object sender, EventArgs e)
    {
        //
        //TODO 按下按鈕時
        //
        //checkmail();
        string[] address = TextBox6.Text.Split('|'); ;
        str_postalCode = address[0];
        str_counties = address[1];
        str_area = address[2];
        Session["email"] = str_email;
        //Response.Write("<Script language='JavaScript'>alert('Y2J測試！');</Script>");
        AddMember();
        //Save_img();
        SendMail();
        Response.Redirect("/webs/manager/backmanageraddmember.aspx");
    }
    protected void Button14_Click1(object sender, EventArgs e)
    {
        Response.Redirect("/webs/manager/backmanagerbillboard.aspx");
    }

    private void Save_img()
    {
        //
        //TODO 儲存圖片
        //

        //if (FileUpload1.HasFile == false) return;
        string filename = FileUpload1.FileName;
        string extension = Path.GetExtension(filename).ToLowerInvariant();
        // 判斷是否為允許上傳的檔案附檔名
        List<string> allowedExtextsion = new List<string> { ".jpg", ".bmp" };
        if (allowedExtextsion.IndexOf(extension) == -1)
        {
            Label1.Text = "不允許該檔案上傳";
            return;
        }

        // 限制檔案大小，限制為 2MB
        int filesize = FileUpload1.PostedFile.ContentLength;
        if (filesize > 2100000)
        {
            Label1.Text = "檔案大小上限為 2MB，該檔案無法上傳";
            return;
        }

        // 檢查 Server 上該資料夾是否存在，不存在就自動建立
        //string serverDir = @"~/img";
        String serverDir = Server.MapPath("~/img");
        if (Directory.Exists(serverDir) == false) Directory.CreateDirectory(serverDir);
        string serverFilePath = Path.Combine(serverDir, filename);
        string fileNameOnly = Path.GetFileNameWithoutExtension(filename);
        int fileCount = 1;

        // 如有重複檔案重新命名
        while (File.Exists(serverFilePath))
        {
            filename = string.Concat(fileNameOnly, "_", fileCount, extension);
            serverFilePath = Path.Combine(serverDir, filename);
            fileCount++;
        }

        // 把檔案存入指定的路徑
        try
        {
            FileUpload1.SaveAs(serverFilePath);
            Label1.Text = "檔案上傳成功";
            Image1.ImageUrl = "~/img/" + filename;
            str_img = "~/img/" + filename;
            //textnull();
            AddMember();
            Response.Redirect("register.aspx");

        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }

    private void AddMember()
    {
        //
        //TODO 新增會員
        //

        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "INSERT INTO `petkitchen`.`member` ( `barcode`, `email`, `password`, `name`, `nickname`, `phone`, `cellphone1`, `cellphone2`, `birthday`, `sex`, `img`, `postalCode`, `counties`, `area`, `address`, `fbid`, `googleid`, `whereid`, `condition`) VALUES ('" + str_barcode + "', '" + str_email + "', '" + str_password + "', '" + str_name + "', '" + str_nickname + "', '" + str_phone + "', '" + str_cellphone1 + "', '" + str_cellphone2 + "', '" + str_birthday + "', '" + str_sex + "', '" + null + "', '" + str_postalCode + "', '" + str_counties + "', '" + str_area + "', '" + str_address + "', '" + null + "', '" + null + "', '" + "general" + "', '" + "False" + "');";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        cmd.ExecuteNonQuery();
        connStr.Close();
        connStr.Dispose();
    }

    private void TextboxName()
    {
        //
        //TODO 設定Textbox文字
        //

        str_barcode = "1-23-45-6789";
        str_email = TextBox10.Text;
        str_password = TextBox12.Text;
        str_name = TextBox1.Text;
        str_nickname = TextBox2.Text;
        str_phone = TextBox3.Text;
        str_cellphone1 = TextBox9.Text;
        str_cellphone2 = TextBox4.Text;
        str_birthday = TextBox5.Text;
        str_address = TextBox11.Text;
        str_sex = TextBox10.Text;

    }

    public void SendMail()
    {
        select();
        //建立 SmtpClient 物件 並設定 Gmail的smtp主機及Port  
        System.Net.Mail.SmtpClient MySmtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);

        //設定你的帳號密碼
        MySmtp.Credentials = new System.Net.NetworkCredential("b11157123x@gmail.com", "boy37201");

        //Gmial 的 smtp 必需要使用 SSL
        MySmtp.EnableSsl = true;

        //發送Email
        MySmtp.Send("b11157123x@gmail.com", str_email, "C# 柚子私房菜認證信件", "點選下列網址進行認證\n" + "http://140.127.22.34:82/webs/registeremail.aspx?aa=" + str_getId); MySmtp.Dispose();
        Session["email"] = str_email;
    }

    public void select()
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
            str_getId = reader["member_id"].ToString();
        }

        connStr.Close();
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

    /* public void checkmail()
     {
         int i = 0;
         MySqlDataReader reader;
         MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
         String select = "SELECT * FROM petkitchen.member where email='" + str_email + "';";
         connStr.Open();
         MySqlCommand cmd = new MySqlCommand(select, connStr);
         reader = cmd.ExecuteReader();
         while (reader.Read())
         {
             i = i + 1;
             str_checkwhere = reader["whereid"].ToString().Trim();
         }
         connStr.Close();
     }*/
}