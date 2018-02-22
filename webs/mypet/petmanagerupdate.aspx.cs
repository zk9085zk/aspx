using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.IO;
using System.Collections;

public partial class webs_petmanagerupdate : System.Web.UI.Page
{
    /*資料參數*/
    int int_sex = 0;//性別
    string str_birthdayAdapter = "";//暫存生日字串
    string[] stringSeparators = new string[] { "/" };//用於切割生日陣列
    string[] lstr_birthday;//切割完生日之後後陣列
    string str_birthday;//我們要的生日
    private string fromRootToPhotos = @"C:\Users\游博翔\Documents\GitHub\pet\Photos\";//圖片路徑
    string fileName;//圖片檔名
    string str_tempPath;//用於暫存字串以做分割使用
    string[] str_imgPath;//用於存取切割後的字串
    string[] separators = { "," };//用於分割字串
    PhotoPicker pp_select; //選擇圖片物件宣告
    public ArrayList str_special = new ArrayList(); //過敏原
    public ArrayList str_stomach = new ArrayList(); //腸胃
    int int_insertImg;
    int count = 0;
    string a;
    string b;
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
            if (!Page.IsPostBack)
            {
               

                //取消使用UnobtrusiveValidationMode驗證
                UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

                //使用初始圖片避免資料庫沒有圖片

                //使用初始設定副程式    

                mamberData();
                date();
                Label4.Text = b;
                //分割從資料庫加入的字串
            }
        }
    }

    private void date()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
     
            //連線到MySql資料庫
            MySqlDataReader reader;
            MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
            String id = Request.QueryString["id"];
            String select = "SELECT * FROM petkitchen.pet where pet_id =@id";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            cmd.Parameters.AddWithValue("@id", id);
            reader = cmd.ExecuteReader();

            //將資料庫中資料存入陣列
            while (reader.Read())
            {
                if (reader["photourl"].ToString().Trim() == "")
                {
                Avatar.ImageUrl = "~/img/noimage.png";
                Session["petimg"] = "";
                }
                else
                {
                Avatar.ImageUrl = reader["photourl"].ToString();
                Session["petimg"] = reader["photourl"].ToString();
            }
                petname.Text =  reader["petname"].ToString();
                ddl_Spicies.SelectedValue = reader["species"].ToString();
            if (reader["subspecies"].ToString() == "")
            {
                subspicies.Text = "無資料!!";
            }
            else
            {
                subspicies.Text = reader["subspecies"].ToString();
            }
                TextBox2.Text = reader["weight"].ToString();
                birthdayy.Text = reader["birthday"].ToString();
                ddl_Sex.SelectedValue = reader["sex"].ToString();
                ddl_HairLengh.SelectedValue = reader["hairlengh"].ToString();
                ddl_Ligation.SelectedValue = reader["ligation"].ToString();
                ddl_HairColor.SelectedValue = reader["haircolor"].ToString();
                ddl_HairStyle.SelectedValue = reader["hairstyle"].ToString();
            if (reader["allergens"].ToString() == "")
            {
                TextBox1.Text = "無";
            }
           


            }
            connStr.Close();

     }
    
    private void update()
    {
        /*更新*/
       
    }


    protected void Buttonfinish_Click(object sender, EventArgs e)
    {

        //
        //TODO 確認新增寵物資料
        //


        //驗證通過才執行
       
            //呼叫副程式刪除重複的過敏原
            Demand();

            Upload_img();

           

            MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

            connStr.Open();

            //    Upload_img();  ,photourl='" + Session["petimg"].ToString().Trim() + "'
            String id = Request.QueryString["id"];
        if(TextBox1.Text=="")
        {
            TextBox1.Text = "無";
        }

            string update = string.Format("update pet set petname='{0}', species='{1}', subspecies='{2}', weight='{3}', birthday='{4}', sex='{5}', hairlengh='{6}',ligation='{7}',haircolor='{8}', hairstyle='{9}', allergens='{10}' , photourl='{11}' where pet_id=@id", petname.Text, ddl_Spicies.SelectedValue, subspicies.Text, TextBox2.Text, birthdayy.Text, ddl_Sex.SelectedValue, ddl_HairLengh.SelectedValue, ddl_Ligation.SelectedValue, ddl_HairColor.SelectedValue, ddl_HairStyle.SelectedValue, TextBox1.Text, Session["petimg"].ToString().Trim());
            MySqlCommand updateCmd = new MySqlCommand(update, connStr);
            updateCmd.Parameters.AddWithValue("@id", id);
            updateCmd.Connection = connStr;
            //執行更新
            updateCmd.ExecuteNonQuery();

            connStr.Close();

            //跳頁至petmanager
            Response.Redirect("/webs/mypet/petdetail.aspx?id=" + Request.QueryString["id"]);

        
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


        /*  for (int i = 0; i < str_special.Count; i++)
          { 
              Label2.Text += str_special[i].ToString();

              }
          for (int i = 0; i < str_stomach.Count; i++)
          {
              Label3.Text += str_stomach[i].ToString();
          }*/
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
        String serverDir = Server.MapPath("~/img/pet");
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
            Session["petimg"] = "~/img/pet/" + filename;
            Label1.Text = "檔案上傳成功";
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
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


    protected void Buttonback_Click(object sender, EventArgs e)
    {
        Response.Redirect("/webs/mypet/petdetail.aspx?id=" + Request.QueryString["id"]);
    }
}