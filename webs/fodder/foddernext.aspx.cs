using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//選擇修改寵物客製化
public partial class webs_foddernext : System.Web.UI.Page
{
    /*資料參數*/
    string[] str_foddername = new string[100];//名字
    string[] str_fodderimgg = new string[100];//照片
    string[] str_price = new string[100];//價錢
    string[] str_fodderId = new string[100];//
    int int_pet = 0;//寵物數量
    int int_img = 0;//照片數量
    string Foolproof_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["useremail"].Value == "")
        {
            Response.Write("<script>alert('請先登入');location.href='/webs/nologinhome.aspx';</script>");

        }
        else
        {
            mamberData();
            SelectPet();
            DynamicPetObject();
           
        }
    }

    private void Foolproof()
    {
        /*刪除*/
        String id = Request.QueryString["id"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        string delete = string.Format("DELETE FROM fodder WHERE fodder_id = " + Foolproof_id + " ");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }

    private void DynamicPetObject()
    {
        //
        //TODO 動態生成寵物選擇物件
        //

        for (int i = 0; i < int_pet; i++)
        {
            ManagerFodderView mfv_item = new ManagerFodderView();
            mfv_item.int_grid = 2;
            mfv_item.str_name = str_foddername[i];
            mfv_item.str_imgurl = str_fodderimgg[i];
            mfv_item.int_price = str_price[i];
            mfv_item.init();
            mfv_item._btn_buy.ID = i.ToString().Trim();//ID
            mfv_item._btn_buy.Click += _btn_buy_Click;//事件

           

            UpdatePanel1.ContentTemplateContainer.Controls.Add(mfv_item);
        }

    }

    private void _btn_buy_Click(object sender, EventArgs e)
    {
        //
        //TODO 選擇按鈕按下時
        //


        for (int i = 0; i < int_pet; i++)
        {
            if (((Button)sender).ID == i.ToString().Trim())
            {

               
                Response.Redirect("/webs/fodder/foddernext2.aspx?id=" + str_fodderId[i]);
            }
        }
    }

   

    private void DeletePet(int i)
    {
        //
        //TODO 連線到資料庫
        //

        MySqlDataReader reader;
        MySqlConnection msc_conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String delete = "DELETE FROM petkitchen.fodder WHERE fodder_id='" + str_fodderId[i] + "';";
        msc_conn.Open();
        MySqlCommand cmd = new MySqlCommand(delete, msc_conn);
        reader = cmd.ExecuteReader();
        msc_conn.Close();
    }

    private void SelectPet()
    {
        //
        //TODO 連線到資料庫
        //
        HttpCookie cookie = Request.Cookies["useremail"];
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.fodder where email='"+cookie.Value.ToString()+"';";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();
        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            if (reader["foddername"].ToString().Trim() == "" || reader["fodder_weight"].ToString().Trim() == "")
            {
                Foolproof_id= reader["fodder_id"].ToString().Trim();
                Foolproof();
            }
            else
            {
            str_fodderId[int_pet]= reader["fodder_id"].ToString().Trim();
            str_foddername[int_pet] = reader["foddername"].ToString().Trim();
            str_price[int_pet] = reader["price"].ToString().Trim();
            str_fodderimgg[int_pet] = reader["fodderimg"].ToString().Trim();
            int_pet++;
            }
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