using com.google.zxing;
using com.google.zxing.common;
using com.google.zxing.qrcode;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_fodder_fodder_finish : System.Web.UI.Page
{
    string code;
    int QRheight = 300; //圖形高
    int QRwidth = 300; // 圖形寬

    protected void Page_Load(object sender, EventArgs e)
    {

      

        if (Request.Cookies["useremail"].Value == "")
        {
            Response.Write("<script>alert('請先登入');location.href='nologinhome.aspx';</script>");

        }
        else
        {
            mamberData();
            string id = Request.QueryString["id"];
            code = "140.127.22.42/webs/fodder/fodder_phone.aspx?id="+ id;
            QrcodeSaver(code);
            Image2.ImageUrl = "/qrcodeimgs/aa2a.jpg";
            Label3.Text = "您的客製化飼料包已完成，如需購買請至歷史菜單。";
                
           
        }
    }

    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //

        HttpCookie cookie = Request.Cookies["useremail"];

        // Response.Write("顯示cookie物件的單值(cookie.Value)：" + cookie.Value + "<hr/>");

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        if (Request.Cookies["useremail"] != null)
        {

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
    }

    private void QrcodeSaver(string data)
    {
        //
        //TODO: 將資料儲存成QRCode
        //

        //設定字元編碼
        Hashtable hints = new Hashtable();
        hints.Add(EncodeHintType.CHARACTER_SET, "UTF-8");

        //產生QRCode
        ByteMatrix bm = new QRCodeWriter().encode(data, BarcodeFormat.QR_CODE, QRwidth, QRheight, hints);
        Bitmap bp = bm.ToBitmap();

        //儲存QRCode檔案
        bp.Save(Server.MapPath("/qrcodeimgs/aa2a.jpg"));

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/webs/fodder/foddernext.aspx");
    }
   
}