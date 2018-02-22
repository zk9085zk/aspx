using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Collections;

public partial class webs_mypet_petdetail : System.Web.UI.Page
{
    string str_petmemberId;
    string str_petname;
    string str_subspecies;
    string str_sex;
    string str_species;
    string srt_weight;
    string str_hairlengh;
    string str_ligation;
    string str_haircolor;
    string str_hairstyle;
    string str_birthday;
    string str_allergens;
    string str_birthdayStringTemp1;
    string str_birthdayStringTemp2;
    string str_birthdayStringTemp3;
    string[] str_allergensItemArray = {"","羊肉","雞肉","鮭魚","鱉肉","鹿肉","鴨肉","牛肉","豬肉","火雞肉","鵪鶉肉","干貝","鮪魚","沙丁","鱈魚","雞蛋"};
    string[] str_allergensSplitArray = new string[100];
    int int_allergensSplitArrayItem;
    string str_allergensShow;
    


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["useremail"].Value == "")
        {
            Response.Write("<script>alert('請先登入');location.href='/webs/nologinhome.aspx';</script>");

        }
        else
        {
            //抓取上一頁點擊的資料ID
            str_petmemberId = Session["str_petmemberid"].ToString();
            //連線到資料庫
            mamberData();
            init();
            


            //把原本的str_birthday生日格式(20160320) 分割成年月日
            str_birthdayStringTemp1 = str_birthday.Substring(0, 4); // 從第1個字元開始擷取4個字  2016
            str_birthdayStringTemp2 = str_birthday.Substring(5, 2); // 從第5個字元開始擷取2個字  03
            str_birthdayStringTemp3 = str_birthday.Substring(8, 2); // 從第7個字元開始擷取2個字  20

            //重組生日字串
            str_birthday = str_birthdayStringTemp1 + "年" + str_birthdayStringTemp2 + "月" + str_birthdayStringTemp3 + "日";

            //判斷過敏原是否為無，是則顯示無過敏源，否則切割陣列並顯示
           

            //新增資料至label
            label_petName.Text = str_petname;
            label_petspecies.Text = str_species;
            label_hairLengh.Text = str_hairlengh;
            label_petSex.Text = str_sex;
            label_petLigation.Text = str_ligation;
            label_petSubSpecies.Text = str_subspecies;
            label_petWeight.Text = srt_weight;
            label_petHairColor.Text = str_haircolor;
            label_petHairStyle.Text = str_hairstyle;
            label_petBirthday.Text = str_birthday;
        }
    }

    private void Split()
    {
        try
        {
                if (str_allergens == "無")
            {
                label_petAllergens.Text = "無過敏源";
            }
            else
            {
                //把str_allergens內的字元格式(2,3,4,5,6,8,)分割成陣列[2,3,4,5,6,8]
                str_allergensSplitArray = str_allergens.Split(',');

                //顯示陣列內容 PS
                for (int i = 0; i < str_allergensSplitArray.Length - 1; i++)
                {
                    //利用分割後str_allergens的內容去顯示str_allergensItemArray陣列的內容
                    str_allergensShow += str_allergensItemArray[int.Parse(str_allergensSplitArray[i])] + "、";
                }

                //顯示內容


                str_allergensShow = str_allergensShow.TrimEnd('、');
                label_petAllergens.Text = str_allergensShow;
            }
        }
        catch
        {

        }
    }


    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //
        HttpCookie cookie = Request.Cookies["useremail"];
        if (Request.Cookies["useremail"] != null)
        {

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
    }



    private void init()
    {
        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.pet WHERE pet_id = " + str_petmemberId +" ";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            if (reader["photourl"].ToString().Trim() == "")
            {
                Image2.ImageUrl = "~/img/noimage.png";
            }
            else
            {
                Image2.ImageUrl = reader["photourl"].ToString().Trim();
            }
           
            str_petname = reader["petname"].ToString().Trim();
            str_species= reader["species"].ToString().Trim();
            str_subspecies = reader["subspecies"].ToString().Trim();
            srt_weight = reader["weight"].ToString().Trim()+"公斤";
            str_sex = reader["sex"].ToString().Trim();
            str_hairlengh = reader["hairlengh"].ToString().Trim();
            str_ligation = reader["ligation"].ToString().Trim();
            str_haircolor = reader["haircolor"].ToString().Trim();
            str_hairstyle = reader["hairstyle"].ToString().Trim();
            str_birthday = reader["birthday"].ToString().Trim();
            str_allergens = reader["allergens"].ToString().Trim();
           
        }
        Split();
        connStr.Close();
    }

    private void order2()
    {
        /*刪除*/
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        connStr.Open();

        string delete = string.Format("DELETE FROM pet WHERE pet_id = " + str_petmemberId +  " ");
        MySqlCommand deleteCmd = new MySqlCommand(delete, connStr);
        deleteCmd.Connection = connStr;
        //執行刪除
        deleteCmd.ExecuteNonQuery();

        connStr.Close();
    }

    protected void Buttonback_Onclick(object sender, EventArgs e)
    {
        Response.Redirect("petmanager.aspx");
    }




    protected void Button1_Onclick(object sender, EventArgs e)
    {

        Response.Redirect("petmanagerupdate.aspx?id=" + str_petmemberId);
    }

    protected void Button2_Onclick(object sender, EventArgs e)
    {
        order2();
        Response.Redirect("/webs/mypet/petmanager.aspx");
    }
}
 