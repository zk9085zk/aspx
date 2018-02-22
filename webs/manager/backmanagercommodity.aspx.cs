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

public partial class webs_manager_backmanagercommodity : System.Web.UI.Page
{
    string aa;
    string bb;
    string id;
    string com;
   


    protected void Page_Load(object sender, EventArgs e)
    {


        /*//新增第一行
                   TableRow row = new TableRow();
                   TableCell cell1 = new TableCell();
                   TableCell cell2 = new TableCell();
                   TableCell cell3 = new TableCell();


                   cell1.Text = "商品名稱";
                   cell1.CssClass = "row";
                   row.TableSection = TableRowSection.TableHeader;
                   row.Cells.Add(cell1);

                               cell2.Text = "商品圖片";
                               cell2.CssClass = "row";
                               row.Cells.Add(cell2);

                              cell3.Text = "特色1";
                              row.Cells.Add(cell3);

                              cell4.Text = "特色2";
                              row.Cells.Add(cell4);

                              cell5.Text = "特色3";
                              row.Cells.Add(cell5);

                              cell6.Text = "注意事項1";
                              row.Cells.Add(cell6);

                              cell7.Text = "注意事項2";
                              row.Cells.Add(cell7);

                              cell8.Text = "注意事項3";
                              row.Cells.Add(cell8);

                              cell9.Text = "成分";
                              row.Cells.Add(cell9);

                              cell10.Text = "建議售價";
                              row.Cells.Add(cell10);

                              cell11.Text = "網路價";
                              row.Cells.Add(cell11);

                              cell12.Text = "產地";
                              row.Cells.Add(cell12);
                              Table1.Rows.Add(row);

                              cell13.Text = "內容物";
                              row.Cells.Add(cell12);
                              Table1.Rows.Add(row);

                              cell14.Text = "照片";
                              row.Cells.Add(cell14);
                               

        Table1.Rows.Add(row); */
      //  if (!Page.IsPostBack)
       // {
            mamberData();
       // }
       
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
            String sql = "SELECT * FROM petkitchen.commodity";
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


                cell1.Text = reader["commodity"].ToString();
                cell1.CssClass = "table_a";
                row.Cells.Add(cell1);

                image.ImageUrl = reader["photourl"].ToString().Trim();
                image.Height = 125;
                image.Width = 125;
                image.CssClass = "zz";
                cell2.Controls.Add(image);
                row.Cells.Add(cell2);

                button10.Text = "詳細資料";
                button10.ID = reader["id"].ToString();
                button10.Click += new EventHandler(lbtn_Click2);
                button10.CssClass = "button button1";
                cell3.Controls.Add(button10);
                row.Cells.Add(cell3);




                //產生表格
                Table1.Rows.Add(row);

            }

        

            connStr.Close();
       
        
    }



    private void search()
    {
        /*搜尋*/

        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();
        String id = com;
        String commodity = com;
        String sql = "SELECT * FROM commodity where id = @id or commodity = @commodity";

        MySqlCommand cmd = new MySqlCommand(sql, connStr);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@commodity", commodity);
        reader = cmd.ExecuteReader();


        while (reader.Read())
        {


            Button button10 = new Button();

            Image image = new Image();

            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();


            cell1.Text = reader["commodity"].ToString();
            cell1.CssClass = "table_a";
            row.Cells.Add(cell1);

            image.ImageUrl = reader["photourl"].ToString().Trim();
            image.Height = 125;
            image.Width = 125;
            image.CssClass = "zz";
            cell2.Controls.Add(image);
            row.Cells.Add(cell2);

            button10.Text = "詳細資料";
            button10.ID = reader["id"].ToString();
            button10.Click += new EventHandler(lbtn_Click2);
            button10.CssClass = "button button1";
            cell3.Controls.Add(button10);

            row.Cells.Add(cell3);




            //產生表格
            Table1.Rows.Add(row);


        }
        connStr.Close();
    }

 

    protected void lbtn_Click2(object sender, EventArgs e)
    {

        
            Button lbtn = (Button)sender;

            Response.Redirect("backmanagercommodity2.aspx?id=" + lbtn.ID);
        
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagercommodityinsert.aspx");
    }


    
    protected void Button2_Click(object sender, EventArgs e)
    {


       
            this.Label3.Text = Request.Form["text"];
            com = Label3.Text;
         
            search();
        
    }
}