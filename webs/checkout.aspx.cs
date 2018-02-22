using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_checkout : System.Web.UI.Page
{

    int d = 0;
    string memberid;
    string order_id;
    string test;
    string email;
    string name;

    protected void Page_Load(object sender, EventArgs e)
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
            test = reader["email"].ToString();
        }
        connStr.Close();
        if (cookie.Value == "")
        {
            Response.Write("<script>alert('請先登入');location.href='login.aspx';</script>");
        }
        else if(test==null || test != cookie.Value)
        {
            Response.Write("<script>alert('您還沒選擇購買商品');location.href='commodity.aspx';</script>");
        }
        else
        {
            TextBox1.Attributes.Add("maxlength", "15");
            TextBox1.Attributes.Add("onkeyup", "return ismaxlength(this)");
            mamberData();
            member();
            count();
            add();
        }
    }
    private void count()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        MySqlCommand cmdMySQL = connStr.CreateCommand();
        cmdMySQL.CommandText = "SELECT COUNT(*) FROM shopping where email='" + cookie.Value.ToString() + "';";
        connStr.Open();
        object scalar = cmdMySQL.ExecuteScalar();
        int rows = int.Parse(scalar.ToString());
        connStr.Close();
        Label3.Text = rows.ToString();
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
            string c = reader["price"].ToString();
            d = d + int.Parse(c);
        }
        Label4.Text = d.ToString();
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
        String select = "SELECT * FROM petkitchen.shopping where email='" + cookie.Value.ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            Button button10 = new Button();

            Image image = new Image();

            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
           

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

            cell4.Text = "$" + reader["price"].ToString();
            cell4.CssClass = "table_a";
            row.Cells.Add(cell4);


          


            //產生表格
            Table1.Rows.Add(row);

        }
        connStr.Close();
    }



    private void member()
    {
        //
        //TODO 連線到資料庫
        //

        HttpCookie cookie = Request.Cookies["useremail"];

        // Response.Write("顯示cookie物件的單值(cookie.Value)：" + cookie.Value + "<hr/>");

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        if (Request.Cookies["useremail"] != null)
        {
           
            String select = "SELECT * FROM petkitchen.member where email='" + cookie.Value.ToString() + "';";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            reader = cmd.ExecuteReader();

            //將資料庫中資料存入陣列
            while (reader.Read())
            {
                Label1.Text = "您好," + reader["nickname"].ToString();
                Label5.Text = reader["name"].ToString();
                Label6.Text = reader["cellphone1"].ToString();
                Label7.Text = reader["counties"].ToString();
                Label8.Text = reader["area"].ToString();
                Label9.Text = reader["address"].ToString();
                email = reader["email"].ToString();
                memberid = reader["member_id"].ToString();
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
        
    
        connStr.Close();

    }

    private void order()
    {

        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        connStr.Open();
        String AddNew = string.Format("INSERT INTO order2(member_id,email,pay,distribution,invoice,remark,price,date,schedule) VALUES('" + memberid + "','" + email + "','" + RadioButtonList1.Text + "','" + RadioButtonList2.Text + "','" + RadioButtonList3.Text + "','" + TextBox1.Text + "','" + Label4.Text + "','" + DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") + "','未出貨')");
        MySqlCommand AddNewCmd = new MySqlCommand(AddNew, connStr);
        AddNewCmd.Connection = connStr;
        //執行新增
        AddNewCmd.ExecuteNonQuery();
        connStr.Close();
        orderid();
    }

    private void orderid()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.order2 where member_id= '"+memberid+"'";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            order_id = reader["order_id"].ToString();
        }
        connStr.Close();
        
        update();
    }

    private void update()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        connStr.Open();
        String update = string.Format("update shopping set order_id='{0}' where email='" + cookie.Value.ToString() + "';",order_id);
        MySqlCommand AddNewCmd = new MySqlCommand(update, connStr);
        AddNewCmd.Connection = connStr;
        //執行新增
        AddNewCmd.ExecuteNonQuery();
        connStr.Close();
        shopping();
        orderdetial();
    }

    private void shopping()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.shopping where order_id= '" + order_id + "'";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            name += reader["name"].ToString() + ",";
        }
        connStr.Close();

    }

    private void orderdetial()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        connStr.Open();
        String AddNew = string.Format("INSERT INTO orderdetial_i(order_id,commodity_id,fodder_id,quantity,price) SELECT order_id,commodity_id,fodder_id,quantity,price FROM petkitchen.shopping WHERE email='" + cookie.Value.ToString() + "';");
        MySqlCommand AddNewCmd = new MySqlCommand(AddNew, connStr);
        AddNewCmd.Connection = connStr;
        //執行新增
        AddNewCmd.ExecuteNonQuery();
        connStr.Close();
    }

    private void delete()
    {
        /*刪除*/
        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
        string delete = string.Format("DELETE FROM shopping where email='" + cookie.Value.ToString() + "';");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Write("<script language=javascript>history.go(-2);</script>");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        order(); 
        delete();
        Response.Redirect("finish.aspx?id="+order_id+"&name="+name);
        
    }
}