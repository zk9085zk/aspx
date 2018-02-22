using Facebook;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class webs_shopping : System.Web.UI.Page
{

    private string a;
    private string b;
    int d = 0;
    int quantity;
    int price;
    string id;
    string total;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Cookies["useremail"].Value == "")
        {
            Response.Write("<script>alert('請先登入');location.href='/webs/nologinhome.aspx';</script>");

        }
        else
        {
            MySqlDataReader reader;
            MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
            id = Request.QueryString["id"];
            String select = "SELECT * FROM petkitchen.commodity where id = @id";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            cmd.Parameters.AddWithValue("@id", id);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
               
                price = int.Parse(reader["discount"].ToString());


            }
            connStr.Close();
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
            TableCell cell5 = new TableCell();

            cell1.Text = "圖片";
            cell1.CssClass = "row2";
            row.TableSection = TableRowSection.TableHeader;
            row.Cells.Add(cell1);

            cell2.Text = "商品名稱";
            cell2.CssClass = "row2";
            row.Cells.Add(cell2);

            cell3.Text = "數量";
            cell3.CssClass = "row2";
            row.Cells.Add(cell3);

            cell4.Text = "小計";
            cell4.CssClass = "row2";
            row.Cells.Add(cell4);

            cell5.Text = "變更";
            cell5.CssClass = "row2";
            row.Cells.Add(cell5);

            Table1.Rows.Add(row);


            mamber();
            mamberData();
            count();
            add();
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

    private void qaz()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.shopping where email='" + cookie.Value.ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {

        }
    }
    private void count()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        MySqlCommand cmdMySQL = connStr.CreateCommand();
        cmdMySQL.CommandText = "SELECT COUNT(*) FROM petkitchen.shopping where email='" + cookie.Value.ToString() + "';";
        connStr.Open();
        object scalar = cmdMySQL.ExecuteScalar();
        int rows = int.Parse(scalar.ToString()); 
        connStr.Close();
        Label3.Text = rows.ToString() ;
    }

    private void add()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.shopping where email='" + cookie.Value.ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            string c =reader["price"].ToString();
            d = d+int.Parse(c);
        }
        Label4.Text = d.ToString();
    }
    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //
      
        string[] drov = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10" };
        string[] drovm = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" };
        HttpCookie cookie = Request.Cookies["useremail"];
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.shopping where email='" + cookie.Value.ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();
     
        //將資料庫中資料存入陣列
        while (reader.Read())
        {

            Button button10 = new Button();
        /*    DropDownList DropDownList1 = new DropDownList();*/

            Image image = new Image();

            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
            TableCell cell5 = new TableCell();

            image.ImageUrl = reader["photourl"].ToString().Trim();
            image.Height = 125;
            image.Width = 125;
            image.CssClass = "zz";
            cell1.Controls.Add(image);
            row.Cells.Add(cell1);

            cell2.Text = reader["name"].ToString();
            cell2.CssClass = "table_a";
            row.Cells.Add(cell2);


            cell3.Text = reader["quantity"].ToString();
            cell3.CssClass = "table_a";
            row.Cells.Add(cell3);

            /*       DropDownList1.AutoPostBack = true;
                   DropDownList1.DataSource = drov;
                  for(int i=0;i<=9;i++)
                   {
                       DropDownList1.Items.Insert(i, drov[i]);
                       DropDownList1.Items[i].Value = drovm[i];
                   }         
                   cell3.Controls.Add(DropDownList1);
                   row.Cells.Add(cell3);
                   DropDownList1.Text = reader["quantity"].ToString();


                   quantity = int.Parse(DropDownList1.Text);
                   total = (quantity * price).ToString();
                   */
            cell4.Text = "$"+ reader["price"].ToString();
            cell4.CssClass = "table_a";
            row.Cells.Add(cell4);



            button10.Text = "刪除";
            button10.ID = reader["shopping_id"].ToString();
            button10.Click += new EventHandler(lbtn_Click2);
            button10.CssClass = "button button1";
            button10.OnClientClick = "return confirm('您確定要刪除嗎？')";
            cell5.Controls.Add(button10);
            row.Cells.Add(cell5);


            //產生表格
            Table1.Rows.Add(row);

        }
        connStr.Close();
    }

    private void delete()
    {
        /*刪除*/
        
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();


        String id = a;
        string delete = string.Format("DELETE FROM shopping WHERE shopping_id = @id");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Parameters.AddWithValue("@id", id);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }


    protected void lbtn_Click2(object sender, EventArgs e)
    {
        
        Button lbtn = (Button)sender;
        a= lbtn.ID; 
        delete();
        Response.Redirect(Request.Url.ToString());
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("commodity.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("checkout.aspx");
    }
}