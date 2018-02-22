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
public partial class webs_manager_backmanagercommodity3 : System.Web.UI.Page
{
    string fileName;//圖片檔名
    string str_tempPath;//用於暫存字串以做分割使用
    string[] str_imgPath;//用於存取切割後的字串
    string[] separators = { "," };//用於分割字串
    PhotoPicker pp_select; //選擇圖片物件宣告

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            mamberData();
        }
    }
    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String id = Request.QueryString["id"];
        String select = "SELECT * FROM petkitchen.commodity where id = @id";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        cmd.Parameters.AddWithValue("@id", id);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            TextBox1.Text = reader["commodity"].ToString();
            TextBox2.Text = reader["recommend"].ToString();
            TextBox3.Text = reader["ingredient"].ToString();
            TextBox4.Text = reader["feature1"].ToString();
            TextBox5.Text = reader["feature2"].ToString();
            TextBox6.Text = reader["feature3"].ToString();
            TextBox7.Text = reader["price"].ToString();
            TextBox8.Text = reader["discount"].ToString();
            TextBox9.Text = reader["origin"].ToString();
            TextBox10.Text = reader["notice1"].ToString();
            TextBox11.Text = reader["notice2"].ToString();
            TextBox12.Text = reader["content"].ToString();
            Preview.ImageUrl = reader["photourl"].ToString();
        }
        connStr.Close();
    }
    private void update()
    {
        /*更新*/
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

          Upload_img(); 
        String id = Request.QueryString["id"];
        string update = string.Format("update commodity set commodity='{0}', recommend='{1}', ingredient='{2}', feature1='{3}', feature2='{4}', feature3='{5}', price='{6}', discount='{7}',origin='{8}',notice1='{9}', notice2='{10}', content='{11}',photourl='{12}'   where id=@id", TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text, TextBox9.Text, TextBox10.Text, TextBox11.Text, TextBox12.Text, Session["petimg"].ToString().Trim());
        MySqlCommand updateCmd = new MySqlCommand(update, connStr);
        updateCmd.Parameters.AddWithValue("@id", id);
        updateCmd.Connection = connStr;
        //執行更新
        updateCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
        update();
        Response.Redirect("backmanagercommodity2.aspx?id=" + Request.QueryString["id"]);
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagercommodity2.aspx?id=" + Request.QueryString["id"]);
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
        String serverDir = Server.MapPath("~/commodity_photos");
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
            Session["petimg"] = "~/commodity_photos/" + filename;
            Label1.Text = "檔案上傳成功";
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }

    }
}