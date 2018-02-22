using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_upload : System.Web.UI.Page
{

    
  
   
    string fileName;//圖片檔名
    string str_tempPath;//用於暫存字串以做分割使用
    string[] str_imgPath;//用於存取切割後的字串
    string[] separators = { "," };//用於分割字串
    PhotoPicker pp_select; //選擇圖片物件宣告
    int int_insertImg;
    int count = 0;
  

    protected void Page_Load(object sender, EventArgs e)
    {
        //
        //TODO 頁面載入
        //

        //取消使用UnobtrusiveValidationMode驗證
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;



        //使用初始圖片避免資料庫沒有圖片
        //  str_tempPath = "~/img/heavy-plus-sign.png";

        //使用初始設定副程式    
        init();

        //分割從資料庫加入的字串
        str_imgPath = str_tempPath.Split(separators, StringSplitOptions.RemoveEmptyEntries);

        //將物件加入版面
        PhotoPicker pp_temp = new PhotoPicker(str_imgPath);
        pp_select = pp_temp;
        pp_select.int_pictureGrid = 4;
        UpdatePanel1.ContentTemplateContainer.Controls.Add(pp_select);
        int_insertImg = pp_select.int_nowPickId;
        pp_select.init();
    }

    private void init()
    {

        List<object[]> listResult = new List<object[]>();
        //
        //TODO 初始化設定
        //           

        //連線到資料庫
        MySqlDataReader reader;

        MySqlConnection msc_conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        //讀取資料庫中圖片資料
        String select = "SELECT * FROM petkitchen.photos Limit 3";


        msc_conn.Open();



        MySqlCommand cmd = new MySqlCommand(select, msc_conn);


        reader = cmd.ExecuteReader();





        while (reader.Read())
        {
           
            str_tempPath = str_tempPath + "," + reader["photourl"].ToString().Trim();
            count++;
           
        }
      

        

        object[][] Result = listResult.ToArray();

        //關閉資料庫
        msc_conn.Close();




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
        string sql = "INSERT INTO photos(photourl) value('" + Session["petimg"].ToString().Trim() + "') ";

        MySqlCommand msc_cmd = new MySqlCommand(sql, msc_conn);

        msc_cmd.ExecuteNonQuery();

        //刪除第一筆

        if (count >= 3)
        {
            string sql2 = "Delete From photos Where photos_id  Limit 1";
            MySqlCommand msc_cmd2 = new MySqlCommand(sql2, msc_conn);
            msc_cmd2.ExecuteNonQuery();
        }
        //關閉資料庫連線
        msc_conn.Close();



        //刷新本頁頁面
        Response.Redirect("upload.aspx");

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
        String serverDir = Server.MapPath("~/Photos");
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
            FileUpload1.SaveAs(serverFilePath);
            Session["petimg"] = "~/Photos/" + filename;
            Label1.Text = "檔案上傳成功";
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }

    }
}