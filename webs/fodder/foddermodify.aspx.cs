using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Drawing;
using ByteMatrix = com.google.zxing.common.ByteMatrix;
using System.Drawing.Imaging;

using com.google.zxing.qrcode;
using com.google.zxing.common;
using com.google.zxing;
using System.Collections;
using System.IO;
//寵物確認客製化飼料
public partial class webs_Default : System.Web.UI.Page
{
    /*參數*/
    string str_foddername;
    string str_fodderimg;
    string str_carbohydrate;
    string str_protein;
    string str_fat;
    string str_price;
    string str_other;
    string general_formula;

    string code ; //QRCode資料

    int QRheight = 300; //圖形高
    int QRwidth = 300; // 圖形寬

    string fileName;//圖片檔名
    string str_tempPath;//用於暫存字串以做分割使用
    string[] str_imgPath;//用於存取切割後的字串
    string[] separators = { "," };//用於分割字串
    PhotoPicker2 pp_select; //選擇圖片物件宣告
    int int_insertImg;
    string b;
    string str_allergens;
    string[] str_allergensItemArray = { "100", "125", "130", "150", "135", "90", "105", "100", "140", "120", "150", "110" };
    string[] str_flag = { "1.1", "1.2", "1.1", "1.3", "1", "1.3", "1.2", "1.1", "1.1", "1.3", "1", "1.2" };
    string[] str_allergensSplitArray = new string[100];
    string[] str_flagSplitArray = new string[100];
    int int_allergensSplitArrayItem;
    int general;
    int special;
    int str_allergensShow;
    string pet_weight;
    int sum;
    string price;
    double abc;
    double cba;
    double count;
    int protein;
    int heat;
    int fiber;
    int calcium;
    int vitamins;




    protected void Page_Load(object sender, EventArgs e)
    {
        //
        //TODO 頁面載入
        //
        if (Request.Cookies["useremail"].Value == "")
        {
            Response.Write("<script>alert('請先登入');location.href='/webs/nologinhome.aspx';</script>");

        }
        else
        {
            mamberData();
            
            compute();


           
            this.Literal1.Text = "\"" + protein + "\";";
            this.Literal2.Text = "\"" + heat + "\";";
            this.Literal3.Text = "\"" + fiber + "\";";
            this.Literal4.Text = "\"" + calcium + "\";";
            this.Literal5.Text = "\"" + vitamins + "\";";



        }
    }

    private void sp()
    {
        try {
                str_allergens = str_allergens.TrimEnd(',');
                str_allergensSplitArray = str_allergens.Split(',');

                    for (int i = 0; i < str_allergensSplitArray.Length; i++)
                    {
                        if (str_allergensSplitArray[i] == "0" || str_allergensSplitArray[i] == "1" || str_allergensSplitArray[i] == "2" || str_allergensSplitArray[i] == "3")
                        {
                            for (int x = 0; x < str_allergensSplitArray.Length; x++)
                            {
                                //利用分割後str_allergens的內容去顯示str_allergensItemArray陣列的內容
                                general += int.Parse(str_allergensItemArray[int.Parse(str_allergensSplitArray[x])]);

                            }
                        }
                        else
                        {

                            //利用分割後str_allergens的內容去顯示str_allergensItemArray陣列的內容
                            special += int.Parse(str_allergensItemArray[int.Parse(str_allergensSplitArray[i])]);

                        }


                    }
                    special = special / 2;

                    for (int i = 0; i < str_allergensSplitArray.Length; i++)
                    {
                        if (str_allergensSplitArray[i] == "0" || str_allergensSplitArray[i] == "1" || str_allergensSplitArray[i] == "2" || str_allergensSplitArray[i] == "3")
                        {
                            str_allergensShow = general;
                        }
                        else
                        {
                            str_allergensShow = special;
                        }
                    }
        }
        catch
        {

        }
    }

    private void sp2()
    {
        str_flagSplitArray = str_allergens.Split(',');

        for (int i = 0; i < str_flagSplitArray.Length; i++)
        {
            if (str_flagSplitArray[i] == "0" || str_flagSplitArray[i] == "1" || str_flagSplitArray[i] == "2" || str_flagSplitArray[i] == "3")
            {
                for (int x = 0; x < str_flagSplitArray.Length; x++)
                {
                    //利用分割後str_allergens的內容去顯示str_allergensItemArray陣列的內容
                    abc += Convert.ToDouble(str_flag[int.Parse(str_flagSplitArray[x])]);
                   
                }
            }
            else
            {

                //利用分割後str_allergens的內容去顯示str_allergensItemArray陣列的內容
                cba += Convert.ToDouble(str_flag[int.Parse(str_flagSplitArray[i])]);
                count++;



            }


        }

       

       

        for (int i = 0; i < str_flagSplitArray.Length; i++)
        {
            if (str_flagSplitArray[i] == "0" || str_flagSplitArray[i] == "1" || str_flagSplitArray[i] == "2" || str_flagSplitArray[i] == "3")
            {
                protein = Convert.ToInt32(abc * 60);
                heat = Convert.ToInt32(abc * 68);
                fiber = Convert.ToInt32(abc * 75);
                calcium = Convert.ToInt32(abc * 65);
                vitamins = Convert.ToInt32(abc * 70);
            }
            else
            {

                nutrition();
                break;

            }
        }
       

    }


    private void nutrition()
    {

        
        protein = Convert.ToInt32(cba/count * 60);
        heat = Convert.ToInt32(cba / count * 68);
        fiber= Convert.ToInt32(cba / count * 75);
        calcium = Convert.ToInt32(cba / count * 65);
        vitamins = Convert.ToInt32(cba / count * 70);

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
                
                Label20.Text = "您好," + reader["nickname"].ToString();
               
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

    private void compute()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String fodder_id = Request.QueryString["fodder_id"];
        String select = "SELECT * FROM pet AS t1 INNER JOIN fodder AS t2 ON t1.pet_id = t2.pet_id where t2.fodder_id ='" + fodder_id + "'";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            str_allergens = reader["formula"].ToString().Trim();
            pet_weight = reader["weight"].ToString().Trim();
           
            sp();
            sp2();
        }
        connStr.Close();
    }

   
    private void total()
    {
       

        string radio = RadioButtonList1.SelectedValue;
        double weight = Convert.ToDouble(radio);
        double pet_weights = Convert.ToDouble(pet_weight);
        double result = Convert.ToInt16(Math.Ceiling(pet_weights / 3));
        double sum = Convert.ToDouble(str_allergensShow) * weight * result;
        int sum1 = Convert.ToInt32(sum);

        price = sum1.ToString();

    }


    protected void Buttoncheck_Click(object sender, EventArgs e)
    {
        //
        //TODO 上傳圖片置資料庫
        //

        //取消使用UnobtrusiveValidationMode驗證
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        //上傳圖片
        Upload_img();

        //連線到資料庫 
        MySqlConnection msc_conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        msc_conn.Open();

        //在資料庫新增寵物資料
        string sql = "INSERT INTO picture(photourl) value('" + Session["petimg"].ToString().Trim() + "')";
        MySqlCommand msc_cmd = new MySqlCommand(sql, msc_conn);
        msc_cmd.ExecuteNonQuery();


        //刪除第一筆
      

        //關閉資料庫連線
        msc_conn.Close();

        //刷新本頁頁面
        Response.Redirect("foddermodify.aspx");

    }


    private void Upload_img()
    {
        //
        //TODO 上傳圖片
        //

        string filename = avatarUpload.PostedFile.FileName;
        string extension = Path.GetExtension(filename).ToLowerInvariant();

        // 判斷是否為允許上傳的檔案附檔名
        List<string> allowedExtextsion = new List<string> { ".jpg", ".bmp", ".png" };
        if (allowedExtextsion.IndexOf(extension) == -1)
        {
            Label3.Text = "不允許該檔案上傳";
            return;
        }

        // 限制檔案大小，限制為 2MB
        int filesize = avatarUpload.PostedFile.ContentLength;
        if (filesize > 2100000)
        {
            Label3.Text = "檔案大小上限為 2MB，該檔案無法上傳";
            return;
        }

        // 檢查 Server 上該資料夾是否存在，不存在就自動建立
        String serverDir = Server.MapPath("~/fodder_photos");
        if (Directory.Exists(serverDir) == false) Directory.CreateDirectory(serverDir);
        string serverFilePath = Path.Combine(serverDir, filename);
        string fileNameOnly = Path.GetFileNameWithoutExtension(filename);
        int fileCount = 1;

        // 重覆檔案的命名
        while (File.Exists(serverFilePath))
        {
            filename = string.Concat(fileNameOnly, "_", fileCount, extension);
            serverFilePath = Path.Combine(serverDir, filename);
            fileCount++;
        }

        // 把檔案存入指定的 Server 內路徑


        try
        {
            avatarUpload.PostedFile.SaveAs(serverFilePath);
            b = "~/fodder_photos/" + filename;
            Label3.Text = "檔案上傳成功";
        }
        catch (Exception ex)
        {
            Label3.Text = ex.Message;
        }

    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        //
        //TODO 按鈕啟動
        //  
        
         Response.Redirect("foddernext.aspx");
    }
 

    private void update()
    {
        Upload_img();
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String fodder_id = Request.QueryString["fodder_id"];
        connStr.Open();
        String update = string.Format("update fodder set foddername='{0}',fodder_weight='{1}',price='{2}',fodderimg='{3}',protein='{4}',heat='{5}',fiber='{6}',calcium='{7}',vitamins='{8}' where fodder_id = '" + fodder_id + "'",TextBox1.Text, RadioButtonList1.SelectedValue, price,b, protein,heat, fiber, calcium, vitamins);
        MySqlCommand AddNewCmd = new MySqlCommand(update, connStr);
        AddNewCmd.Connection = connStr;
        //執行新增
        AddNewCmd.ExecuteNonQuery();
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
        bp.Save(Server.MapPath("/qrcodeimgs/aa2a.jpg"));

    }
    private void DeleteFodder()
    {
        /*刪除*/
        String fodder_id = Request.QueryString["fodder_id"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        string delete = string.Format("DELETE FROM fodder WHERE fodder_id = " + fodder_id + " ");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        total();
        update();
        String fodder_id = Request.QueryString["fodder_id"];
        Response.Redirect("/webs/fodder/fodder_finish.aspx?id="+ fodder_id);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        DeleteFodder();
        Response.Redirect("/webs/fodder/foddernext.aspx");
    }
}