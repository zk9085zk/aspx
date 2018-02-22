using MySql.Data.MySqlClient;
using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_backmanagercommodity2 : System.Web.UI.Page
{
    string str_tempPath;
    string aa;

    protected void Page_Load(object sender, EventArgs e)
    {
        mamberData();
        init();
        aa = str_tempPath.ToString();
        Image2.ImageUrl = aa;
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
            Label5.Text = reader["ingredient"].ToString();
            Label6.Text = reader["feature1"].ToString();
            Label7.Text = reader["feature2"].ToString();
            Label8.Text = reader["feature3"].ToString();
            Label9.Text = reader["price"].ToString();
            Label10.Text = reader["discount"].ToString();
            Label11.Text = reader["origin"].ToString();
            Label12.Text = reader["notice1"].ToString();
            Label13.Text = reader["notice2"].ToString();
            Label14.Text = reader["content"].ToString();
        }
        connStr.Close();
    }
    private void init()
    {
        //
        //TODO 初始化設定
        //           

        //連線到資料庫
        MySqlDataReader reader;
        MySqlConnection msc_conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        //讀取資料庫中圖片資料
        String id = Request.QueryString["id"];
        String select = "SELECT * FROM petkitchen.commodity where id = @id";
        msc_conn.Open();
        MySqlCommand cmd = new MySqlCommand(select, msc_conn);
        cmd.Parameters.AddWithValue("@id", id);
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {

            //一筆一筆加入字串
            str_tempPath = reader["photourl"].ToString().Trim();

        }

        //關閉資料庫
        msc_conn.Close();




    }
    private void delete()
    {
        /*刪除*/
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        String id = Request.QueryString["id"];
        string delete = string.Format("DELETE FROM commodity WHERE id = @id ");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Parameters.AddWithValue("@id", id);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagercommodity3.aspx?id=" + Request.QueryString["id"]);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        delete();
        Response.Redirect("backmanagercommodity.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagercommodity.aspx");
    }
}