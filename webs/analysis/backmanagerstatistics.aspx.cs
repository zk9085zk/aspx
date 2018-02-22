using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class webs_manager_backmanagerstatistics : System.Web.UI.Page
{
    float f_google_in = 0;
    float f_fb_in = 0;
    float f_gengeneral_in = 0;
    float f_google = 0;
    float f_fb = 0;
    float f_gengeneral = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        searchData();
        proportion();
    }

    public void searchData()
    {

        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.member ";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            if (reader["whereid"].ToString().Equals("google"))
            {
                f_google_in++;
            }
            if (reader["whereid"].ToString().Equals("fb"))
            {
                f_fb_in++;
            }
            if (reader["whereid"].ToString().Equals("general"))
            {
                f_gengeneral_in++;
            }
        }
        connStr.Close();
    }
    public void proportion()
    {
        float all = f_google_in + f_fb_in + f_gengeneral_in;
        f_google = f_google_in / all * 100;
        f_fb = f_fb_in / all * 100;
        f_gengeneral = f_gengeneral_in / all * 100;
        TextBox1.Text = f_google.ToString();
        TextBox2.Text = f_fb.ToString();
        TextBox3.Text = f_gengeneral.ToString();
        Label3.Text = "GOOGLE註冊" + f_google_in.ToString()+"人";
        Label4.Text = "Facebook註冊" + f_fb_in.ToString() + "人";
        Label5.Text = "一般註冊" + f_gengeneral_in.ToString() + "人";
    }
}