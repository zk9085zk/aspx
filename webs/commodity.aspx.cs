using Facebook;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_commodity : System.Web.UI.Page
{
    string[] str_petname = new string[100];//商品名稱
    string[] str_commodity = new string[100];//名字
    string[] str_memberid = new string[100];//ID
    string[] str_img = new string[100];//圖片
    int int_pet = 0;//寵物數量
    


    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //
        HttpCookie cookie = Request.Cookies["useremail"];
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.member where email='" + cookie.Value.ToString() + "';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
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
    }

    protected void Page_Load(object sender, EventArgs e)
    {



        mamberData();
        SelectPet();
        DynamicPetObject();
       
    }

    private void SelectPet()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.commodity;";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            str_memberid[int_pet] = reader["id"].ToString().Trim();
            str_petname[int_pet] = reader["discount"].ToString().Trim();
            str_commodity[int_pet] = reader["commodity"].ToString().Trim();
            str_img[int_pet] = reader["photourl"].ToString().Trim();

            int_pet++;
        }
        connStr.Close();
    }

    private void DynamicPetObject()
    {
        //
        //TODO 動態生成寵物選擇物件
        //

        for (int i = 0; i < int_pet; i++)
        {
            
            commodity civ_item = new commodity();
            civ_item.int_gd =3;
            civ_item.str_name = str_petname[i];
            civ_item.str_imgurl = str_img[i];
            civ_item.srt_commodity = str_commodity[i];
            civ_item.init();
         //   civ_item._btn_img.ID = i.ToString().Trim();
          //  civ_item._btn_img.Click +=_btn_img_Click;
            civ_item._btn_choice.ID = i.ToString().Trim();//ID
            civ_item._btn_choice.Click += _btn_choice_Click;//事件
            UpdatePanel1.ContentTemplateContainer.Controls.Add(civ_item);
            
        }
    }

    private void _btn_img_Click(object sender, EventArgs e)
    {
        //
        //TODO 選擇按鈕按下時
        //

        for (int i = 0; i < int_pet; i++)
        {

            if (((ImageButton)sender).ID == i.ToString().Trim())
            {
                Session["str_memberid"] = str_memberid[i];
                Response.Redirect("commodity2.aspx?id=" + str_memberid[i]);
            }
        }
    }

    private void _btn_choice_Click(object sender, EventArgs e)
    {
        //
        //TODO 選擇按鈕按下時
        //

        for (int i = 0; i < int_pet; i++)
        {
        
            if (((LinkButton)sender).ID == i.ToString().Trim())
            {
                Session["str_memberid"] = str_memberid[i];
                Response.Redirect("commodity2.aspx?id="+ str_memberid[i]);
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("purchase.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("fodder_pet.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {

    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("member.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {

    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("re_member.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("member.aspx");
    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("commodity2.aspx?id="+"1");
    }



    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("commodity2.aspx?id=" + "1");
    }

    protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("commodity2.aspx?id=" + "2");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("commodity2.aspx?id=" + "2");
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("commodity2.aspx?id=" + "3");
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("commodity2.aspx?id=" + "3");
    }

    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("commodity2.aspx?id=" + "4");
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("commodity2.aspx?id=" + "4");
    }
}