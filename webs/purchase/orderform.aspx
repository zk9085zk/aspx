<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderform.aspx.cs" Inherits="webs_orderform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- 圖示CSS -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
    <!-- 最新編譯和最佳化的 CSS -->
    <link href="/css/bootstrap-theme.min.css" rel="stylesheet" />
    <!-- w3 card的 CSS -->
    <link href="/css/w3.css" rel="stylesheet" />
    <!-- 選擇性佈景主題 -->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- 最新編譯和最佳化的 JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function getValue() {
            '<% Session.Add("fbid", null); %>';
            '<% Session.Add("googleid", null); %>';
             '<% Session.Add("user", "1"); %>';
        }
    </script>
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
        <nav class="w3-sidenav w3-collapse w3-card-2 w3-animate-left" style="width: 18%; background-color: #00796B" id="mySidenav">
            <a href="javascript:void(0)" onclick="w3_close()"
                class="w3-closenav w3-large w3-hide-large">收起 &times;</a>
            <a href="#" style="color: white;">
                <h1>寵物廚房</h1>
            </a>
             <a href="#" style="color: white;">+
                <h1>
                    <asp:Label ID="Label1" runat="server" Text="您尚未登入"></asp:Label></h1>
            </a>
            <asp:Image ID="Image1"  runat="server" Height="100px" Width="100px" Style="margin-left:70px" ImageUrl="https://scontent-tpe1-1.xx.fbcdn.net/v/t1.0-9/13177259_1106987156026514_5456761746775041918_n.jpg?oh=bdfc1f82ed5e3c2cf36b26fb9fc2a16d&oe=582113BE" />
            <a href="#" style="color: white">
            </a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-user" aria-hidden="true"></i>會員中心</h4>
            </a>
            <a href="/webs/member/member.aspx" style="color: white;">我的基本資料</a>
            <a href="/webs/member/memberbuy.aspx" style="color: white;">我的購物紀錄</a>

            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-paw" aria-hidden="true"></i>寵物管理</h4>
            </a>
            <a href="/webs/mypet/petmanager.aspx" style="color: white;">我的毛小孩</a>
            <a href="/webs/mypet/petmanagerinsert.aspx" style="color: white;">註冊毛小孩</a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-cutlery" aria-hidden="true"></i>糧身菜單</h4>
            </a>
            <a href="/webs/fodder/fodder_pet.aspx" style="color: white;">菜單設計</a>
            <a href="/webs/fodder/foddernext.aspx" style="color: white;">菜單總覽</a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-shopping-basket" aria-hidden="true"></i>商品選購</h4>
            </a>
            <a href="/webs/purchase/orderform.aspx" style="color: white;">我的購物車</a>
            <a href="/webs/purchase/purchase.aspx" style="color: white;">寵物保健品</a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-phone" aria-hidden="true"></i>客服中心</h4>
            </a>
            <a href="/webs/info/contact.aspx" style="color: white;">聯絡我們</a>
            <a href="/webs/info/shoppinginfo.aspx" style="color: white;">購物須知</a>
            <a href="/webs/info/askme.aspx" style="color: white;">客服留言</a>
        </nav>


        <div class="w3-main" style="margin-left: 18%;">
            <ul class="w3-navbar w3-border w3-xlarge col-md-12 navbar-fixed-top " style="background-color: #006064; position: fixed">
                <li class="col-md-2">
                    <a style="color: white; text-align: center; background-color: #004D40">
                        <h1>柚子私房菜</h1>
                    </a>
                </li>
                <li class="col-md-9">
                    <a style="color: white; text-align: center; background-color: #004D40">
                        <h1>我的購物車</h1>
                    </a>
                </li>
                <li class="col-md-1 w3-black" id="li0" onclick="getValue()" aria-autocomplete="none">
                    <a style="color: white; text-align: center" href="/webs/login.aspx">
                        <h1>
                            <asp:Label ID="Label4" runat="server" Text="登入"></asp:Label></h1>
                    </a>
                </li>
            </ul>

            <div class="w3-container w3-card-12" style="padding-top: 100px">
                <div class="col-md-12">
                    <div class="col-md-12 w3-card-12">
                        <div class="col-md-12" style="border: thin ridge #000000; background-color: #CCEEFF">
                            <b>購物單號:546877845415</b>
                        </div>
                        <div class="col-md-12" style="background-color: #5599FF; border-width: thin; border-color: #000000; border-right-style: ridge; border-bottom-style: ridge; border-left-style: ridge">
                            <div class="col-md-2 w3-center" style="border-right-style: ridge; border-width: thin; border-color: #000000">
                                <b>圖片</b>
                            </div>
                            <div class="col-md-2 w3-center" style="border-right-style: ridge; border-width: thin; border-color: #000000">
                                <b>編號</b>
                            </div>
                            <div class="col-md-3 w3-center" style="border-right-style: ridge; border-width: thin; border-color: #000000">
                                <b>品名</b>
                            </div>
                            <div class="col-md-2 w3-center" style="border-right-style: ridge; border-width: thin; border-color: #000000">
                                <b>數量</b>
                            </div>
                            <div class="col-md-1 w3-center" style="border-right-style: ridge; border-width: thin; border-color: #000000">
                                <b>單價</b>
                            </div>
                            <div class="col-md-1 w3-center" style="border-right-style: ridge; border-width: thin; border-color: #000000">
                                <b>小計</b>
                            </div>
                            <div class="col-md-1 w3-center">
                                <b>刪除</b>
                            </div>
                        </div>

                        <asp:Panel CssClass="col-md-12" ID="Panel1" runat="server">
                        </asp:Panel>

                        <div class="col-md-12" style="border-width: thin; border-color: #000000; background-color: #FFFFBB; border-right-style: ridge; border-bottom-style: ridge; border-left-style: ridge;">
                            <b class="w3-left">目前消費金額不足 1000‧必須收運費：70 </b>
                            <b class="w3-right w3-text-red">*總計：
                    <asp:Label ID="Label3" runat="server" Text="210"></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                            </b>
                        </div>

                        <div class="col-md-12" style="background-color: #5599FF; border-width: thin; border-color: #000000; border-right-style: ridge; border-bottom-style: ridge; border-left-style: ridge">
                            <b>請選擇付款方式</b>
                        </div>
                        <div class="col-md-12" style="background-color: #CCEEFF; border-width: thin; border-color: #000000; border-right-style: ridge; border-bottom-style: ridge; border-left-style: ridge">
                            <asp:RadioButton ID="RadioButton1" runat="server" Text="貨到收款" /><br />
                            <asp:RadioButton ID="RadioButton2" runat="server" Text="提款機ATM轉帳" /><br />
                            <asp:RadioButton ID="RadioButton3" runat="server" Text="銀行匯款" /><br />
                            <asp:RadioButton ID="RadioButton4" runat="server" Text="郵局劃撥" /><br />
                            如果您選擇轉帳匯款，請輸入您轉出帳戶的後5碼：
                <asp:TextBox ID="TextBox2" runat="server" Style="width: 80px"></asp:TextBox>
                            (以方便核帳)
                        </div>
                        <div class="col-md-12" style="background-color: #5599FF; border-width: thin; border-color: #000000; border-right-style: ridge; border-bottom-style: ridge; border-left-style: ridge">
                            <b>請填寫資料:</b>
                        </div>
                        <div class="col-md-12" style="background-color: #CCEEFF; border-width: thin; border-color: #000000; border-right-style: ridge; border-bottom-style: ridge; border-left-style: ridge">
                            <b>購買人姓名:</b>
                            <asp:TextBox ID="TextBox3" runat="server" Style="width: 120px"></asp:TextBox>
                            (請填全名)
                <asp:RadioButton ID="RadioButton5" runat="server" Text="先生" />
                            <asp:RadioButton ID="RadioButton6" runat="server" Text="小姐" /><br />
                            <b>電話:</b>
                            <asp:TextBox ID="TextBox4" runat="server" Style="width: 180px"></asp:TextBox>
                            (手機優先，供出貨聯絡)
                <br />
                            <b>E-MAIL:</b>
                            <asp:TextBox ID="TextBox5" runat="server" Style="width: 180px"></asp:TextBox><br />
                            <b>郵遞區號:
                <asp:TextBox ID="TextBox6" runat="server" Style="width: 80px"></asp:TextBox>
                                <asp:LinkButton ID="LinkButton1" runat="server">查詢區號  </asp:LinkButton>
                                <b>地址:</b>
                                <asp:TextBox ID="TextBox7" runat="server" Style="width: 180px"></asp:TextBox><br />
                                <b>統一編號:</b>
                                <asp:TextBox ID="TextBox8" runat="server" Style="width: 180px"></asp:TextBox>
                                <b>公司抬頭:</b>
                                <asp:TextBox ID="TextBox9" runat="server" Style="width: 180px"></asp:TextBox><br />
                        </div>
                        <div class="col-md-12" style="background-color: #5599FF; border-width: thin; border-color: #000000; border-right-style: ridge; border-bottom-style: ridge; border-left-style: ridge">
                            <b>收貨人資料 >> </b>
                            <asp:LinkButton class="w3-text-red" ID="LinkButton2" runat="server">資料同購買人請按此</asp:LinkButton>
                        </div>
                        <div class="col-md-12" style="background-color: #CCEEFF; border-width: thin; border-color: #000000; border-right-style: ridge; border-bottom-style: ridge; border-left-style: ridge">
                            <b>收貨人姓名:</b>
                            <asp:TextBox ID="TextBox10" runat="server" Style="width: 120px"></asp:TextBox>
                            (請填全名)
                <asp:RadioButton ID="RadioButton7" runat="server" Text="先生" />
                            <asp:RadioButton ID="RadioButton8" runat="server" Text="小姐" /><br />
                            <b>電話:</b>
                            <asp:TextBox ID="TextBox11" runat="server" Style="width: 180px"></asp:TextBox>
                            (手機優先，供出貨聯絡)
                <br />
                            <b>郵遞區號:
                <asp:TextBox ID="TextBox13" runat="server" Style="width: 80px"></asp:TextBox>
                                <b>收貨地址:</b>
                                <asp:TextBox ID="TextBox14" runat="server" Style="width: 180px"></asp:TextBox><br />
                        </div>
                        <div class="col-md-12" style="background-color: #5599FF; border-width: thin; border-color: #000000; border-right-style: ridge; border-bottom-style: ridge; border-left-style: ridge">
                            <b>其它備註:</b>
                        </div>
                        <div class="col-md-12" style="background-color: #CCEEFF; border-width: thin; border-color: #000000; border-right-style: ridge; border-bottom-style: ridge; border-left-style: ridge">
                            <b>假日是否可以收貨:</b>
                            <asp:RadioButton ID="RadioButton9" runat="server" Text="假日可收貨" />
                            <asp:RadioButton ID="RadioButton10" runat="server" Text="假日請不要出貨" /><br />
                            <div class="col-md-12 w3-center" style="margin-top: 30px; margin-bottom: 10px">
                                <style>
                                    .button {
                                        border: none;
                                        color: white;
                                        padding: 15px 32px;
                                        text-align: center;
                                        text-decoration: none;
                                        display: inline-block;
                                        font-size: 16px;
                                        margin: 4px 2px;
                                        cursor: pointer;
                                    }


                                    .button4 {
                                        border-radius: 12px;
                                    }
                                </style>
                                <asp:Button ID="Button10" runat="server" Text="確認下單" class="button button4 w3-green w3-card-12" Style="background-color: #4CAF50" Height="50px" />
                                <asp:Button ID="Button11" runat="server" Text="取消訂單" class="button button4 w3-pink w3-card-12" Style="background-color: FA8072" Height="50px" />

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <footer class="w3-container w3-teal">
                <h5>為毛小孩選購保健品</h5>
                <p>可以利用商品搜尋的功能，搜尋到你要的保健品。</p>
            </footer>

        </div>
    </form>
</body>

</html>


