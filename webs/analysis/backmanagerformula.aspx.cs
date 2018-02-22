using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_backmanagerformula : System.Web.UI.Page
{
    float f_a_in = 0;
    float f_b_in = 0;
    float f_c_in = 0;
    float f_d_in = 0;
    float f_e_in = 0;
    float f_f_in = 0;
    float f_g_in = 0;
    float f_h_in = 0;
    float f_i_in = 0;
    float f_j_in = 0;
    float f_k_in = 0;
    float f_l_in = 0;
    string a;
    string b;
    string c;
    string d;
    string e;
    string str_allergens;
    string[] str_allergensItemArray = { "增加體重", "肥胖代謝", "血糖管理", "腎臟護理", "心臟保養", "泌尿道保養", "關節保養", "消化護理", "視力保健", "皮膚修護", "毛髮亮澤", "環境除臭" };
    string[] str_allergensSplitArray = new string[100];
    string str_allergensShow;

    protected void Page_Load(object sender, EventArgs e)
    {
        searchData();
        proportion();
     
    }



    public void searchData()
    {

        //
        //TODO 連線到資料庫
        //

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.fodder ";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            str_allergens += reader["formula"].ToString().Trim();
        }
        sp();
        connStr.Close();
    }

    private void sp()
    {

       str_allergensSplitArray = str_allergens.Split(',');

        //顯示陣列內容 PS
        for (int i = 0; i < str_allergensSplitArray.Length; i++)
        {
            //利用分割後str_allergens的內容去顯示str_allergensItemArray陣列的內容
             if(str_allergensSplitArray[i]== "0")
            {
                f_a_in++;
            }
            if (str_allergensSplitArray[i] == "1")
            {
                f_b_in++;
            }
            if (str_allergensSplitArray[i] == "2")
            {
                f_c_in++;
            }
            if (str_allergensSplitArray[i] == "3")
            {
                f_d_in++;
            }
            if (str_allergensSplitArray[i] == "4")
            {
                f_e_in++;
            }
            if (str_allergensSplitArray[i] == "5")
            {
                f_f_in++;
            }
            if (str_allergensSplitArray[i] == "6")
            {
                f_g_in++;
            }
            if (str_allergensSplitArray[i] == "7")
            {
                f_h_in++;
            }
            if (str_allergensSplitArray[i] == "8")
            {
                f_i_in++;
            }
            if (str_allergensSplitArray[i] == "9")
            {
                f_j_in++;
            }
            if (str_allergensSplitArray[i] == "10")
            {
                f_k_in++;
            }
            if (str_allergensSplitArray[i] == "11")
            {
                f_l_in++;
            }
        }
       
    }

    public void proportion()
    {
        TextBox1.Text = f_a_in.ToString();
        TextBox2.Text = f_b_in.ToString();
        TextBox3.Text = f_c_in.ToString();
        TextBox4.Text = f_d_in.ToString();
        TextBox5.Text = f_e_in.ToString();
        TextBox6.Text = f_f_in.ToString();
        TextBox7.Text = f_g_in.ToString();
        TextBox8.Text = f_h_in.ToString();
        TextBox9.Text = f_i_in.ToString();
        TextBox10.Text = f_j_in.ToString();
        TextBox11.Text = f_k_in.ToString();
        TextBox12.Text = f_l_in.ToString();
    }


  
}