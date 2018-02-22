using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_backmanagersearchpet : System.Web.UI.Page
{

    private String email;

    private void search()
    {
        /*搜尋*/

        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
        String email = Request.QueryString["email"];
        String name = Request.QueryString["name"];
        
        String sql = "SELECT * FROM member where email = @email or name = @name";

        MySqlCommand cmd = new MySqlCommand(sql, connStr);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@name", name);
        reader = cmd.ExecuteReader();


        while (reader.Read())
        {
            Label30.Text= reader["name"].ToString(); 
            Label31.Text= reader["email"].ToString();
            email = reader["email"].ToString();

           
        }
        connStr.Close();

        // 搜尋寵物
        MySqlDataReader reader2;
        connStr.Open();
        String sql2 = "SELECT * FROM pet where email = @email";

        MySqlCommand cmd2 = new MySqlCommand(sql2, connStr);
        cmd2.Parameters.AddWithValue("@email", email);

        reader2 = cmd2.ExecuteReader();


        while (reader2.Read())
        {
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
            TableCell cell5 = new TableCell();


            cell1.Text = reader2["petname"].ToString();
            row.Cells.Add(cell1);

            cell2.Text = reader2["subspecies"].ToString();
            //cell2.Font.Size = FontUnit.Large; //設定文字尺寸
            //cell2.ForeColor = System.Drawing.Color.Blue; //設定文字顏色
            //cell2.BackColor = System.Drawing.Color.Red; //設定文字顏色
            row.Cells.Add(cell2);

            cell3.Text = reader2["birthday"].ToString();
            row.Cells.Add(cell3);

            cell4.Text = reader2["weight"].ToString();
            row.Cells.Add(cell4);

            cell5.Text = reader2["sex"].ToString();
            row.Cells.Add(cell5);

            //產生表格
            Table1.Rows.Add(row);

        }
        connStr.Close();

    }

   
    protected void Page_Load(object sender, EventArgs e)
    {
        //新增第一行
        TableRow row = new TableRow();
        TableCell cell1 = new TableCell();
        TableCell cell2 = new TableCell();
        TableCell cell3 = new TableCell();
        TableCell cell4 = new TableCell();
        TableCell cell5 = new TableCell();
    

        cell1.Text = "寵物";
        row.Cells.Add(cell1);

        cell2.Text = "種類";
        row.Cells.Add(cell2);

        cell3.Text = "生日";
        row.Cells.Add(cell3);

        cell4.Text = "體重";
        row.Cells.Add(cell4);

        cell5.Text = "性別";
        row.Cells.Add(cell5);

        Table1.Rows.Add(row);

        if (!Page.IsPostBack)
        {
            search();
        }
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagersearchpet.aspx?email=" + TextBox1.Text + "&name=" + TextBox2.Text);

    }
}