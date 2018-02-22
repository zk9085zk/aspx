using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;

public partial class webs_backmanagerinsert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Buttoninsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagerinsert.aspx");
    }
    protected void Buttondelete_Click(object sender, EventArgs e)
    {
        
    }
    protected void Buttonupdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("backmanagerupdate.aspx");
    }
}