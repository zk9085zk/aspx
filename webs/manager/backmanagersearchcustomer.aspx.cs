using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_backmanagersearchcustomer : System.Web.UI.Page
{
    private string a;
    string email;
    string name;
    int b;
    int rows;
    string str_allergens;
    string[] email2 = new string[100];

    protected void Page_Load(object sender, EventArgs e)
    {

        
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

            cell2.Text = "姓名";
            cell2.CssClass = "table_a";
            row.Cells.Add(cell2);

            cell3.Text = "郵件";
            cell3.CssClass = "table_a";
            row.Cells.Add(cell3);

            cell4.Text = "電話";
            cell4.CssClass = "table_a";
            row.Cells.Add(cell4);

            cell5.Text = "上次登入時間";
            cell5.CssClass = "table_a";
            row.Cells.Add(cell5);

            cell6.Text = "變更";
            cell6.CssClass = "table_a";
            row.Cells.Add(cell6);

        Table1.Rows.Add(row);

            mamberData();

       
    }

    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        //顯示公告
        connStr.Open();
        String sql = "SELECT * FROM petkitchen.member";

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

            image.ImageUrl = reader["img"].ToString().Trim();
            image.Height = 125;
            image.Width = 125;
            image.CssClass = "zz";
            cell1.Controls.Add(image);
            row.Cells.Add(cell1);


            cell2.Text = "<a href='" + "member_detailed.aspx?member_id=" + reader["member_id"].ToString() + "&email="+ reader["email"].ToString() + "  '>" + reader["name"].ToString() + "</a>";
            cell2.CssClass = "table_b";
            row.Cells.Add(cell2);


            cell3.Text = reader["email"].ToString();
            cell3.CssClass = "table_b";
            row.Cells.Add(cell3);

            cell4.Text = reader["cellphone1"].ToString();
            cell4.CssClass = "table_b";
            row.Cells.Add(cell4);

            cell5.Text = reader["login_time"].ToString();
            cell5.CssClass = "table_b";
            row.Cells.Add(cell5);

            button10.Text = "刪除";
            button10.ID = reader["member_id"].ToString();
            button10.Click += new EventHandler(lbtn_Click2);
            button10.CssClass = "button button1";
            button10.OnClientClick = "return confirm('您確定要刪除嗎？')";
            cell6.Controls.Add(button10);
            row.Cells.Add(cell6);

            //產生表格
            Table1.Rows.Add(row);

        }
        connStr.Close();

    }

    protected void lbtn_Click2(object sender, EventArgs e)
    {

        Button lbtn = (Button)sender;
        a = lbtn.ID;
        delete();
        Response.Redirect(Request.Url.ToString());
    }

    private void delete()
    {
        /*刪除*/

        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();


        String id = a;
        string delete = string.Format("DELETE FROM member WHERE member_id = @id");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Parameters.AddWithValue("@id", id);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }

    private void search()
    {
        /*搜尋*/

        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
     
        String sql = "SELECT * FROM member where email = '"+ email + "' or name = '" + name + "'";

        MySqlCommand cmd = new MySqlCommand(sql, connStr);

        reader = cmd.ExecuteReader();


        while (reader.Read())
        {

            Label4.Text = "姓名：" + reader["name"].ToString();
            Label3.Text = "信箱：" + reader["email"].ToString();
            Label5.Text = "密碼：" + reader["password"].ToString();
            Label6.Text = "手機：" + reader["cellphone1"].ToString(); 
            Label7.Text = "生日：" + reader["birthday"].ToString();
            Label8.Text = "性別：" + reader["sex"].ToString();
            Label9.Text = "地址：" + reader["postalCode"].ToString() + reader["counties"].ToString()+ reader["address"].ToString() ;
            Label10.Text = "帳號來自於：" + reader["whereid"].ToString();
            Image2.ImageUrl= reader["img"].ToString();


        }
        connStr.Close();
    }

   
    private void count()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        MySqlCommand cmdMySQL = connStr.CreateCommand();
        cmdMySQL.CommandText = "SELECT COUNT(*) FROM petkitchen.member";
        connStr.Open();
        object scalar = cmdMySQL.ExecuteScalar();
        rows = int.Parse(scalar.ToString());
        connStr.Close();
       
    }

    private void Data()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        //顯示公告
        connStr.Open();
        String sql = "SELECT * FROM petkitchen.member";

        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);

        reader = cmd2.ExecuteReader();


        while (reader.Read())
        {
           
                str_allergens += reader["email"].ToString()+",";
               
          
        }
        connStr.Close();

    }


   

    protected void Button1_Click(object sender, EventArgs e)
    {
        count();
        Data();
        str_allergens = str_allergens.TrimEnd(',');
        email2 = str_allergens.Split(',');
        
       for (int i = 0; i <rows; i++)
        {
            
            System.Net.Mail.SmtpClient MySmtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);

            //設定你的帳號密碼
            MySmtp.Credentials = new System.Net.NetworkCredential("b11157123x@gmail.com", "boy37201");

            //Gmial 的 smtp 必需要使用 SSL
            MySmtp.EnableSsl = true;

            //發送Email
            MySmtp.Send("b11157123x@gmail.com", email2[i], "寵物廚房", TextBox3.Text); MySmtp.Dispose();
        }
        Response.Redirect("/webs/manager/backmanagersearchcustomer.aspx");
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        email = TextBox1.Text;
        name= TextBox2.Text;
        search();
       
    }
}