using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_registeremail : System.Web.UI.Page
{
    string q;
    protected void Page_Load(object sender, EventArgs e)
    {
        q = Request.QueryString["aa"];
        Response.Write(q);

        select();
        Response.Redirect("checkmail.aspx");
    }

    public void select()
    {
        //資料庫連結修改
        MySqlDataReader reader;
        MySqlConnection msc_conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        msc_conn.Open();
        String update = "UPDATE `petkitchen`.`member` SET `condition`='True' WHERE `member_id`='" + q+"';";
        MySqlCommand cmd = new MySqlCommand(update, msc_conn);

        reader = cmd.ExecuteReader();

        msc_conn.Close();
    }
}