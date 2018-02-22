using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_backmanagerorder3 : System.Web.UI.Page
{
    string aa;
    string bb;
    string id;
    string com;



    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            //新增第一行

            txt();
            txt2();
            //  if (!Page.IsPostBack)
            //  {
            mamberData();
        mamberData2();
        order();
        //  }
         }
    }

    private void txt()
    {
        //新增第一行
        TableRow row = new TableRow();
        TableCell cell1 = new TableCell();
        TableCell cell2 = new TableCell();
        TableCell cell3 = new TableCell();
        TableCell cell4 = new TableCell();

        cell1.Text = "商品名稱";
        cell1.CssClass = "row2";
        row.TableSection = TableRowSection.TableHeader;
        row.Cells.Add(cell1);

        cell2.Text = "數量";
        cell2.CssClass = "row2";
        row.Cells.Add(cell2);

        cell3.Text = "價格";
        cell3.CssClass = "row2";
        row.Cells.Add(cell3);






        Table1.Rows.Add(row);
    }

    private void txt2()
    {
        //新增第一行
        TableRow row = new TableRow();
        TableCell cell1 = new TableCell();
        TableCell cell2 = new TableCell();
        TableCell cell3 = new TableCell();
        TableCell cell4 = new TableCell();

        cell1.Text = "商品名稱";
        cell1.CssClass = "row2";
        row.TableSection = TableRowSection.TableHeader;
        row.Cells.Add(cell1);

        cell2.Text = "數量";
        cell2.CssClass = "row2";
        row.Cells.Add(cell2);

        cell3.Text = "價格";
        cell3.CssClass = "row2";
        row.Cells.Add(cell3);






        Table2.Rows.Add(row);
    }

    private void mamberData()
    {

        string[] drov = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10" };
        string[] drovm = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" };
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String id = Request.QueryString["id"];
        connStr.Open();
        String sql = "SELECT * FROM  orderdetial_i AS t1 INNER JOIN order2 AS t2 ON t1.order_id = t2.order_id INNER JOIN commodity AS t3 ON t1.commodity_id = t3.id WHERE t1.order_id = '" + id + "'";
        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);
        reader = cmd2.ExecuteReader();




        while (reader.Read())
        {
           

            Button button10 = new Button();
            TextBox textBox1 = new TextBox();
            DropDownList DropDownList1 = new DropDownList();

            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();


            cell1.Text = reader["commodity"].ToString();
            cell1.CssClass = "table_b";
            row.Cells.Add(cell1);

            cell2.Text = reader["quantity"].ToString();
            cell2.CssClass = "table_b";
            row.Cells.Add(cell2);

            cell3.Text = reader["price"].ToString();
            cell3.CssClass = "table_b";
            row.Cells.Add(cell3);
        
           

            //產生表格
            Table1.Rows.Add(row);

        }



        connStr.Close();


    }

    private void mamberData2()
    {


        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String id = Request.QueryString["id"];
        connStr.Open();
        String sql = "SELECT * FROM  orderdetial_i AS t1 INNER JOIN order2 AS t2 ON t1.order_id = t2.order_id INNER JOIN fodder AS t3 ON t1.fodder_id = t3.fodder_id WHERE t1.order_id = '" + id + "'";
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


            cell1.Text = reader["foddername"].ToString();
            cell1.CssClass = "table_b";
            row.Cells.Add(cell1);

            cell2.Text = reader["quantity"].ToString();
            cell2.CssClass = "table_b";
            row.Cells.Add(cell2);

            cell3.Text = reader["price"].ToString();
            cell3.CssClass = "table_b";
            row.Cells.Add(cell3);





            //產生表格
            Table2.Rows.Add(row);

        }



        connStr.Close();


    }

    private void update()
    {
        
       
        /*更新*/
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        String id = Request.QueryString["id"];
        string update = string.Format("update petkitchen.order2 set  pay='{0}', distribution='{1}', invoice='{2}', remark='{3}', price='{4}' ,schedule='{5}' where  order_id=@id", DropDownList1.Text, DropDownList2.Text, DropDownList3.Text, TextBox1.Text,TextBox2.Text,DropDownList4.Text);
        MySqlCommand updateCmd = new MySqlCommand(update, connStr);
        updateCmd.Parameters.AddWithValue("@id", id);
        updateCmd.Connection = connStr;
        //執行更新
        updateCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagerorder.aspx");

    }

    private void order()
    {
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String id = Request.QueryString["id"];
        connStr.Open();
        String sql = "SELECT * FROM member AS t1 INNER JOIN order2 AS t2 ON t1.member_id = t2.member_id WHERE order_id='" + id + "'";
        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);
        reader = cmd2.ExecuteReader();




        while (reader.Read())
        {
            Label3.Text = reader["name"].ToString();
            DropDownList1.Text= reader["pay"].ToString();
            DropDownList2.Text = reader["distribution"].ToString();
            DropDownList3.Text = reader["invoice"].ToString();
            TextBox1.Text= reader["remark"].ToString();
            TextBox2.Text = reader["price"].ToString();
            DropDownList4.Text= reader["schedule"].ToString();
        }
        connStr.Close();
    }

   

    protected void Button2_Click(object sender, EventArgs e)
    {
       
        update();
        Response.Redirect("backmanagerorder2.aspx?id=" + Request.QueryString["id"]);
    }

    

    protected void Button3_Click(object sender, EventArgs e)
    {

        Response.Redirect("backmanagerorder2.aspx?id=" + Request.QueryString["id"]);
    }
}