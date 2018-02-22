using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_backmanageraddbillboard : System.Web.UI.Page
{
    private void insert()
    {
        MySqlDataReader reader;

        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        String AddNew = string.Format("INSERT INTO billboard(sort, title, content ,time) VALUES('{0}','{1}','{2}','{3}')", DropDownList1.Text, TextBox6.Text, CKEditorControl1.Text, DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));
        MySqlCommand AddNewCmd = new MySqlCommand(AddNew, connStr);
        AddNewCmd.Connection = connStr;
        //執行新增
        AddNewCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button15_Click(object sender, EventArgs e)
    {
       // Label22.Text = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
       insert();
        Response.Redirect("backmanageraddbillboard.aspx?title=" + TextBox6.Text);
    }
}