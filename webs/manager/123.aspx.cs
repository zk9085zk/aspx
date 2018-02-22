using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_123 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        for (int i = 1; i <= 10; i++)
        {
            Button button10 = new Button();
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            button10.Text = "詳情" + i;
            button10.Click += new EventHandler(lbtn_Click2);
            cell1.Controls.Add(button10);
            row.Cells.Add(cell1);

            Table1.Rows.Add(row);
        }
    }


 protected void lbtn_Click2(object sender, EventArgs e)
    {
        Response.Write("ClickBtn");
        TextBox1.Text = "121";
         Button lbtn = (Button)sender;

       Response.Redirect("backmanagercommodity2.aspx");
    }
}