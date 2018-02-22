<%@ Page Language="C#" AutoEventWireup="true" CodeFile="purchase.aspx.cs" Inherits="webs_purchase" %>

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
    <script src="http://code.jquery.com/jquery-1.7.js"></script>
    <script src="/jquery-ui-1.12.0.custom/jquery-ui.js"></script>
    <link href="/jquery-ui-1.12.0.custom/jquery-ui.theme.css" rel="stylesheet" />
    <link href="/jquery-ui-1.12.0.custom/jquery-ui.structure.min.css" rel="stylesheet" />

    <script type="text/javascript">
        function getValue() {
             '<% Session.Add("user", "1"); %>';
        }
    </script>


    <!-- 拖拉使用的js -->
    <script>
        $(function () {
            $('[id*=sortable').sortable();
            $('[id*=sortable').disableSelection();
        });
    </script>




    <script>

        var ar_data = new Array()


        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json;',
            url: '/webs/petkitchenservice.asmx/AutoSearchItemString',
            data: {},
            success: function (response) {
                ar_data = response.d;
                var availableTags = ar_data;
                $("#tx_autoSearch").autocomplete({
                    source: availableTags
                });
            }
        });

    </script>

    <script>
        function w3_open() {
            document.getElementById("mySidenav").style.display = "block";
        }
        function w3_close() {
            document.getElementById("mySidenav").style.display = "none";
        }
    </script>

    <title></title>
</head>
<body style="background-color: #F5F5F5">
    <form id="form1" runat="server">

        <nav class="w3-sidenav w3-collapse w3-card-2 w3-animate-left" style="width: 18%; background-color: #00796B" id="mySidenav">
            <a href="javascript:void(0)" onclick="w3_close()"
                class="w3-closenav w3-large w3-hide-large">收起 &times;</a>
            <a href="#" style="color: white;">
                <h1>柚子私房菜</h1>
            </a>
            <a href="#" style="color: white;">+
                <h1>
                    <asp:Label ID="Label2" runat="server" Text="您尚未登入"></asp:Label></h1>
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
                        <h1>商品購買</h1>
                    </a>
                </li>
                <li class="col-md-1 w3-black" id="li0" onclick="getValue()" aria-autocomplete="none">
                    <a style="color: white; text-align: center" href="/webs/login.aspx">
                        <h1>
                            <asp:Label ID="Label3" runat="server" Text="登入"></asp:Label></h1>
                    </a>
                </li>
            </ul>

            <div class="w3-container w3-card-12" style="padding-top: 100px">
                <div class="col-md-12">
                    <div class="col-md-12" style="padding: 10px">
                        <asp:Label ID="Label1" runat="server" Text="搜尋商品"></asp:Label>
                        <asp:TextBox ID="tx_autoSearch" runat="server"></asp:TextBox>
                        <asp:Button ID="btn_search" runat="server" Text="搜尋" OnClick="btn_search_Click" />
                    </div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>

            <footer class="w3-container w3-teal">
                <h5>為毛小孩選購保健品</h5>
                <p>可以利用商品搜尋的功能，搜尋到你要的保健品。</p>
            </footer>

        </div>

    </form>

    <script>
        function w3_open() {
            document.getElementById("mySidenav").style.display = "block";
        }
        function w3_close() {
            document.getElementById("mySidenav").style.display = "none";
        }
    </script>
</body>
</html>
