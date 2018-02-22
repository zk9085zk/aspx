using Facebook;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_home : System.Web.UI.Page
{
    string email;
    string member_id;

    protected void Page_Load(object sender, EventArgs e)
    {
       
        mamberData();
        

        if (email ==null)
        {
            Response.Write("<script>alert('請先登入');location.href='/webs/nologinhome.aspx';</script>");   
        }
        else
       { 
            if (!Page.IsPostBack)
            {
           
            //新增第一行
            TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();


                cell1.Text = "日期";
                row.Cells.Add(cell1);

                cell2.Text = "類別";
                row.Cells.Add(cell2);

                cell3.Text = "標題";
                row.Cells.Add(cell3);


                Table1.Rows.Add(row);

                Data();

          
            }
            update();
        }

    }
    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //
       
        HttpCookie cookie = Request.Cookies["useremail"];
       
        // Response.Write("顯示cookie物件的單值(cookie.Value)：" + cookie.Value + "<hr/>");

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

      
            
            String select = "SELECT * FROM petkitchen.member where email='" + cookie.Value.ToString() + "';";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            reader = cmd.ExecuteReader();
            
            //將資料庫中資料存入陣列
            while (reader.Read())
            {
              
               Label1.Text = "您好," + reader["nickname"].ToString();
                email = reader["email"].ToString();
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

    private void Data()
    {
        //
        //TODO 連線到資料庫
        //

        HttpCookie cookie = Request.Cookies["useremail"];

        // Response.Write("顯示cookie物件的單值(cookie.Value)：" + cookie.Value + "<hr/>");

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
        String sql = "SELECT * FROM petkitchen.billboard ORDER BY time DESC";

        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);

        reader = cmd2.ExecuteReader();


        while (reader.Read())
        {


            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();

            cell1.Text = DateTime.Parse(reader["time"].ToString()).ToString("yyyy/MM/dd");
            row.Cells.Add(cell1);


            cell2.Text = reader["sort"].ToString();
            //cell2.Font.Size = FontUnit.Large; //設定文字尺寸
            //cell2.ForeColor = System.Drawing.Color.Blue; //設定文字顏色
            //cell2.BackColor = System.Drawing.Color.Red; //設定文字顏色
            row.Cells.Add(cell2);

            cell3.Text = "<a href='" + "billboard.aspx?member=" + Request.QueryString["member"] + "&id=" + reader["id"].ToString() + "'>" + reader["title"].ToString() + "</a>";
            row.Cells.Add(cell3);


            //產生表格
            Table1.Rows.Add(row);

        }
        connStr.Close();

    }

    private void update()
    {
        /*更新*/
        HttpCookie cookie = Request.Cookies["useremail"];
    
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        string update = string.Format("update member set login_time='{0}' where email='" + cookie.Value.ToString() + "'", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));
        MySqlCommand updateCmd = new MySqlCommand(update, connStr);
        updateCmd.Connection = connStr;
        //執行更新
        updateCmd.ExecuteNonQuery();

        connStr.Close();


    }



    protected void Button2_Click(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("purchase.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("fodder_pet.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {

    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("member.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {

    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("re_member.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("member.aspx");
    }


  
}