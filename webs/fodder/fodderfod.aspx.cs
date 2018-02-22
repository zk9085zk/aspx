using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//寵物修改
public partial class webs_fodder_fodderfod : System.Web.UI.Page
{
    /*參數*/
    string str_foddername;
    string str_memberid;
    string str_fodderimg;
    string str_carbohydrate;
    string str_protein;
    string str_fat;
    string str_price;
    string str_other;
    string str_Demand;

    int int_fat = 150;       //熱量
    int int_protein = 132;   //蛋白
    int int_carbohydrate = 120; //只防
    int int_price = 120;     //價錢

    protected void Page_Load(object sender, EventArgs e)
    {
        //
        //TODO 頁面載入
        //

        // 第一次執行程式，才會運作到此.
    //    if (!Page.IsPostBack)
     //   {
     //        InquireFodder();//讀取資料庫
     //       Picture();//顯示資料庫
            //str_other = str_Demand;
//}
    }
    private void Upload_img()
    {
        //
        //TODO 上傳圖片
        //

        if (FileUpload1.HasFile == false) return;
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
            str_fodderimg = "~/img/" + filename;
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        //
        //TODO 按鈕啟動
        // 
        Upload_img();
        Demand();
        ModiftFodder();

    }
    private void InquireFodder()
    {
        //
        //TODO 查詢客製化飼料
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.fodder;";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            str_foddername = reader["foddername"].ToString().Trim();
            //str_memberid = reader[" member_id"].ToString().Trim();           
            str_fodderimg = reader["fodderimg"].ToString().Trim();
            str_carbohydrate = reader["energy"].ToString().Trim();
            str_protein = reader["protein"].ToString().Trim();
            str_fat = reader["fat"].ToString().Trim();
            str_price = reader["price"].ToString().Trim();
            str_other = reader["other"].ToString().Trim();

        }
        connStr.Close();
    }
    private void Picture()
    {
        //
        //TODO 畫面填入資料
        //
        string name;
        name = Session["img"].ToString();
        string[] str_demand;
        Image1.ImageUrl = name;//路徑
        Label2.Text = str_fat;//熱量
        Label3.Text = str_protein;//蛋白
        Label4.Text = str_carbohydrate;//只防
        Label5.Text = str_carbohydrate;//只防
        TextBox1.Text = str_foddername;//名字
        TextBox2.Text = str_price;//價錢
        str_demand = str_other.Split(',');
        for (int j = 0; j < str_demand.Length - 1; j++)
        {
            if (str_demand[j] == "0")
            {
                CheckBox1.Checked = true;
            }
            if (str_demand[j] == "1")
            {
                CheckBox2.Checked = true;
            }
            if (str_demand[j] == "2")
            {
                CheckBox3.Checked = true;
            }

        }
    }
    private void ModiftFodder()
    {
        //資料庫連結修改
        MySqlDataReader reader;
        MySqlConnection msc_conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        msc_conn.Open();
        String update = "UPDATE `pet`.`fodder` SET `foddername`= '" + TextBox1.Text + "', `fodderimg`= '" + str_fodderimg + "', `carbohydrate`= '" + Label2.Text + "', `protein`= '" + Label3.Text + "', `fat`= '" + Label4.Text + "', `price`= '" + Label2.Text + "', `other`= '" + str_Demand + "' WHERE `fodder_id`= '13' ";
        MySqlCommand cmd = new MySqlCommand(update, msc_conn);
        reader = cmd.ExecuteReader();
        msc_conn.Close();
    }
    private void Demand()
    {
        //
        //TODO 抓CheckBox
        //

        if (CheckBox1.Checked)
        {
            str_Demand += "0,";
            int_fat += 50;       //熱量
            int_protein += 32;   //蛋白
            int_carbohydrate += 20;//只防
            int_price += 30;
        }
        if (CheckBox2.Checked)
        {
            str_Demand += "1,";
            int_fat += 40;       //熱量
            int_protein += 72;   //蛋白
            int_carbohydrate += 50;//只防
            int_price += 20;
        }
        if (CheckBox3.Checked)
        {
            str_Demand += "2,";
            int_fat += 10;       //熱量
            int_protein += 42;   //蛋白
            int_carbohydrate += 40;//只防
            int_price += 10;
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("fodder_pet.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("foddernext.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/webs/mypet/petmanager.aspx");

    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/webs/member/member.aspx");
    }
}