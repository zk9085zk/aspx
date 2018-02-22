using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_companymessage : System.Web.UI.Page
{
    private string account;

   

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    private void insert()
    {


        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
        string id = Request.QueryString["id"];
        account = Request.QueryString["account"];
        String AddNew = string.Format("INSERT INTO companymessage(account, title, content ,time,client_id) VALUES('{0}','{1}','{2}','{3}','{4}')", account, TextBox1.Text, CKEditorControl1.Text, DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"), id);
        MySqlCommand AddNewCmd = new MySqlCommand(AddNew, connStr);
        AddNewCmd.Connection = connStr;
        //執行新增
        AddNewCmd.ExecuteNonQuery();

        connStr.Close();
    }

    

    protected void Button15_Click(object sender, EventArgs e)
    {
    
        insert();
        SendMail();
        Response.Redirect("/webs/manager/content.aspx");
    }

    protected void Button11_Click(object sender, EventArgs e)
    {
        Response.Redirect("/webs/manager/content.aspx");
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
        MySmtp.Send("b11157123x@gmail.com", account, "寵物廚房回覆留言", CKEditorControl1.Text+ "\n\n\n\n" + "注意：本郵件是由寵物廚房系統客服回覆，請勿直接回覆"); MySmtp.Dispose();

    }
}