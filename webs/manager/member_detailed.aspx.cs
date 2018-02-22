using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_member_detailed : System.Web.UI.Page
{
    string member_id;
    string img;
    string email;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            mamberData();
           
        }
    
        //新增第一行
        TableRow row = new TableRow();
        TableCell cell1 = new TableCell();
        TableCell cell2 = new TableCell();
        TableCell cell3 = new TableCell();
        TableCell cell4 = new TableCell();
        TableCell cell5 = new TableCell();
        TableCell cell6 = new TableCell();

        cell1.Text = "圖片";
        cell1.CssClass = "table_a";
        row.TableSection = TableRowSection.TableHeader;
        row.Cells.Add(cell1);

        cell2.Text = "名稱";
        cell2.CssClass = "table_a";
        row.Cells.Add(cell2);

        cell3.Text = "品種";
        cell3.CssClass = "table_a";
        row.Cells.Add(cell3);

        cell4.Text = "性別";
        cell4.CssClass = "table_a";
        row.Cells.Add(cell4);

        cell5.Text = "體重";
        cell5.CssClass = "table_a";
        row.Cells.Add(cell5);

        cell6.Text = "生日";
        cell6.CssClass = "table_a";
        row.Cells.Add(cell6);

        Table1.Rows.Add(row);
        pet();
    }
    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        member_id = Request.QueryString["member_id"];
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        //顯示公告
        connStr.Open();
        String sql = "SELECT * FROM petkitchen.member where member_id='" + member_id + "'";

        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);

        reader = cmd2.ExecuteReader();


        while (reader.Read())
        {
            Label15.Text = reader["member_id"].ToString();
            TextBox1.Text = reader["email"].ToString();
            TextBox2.Text = reader["password"].ToString();
            TextBox3.Text = reader["name"].ToString();
            TextBox4.Text = reader["sex"].ToString();
            TextBox5.Text = reader["cellphone1"].ToString();
            TextBox6.Text = reader["birthday"].ToString();
            TextBox7.Text = reader["address"].ToString();
            Label12.Text = reader["login_time"].ToString();
            img=reader["img"].ToString().Trim();
            if (reader["img"].ToString().Trim() == "")
            {
                Preview.ImageUrl = "~/img/noimage.png";
                Session["petimg"] = "";
            }
            else
            {
                Preview.ImageUrl = reader["img"].ToString();
                Session["petimg"] = reader["img"].ToString();
            }

        }
        connStr.Close();

    }

    private void pet()
    {
        //
        //TODO 連線到資料庫
        //
        email = Request.QueryString["email"];
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        //顯示公告
        connStr.Open();
        String sql = "SELECT * FROM petkitchen.pet where email='"+email+"'";

        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);

        reader = cmd2.ExecuteReader();


        while (reader.Read())
        {
            Button button10 = new Button();
            Image image = new Image();
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
            TableCell cell5 = new TableCell();
            TableCell cell6 = new TableCell();

            image.ImageUrl = reader["photourl"].ToString().Trim();
            image.Height = 125;
            image.Width = 125;
            image.CssClass = "zz";
            cell1.Controls.Add(image);
            row.Cells.Add(cell1);


            cell2.Text = reader["petname"].ToString();
            cell2.CssClass = "table_b";
            row.Cells.Add(cell2);


            cell3.Text = reader["subspecies"].ToString();
            cell3.CssClass = "table_b";
            row.Cells.Add(cell3);

            cell4.Text = reader["sex"].ToString();
            cell4.CssClass = "table_b";
            row.Cells.Add(cell4);

            cell5.Text = reader["weight"].ToString();
            cell5.CssClass = "table_b";
            row.Cells.Add(cell5);

            cell6.Text = reader["birthday"].ToString();
            cell6.CssClass = "table_b";
            row.Cells.Add(cell6);

            //產生表格
            Table1.Rows.Add(row);

        }
        connStr.Close();

    }

    private void update()
    {
        /*更新*/
       
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        Upload_img();
        connStr.Open();
        member_id = Request.QueryString["member_id"];
        string update = string.Format("update member set email='{0}', password='{1}', name='{2}', sex='{3}', cellphone1='{4}', birthday='{5}', address='{6}',img='{7}'  where member_id=@id", TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox7.Text, Session["petimg"].ToString().Trim());
        MySqlCommand updateCmd = new MySqlCommand(update, connStr);
        updateCmd.Parameters.AddWithValue("@id", member_id);
        updateCmd.Connection = connStr;
        //執行更新
        updateCmd.ExecuteNonQuery();

        connStr.Close();
    }

    private void delete()
    {
        /*刪除*/

        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();


        member_id = Request.QueryString["member_id"];
        string delete = string.Format("DELETE FROM member WHERE member_id = @member_id ");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Parameters.AddWithValue("@id", member_id);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
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
        String serverDir = Server.MapPath("~/img/member");
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
            Session["petimg"] = "~/img/member/" + filename;
            Label1.Text = "檔案上傳成功";
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Enabled = true;
        TextBox2.Enabled = true;
        TextBox3.Enabled = true;
        TextBox4.Enabled = true;
        TextBox5.Enabled = true;
        TextBox6.Enabled = true;
        TextBox7.Enabled = true;
        Button1.Visible = false;
        Button2.Visible = true;
        Button3.Visible = true;
        Button4.Visible = false;
        Button5.Visible = true;
        FileUpload1.Visible = true;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        update();
        member_id = Request.QueryString["member_id"];
        email = Request.QueryString["email"];
        Response.Redirect("/webs/manager/member_detailed.aspx?member_id=" + member_id + "&email=" + email);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        member_id = Request.QueryString["member_id"];
        email = Request.QueryString["email"];
        Response.Redirect("/webs/manager/member_detailed.aspx?member_id="+member_id+"&email=" + email);
    }



    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("/webs/manager/backmanagersearchcustomer.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        delete();
        Response.Redirect("/webs/manager/backmanagersearchcustomer.aspx");
    }
}