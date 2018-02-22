using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_content : System.Web.UI.Page
{
    private string a;

    protected void Page_Load(object sender, EventArgs e)
    {
        
            //新增第一行
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
            TableCell cell5 = new TableCell();

            cell1.Text = "帳號";
            row.Cells.Add(cell1);

            cell2.Text = "標題";
            row.Cells.Add(cell2);

            cell3.Text = "時間";
            row.Cells.Add(cell3);

            cell4.Text = "";
            row.Cells.Add(cell4);

            cell5.Text = "";
            row.Cells.Add(cell5);

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
        String sql = "SELECT * FROM petkitchen.clientmessages ORDER BY time DESC";

        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);

        reader = cmd2.ExecuteReader();


        while (reader.Read())
        {

            Button button10 = new Button();
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
            TableCell cell5 = new TableCell();

            cell1.Text = reader["account"].ToString();
            row.Cells.Add(cell1);


            cell2.Text = "<a href='" + "/webs/manager/companyseeclient.aspx?id=" + reader["reply_id"].ToString() + "'>" + reader["title"].ToString() + "</a>";
            //cell2.Font.Size = FontUnit.Large; //設定文字尺寸
            //cell2.ForeColor = System.Drawing.Color.Blue; //設定文字顏色
            //cell2.BackColor = System.Drawing.Color.Red; //設定文字顏色
            row.Cells.Add(cell2);
         
            cell3.Text = DateTime.Parse(reader["time"].ToString()).ToString("yyyy/MM/dd");
            row.Cells.Add(cell3);

            
            cell4.Text = "<a href='" + "/webs/manager/companymessage.aspx?id=" + reader["reply_id"].ToString() + "&account=" + reader["account"].ToString()+ "'>" + "回覆" + "</a>";
            row.Cells.Add(cell4);

            button10.Text = "刪除";
            button10.ID = reader["reply_id"].ToString();
            button10.Click += new EventHandler(lbtn_Click2);
            button10.CssClass = "button button1";
            cell5.Controls.Add(button10);
            row.Cells.Add(cell5);

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
        delete2();
        Response.Redirect(Request.Url.ToString());
    }

    private void delete()
    {
        /*刪除顧客留言*/

        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();


        String id = a;
        string delete = string.Format("DELETE FROM clientmessages WHERE reply_id = @id");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Parameters.AddWithValue("@id", id);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }

    private void delete2()
    {
        /*刪除客服回覆*/

        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();


        String id = a;
        string delete = string.Format("DELETE FROM companymessage WHERE client_id = @id");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Parameters.AddWithValue("@id", id);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }
}