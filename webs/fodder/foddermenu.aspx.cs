using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_fodder_foddermenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        mamberData();
        text();

    }
    private void text()
    {
        int txt1, txt2, txt3, txt4, txt5, txt6, txt7, txt8;

        Label10.Text = "3900";
        Label11.Text = "28.8";
        Label12.Text = "3.1";

        txt1 = Convert.ToInt32(Label10.Text);
        txt2 = Convert.ToInt32(Label10.Text);
        txt3 = Convert.ToInt32(Label10.Text);

        Label1.Text = "" + txt1 * 1 * 1.025 * 0.975;
        Label2.Text = "" + txt1 * 1 * 1.025 * 0.975;
        Label3.Text = "" + txt1 * 1 * 1.025 * 0.975;

        Label13.Text = "10 ,  1.2  ,   0.3";
        Label14.Text = "7 ,  0.8  ,   0.5";
        Label15.Text = "12 ,  1.5  ,   1.2";

    }

    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //
        HttpCookie cookie = Request.Cookies["useremail"];
        if (Request.Cookies["useremail"] != null
)
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
                Label20.Text = "您好," + reader["nickname"].ToString();
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