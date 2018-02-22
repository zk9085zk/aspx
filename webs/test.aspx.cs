using AllPay.Payment.Integration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webs_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
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
                oPayment.Send.MerchantTradeNo = "64851324452";
                oPayment.Send.MerchantTradeDate = DateTime.Parse("2016/12/05");
                oPayment.Send.TotalAmount = Decimal.Parse("1000");
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
                oPayment.Send.Items.Add(new Item()
                {
                    Name = "66",
                    Price = Decimal.Parse("100"),
                    Currency = "元",
                    Quantity = Int32.Parse("1"),
                    URL = " << 產品說明位址 >> "
                });


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
