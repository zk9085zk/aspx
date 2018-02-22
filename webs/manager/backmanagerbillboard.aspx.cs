using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_backmanagerdeletebillboard : System.Web.UI.Page
{

    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
     //顯示公告


        connStr.Open();
        String sql = "SELECT * FROM petkitchen.billboard ORDER BY time DESC";

        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);

        reader = cmd2.ExecuteReader();


        while (reader.Read())
        {


            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();

            cell1.Text = DateTime.Parse(reader["time"].ToString()).ToString("yyyy/MM/dd");
            row.Cells.Add(cell1);


            cell2.Text = reader["sort"].ToString();
            //cell2.Font.Size = FontUnit.Large; //設定文字尺寸
            //cell2.ForeColor = System.Drawing.Color.Blue; //設定文字顏色
            //cell2.BackColor = System.Drawing.Color.Red; //設定文字顏色
            row.Cells.Add(cell2);

            cell3.Text = "<a href='" + "backmanagereditbillboard.aspx?id=" + reader["id"].ToString() + "'>" + reader["title"].ToString() + "</a>";
            row.Cells.Add(cell3);


            //產生表格
            Table1.Rows.Add(row);

        }
        connStr.Close();

    }
  


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //新增第一行
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();


            cell1.Text = "日期";
            row.Cells.Add(cell1);

            cell2.Text = "類別";
            row.Cells.Add(cell2);

            cell3.Text = "標題";
            row.Cells.Add(cell3);


            Table1.Rows.Add(row);

            mamberData();

        }
    }


    
   
}