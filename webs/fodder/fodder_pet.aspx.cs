using System;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web;
//寵物選擇
public partial class webs_fodder_pet : System.Web.UI.Page
{
    /*資料參數*/
    string[] str_petname = new string[100];//名字
    string[] str_img = new string[100];//名字
    int int_pet = 0;//寵物數量
    string[] str_memberid = new string[100];//會員

    protected void Page_Load(object sender, EventArgs e)
    {
        //
        //TODO 頁面載入
        //
        mamberData();
        SelectPet();
        DynamicPetObject();
    }


    private void _btn_choice_Click(object sender, EventArgs e)
    {
        //
        //TODO 選擇按鈕按下時
        //

        for (int i = 0; i < int_pet; i++)
        {
            if (((Button)sender).ID == i.ToString().Trim())
            {
                Session["str_memberid"] = str_memberid[i];
                Response.Redirect("fodder.aspx");
            }
        }
    }

    private void DynamicPetObject()
    {
        //
        //TODO 動態生成寵物選擇物件
        //

        for (int i = 0; i < int_pet; i++)
        {
            ChoiceItemView civ_item = new ChoiceItemView();
            civ_item.int_gd = 2;
            civ_item.str_name = str_petname[i];
            civ_item.str_imgurl = str_img[i];
            civ_item.init();
            civ_item._btn_choice.ID = i.ToString().Trim();//ID
            civ_item._btn_choice.Click += _btn_choice_Click;//事件
            UpdatePanel1.ContentTemplateContainer.Controls.Add(civ_item);
        }
    }

    private void SelectPet()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.pet;";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            str_memberid[int_pet] = reader["member_id"].ToString().Trim();
            str_petname[int_pet] = reader["petname"].ToString().Trim();
          //  str_img[int_pet] = reader["petimg"].ToString().Trim();
           
            int_pet++;
        }
        connStr.Close();
    }



    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("fodder_pet.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("foddernext.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/webs/mypet/petmanager.aspx");

    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/webs/member/member.aspx");
    }

    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //
        HttpCookie cookie = Request.Cookies["useremail"];
        if (Request.Cookies["useremail"] != null)
        {
            int i = 0;
            //連線到MySql資料庫
            MySqlDataReader reader;
            MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
            //String id = Request.QueryString["member"];
            String select = "SELECT * FROM petkitchen.member where email ='" + cookie.Value.ToString() + "';";
            // String select = "SELECT * FROM petkitchen.member where member_id = @id";
            connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            //cmd.Parameters.AddWithValue("@id", id);
            reader = cmd.ExecuteReader();

            //將資料庫中資料存入陣列
            while (reader.Read())
            {
                i = 1;
                Label1.Text = "您好," + reader["nickname"].ToString();
                if (reader["img"] == null)
                {
                    Image1.ImageUrl = "~/img/head.png";
                }
                else
                {
                    Image1.ImageUrl = reader["img"].ToString();
                }

            }
            connStr.Close();
            if (i == 1)
            {
                Label2.Text = "登出";
            }
        }
    }
}