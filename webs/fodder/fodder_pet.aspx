<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fodder_pet.aspx.cs" Inherits="webs_fodder_pet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- 最新編譯和最佳化的 CSS -->
    <link href="/css/bootstrap-theme.min.css" rel="stylesheet" />
    <!-- w3 card的 CSS -->
    <link href="/css/w3.css" rel="stylesheet" />
    <!-- 選擇性佈景主題 -->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- 最新編譯和最佳化的 JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.7.js"></script>
    <script src="/jquery-ui-1.12.0.custom/jquery-ui.js"></script>
    <link href="/jquery-ui-1.12.0.custom/jquery-ui.theme.css" rel="stylesheet" />
    <link href="/jquery-ui-1.12.0.custom/jquery-ui.structure.min.css" rel="stylesheet" />


    <!-- 圖示CSS -->

    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
    <script type="text/javascript">
        function getValue() {
            '<% Session.Add("fbid", null); %>';
            '<% Session.Add("googleid", null); %>';
             '<% Session.Add("user", "1"); %>';
        }
    </script>

    <title>寵物客製化</title>
</head>
<body>
    <form id="form1" runat="server">
     <nav class="w3-sidenav w3-collapse w3-card-2 w3-animate-left" style="width: 18%; background-color: #00796B" id="mySidenav">
            <a href="javascript:void(0)" onclick="w3_close()"
                class="w3-closenav w3-large w3-hide-large">收起 &times;</a>
            <a href="#" style="color: white;">
                <h1>柚子私房菜</h1>
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
                <h4><i style="padding-right: 10px" class="fa fa-cutlery" aria-hidden="true"></i>寵物菜單</h4>
            </a>
            <a href="/webs/fodder/foddermenu.aspx" style="color: white;">食材介紹</a>
            <a href="/webs/fodder/fodder.aspx" style="color: white;">訂製我的菜</a>
            <a href="/webs/fodder/foddernext.aspx" style="color: white;">歷史菜單</a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-shopping-basket" aria-hidden="true"></i>商品選購</h4>
            </a>
            <a href="/webs/purchase/orderform.aspx" style="color: white;">我的購物車</a>
             <a href="/webs/commodity.aspx" style="color: white;">寵物保健品</a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-phone" aria-hidden="true"></i>客服中心</h4>
            </a>
            <a href="/webs/info/contact.aspx" style="color: white;">聯絡我們</a>
            <a href="/webs/info/shoppinginfo.aspx" style="color: white;">購物須知</a>
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
                        <h1>菜單設計
                        </h1>
                    </a>
                </li>
                <li class="col-md-1 w3-black" id="li0" onclick="getValue()" aria-autocomplete="none">
                    <a style="color: white; text-align: center" href="/webs/login.aspx">
                        <h1>
                            <asp:Label ID="Label2" runat="server" Text="登入"></asp:Label></h1>
                    </a>
                </li>
            </ul>

            <div class="w3-container w3-card-12" style="padding-top: 100px">
                <div class="col-md-12">
                    <div class="col-md-12" style="padding: 10px">
                    </div>

                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>

            <footer class="w3-container w3-teal">
                <h5>為毛小孩選購菜單設計</h5>
                <p>可以為自己毛小孩客製化適合自己的菜單。</p>
            </footer>

        </div>


    </form>
</body>
</html>
