using System;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web;

public partial class webs_orderform : System.Web.UI.Page
{
    String str_older_id;
    String[] str_fodder_id;
    String[] str_itemname;
    String[] str_itemNum;
    String[] str_itemPrice;
    String str_tempID = "";
    String str_tempName = "";
    String str_tempNum = "";
    String str_tempPrice = "";
    String abc = "";
    int[] int_foodNum;
    int int_num;//筆數數量
    protected void Page_Load(object sender, EventArgs e)
    {
        //str_older_id = DateTime.Now.ToString("yyyyMMddHHmm");
        //Label1.Text = str_older_id;
        mamberData();
        str_older_id = "2011080230";
        food();      //飼料
        health();    //保健品
        str_fodder_id = str_tempID.Split(',');
        commonity(); //商品資料
        str_itemname = str_tempName.Split(',');
        str_itemNum = str_tempNum.Split(',');
        str_itemPrice = str_tempPrice.Split(',');
        older();     //訂單
        for (int i = 1; i < str_itemname.Length; i++)
        {
            OrderListView olv_order = new OrderListView();
            olv_order.str_imgurl = "http://img.udn.com/image/product/S0001126/APPROVED/U003935547/20140821165040591_300.jpg";
            olv_order.str_orderCode = str_older_id;
            olv_order.str_itemName = str_itemname[i];
            olv_order.int_number = Int32.Parse(str_itemNum[i]);
            olv_order.int_price = Int32.Parse(str_itemPrice[i]);
            olv_order.init();
            Panel1.Controls.Add(olv_order);
        }
    }

    public void older()
    {

        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.order";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {

        }
        connStr.Close();
    }
    public void food()
    {

        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.orderdetial_f";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            if (str_older_id.Equals(reader["order_id"].ToString().Trim()))
            {
                str_tempID = str_tempID + "," + reader["fodder_id"].ToString().Trim();
                str_tempNum = str_tempNum + "," + reader["number"].ToString().Trim();
            }
        }


        //Label2.Text = "我是2" + Convert.ToString(str_fodder_id.Length);
        connStr.Close();
    }
    public void health()
    {

        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.orderdetial_i";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            if (str_older_id.Equals(reader["order_id"].ToString().Trim()))
            {
                str_tempID = str_tempID + "," + reader["item_id"].ToString().Trim();
                str_tempNum = str_tempNum + "," + reader["number"].ToString().Trim();
            }
        }
        connStr.Close();
    }
    public void commonity()
    {

        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫

        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.item";
        for (int i = 0; i < str_fodder_id.Length; i++)
        {
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            reader = cmd.ExecuteReader();
            //將資料庫中資料存入陣列
            while (reader.Read())
            {
                if (str_fodder_id[i].Trim().Equals(reader["item_id"].ToString().Trim()))
                {
                    str_tempName = str_tempName + "," + reader["itemname"].ToString().Trim();
                    str_tempPrice = str_tempPrice + "," + reader["itemprice"].ToString().Trim();

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
                Label1.Text = "您好,"+reader["nickname"].ToString();
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
                Label4.Text = "登出";
            }
        }
    }
}