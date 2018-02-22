using System;
using System.Collections.Generic;
using System.IO;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Collections;

using com.google.zxing.qrcode;
using com.google.zxing.common;
using com.google.zxing;

using System.Drawing;
using ByteMatrix = com.google.zxing.common.ByteMatrix;
using System.Drawing.Imaging;
using System.Web;

//客製化新增
public partial class webs_fodder : System.Web.UI.Page
{
    /*資料參數*/
    string str_fileName;  //名字
    string str_demand;    //需求
    int int_fat = 1;       //熱量
    int int_protein = 1;   //蛋白
    int int_carbohydrate = 1; //脂肪
    int int_price = 120;     //價錢
    string fodder_id;
    int int_img;//照片代號 
    public ArrayList str_special = new ArrayList(); //特殊需求
    int int_special ;//特殊需求的數量
    double parameter;
    string str;

    /*QRcode參數*/
    string code= "https://www.youtube.com/watch+"+"?v=RgKAFK5djSk"; //QRCode資料
    int QRheight = 300; //圖形高
    int QRwidth = 300; // 圖形寬

   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["useremail"].Value == "")
        {
            Response.Write("<script>alert('請先登入');location.href='/webs/nologinhome.aspx';</script>");

        }
        else
        {
            mamberData();
          

            
            //str_memberid = Session["str_memberid"].ToString();

          
           


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

    protected void Button8_Click1(object sender, EventArgs e)
    {
        //
        //TODO 上傳檔案時執行的事件
        //
        
      //  QrcodeSaver(code);
     
        
      //  Formula(0,0,0);
        Response.Redirect("~/webs/fodder/foddermodify.aspx");
       
    }



    private void formula()
    {
        try
        {
            //
            //TODO 新增客製化飼料包
            //
            Demand();
            str = TextBox1.Text;
           
            String pet_id = Request.QueryString["pet_id"];
            HttpCookie cookie = Request.Cookies["useremail"];
            MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
            String select = "INSERT INTO fodder (pet_id,email,formula) VALUES ('"+ pet_id + "','" + cookie.Value.ToString() + "','" + str + "') ";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            cmd.ExecuteNonQuery();
            connStr.Close();

        }
        catch (Exception ex)
        {
            //Label1.Text = ex.Message;
        }
    }

    private void date()
    {
        //
        //TODO 查詢客製化飼料
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.fodder where formula='" + str + "'";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            fodder_id = reader["fodder_id"].ToString().Trim();

        }
        connStr.Close();
    }

    private void Demand()
    {
        //
        //TODO 抓div
        //

        String[] special = TextBox1.Text.Split(',');



        for (int i = 0; i < special.Length; i++)
        {

            if (str_special.IndexOf(special[i]) == -1)//重複
            {
                str_special.Add(special[i]);//新增
            }
            else
            {
                str_special.Remove(special[i]);//刪除
            }
        }

        str_special.Sort();

        TextBox1.Text = str_special[0].ToString();

        for (int i = 1; i < str_special.Count; i++)
        {
            TextBox1.Text = TextBox1.Text + str_special[i] + ",";
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        formula();
        date();
        Response.Redirect("~/webs/fodder/foddermodify.aspx?fodder_id=" + fodder_id);
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        formula();
        date();
        Response.Redirect("~/webs/fodder/foddermodify.aspx?fodder_id=" + fodder_id);
    }

    private void Formula(int date, int weight, int ligation)
        {
        /*
         * 特殊需求公式
         * date     生長日期
         * weight   體重
         * ligation 結紮
         */            
        date =0;
        switch (date)
        {
            case 0://3個月內1.4
                parameter = 1.4;
                break;
            case 1://3個月內1.2
                parameter = 1.2;
                break;
            case 2://3個月內1.1
                parameter = 1.1;
                break;
            case 3://3個月內1
                parameter = 1;
                break;
            case 4://3個月內0.95
                parameter = 0.95;
                break;
            case 5://3個月內0.9
                parameter = 0.9;
                break;          
        }
        switch (weight)
        {
            case 0://過瘦1.2
                parameter = parameter*1.2;
                break;
            case 1://瘦1.1
                parameter = parameter * 1.1;
                break;
            case 2://適中1.

                break;
            case 3://過重0.95
                parameter = parameter * 0.95;
                break;
            case 4://肥胖0.9
                parameter = parameter * 0.9;
                break;        
        }
        switch (ligation)
        {
            case 0://結紮0.95
                parameter = parameter * 0.95;
                break;
            case 1://正常1
                break;
        }
       
    }
   
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/webs/fodder/fodder_pet.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/webs/fodder/foddernext.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/webs/mypet/petmanager.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/webs/member/member.aspx");
    }
    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //
        HttpCookie cookie = Request.Cookies["useremail"];
        if (Request.Cookies["useremail"] != null)
        {
            int i = 0;
            //連線到MySql資料庫
            MySqlDataReader reader;
            MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
            //String id = Request.QueryString["member"];
            String select = "SELECT * FROM petkitchen.member where email ='" + cookie.Value.ToString() + "';";
            // String select = "SELECT * FROM petkitchen.member where member_id = @id";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            //cmd.Parameters.AddWithValue("@id", id);
            reader = cmd.ExecuteReader();

            //將資料庫中資料存入陣列
            while (reader.Read())
            {
                i = 1;
                Label3.Text = "您好," + reader["nickname"].ToString();
                if (reader["img"] == null)
                {
                    Image2.ImageUrl = "~/img/head.png";
                }
                else
                {
                    Image2.ImageUrl = reader["img"].ToString();
                }

            }
            connStr.Close();
           
        }
    }



   
}