using MySql.Data.MySqlClient;
using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Collections;
public partial class webs_manager_backmanagercommodityinsert : System.Web.UI.Page
{

    /*資料參數*/

   
    string fileName;//圖片檔名
    string str_tempPath;//用於暫存字串以做分割使用
    string[] str_imgPath;//用於存取切割後的字串
    string[] separators = { "," };//用於分割字串
    PhotoPicker pp_select; //選擇圖片物件宣告
  

    protected void Page_Load(object sender, EventArgs e)
    {
        //
        //TODO 頁面載入
        //

        //取消使用UnobtrusiveValidationMode驗證
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        
     

       

        
    }
   
    private void insert()
    {
     

        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        //  Upload_img();  ,'" + Session["petimg"].ToString().Trim() + "'
        String AddNew = string.Format("INSERT INTO commodity(commodity, recommend, ingredient, feature1, feature2, feature3, price, discount,origin,notice1, notice2, content) VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}')", TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text, TextBox9.Text, TextBox10.Text, TextBox11.Text, TextBox12.Text);
        MySqlCommand AddNewCmd = new MySqlCommand(AddNew, connStr);
        AddNewCmd.Connection = connStr;
        //執行新增
        AddNewCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            insert();
            Response.Redirect("backmanagercommodity.aspx");
        }
        catch
        {

        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagercommodity.aspx");
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