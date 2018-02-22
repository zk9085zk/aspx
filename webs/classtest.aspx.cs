using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_classtest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        for (int i = 1; i < 11; i++)
        {
            PetManagementView pmv_temp = new PetManagementView();
            UpdatePanel1.ContentTemplateContainer.Controls.Add(pmv_temp);
        }
    }
}