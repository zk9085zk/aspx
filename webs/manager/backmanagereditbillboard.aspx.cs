using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_backmanagerupdatebillboard : System.Web.UI.Page
{



    private void search()
    {
        /*搜尋*/

        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
        String id = Request.QueryString["id"];
        
        String sql = "SELECT * FROM billboard where id = @id ";

        MySqlCommand cmd = new MySqlCommand(sql, connStr);
        cmd.Parameters.AddWithValue("@id", id);
        
        reader = cmd.ExecuteReader();


        while (reader.Read())
        {

            Label22.Text = DateTime.Parse(reader["time"].ToString()).ToString("yyyy/MM/dd");
            DropDownList1.Text = reader["sort"].ToString();
            TextBox6.Text = reader["title"].ToString();
            CKEditorControl1.Text = reader["content"].ToString();

        }
        connStr.Close();
    }

    private void update()
    {
        /*更新*/
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        String id = Request.QueryString["id"];
        string update = string.Format("update billboard set time='{0}', sort='{1}', title='{2}', content='{3}' where id=@id", Label22.Text, DropDownList1.Text, TextBox6.Text, CKEditorControl1.Text);
        MySqlCommand updateCmd = new MySqlCommand(update, connStr);
        updateCmd.Parameters.AddWithValue("@id", id);
        updateCmd.Connection = connStr;
        //執行更新
        updateCmd.ExecuteNonQuery();

        connStr.Close();
    }

    private void delete()
    {
        /*刪除*/
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        String id = Request.QueryString["id"];
        string delete = string.Format("DELETE FROM billboard WHERE id = @id ");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Parameters.AddWithValue("@id", id);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            search();
        }
    }
   

    protected void Button15_Click(object sender, EventArgs e)
    {
        Label22.Text = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
        update();
        Response.Redirect("backmanagereditbillboard.aspx?id=" + Request.QueryString["id"]);
    }

    protected void Button16_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagerbillboard.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        delete();
        Response.Redirect("backmanagerbillboard.aspx");
    }
}