using AllPay.Payment.Integration;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_finish : System.Web.UI.Page
{
    int rows;
    string id;
    string pay;
    string email;
    string price;

    string str_allergens_quantity;
    string str_allergens_price;
    string str_allergens_neme;

    string str_allergens_commodity_price;
    string str_allergens_fodder_price;
    string str_allergens_commodity;
    string str_allergens_foddername;
    string commodity_id;
    string fodder_id;
    string select;
    string[] commodity = new string[33];
    string[] foddername = new string[200];
    string[] commodity_price = new string[200];
    string[] fodder_price = new string[200];

    string[] orderdetial_quantity = new string[200];
    string[] orderdetial_price = new string[200];
    string[] orderdetial_name = new string[200];

  
    int[] orderdetial_price_int = new int[200];

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["useremail"].Value == "")
        {
            Response.Write("<script>alert('請先登入');location.href='nologinhome.aspx';</script>");

        }
        else
        {
            // check();
               mamberData();
               Data();
               orderdetial();
               count();
            //    commodity = str_allergens_commodity.Split(',');
            //    commodity_price = str_allergens_fodder_price.Split(',');

            str_allergens_neme = Request.QueryString["name"];
        


            orderdetial_quantity = str_allergens_quantity.Split(',');
            orderdetial_price= str_allergens_price.Split(',');
            orderdetial_name = str_allergens_neme.Split(',');


            for (int i=0;i< rows;i++)
            {
                orderdetial_price_int[i] = int.Parse(orderdetial_price[i]) / int.Parse(orderdetial_quantity[i]);
            }


            if (pay == "ATM轉帳")
                {
                    Label3.Text = "您的訂單已經訂購完畢，請您盡速匯款，匯款完畢後我們會盡快為您出貨。" + "<br>" + "匯款代號：700" + "<br>" + "匯款帳號：00510081745874";
                    SendMail2();
                }
                else if (pay == "歐付寶")
                {
                    Button2.Visible = true;
                    Label3.Text = "您的訂單已經訂購完畢，請您盡速使用歐付寶付款，付款完畢後我們會盡快為您出貨。" + "<br>" + "匯款代號：700" + "<br>" + "匯款帳號：00510081745874";
                  //  SendMail2();
                }
                else
                {
                    Label3.Text = "您的訂單已經訂購完畢，我們會盡快為您出貨。";
                    SendMail();
                }
            }
       
    }

    private void mamberData()
    {
        //
        //TODO 連線到資料庫
        //

        HttpCookie cookie = Request.Cookies["useremail"];

        // Response.Write("顯示cookie物件的單值(cookie.Value)：" + cookie.Value + "<hr/>");

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

        if (Request.Cookies["useremail"] != null)
        {
           
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
    }

    public void SendMail()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        //建立 SmtpClient 物件 並設定 Gmail的smtp主機及Port  
        System.Net.Mail.SmtpClient MySmtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);

        //設定你的帳號密碼
        MySmtp.Credentials = new System.Net.NetworkCredential("b11157123x@gmail.com", "boy37201");

        //Gmial 的 smtp 必需要使用 SSL
        MySmtp.EnableSsl = true;

        //發送Email
        MySmtp.Send("b11157123x@gmail.com", cookie.Value.ToString(), "寵物飼料購買完成", "非常感謝您的訂購，我們會盡快為您出貨." + "\n\n\n\n" + "注意：本郵件是由寵物廚房系統自動產生與發送，請勿直接回覆"); MySmtp.Dispose();

    }

    public void SendMail2()
    {
        HttpCookie cookie = Request.Cookies["useremail"];
        //建立 SmtpClient 物件 並設定 Gmail的smtp主機及Port  
        System.Net.Mail.SmtpClient MySmtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);

        //設定你的帳號密碼
        MySmtp.Credentials = new System.Net.NetworkCredential("b11157123x@gmail.com", "boy37201");

        //Gmial 的 smtp 必需要使用 SSL
        MySmtp.EnableSsl = true;

        //發送Email
        MySmtp.Send("b11157123x@gmail.com", cookie.Value.ToString(), "寵物飼料購買完成", "非常感謝您的訂購，請您盡速匯款，匯款完畢後我們會盡快為您出貨." + "\n\n\n\n" + "注意：本郵件是由寵物廚房系統自動產生與發送，請勿直接回覆"); MySmtp.Dispose();

    }

  /*  private void check()
    {
        //
        //TODO 連線到資料庫
        //
        id = Request.QueryString["id"];
        HttpCookie cookie = Request.Cookies["useremail"];

        // Response.Write("顯示cookie物件的單值(cookie.Value)：" + cookie.Value + "<hr/>");

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);



        String select = "SELECT * FROM  orderdetial_i WHERE order_id = '" + id + "'";


        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            commodity_id += reader["commodity_id"].ToString();
            fodder_id += reader["fodder_id"].ToString();
        }
        connStr.Close();


    }*/


    private void Data()
    {
        //
        //TODO 連線到資料庫
        //
       id = Request.QueryString["id"];
 

        // Response.Write("顯示cookie物件的單值(cookie.Value)：" + cookie.Value + "<hr/>");

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

      
             select = "SELECT * FROM order2 WHERE order_id = '" + id + "'";
     
       


        connStr.Open();
            MySqlCommand cmd = new MySqlCommand(select, connStr);
            reader = cmd.ExecuteReader();

            //將資料庫中資料存入陣列
            while (reader.Read())
            {
                pay = reader["pay"].ToString();
                email = reader["email"].ToString();
                price = reader["price"].ToString();
              
        }
            connStr.Close();


    }

    private void orderdetial()
    {
        //
        //TODO 連線到資料庫
        //
        id = Request.QueryString["id"];
        HttpCookie cookie = Request.Cookies["useremail"];

        // Response.Write("顯示cookie物件的單值(cookie.Value)：" + cookie.Value + "<hr/>");

        //連線到MySql資料庫
        MySqlDataReader reader;
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);

            select = "SELECT * FROM orderdetial_i AS t1 INNER JOIN order2 AS t2 ON t1.order_id= t2.order_id  WHERE t2.order_id = '" + id + "'";
   

        connStr.Open();
        MySqlCommand cmd = new MySqlCommand(select, connStr);
        reader = cmd.ExecuteReader();

        //將資料庫中資料存入陣列
        while (reader.Read())
        {
            str_allergens_quantity += reader["quantity"].ToString()+",";
            str_allergens_price += reader["price"].ToString() + ",";
        }
        connStr.Close();

        
    }

   private void count()
    {
        id = Request.QueryString["id"];
        MySqlConnection connStr = new MySqlConnection(ConfigurationManager.ConnectionStrings["LocalMySqlServer"].ConnectionString);
        MySqlCommand cmdMySQL = connStr.CreateCommand();
        cmdMySQL.CommandText = "SELECT COUNT(*) FROM petkitchen.orderdetial_i where order_id='" + id + "'";
        connStr.Open();
        object scalar = cmdMySQL.ExecuteScalar();
        rows = int.Parse(scalar.ToString());
        connStr.Close();
      
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("commodity.aspx");
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
         id = Request.QueryString["id"];
        List<string> enErrors = new List<string>();

        try
        {
            using (AllInOne oPayment = new AllInOne())
            {
                /* 服務參數 */
                oPayment.ServiceMethod = HttpMethod.HttpPOST;
                oPayment.ServiceURL = "https://payment-stage.allpay.com.tw/Cashier/AioCheckOut";
                oPayment.HashKey = "5294y06JbISpM5x9";
                oPayment.HashIV = "v77hoKGq4kWxNNIS";
                oPayment.MerchantID = "2000132";
                /* 基本參數 */
                oPayment.Send.ReturnURL = "https://payment-stage.allpay.com.tw/Cashier/AioCheckOut";
                //oPayment.Send.ClientBackURL = "<<您要歐付寶返回按鈕導向的瀏覽器端網址>>";
                //oPayment.Send.OrderResultURL = "<<您要收到付款完成通知的瀏覽器端網址>>";
                oPayment.Send.MerchantTradeNo = "648513244"+id;
                oPayment.Send.MerchantTradeDate = DateTime.Parse("2016/12/05");
                oPayment.Send.TotalAmount = Decimal.Parse(price);
                oPayment.Send.TradeDesc = "很酷";
                oPayment.Send.ChoosePayment = PaymentMethod.ALL;
                //oPayment.Send.Remark = "<<您要填寫的其他備註>>";
                oPayment.Send.ChooseSubPayment = PaymentMethodItem.None;
                oPayment.Send.NeedExtraPaidInfo = ExtraPaymentInfo.Yes;
                oPayment.Send.HoldTrade = HoldTradeType.No;
                oPayment.Send.DeviceSource = DeviceType.PC;
                oPayment.Send.UseRedeem = UseRedeemFlag.Yes; //購物金/紅包折抵
                oPayment.Send.IgnorePayment = "Alipay"; // 例(排除財富通):Tenpay

                // 加入選購商品資料。

                for (int i = 0; i < rows; i++)
                {
                    oPayment.Send.Items.Add(new Item()
                    {
                        Name = orderdetial_name[i],
                        Price = Decimal.Parse(orderdetial_price_int[i].ToString()),
                        Currency = "元",
                        Quantity = Int32.Parse(orderdetial_quantity[i]),
                        URL = " << 產品說明位址 >> "
                    });
                }
                


                // 當付款方式為 ALL 時，建議增加的參數。
                //oPayment.SendExtend.PaymentInfoURL = "<<您要接收回傳自動櫃員機/超商/條碼付款相關資訊的網址。>> ";
                /* 產生訂單 */
                enErrors.AddRange(oPayment.CheckOut());
                /* 產生產生訂單 Html Code 的方法 */
                string szHtml = String.Empty;
                enErrors.AddRange(oPayment.CheckOutString(ref szHtml));
            }
        }
        catch (Exception ex)
        {
            // 例外錯誤處理。
            enErrors.Add(ex.Message);
        }
        finally
        {
            // 顯示錯誤訊息。
            if (enErrors.Count() > 0)
            {
                string szErrorMessage = String.Join("\\r\\n", enErrors);
            }
        }
    }
}
