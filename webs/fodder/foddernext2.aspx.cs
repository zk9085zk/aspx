using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Collections;
using com.google.zxing;
using com.google.zxing.common;
using com.google.zxing.qrcode;
using System.Drawing;

public partial class webs_fodder_foddernext2 : System.Web.UI.Page
{
    string str_petweight;
    string str_fooddername;
    string str_petname;
    string str_subspecies;
    string str_price;
    string str_species;
    string srt_weight;
    string str_fodderweight;
    string str_ligation;
    string str_haircolor;
    string str_hairstyle;
    string str_birthday;
    string str_allergens;
    string protein;
    string heat;
    string fiber;
    string calcium;
    string vitamins;


    string code;
    int QRheight = 120; //圖形高
    int QRwidth = 120; // 圖形寬


    string[] str_allergensItemArray = { "增加體重", "肥胖代謝", "血糖管理", "腎臟護理", "心臟保養", "泌尿道保養", "關節保養", "消化護理", "視力保健", "皮膚修護", "毛髮亮澤", "環境除臭" };
    string[] str_allergensSplitArray = new string[100];
    int int_allergensSplitArrayItem;
    string str_allergensShow;
    string str;
    string name;
    int quantity;
    int price;
    string photourl;
    string total;
    private static int i = 0;
    string id;
    string test;
    string aa;

    protected void Page_Load(object sender, EventArgs e)
    {
       
            //抓取上一頁點擊的資料ID
           
            //連線到資料庫
            mamberData();
            init();
    
            Split();
            shopping();
            string id = Request.QueryString["id"];
            code = "140.127.22.42/webs/fodder/fodder_phone.aspx?id="+ id;
            QrcodeSaver(code);
            Image4.ImageUrl = "/qrcodeimgs/bb.png";


        this.Literal1.Text = "\"" + protein + "\";";
        this.Literal2.Text = "\"" + heat + "\";";
        this.Literal3.Text = "\"" + fiber + "\";";
        this.Literal4.Text = "\"" + calcium + "\";";
        this.Literal5.Text = "\"" + vitamins + "\";";




    }

    private void Split()
    {
        try { 
        str_allergens= str_allergens.TrimEnd(',');
        str_allergensSplitArray = str_allergens.Split(',');

                //顯示陣列內容 PS
                for (int i = 0; i<str_allergensSplitArray.Length ; i++)
                {
                    //利用分割後str_allergens的內容去顯示str_allergensItemArray陣列的內容
                    str_allergensShow += str_allergensItemArray[int.Parse(str_allergensSplitArray[i])] + "、";
                }


            str = str_allergensShow.TrimEnd('、');  //去掉最後面的符號
            label_petAllergens.Text = str;


            //新增資料至label
            label_fodderName.Text= str_fooddername;
            label_petName.Text = str_petname;
            label_fodderWeight.Text = str_fodderweight;
            label_petweight.Text = str_petweight;
            label_price.Text = str_price;
        }
        catch
        {

        }
    }

    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //
        HttpCookie cookie = Request.Cookies["useremail"];
        if (Request.Cookies["useremail"] != null)
        {

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



    private void init()
    {
        //
        //TODO 連線到資料庫
        //
        String id = Request.QueryString["id"];
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM pet AS t1 INNER JOIN fodder AS t2 ON t1.pet_id = t2.pet_id where t2.fodder_id ='" + id + "'";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            if (reader["fodderimg"].ToString().Trim() == "")
            {
                Image2.ImageUrl = "~/img/noimage.png";
            }
            else
            {
                Image2.ImageUrl = reader["fodderimg"].ToString().Trim();
            }


            str_fooddername = reader["foddername"].ToString().Trim();
            str_petname = reader["petname"].ToString().Trim();
            str_fodderweight = reader["fodder_weight"].ToString().Trim()+"公斤";
            str_price = reader["price"].ToString().Trim();
            str_petweight = reader["weight"].ToString().Trim() + "公斤";
            str_allergens = reader["formula"].ToString().Trim();
            protein=reader["protein"].ToString().Trim();
            heat= reader["heat"].ToString().Trim();
            fiber= reader["fiber"].ToString().Trim();
            calcium= reader["calcium"].ToString().Trim();
            vitamins= reader["vitamins"].ToString().Trim();
           
        }
        
        connStr.Close();
    }

    private void DeleteFodder()
    {
        /*刪除*/
        String id = Request.QueryString["id"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        string delete = string.Format("DELETE FROM fodder WHERE fodder_id = " + id + " ");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Buttonback_Onclick(object sender, EventArgs e)
    {
        Response.Redirect("/webs/fodder/foddernext.aspx");
    }





    protected void Button2_Onclick(object sender, EventArgs e)
    {
        DeleteFodder();
        Response.Redirect("/webs/fodder/foddernext.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        quantity = int.Parse(DropDownList1.Text);
        total = (quantity * price).ToString();
        HttpCookie cookie = Request.Cookies["useremail"];
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.shopping where email='" + cookie.Value.ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            test = reader["fodder_id"].ToString();
        }

        if (id == test)
        {

            ScriptManager.RegisterClientScriptBlock(this.UpdatePanel2, this.UpdatePanel2.GetType(), "alert", "alert('此商品已加入購物車');", true);

        }
        else
        {
            insert();
            Response.Redirect("/webs/shopping.aspx?id=" + id);
        }
        connStr.Close();
    }


    protected void Button3_Click1(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["useremail"];

        if (cookie.Value.ToString() == "")
        {

            ScriptManager.RegisterClientScriptBlock(this.UpdatePanel1, this.UpdatePanel1.GetType(), "alert", "alert('請先登入');location.href='nologinhome.aspx';", true);
        }
        else
        {


            quantity = int.Parse(DropDownList1.Text);
            total = (quantity * price).ToString();


            //連線到MySql資料庫
            MySqlDataReader reader;
            MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
            String select = "SELECT * FROM petkitchen.shopping where email='" + cookie.Value.ToString() + "';";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            reader = cmd.ExecuteReader();

            //將資料庫中資料存入陣列
            while (reader.Read())
            {
                test = reader["fodder_id"].ToString();
            }

            if (id == test)
            {

                ScriptManager.RegisterClientScriptBlock(this.UpdatePanel1, this.UpdatePanel1.GetType(), "alert", "alert('此商品已加入購物車');", true);


            }
            else
            {
                insert();
                ScriptManager.RegisterClientScriptBlock(this.UpdatePanel1, this.UpdatePanel1.GetType(), "alert", "alert('商品已加入購物車');", true);
            }
            connStr.Close();
        }
    }

    private void shopping()
    {
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        id = Request.QueryString["id"];
        String select = "SELECT * FROM petkitchen.fodder where fodder_id = @id";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        cmd.Parameters.AddWithValue("@id", id);
        reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            name = reader["foddername"].ToString();
            price = int.Parse(reader["price"].ToString());
            aa = reader["fodderimg"].ToString();

        }
        connStr.Close();
    }

    private void insert()
    {

        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
        String AddNew = string.Format("INSERT INTO shopping(fodder_id,email,name,quantity,price,photourl) VALUES('{0}','{1}','{2}','{3}','{4}','{5}')", id, cookie.Value.ToString(), name, quantity.ToString(), total, aa);
        MySqlCommand AddNewCmd = new MySqlCommand(AddNew, connStr);
        AddNewCmd.Connection = connStr;
        //執行新增
        AddNewCmd.ExecuteNonQuery();
        // i++;
        connStr.Close();

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
        bp.Save(Server.MapPath("/qrcodeimgs/bb.png"));
       

    }
}