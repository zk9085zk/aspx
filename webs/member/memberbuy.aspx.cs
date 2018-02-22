using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;


public partial class webs_memberbuy : System.Web.UI.Page
{
    /*資料參數*/
    string[] str_customerBuy;
    string str_temp = "";//暫存日期
    int int_starDate;
    int int_endDate;
    int int_date;//日期區間數量
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Request.Cookies["useremail"].Value == "")
          {
              Response.Write("<script>alert('請先登入');location.href='/webs/nologinhome.aspx';</script>");

          }
          else
          {

        if (!Page.IsPostBack)
        {
            mamberData();
            txt();
            order();
        }
        else
        {
            order();
            searchData();
        }
         }





    }
    public void txt()
    {//新增第一行
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
            TableCell cell5 = new TableCell();

            cell1.Text = "訂單編號";
            cell1.CssClass = "row2";
            row.Cells.Add(cell1);

            cell2.Text = "總計";
            cell2.CssClass = "row2";
            row.Cells.Add(cell2);

            cell3.Text = "日期";
            cell3.CssClass = "row2";
            row.Cells.Add(cell3);

            cell4.Text = "";
            row.Cells.Add(cell4);
            Table1.Rows.Add(row);


    }
    public void order_1()
    {

        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM member AS t1 INNER JOIN order2 AS t2 ON t1.member_id = t2.member_id where t1.email ='" + cookie.Value.ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();


        while (reader.Read())
        {

            Button button10 = new Button();
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();



            cell1.Text = reader["order_id"].ToString();
            cell1.CssClass = "table_a";
            row.Cells.Add(cell1);

            cell2.Text = reader["price"].ToString();
            cell2.CssClass = "table_a";
            row.Cells.Add(cell2);

            cell3.Text = reader["date"].ToString();
            cell3.CssClass = "table_a";
            row.Cells.Add(cell3);

            button10.Text = "詳細訂單";
            button10.ID = reader["order_id"].ToString();
            button10.Click += new EventHandler(lbtn_Click2);
            button10.CssClass = "button button1";
            cell4.Controls.Add(button10);
            row.Cells.Add(cell4);

            //產生表格
            Table1.Rows.Add(row);
        }
        connStr.Close();
    }
    public void order()
    {

        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM member AS t1 INNER JOIN order2 AS t2 ON t1.member_id = t2.member_id where t1.email ='" + cookie.Value.ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();


        while (reader.Read())
        {

            Button button10 = new Button();
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
           


            cell1.Text = reader["order_id"].ToString();
            cell1.CssClass = "table_a";
            row.Cells.Add(cell1);

            cell2.Text = reader["price"].ToString();
            cell2.CssClass = "table_a";
            row.Cells.Add(cell2);

            cell3.Text = reader["date"].ToString();
            cell3.CssClass = "table_a";
            row.Cells.Add(cell3);

            button10.Text = "詳細訂單";
            button10.ID = reader["order_id"].ToString();
            button10.Click += new EventHandler(lbtn_Click2);
            button10.CssClass = "button button1";
            cell4.Controls.Add(button10);
            row.Cells.Add(cell4);

            //產生表格
            Table1.Rows.Add(row);
        }
        connStr.Close();
    }

    public void searchData()
    {

        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM member AS t1 INNER JOIN order2 AS t2 ON t1.member_id = t2.member_id  WHERE t2.date > @start and t2.date < @end and t1.email ='" + cookie.Value.ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        cmd.Parameters.AddWithValue("@start", int_starDate);
        cmd.Parameters.AddWithValue("@end", int_endDate );
       
        reader = cmd.ExecuteReader();

     
            while (reader.Read())
           {
           

                Button button10 = new Button();
                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();



                cell1.Text = reader["order_id"].ToString();
                row.Cells.Add(cell1);

                cell2.Text = reader["price"].ToString();
                row.Cells.Add(cell2);

                cell3.Text = reader["date"].ToString();
                row.Cells.Add(cell3);

                button10.Text = "詳細訂單";
                button10.ID = reader["order_id"].ToString();
                button10.Click += new EventHandler(lbtn_Click2);
                button10.CssClass = "button button1";
                cell4.Controls.Add(button10);
                row.Cells.Add(cell4);

                //產生表格
                Table1.Rows.Add(row);

                //orderid.Add(reader["order_id"].ToString());
            }
      

        //將資料庫中資料存入陣列
        /*暫時
        while (reader.Read())
        {
            String[] str_buyDate = reader["date"].ToString().Trim().Split('/');
            int int_buyDate = Int32.Parse(str_buyDate[0] + str_buyDate[1] + str_buyDate[2]);
            if (int_buyDate >= int_starDate && int_buyDate <= int_endDate)
            {
                str_temp = str_temp + "," + reader["date"].ToString().Trim();
                int_date++;
            }
        }
        str_customerBuy = str_temp.Split(',');
        */

        connStr.Close();
    }

    protected void lbtn_Click2(object sender, EventArgs e)
    {

      
        Button lbtn = (Button)sender;

        Response.Redirect("/webs/member/memberbuy2.aspx?id=" + lbtn.ID);

    }


    protected void Button8_Click(object sender, EventArgs e)
    {
        //
        //TODO 查詢
        //
    
        InputDate();
        searchData();
        
       
        /*暫時
        for (int i = 0; i < int_date; i++)
        {
            ManagerOrderView mov_item = new ManagerOrderView();
            mov_item.str_date = str_customerBuy[i + 1];
            mov_item.init();
            Panel1.Controls.Add(mov_item);
        }*/




    }

    public void InputDate()
    {
        //
        //TODO 資料輸入
        //

        String[] str_starDate = datepicker.Text.ToString().Trim().Split('/');//買家購買起始日
        String[] str_endDate = datepicker2.Text.ToString().Trim().Split('/');//買家購買結束日
        int_starDate = Int32.Parse(str_starDate[0] + str_starDate[1] + str_starDate[2]);
        int_endDate = Int32.Parse(str_endDate[0] + str_endDate[1] + str_endDate[2]);
       
    }

    private void mamberData()
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
}