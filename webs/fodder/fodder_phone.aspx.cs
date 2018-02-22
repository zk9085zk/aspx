using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_fodder_fodder_phone : System.Web.UI.Page
{
    string str_petweight;
    string str_fooddername;
    string str_petname;
    string str_subspecies;
    string str_price;
    string str_species;
    string srt_weight;
    string str_fodderweight;
    string str_ligation;
    string str_haircolor;
    string str_hairstyle;
    string str_birthday;
    string str_allergens;

    string[] str_allergensItemArray = { "增加體重", "肥胖代謝", "血糖管理", "腎臟護理", "心臟保養", "泌尿道保養", "關節保養", "消化護理", "視力保健", "皮膚修護", "毛髮亮澤", "環境除臭" };
    string[] str_allergensSplitArray = new string[100];
    int int_allergensSplitArrayItem;
    string str_allergensShow;
    string str;
    string name;
    int quantity;
    int price;
    string photourl;
    string total;
    private static int i = 0;
    string id;
    string test;
    string aa;
    string protein;
    string heat;
    string fiber;
    string calcium;
    string vitamins;

    protected void Page_Load(object sender, EventArgs e)
    {

        //抓取上一頁點擊的資料ID

        //連線到資料庫
       
        init();


        this.Literal1.Text = "\"" + protein + "\";";
        this.Literal2.Text = "\"" + heat + "\";";
        this.Literal3.Text = "\"" + fiber + "\";";
        this.Literal4.Text = "\"" + calcium + "\";";
        this.Literal5.Text = "\"" + vitamins + "\";";

        //把str_allergens內的字元格式(2,3,4,5,6,8,)分割成陣列[2,3,4,5,6,8]




    }

    private void Split()
    {
        try
        {
                str_allergens = str_allergens.TrimEnd(',');
                str_allergensSplitArray = str_allergens.Split(',');

                //顯示陣列內容 PS
                for (int i = 0; i < str_allergensSplitArray.Length; i++)
                {
                    //利用分割後str_allergens的內容去顯示str_allergensItemArray陣列的內容
                    str_allergensShow += str_allergensItemArray[int.Parse(str_allergensSplitArray[i])] + "、";
                }

                //顯示內容

                str = str_allergensShow.TrimEnd('、');
                label_petAllergens.Text = str;


                //新增資料至label
                label_fodderName.Text = str_fooddername;
                label_fodderWeight.Text = str_fodderweight;
                label_petweight.Text = str_petweight;
                label_price.Text = str_price;
        }
        catch
        {

        }
    }

 


    private void init()
    {
        //
        //TODO 連線到資料庫
        //
        String id = Request.QueryString["id"];
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM pet AS t1 INNER JOIN fodder AS t2 ON t1.pet_id = t2.pet_id where t2.fodder_id ='" + id + "'";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            if (reader["fodderimg"].ToString().Trim() == "")
            {
                Image2.ImageUrl = "~/img/noimage.png";
            }
            else
            {
                Image2.ImageUrl = reader["fodderimg"].ToString().Trim();
            }


            str_fooddername = reader["foddername"].ToString().Trim();
            str_fodderweight = reader["fodder_weight"].ToString().Trim() + "公斤";
            str_price = reader["price"].ToString().Trim();
            str_petweight = reader["weight"].ToString().Trim() + "公斤";
            str_allergens = reader["formula"].ToString().Trim();
            protein = reader["protein"].ToString().Trim();
            heat = reader["heat"].ToString().Trim();
            fiber = reader["fiber"].ToString().Trim();
            calcium = reader["calcium"].ToString().Trim();
            vitamins = reader["vitamins"].ToString().Trim();
            Split();
        }

        connStr.Close();
    }



   

  
   
}