
using MySql.Data.MySqlClient;
using System;

using System.Configuration;

using System.Web;

using System.Web.UI;


public partial class webs_commodity2 : System.Web.UI.Page
{



    string fileName;//圖片檔名
    string str_tempPath;//用於暫存字串以做分割使用
    string aa;
    string name;
    int quantity;
    int price;
    string photourl;
    string total;
    private static int i = 0;
    string id;
    string test;
    string email;



    protected void Page_Load(object sender, EventArgs e)
    {




        Data();
        mamberData();
    // init(); 
        shopping();
        aa = str_tempPath.ToString();
        Image2.ImageUrl = aa;
        Image3.ImageUrl = aa;
        //分割從資料庫加入的字串
        mamber();
       
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



        String select = "SELECT * FROM petkitchen.member where email='" + cookie.Value.ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {

           
            email = reader["email"].ToString();
           
        }
        connStr.Close();


    }

    private void mamber()
    {
        //
        //TODO 連線到資料庫
        //
       
        if (email != "")
        {
           
            //連線到MySql資料庫
            MySqlDataReader reader;
            MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
            //String id = Request.QueryString["member"];
            String select = "SELECT * FROM petkitchen.member where email ='" + email + "';";
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
        else
        {
            Label1.Text = "您尚未登入，部分功能尚未開啟";
            Label2.Text = "登入";
            Image1.ImageUrl = "~/img/head.png";
        }

    }

    private void shopping()
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
            name= reader["commodity"].ToString();
            price = int.Parse(reader["discount"].ToString());
           

        }
        connStr.Close();
    }

    private void insert()
    {

        HttpCookie cookie = Request.Cookies["useremail"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
        String AddNew = string.Format("INSERT INTO shopping(commodity_id,email,name,quantity,price,photourl) VALUES('{0}','{1}','{2}','{3}','{4}','{5}')", id, cookie.Value.ToString(),name,quantity.ToString(),total,aa);
        MySqlCommand AddNewCmd = new MySqlCommand(AddNew, connStr);
        AddNewCmd.Connection = connStr;
        //執行新增
        AddNewCmd.ExecuteNonQuery();
       // i++;
        connStr.Close();
       
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
        String select = "SELECT * FROM petkitchen.commodity where id = @id";  
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        cmd.Parameters.AddWithValue("@id", id);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            Label3.Text = reader["commodity"].ToString();
            Label4.Text = reader["recommend"].ToString();
            Label5.Text = reader["feature1"].ToString();
            Label6.Text = reader["feature2"].ToString();
            Label7.Text = reader["feature3"].ToString();
            Label8.Text = reader["price"].ToString();
            Label9.Text = reader["discount"].ToString();
            Label10.Text = reader["commodity"].ToString();
            Label11.Text = reader["recommend"].ToString();
            Label12.Text = reader["feature1"].ToString();
            Label13.Text = reader["feature2"].ToString();
            Label14.Text = reader["feature3"].ToString();
            Label15.Text = reader["commodity"].ToString();
            Label16.Text = reader["ingredient"].ToString();
            Label17.Text = reader["notice1"].ToString();
            Label18.Text = reader["notice2"].ToString();
            Label19.Text = reader["origin"].ToString();
            Label20.Text = reader["content"].ToString();
            str_tempPath = reader["photourl"].ToString().Trim();
        }
        connStr.Close();
    }

  

    protected void Button2_Click1(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["useremail"];

        if (cookie.Value.ToString() == "")
        {
            
            ScriptManager.RegisterClientScriptBlock(this.UpdatePanel1, this.UpdatePanel1.GetType(), "alert", "alert('請先登入');location.href='nologinhome.aspx';", true);
        }
        else
        {


            quantity = int.Parse(DropDownList1.Text);
            total = (quantity * price).ToString();

           
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
                test = reader["commodity_id"].ToString();
            }

            if (id == test)
            {

                ScriptManager.RegisterClientScriptBlock(this.UpdatePanel1, this.UpdatePanel1.GetType(), "alert", "alert('此商品已加入購物車');", true);


            }
            else
            {
                insert();
                ScriptManager.RegisterClientScriptBlock(this.UpdatePanel1, this.UpdatePanel1.GetType(), "alert", "alert('商品已加入購物車');", true);
            }
            connStr.Close();
        }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        quantity = int.Parse(DropDownList1.Text);
        total = (quantity * price).ToString();
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
            test = reader["commodity_id"].ToString();
        }

        if (id == test)
        {

            ScriptManager.RegisterClientScriptBlock(this.UpdatePanel2, this.UpdatePanel2.GetType(), "alert", "alert('此商品已加入購物車');", true);

        }
        else
        {
            insert();
            Response.Redirect("shopping.aspx?id=" + id);
        }
        connStr.Close();
    }
}