using System;
using System.Collections.Generic;
using System.IO;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web;

public partial class webs_purchase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //
        //TODO: 當網頁loding
        //
        mamberData();
        ConnectDatabase();

    }

    private void ConnectDatabase()
    {
        //
        //TODO: 連線到資料庫，產生商品物件。
        //

        MySqlDataReader reader;
        MySqlConnection msc_conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.item inner join petkitchen.photos ON item.itemimg=photos.photos_id;";
        msc_conn.Open();
        MySqlCommand cmd = new MySqlCommand(select, msc_conn);
        reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            DisplayItemView div_item = new DisplayItemView();
            div_item.int_gd = 3;
            div_item.str_name = reader["itemname"].ToString().Trim();
            div_item.int_price = int.Parse(reader["itemprice"].ToString().Trim());
            div_item.str_imgurl = reader["itemimg"].ToString().Trim();
            div_item.init();


            UpdatePanel1.ContentTemplateContainer.Controls.Add(div_item);
        }
        UpdatePanel1.ID = "sortableo";

        reader.Close();

        msc_conn.Close();

        

    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("purchase.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("feed.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {

    }

    protected void Button6_Click(object sender, EventArgs e)
    {

    }

    protected void Button7_Click(object sender, EventArgs e)
    {

    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        //
        // TODO: 查資料庫指定商品
        //

        UpdatePanel1.ContentTemplateContainer.Controls.Clear();

        MySqlDataReader reader;
        MySqlConnection msc_conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.item inner join petkitchen.photos ON item.itemimg=photos.photos_id where itemname LIKE '%" + tx_autoSearch.Text.Trim() + "%';";
        msc_conn.Open();
        MySqlCommand cmd = new MySqlCommand(select, msc_conn);
        reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            DisplayItemView div_item = new DisplayItemView();
            div_item.int_gd = 2;
            div_item.str_name = reader["itemname"].ToString().Trim();
            div_item.int_price = int.Parse(reader["itemprice"].ToString().Trim());
            div_item.str_imgurl = reader["itemimg"].ToString().Trim();
            div_item.init();


            UpdatePanel1.ContentTemplateContainer.Controls.Add(div_item);
        }

        reader.Close();

        msc_conn.Close();
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
                Label2.Text = "您好," + reader["nickname"].ToString();
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
                Label3.Text = "登出";
            }
        }
    }
}