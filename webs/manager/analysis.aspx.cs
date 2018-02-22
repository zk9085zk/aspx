using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_analysis : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }





    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/webs/analysis/backmanagerstatistics.aspx");
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/webs/analysis/backmanagersales.aspx");
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/webs/analysis/backmanagerformula.aspx");
    }
}