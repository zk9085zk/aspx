using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;


public partial class webs_fodder_pet_fodder : System.Web.UI.Page
{
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
                

            }
            order();
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

        cell1.Text = "寵物姓名";
        cell1.CssClass = "row2";
        row.Cells.Add(cell1);

        cell2.Text = "寵物種類";
        cell2.CssClass = "row2";
        row.Cells.Add(cell2);

        cell3.Text = "體重";
        cell3.CssClass = "row2";
        row.Cells.Add(cell3);

        cell4.Text = "生日";
        cell4.CssClass = "row2";
        row.Cells.Add(cell4);
        

        cell5.Text = "";
        row.Cells.Add(cell5);
        Table1.Rows.Add(row);

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
        String select = "SELECT * FROM pet where email ='" + cookie.Value.ToString() + "';";
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
            TableCell cell5 = new TableCell();


            cell1.Text = reader["petname"].ToString();
            cell1.CssClass = "table_a";
            row.Cells.Add(cell1);

            cell2.Text = reader["species"].ToString();
            cell2.CssClass = "table_a";
            row.Cells.Add(cell2);

            cell3.Text = reader["weight"].ToString();
            cell3.CssClass = "table_a";
            row.Cells.Add(cell3);

            cell4.Text = reader["birthday"].ToString();
            cell4.CssClass = "table_a";
            row.Cells.Add(cell4);

            button10.Text = "客製化";
            button10.ID = reader["pet_id"].ToString();
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

        Response.Redirect("/webs/fodder/fodder.aspx?pet_id=" + lbtn.ID);

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