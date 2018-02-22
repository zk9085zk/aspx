using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_member_memberbuy2 : System.Web.UI.Page
{
    string aa;
    string bb;
    string id;
    string com;
    string commodity_id;
    string fodder_id;


    protected void Page_Load(object sender, EventArgs e)
    {

        all();
        TextBox1.Text = commodity_id;
        TextBox2.Text = fodder_id;
        txt();
        txt2();
        //  if (!Page.IsPostBack)
        //  {
        mamber();
        order();
        //  }

    }

    private void txt()
    {
        if (commodity_id =="" || commodity_id == null)
        {

        }
        else
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
            mamberData();
        }
    }

    private void txt2()
    {
        if (fodder_id =="" || fodder_id == null)
        {

        }
        else
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
            mamberData2();
        }
    }

    private void all()
    {
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String id = Request.QueryString["id"];
        connStr.Open();
        String sql = "SELECT * FROM  orderdetial_i AS t1 INNER JOIN order2 AS t2 ON t1.order_id = t2.order_id  WHERE t1.order_id = '" + id + "'";
        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);
        reader = cmd2.ExecuteReader();


        while (reader.Read())
        {
            commodity_id += reader["commodity_id"].ToString();
            fodder_id += reader["fodder_id"].ToString();
        }
    }

    private void mamber()
    {
        //
        //TODO 連線到資料庫
        //

        HttpCookie cookie = Request.Cookies["useremail"];
        if (Request.Cookies["useremail"] != null)
        {
            int i = 0;
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
        connStr.Open();
        String sql = "SELECT * FROM  orderdetial_i AS t1 INNER JOIN order2 AS t2 ON t1.order_id = t2.order_id INNER JOIN commodity AS t3 ON t1.commodity_id = t3.id WHERE t1.order_id = '" + id + "'";
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/webs/member/memberbuy.aspx");
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
            Label4.Text = reader["pay"].ToString();
            Label5.Text = reader["distribution"].ToString();
            Label6.Text = reader["invoice"].ToString();
            Label7.Text = reader["remark"].ToString();
            Label8.Text = reader["price"].ToString();
            Label10.Text = reader["schedule"].ToString();
        }
    }


}