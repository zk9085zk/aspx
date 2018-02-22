using Facebook;
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

public partial class webs_manager_backmanagerorder : System.Web.UI.Page
{
    string aa;
    string bb;
    string id;
    string com;



    protected void Page_Load(object sender, EventArgs e)
    {


        //新增第一行
                   TableRow row = new TableRow();
                   TableCell cell1 = new TableCell();
                   TableCell cell2 = new TableCell();
                   TableCell cell3 = new TableCell();
                   TableCell cell4 = new TableCell();

                    cell1.Text = "會員EMAIL";
                   cell1.CssClass = "row2";
                   row.TableSection = TableRowSection.TableHeader;
                   row.Cells.Add(cell1);

                               cell2.Text = "訂單價格";
                               cell2.CssClass = "row2";
                               row.Cells.Add(cell2);

                              cell3.Text = "訂單時間";
                              cell3.CssClass = "row2";
                              row.Cells.Add(cell3);

                              cell4.Text = "";
                              row.Cells.Add(cell4);

                            
                               

        Table1.Rows.Add(row); 
        //  if (!Page.IsPostBack)
        //  {
        mamberData();
        //  }

    }

    private void mamberData()
    {


        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);


        connStr.Open();
        String sql = "SELECT * FROM  member AS t1 INNER JOIN order2 AS t2 ON t1.email = t2.email ORDER BY t2.date DESC ";
        MySqlCommand cmd2 = new MySqlCommand(sql, connStr);
        reader = cmd2.ExecuteReader();




        while (reader.Read())
        {


            Button button10 = new Button();

            Image image = new Image();

            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();


            cell1.Text = reader["email"].ToString();
            cell1.CssClass = "table_a";
            row.Cells.Add(cell1);

            cell2.Text = reader["price"].ToString();
            cell2.CssClass = "table_a";
            row.Cells.Add(cell2);

            cell3.Text = reader["date"].ToString();
            cell3.CssClass = "table_a";
            row.Cells.Add(cell3);

            button10.Text = "詳細訂單";
            button10.ID = reader["order_id"].ToString();
            button10.Click += new EventHandler(lbtn_Click2);
            button10.CssClass = "button button1";
            cell4.Controls.Add(button10);
            row.Cells.Add(cell4);




            //產生表格
            Table1.Rows.Add(row);

        }



        connStr.Close();


    }



   



    protected void lbtn_Click2(object sender, EventArgs e)
    {


        Button lbtn = (Button)sender;

        Response.Redirect("backmanagerorder2.aspx?id=" + lbtn.ID);

    }



   



}