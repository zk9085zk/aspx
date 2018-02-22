using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class webs_info_askme : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Cookies["useremail"].Value == "")
        {
            Response.Write("<script>alert('請先登入，首頁有提供未登入留言');location.href='/webs/nologinhome.aspx';</script>");

        }
        else
        {
            //新增第一行
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();



            cell1.Text = "標題";
            cell1.CssClass = "row2";
            row.Cells.Add(cell1);

            cell2.Text = "時間";
            cell2.CssClass = "row2";
            row.Cells.Add(cell2);

            cell3.Text = "客服回覆";
            cell3.CssClass = "row2";
            row.Cells.Add(cell3);

            Table1.Rows.Add(row);


            //連資料庫
            mamberData();
        }
    }


    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //

        HttpCookie cookie = Request.Cookies["useremail"];

        
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        //String id = Request.QueryString["member"];
        if (Request.Cookies["useremail"] != null)
        {
            int i = 0;
            String select = "SELECT * FROM petkitchen.member where email ='" + cookie.Value.ToString() + "';";
            // String select = "SELECT * FROM petkitchen.member where member_id = @id";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            //cmd.Parameters.AddWithValue("@id", id);
            reader = cmd.ExecuteReader();

            //將資料庫中資料存入陣列
            while (reader.Read())
            {
                i = 1;
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
            if (i == 1)
            {
                Label2.Text = "登出";
            }
        }







        String sql = "SELECT * FROM petkitchen.clientmessages where account='" + cookie.Value.ToString() + "'ORDER BY time DESC; ";

        connStr.Open();
        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);
        reader = cmd2.ExecuteReader();




        while (reader.Read())
        {




            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();

           


            cell1.Text = "<a href='" + "/webs/manager/clientmessages.aspx?id=" + reader["reply_id"].ToString() + "'>" + reader["title"].ToString() + "</a>";
            //cell2.Font.Size = FontUnit.Large; //設定文字尺寸
            //cell2.ForeColor = System.Drawing.Color.Blue; //設定文字顏色
            //cell2.BackColor = System.Drawing.Color.Red; //設定文字顏色
            row.Cells.Add(cell1);



            cell2.Text = reader["time"].ToString();
            row.Cells.Add(cell2);

            cell3.Text = "<a href='" + "/webs/manager/clientseecompany.aspx?&id=" + reader["reply_id"].ToString() + "'>" + "查看回覆" + "</a>";
            row.Cells.Add(cell3);

            //產生表格
            Table1.Rows.Add(row);

        }
        connStr.Close();

    }



    private void insert()
    {

        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
        String AddNew = string.Format("INSERT INTO clientmessages(account,title,content ,time) VALUES('{0}','{1}','{2}','{3}')", cookie.Value.ToString(),TextBox6.Text, TextBox3.Text, TextBox4.Text);
        MySqlCommand AddNewCmd = new MySqlCommand(AddNew, connStr);
        AddNewCmd.Connection = connStr;
        //執行新增
        AddNewCmd.ExecuteNonQuery();

        connStr.Close();
    }

   

    protected void CKEditorControl1_TextChanged(object sender, EventArgs e)
    {

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            TextBox3.Text = CKEditorControl1.Text;
            TextBox4.Text = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
            insert();
            Response.AddHeader("Refresh", "0");

        }
        catch
        {

        }
    }

   

    
}