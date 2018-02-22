<%@ Page Language="C#" AutoEventWireup="true" CodeFile="petknow.aspx.cs" Inherits="webs_info_petknow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- 圖示CSS -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
    <!-- 最新編譯和最佳化的 CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
    <!-- w3 card的 CSS -->
    <link href="/css/w3.css" rel="stylesheet" />
    <!-- 選擇性佈景主題 -->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- 最新編譯和最佳化的 JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

    <title></title>
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
                <h1>歡迎您，小剛</h1>
            </a>
            <asp:Image ID="Image1" runat="server" Height="40px" Width="40px" ImageUrl="https://scontent-tpe1-1.xx.fbcdn.net/v/t1.0-9/13177259_1106987156026514_5456761746775041918_n.jpg?oh=bdfc1f82ed5e3c2cf36b26fb9fc2a16d&oe=582113BE" />
            <a href="#" style="color: white; background-color: #00695C">
                <h3>小剛</h3>
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
            <a href="/webs/fodder/fodder.aspx" style="color: white;">菜單總覽</a>
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
                        <h1>寵物廚房</h1>
                    </a>
                </li>
                <li class="col-md-9">
                    <a style="color: white; text-align: center; background-color: #004D40">
                        <h1>寵物小知識</h1>
                    </a>
                </li>
                <li class="col-md-1 w3-black">
                    <a style="color: white; text-align: center" href="#">
                        <h1>登出</h1>
                    </a>
                </li>
            </ul>

            <div class="w3-container w3-card-12" style="padding-top: 100px">
                <div class="row">
                    <asp:Button ID="Button1" CssClass="col-md-2 w3-indigo" runat="server" Text="狗" />
                    <asp:Button ID="Button2" CssClass="col-md-2 w3-khaki" runat="server" Text="貓" />
                    <asp:Button ID="Button3" CssClass="col-md-2 w3-red" runat="server" Text="鳥" />
                    <asp:Button ID="Button4" CssClass="col-md-2 w3-teal" runat="server" Text="魚" />

                </div>
                <div class="w3-card-12" style="padding: 20px">
                    <h2>[狗] 轉PO：十大常見室內植物　對貓狗有「致命危機」2016/08/31</h2>
                    <h3>在室內種植盆栽、花卉來裝飾居家環境，不過很少人知道，很多植物對貓狗有害，甚至有致命危機；若不慎誤食，後果不堪設想。例如百合花、萬年青、仙人掌等，美國獸醫師網站《Vet street》公佈十種常見的有毒室內植物，家有養寵物的人，若有需要在室內放置這些植物，請記得挪到高處，別讓貓狗碰觸或啃食。 一、 百合花：百合花的花葉、花粉和花瓣，可能導致貓咪腎衰竭，其他症狀還包括嘔吐、嗜睡、食慾不振等。當貓咪抓了百合花，再舔一下爪子，百合毒素或許就因此進入體內。若沒有接受治療，毒素可能在36到72小時內發作，有些貓咪甚至因此死亡。 二、文竹：當貓咪碰觸到文竹後，因接觸造成刺激，很可能引發皮膚炎、口舌炎等。 三、玉米盆栽：可能引發貓咪嘔吐、食慾不振，增加憂鬱症和流口水發生機率，也可能讓貓咪瞳孔變大，影響視力。 四、黃金葛...</h3>
                </div>
                <div class="w3-card-12" style="padding: 20px">
                    <h2>[狗] 寵物登記-新登記流程 2016/08/31</h2>
                    <h3>寵物登記申請表填寫說明（委託代辦） 1. 飼主需填寫委託代辦申請同意書。  2.  代辦人親至登記機構並攜帶： ●委託代辦申請同意書 ● 飼主身分證明文件●寵物最近一年內狂犬病預防注射證明文件影本●絕育證明文件影本（寵物未絕育者可免附）●晶片植入手續費：各縣市索費不同，最多三百元●寵物登記費：　 ◎88.9.1～88.11.30 免費　 ◎88.12.1～89.8.31 絕育：250元/隻 未絕育...</h3>
                </div>
                <div class="w3-card-12" style="padding: 20px">
                    <h2>[狗] 寵物暈車─十種平緩不適的方法 2016/08/31</h2>
                    <h3> 年齡越小的動物愈容易暈車。雖然這不是什麼嚴重的病症，只不過幼時的可怕記憶，會讓牠們一輩子不敢坐車。 雖然如此，畜主還是有辦法幫助牠們突破害怕坐車的恐懼感，同時也能避免車內的空氣充滿嘔吐物的酸臭味。 1.空腹上路：在出發前的六到八小時內，最好別讓寵物進食。因為胃裡沒東西時比較不會嘔吐。即使想吐，也不會將車內弄的一團糟。不過飲水則不需要限制。 2.經常休息：有些寵物能適應長途旅行，有些...</h3>
                </div>
            </div>

            <footer class="w3-container w3-teal">
                <h5>寵物廚房客服專線</h5>
                <p>營業時間 早上9:00-下午6:00</p>
            </footer>

        </div>
    </form>
</body>
</html>
