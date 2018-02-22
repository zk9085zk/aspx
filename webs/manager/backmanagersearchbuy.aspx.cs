using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_backmanagersearchbuy : System.Web.UI.Page
{
    private String memberid;

    private void search()
    {
        /*搜尋*/

        ArrayList orderid= new ArrayList();

        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
        String email = Request.QueryString["email"];
        String name = Request.QueryString["name"];

        String sql = "SELECT * FROM member where email = @email or name = @name";

        MySqlCommand cmd = new MySqlCommand(sql, connStr);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@name", name);
        reader = cmd.ExecuteReader();


        while (reader.Read())
        {
            Label30.Text = reader["name"].ToString();
            Label31.Text =reader["email"].ToString();
            memberid = reader["member_id"].ToString();

        }
        connStr.Close();

        // 搜尋購買

        MySqlDataReader reader2;
        connStr.Open();
        String sql2 = "SELECT * FROM member AS t1 INNER JOIN order2 AS t2 ON t1.member_id = t2.member_id INNER JOIN orderdetial_i AS t3 ON t2.order_id = t3.order_id INNER JOIN commodity AS t4 ON t3.commodity_id = t4.id WHERE t1.member_id = @member_id ; ";

        MySqlCommand cmd2 = new MySqlCommand(sql2, connStr);
        cmd2.Parameters.AddWithValue("@member_id", memberid);

        reader2 = cmd2.ExecuteReader();

       
       
        while (reader2.Read())
        {
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
            TableCell cell5 = new TableCell();


            cell1.Text = reader2["order_id"].ToString();
            row.Cells.Add(cell1);

            cell2.Text = reader2["commodity"].ToString();
            //cell2.Font.Size = FontUnit.Large; //設定文字尺寸
            //cell2.ForeColor = System.Drawing.Color.Blue; //設定文字顏色
            //cell2.BackColor = System.Drawing.Color.Red; //設定文字顏色
            row.Cells.Add(cell2);

            cell3.Text = reader2["quantity"].ToString();
            row.Cells.Add(cell3);

            //總價
         
            cell4.Text = reader2["price"].ToString();
            row.Cells.Add(cell4);

            cell5.Text = reader2["date"].ToString();
            row.Cells.Add(cell5);

            //產生表格
            Table1.Rows.Add(row);

            //orderid.Add(reader["order_id"].ToString());
            
        }
        connStr.Close();

       
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //新增第一行
        TableRow row = new TableRow();
        TableCell cell1 = new TableCell();
        TableCell cell2 = new TableCell();
        TableCell cell3 = new TableCell();
        TableCell cell4 = new TableCell();
        TableCell cell5 = new TableCell();


        cell1.Text = "訂單編號";
        row.Cells.Add(cell1);

        cell2.Text = "商品名稱";
        row.Cells.Add(cell2);

        cell3.Text = "數量";
        row.Cells.Add(cell3);

        cell4.Text = "總計";
        row.Cells.Add(cell4);

        cell5.Text = "日期";
        row.Cells.Add(cell5);

        Table1.Rows.Add(row);

        if (!Page.IsPostBack)
        {
            search();
        }
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagersearchbuy.aspx?email=" + TextBox1.Text + "&name=" + TextBox2.Text);

    }
}