using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_manager_backmanagersales : System.Web.UI.Page
{
    float f_a_in = 0;
    float f_b_in = 0;
    float f_c_in = 0;
   
    float f_a = 0;
    float f_b = 0;
    float f_c = 0;

    float f_a_count;
    float f_b_count;
    float f_c_count;
    string a;
    string b;
    string c;
    string d;
    string e;
    int[] array = new int[33];
    string[] aa = new string[33];
    int tmp;

    protected void Page_Load(object sender, EventArgs e)
    {
        searchData();
        searchcommodity();
        test();
        proportion();
      
    }

    public struct Student
    {
        public string Name;
        public int Score;

        public Student(string name, int score)
        {
            this.Name = name;
            this.Score = score;
        }
    };

    public void test()
    {

        Student[] students = new Student[] {new Student( aa[1], array[1]),
                                        new Student( aa[2], array[2]),
                                        new Student( aa[3], array[3]),
                                        new Student( aa[4], array[4]),
                                        new Student( aa[5], array[5]),
                                        new Student( aa[6], array[6]),
                                        new Student( aa[7], array[7]),
                                        new Student( aa[8], array[8]),
                                        new Student( aa[9], array[9]),
                                        new Student( aa[10], array[10]),
                                        new Student( aa[11], array[11]),
                                        new Student( aa[12], array[12]),
                                        new Student( aa[13], array[13]),
                                        new Student( aa[14], array[14]),
                                        new Student( aa[15], array[15]),
                                        new Student( aa[16], array[16]),
                                        new Student( aa[17], array[17]),
                                        new Student( aa[18], array[18]),
                                        new Student( aa[19], array[19]),
                                        new Student( aa[20], array[20]),
                                        new Student( aa[21], array[21]),
                                        new Student( aa[22], array[22]),
                                        new Student( aa[23], array[23]),
                                        new Student( aa[24], array[24]),
                                        new Student( aa[25], array[25]),
                                        new Student( aa[26], array[26]),
                                        new Student( aa[27], array[27]),
                                        new Student( aa[28], array[28]),
                                        new Student( aa[29], array[29]),
                                        new Student( aa[30], array[30]),
                                        new Student( aa[31], array[31]),
                                        new Student( aa[32], array[32])
        };

        // 氣泡排序法，由大到小排序
        for (int i = 0; i < 32; i++)
        {
            for (int j = i + 1; j < 32; j++)
            {
                if (students[i].Score < students[j].Score)
                {
                    Student temp = students[i];
                    students[i] = students[j];
                    students[j] = temp;
                }
            }
        }

       

        f_a_count = array[31];
        f_b_count = array[30];
        f_c_count = array[29];

        float all = students[0].Score + students[1].Score + students[2].Score;
        f_a = students[0].Score / all * 100;
        f_b = students[1].Score / all * 100;
        f_c = students[2].Score / all * 100;

        TextBox1.Text = f_a.ToString();
        TextBox2.Text = f_b.ToString();
        TextBox3.Text = f_c.ToString();
        TextBox4.Text = students[0].Score.ToString();
        TextBox5.Text = students[1].Score.ToString();
        TextBox6.Text = students[2].Score.ToString();
        TextBox7.Text = students[0].Name.ToString();
        TextBox8.Text = students[1].Name.ToString();
        TextBox9.Text = students[2].Name.ToString();
    }

    public void searchData()
    {

        //
        //TODO 連線到資料庫
        //
       
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.orderdetial_i ";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            for (int i = 1; i <= 32; i++)
            {
                if (reader["commodity_id"].ToString().Equals(i.ToString()))
                {
                    array[i] += int.Parse(reader["quantity"].ToString());
                    
                  
                }
            }
           
        }
        connStr.Close();
    }

    public void searchcommodity()
    {

        //
        //TODO 連線到資料庫
        //
       
        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        String select = "SELECT * FROM petkitchen.commodity ";
        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {

            for (int i = 1; i <= 32; i++)
            {

                if (reader["id"].ToString().Equals(i.ToString()))
                {

                    aa[i] = reader["commodity"].ToString();

                }
            }


        }
        connStr.Close();
    }

    public void proportion()
    {

        for (int i = 0; i < 31; i++)
        {
            for (int j = i + 1; j < 32; j++)
            {
                if (array[j] < array[i])
                {
                    tmp = array[j];
                    array[j] = array[i];
                    array[i] = tmp;
                }
            }
        }

        

    }


   
}