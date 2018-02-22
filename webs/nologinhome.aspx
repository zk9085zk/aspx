<%@ Page Language="C#" AutoEventWireup="true" CodeFile="nologinhome.aspx.cs" Inherits="webs_nologinhome" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="shortcut icon" href="/images/cp_ico.png"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="http://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css" rel="stylesheet" />
    
    <link href="/css/commodity.css" rel="stylesheet" />
    <link href="/css/w3.css" rel="stylesheet" />
    <link href="/css/agency.min.css" rel="stylesheet"/>

    <!-- FaceBook -->
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '1822513947981788', // App ID
                channelUrl: 'http://hayageek.com/examples/oauth/facebook/oauth-javascript/channel.html', // Channel File
                cookie: true,  // enable cookies to allow the server to access 
                // the session
                xfbml: true,  // parse social plugins on this page
                version: 'v2.5' // use graph api version 2.5
            });


            FB.Event.subscribe('auth.authResponseChange', function (response) {
                if (response.status === 'connected') {
                    document.getElementById("message").innerHTML += "<br>Connected to Facebook";
                    //SUCCESS

                }
                else if (response.status === 'not_authorized') {
                    document.getElementById("message").innerHTML += "<br>Failed to Connect";

                    //FAILED
                } else {
                    document.getElementById("message").innerHTML += "<br>Logged Out";

                    //UNKNOWN ERROR
                }
            });

        };

        function Login() {

            FB.login(function (response) {
                if (response.authResponse) {
                    getUserInfo();
                } else {
                    console.log('User cancelled login or did not fully authorize.');
                }
            }, { scope: 'email,user_photos,user_videos' });


        }

        function getUserInfo() {
            FB.api('/me', function (response) {
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json;',
                    url: 'nologinhome.aspx/fb',
                    data: "{ name:'" + response.name + "',id:'" + response.id + "',img:'" + "http://graph.facebook.com/" + response.id + "/picture" + "'}",
                    success: function (response) {
                        //把值顯示
                        location.href = "registerfbgoogle.aspx"
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.responseText);
                    }
                });

            });
        }
        function getPhoto() {
            FB.api('/me/picture?type=normal', function (response) {

                var str = "<br/><b>Pic</b> : <img src='" + response.data.url + "'/>";
                document.getElementById("status").innerHTML += str;

            });

        }
        function Logout() {
            FB.logout(function () { document.location.reload(); });
        }

        // Load the SDK asynchronously
        (function (d) {
            var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement('script'); js.id = id; js.async = true;
            js.src = "//connect.facebook.net/en_US/all.js";
            ref.parentNode.insertBefore(js, ref);
        }(document));

    </script>

    <!-- Google -->

    <script type="text/javascript">

        function logout() {
            gapi.auth.signOut();
            location.reload();
        }
        function login() {
            var myParams = {
                'clientid': '999773824712-mv27ugs087503b1vctlh2522amd4e0j2.apps.googleusercontent.com',
                'cookiepolicy': 'single_host_origin',
                'callback': 'loginCallback',
                'approvalprompt': 'force',
                'scope': 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
            };
            gapi.auth.signIn(myParams);
        }

        function loginCallback(result) {
            if (result['status']['signed_in']) {
                var a = 0;
                var request = gapi.client.plus.people.get(
                {
                    'userId': 'me'
                });
                request.execute(function (resp) {
                    var email = '';
                    if (resp['emails']) {
                        for (i = 0; i < resp['emails'].length; i++) {
                            if (resp['emails'][i]['type'] == 'account') {
                                email = resp['emails'][i]['value'];
                            }
                        }
                    }
                    //alert("{ name:'" + resp['displayName'] + "',id:'" + resp['id'] + "',email:'" + email + "',img:'" + resp['image']['url'] + "'}")
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json;',
                        url: 'nologinhome.aspx/google',
                        data: "{ name:'" + resp['displayName'] + "',id:'" + resp['id'] + "',email:'" + email + "',img:'" + resp['image']['url'] + "'}",
                        success: function (response) {
                            //把值顯示
                            location.href = "registerfbgoogle.aspx"
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(xhr.responseText);

                        }
                    });

                    /*document.getElementById("TextBox1").value = resp['displayName'];
                    document.getElementById("TextBox2").value = resp['id'];
                    document.getElementById("TextBox3").value = email;
                    document.getElementById("TextBox4").value = resp['image']['url'];*/

                });


            }

        }

        function onLoadCallback() {
            // gapi.client.setApiKey('999773824712-mv27ugs087503b1vctlh2522amd4e0j2.apps.googleusercontent.com');
            gapi.client.load('plus', 'v1', function () { });
        }

        $(function () {
            var nav = $('#nav');
            var win = $(window);

            $('#menu').on('click', function (e) {
                e.preventDefault();
                nav.slideToggle();
            });

            win.resize(function () {
                if (win.width() > 480 && nav.is(':hidden')) {
                    nav.removeAttr('style');
                }
            });
        });
    </script>

    <script type="text/javascript">
        (function () {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
    </script>
   
   

    <style>
        .TEST{
            width:85%;
            margin-left:15%;
        }
        .lv3_item{
            margin-right:5%
        }

        /* Shared */
        .loginBtn {
            box-sizing: border-box;
            position: relative;
            /* width: 13em;  - apply for fixed size */
            margin: 0.2em;
            padding: 0 15px 0 46px;
            border: none;
            text-align: left;
            line-height: 34px;
            white-space: nowrap;
            border-radius: 0.2em;
            font-size: 16px;
            color: #FFF;
            height: 100%;
        }

            .loginBtn:before {
                content: "";
                box-sizing: border-box;
                position: absolute;
                top: 0;
                left: 0;
                width: 34px;
                height: 100%;
            }

            .loginBtn:focus {
                outline: none;
            }

            .loginBtn:active {
                box-shadow: inset 0 0 0 32px rgba(0,0,0,0.1);
            }

        /* general */
        .loginBtn--general {
            /*font-family: "Roboto", Roboto, arial, sans-serif;*/
            background: #00DD77;
        }

            .loginBtn--general:before {
            }

            .loginBtn--general:hover,
            .loginBtn--general:focus {
                background: #00FF99;
            }

        /* Facebook */
        .loginBtn--facebook {
            background-color: #4C69BA;
            background-image: linear-gradient(#4C69BA, #3B55A0);
            /*font-family: "Helvetica neue", Helvetica Neue, Helvetica, Arial, sans-serif;*/
            text-shadow: 0 -1px 0 #354C8C;
        }

            .loginBtn--facebook:before {
                border-right: #364e92 1px solid;
                background: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_facebook.png') 6px 6px no-repeat;
            }

            .loginBtn--facebook:hover,
            .loginBtn--facebook:focus {
                background-color: #5B7BD5;
                background-image: linear-gradient(#5B7BD5, #4864B1);
            }


        /* Google */
        .loginBtn--google {
            /*font-family: "Roboto", Roboto, arial, sans-serif;*/
            background: #DD4B39;
        }

            .loginBtn--google:before {
                border-right: #BB3F30 1px solid;
                background: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_google.png') 6px 6px no-repeat;
            }

            .loginBtn--google:hover,
            .loginBtn--google:focus {
                background: #E74B37;
            }
.img1{
    width:24px;
}
.img2{
    width:50%;
}
        

    </style>
</head>
<body>
   <style>
     
   </style>

   <form runat="server" style="height:100%;width:100%;background:center no-repeat fixed url(../img/pet2.jpg);background-size: cover; font-family: 'Lato', sans-serif;">
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
    <div class="container" style="font-size:16px;font-family:Microsoft JhengHei">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapsible">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
             <a class="navbar-brand page-scroll" href="#">寵物廚房</a>
           
        </div>
        <div class="navbar-collapse collapse" id="navbar-collapsible">
            <ul class="nav navbar-nav navbar-left" >
                <li><a href="#section1">首頁</a></li>
                <li><a href="#section2">寵物保健品</a></li>
                <li><a href="#section3">購物須知</a></li>
                <li><a href="#section4">聯絡我們</a></li>
                <li><a href="#section5">關於我們</a></li>
                
                
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" data-toggle="modal" data-target="#myModal"><img src="/img/avatar.png" class="img1"/></a></li>
            </ul>
        </div>
    </div>
</nav>


<section class="container-fluid" id="section1" style="padding:16%">
   <div style="padding-left:30px">
        <div class="intro-text">
        <h1 class="text-center" style="font-size:40px">歡迎蒞臨，<b>客製化</b>寵物飼料</h1>
        <br/><br/>
        <h2 class="text-center lato animate slideInDown" style="font-size:70px">還在擔心<b>寵物飼料</b>吃的不安心嗎?</h2>
        <p class="text-center">
            <br/><br/><br/>
            <a href="#" class="btn btn-danger btn-lg btn-huge lato" data-toggle="modal" data-target="#myModal">免費註冊登入</a>
        </p>
            </div>
    </div>
    <a href="#section2">
        <div class="scroll-down bounceInDown animated">
            <span>
                <i class="fa fa-angle-down fa-2x"></i>
            </span>
        </div>
    </a>
</section>



<section class="container-fluid" id="section2">
      
 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                           
                        </ContentTemplate>
                    </asp:UpdatePanel>
  
    <!--/container-->
</section>



<section class="container-fluid" id="section3">
    <div class="w3-container w3-card-12" >
      <div class="col-md-12" >
                    <article class="w3-container" >
                        <div class="w3-card-2">
                            <header class="w3-container w3-blue" style="text-align:left">
                                <h3>Q1.	‧全台灣24h到貨；週末假日照常出貨。</h3>
                            </header>
                            <br/>
                            <div class="w3-container">
                                <p>
                                    預計訂單成立並且經PChome24h購物訂單確認後，24小時內送達(含週六日及國定假日)。<br />
                                    ‧全台灣24h到貨；週末假日照常出貨。<br />
                                    下列除外！<br />
                                    1. 非北北基地區，晚上10：00～早上10：00下單者
                            <br />
                                    2. 安裝商品<br />
                                    3. ATM 付款<br />
                                    <br />
                                    ※若收貨人資訊不完整、收貨人無法收貨、遇颱風地震等天災、公共工程，或遇系統設備維護，倉儲調整、盤點等情況，出貨時間將順延，亦不在此服務範圍之內。<br />
                                    <br />
                                    ※行銷活動商品說明<br />
                                    部分加價購、滿額滿件折扣、積點、點我折扣...等行銷活動，本店暫不適用。<br />
                                </p>
                            </div>
                            <br/>
                        </div>

                        <div class="w3-card-2">
                            <header class="w3-container w3-blue" style="text-align:left">
                                <h3>Q2.	付款方式說明：</h3>
                            </header>
                            <br/>
                            <div class="w3-container">
                                <p>
                                    ATM轉帳
                            <br />
                                    ‧如何付款?<br />
                                    只要將購買款項直接匯入「系統指定帳號」即可完成付款。每個指定帳號只能用在該筆訂單。
                            <br />
                                    ‧帳號何時提供?<br />
                                    購買完成後，我們會提供您該筆訂單的專用「轉帳帳號」，請您在隔日23:59前轉入款項(繳款期限是不受例假日所影響)。
                            <br />
                                    ‧帳號格式?
                            <br />
                                    帳號為3碼銀行代碼+16碼轉帳帳號。
                            <br />
                                    ‧匯款金額有限制嗎?
                            <br />
                                    本店不受轉帳每日3萬元之限制，請您安心轉帳繳款。
                            <br />
                                    ‧可以合併訂單付款嗎?
                            <br />
                                    如您有二筆以上的訂單，請依各別的專用匯款帳號轉帳，無法合併付款。<br />
                                    <br />
                                    信用卡線上刷卡
                            <br />
                                    ‧接受的卡別? 您可以安心使用信用卡（VISA、MASTER、JCB）即時線上刷卡，<br />
                                    ‧一次付款：接受信用卡一次付款。(僅限台灣地區發行之VISA、Master Card、JCB信用卡)
                            <br />
                                </p>
                            </div>
                            <br/>
                        </div>

                        <div class="w3-card-2">
                            <header class="w3-container w3-blue" style="text-align:left">
                                <h3>Q3.	退貨退款 </h3>
                            </header>
                            <br/>
                            <div class="w3-container">
                                <p>
                                    關於退貨：
                            <br />
                                    - 依照消費者保護法規定，商店街之消費者均享有商品到貨七天猶豫期之權益。
                            <br />
                                    - 消費者辦理退貨時請先至【我的帳戶】點選退貨申請並於退貨申請網頁填妥相關資料，並將原商品備妥，<br />
                                    本公司將於接獲申請之次日起1個工作天內檢視您的退貨要求，檢視完畢後將委託指定之宅配公司，在5個工作天內透過電話與您連絡前往取回退貨商品。
                            <br />
                                    (到貨七天期限內申請，逾期未辦理，除因商品原始瑕疵外將無法辦理銷退。)
                            <br />
                                    - 請您保持電話暢通，並備妥原商品及所有包裝及附件，以便於交付予本公司指定之宅配公司取回（宅配公司僅負責收件，退貨商品仍由PChome24h購物進行驗收），宅配公司取件後會提供簽收單據給您，請注意留存。
                            <br />
                                    <br />
                                    提醒您!退回商品必須是全新狀態且包裝完整<br />
                                    (保持商品、附件、包裝、廠商紙箱及所有附隨文件或資料之完整性),否則恕不接受退訂。
                            <br />
                                    <br />
                                    什麼樣的商品無法退貨呢?
                            <br />
                                    - 已拆封之電腦軟體、程式、錄音帶及錄影帶、CD、VCD、DVD、食品、花卉商品、衣服、包包及耗材，以及商品網頁上特別載明之商品，均不接受退訂。
                            <br />
                                    訂單可以部分退款嗎?
                            <br />
                                    - 本店僅接受整筆訂單辦理退費，無法接受訂單部分退款。
                            <br />
                                    如需提供資料，該怎麼寄出? 又該寄到哪裡呢?
                            <br />
                                    請注意！如退款過程中需訂購者提供資料文件(如折讓單、公司戶發票)，<br />
                                    請您將所收到的發票以「掛號方式」寄回至「商店街市集國際資訊股份有限公司﹝客服部﹞」地址：(106)台北市敦化南路二段105號14樓。多久會收到退款呢?本公司於收到消費者退回商品並確認驗收無誤後，將由商店街市集國際資訊股份有限公司於7個工作天內退款，退款日當天會發送mail通知函。<br />
                                </p>
                            </div>
                            <br/>
                        </div>
                    </article>

                </div>
        </div>
</section>

<section id="section4">
 
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center">客戶留言</h1>
                <hr/>
            </div>
        </div>
        <div class="row" style="margin-top:60px">
           <div class="col-md-7 col-md-offset-1">

              <div class="form-group">
                
                            <asp:Label CssClass="col-sm-1 control-label" ID="Label4" runat="server" Text="Email：" AssociatedControlID="TextBox3"></asp:Label>
                           
                      <div class="col-md-8" style="margin-left:12px">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Email" ></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                            ErrorMessage="eamil為必填項目!!" ControlToValidate="TextBox3" Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            </div>
                        </div>
               <br/><br/>
                <div class="form-group" >
                            <asp:Label CssClass="col-sm-1 control-label" ID="Label2" runat="server" Text="title：" AssociatedControlID="TextBox6"></asp:Label>
                            <div class="col-sm-8" style="margin-left:12px">
                                <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="標題" ></asp:TextBox>
                            </div>
                        </div>
                 <br/><br/>

                        <div class="form-group">
                            <asp:Label CssClass="col-sm-1 control-label" ID="Label5" runat="server" Text="content：" AssociatedControlID="CKEditorControl1"></asp:Label>
                            <div class="col-xs-9" style="margin-left:12px">
                              
                                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" >
                                </CKEditor:CKEditorControl>
                            </div>
                        </div>
  
                            <div class="form-group">
                                <div class="col-sm-offset-1 col-sm-8" >
                                    <br/>
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" onclientclick="return confirm('確定留言嗎?')" Text="留言" Style="width: 120px; height: 50px;" CssClass="btn btn-lg btn-primary btn-block" />
                                </div>
                            </div>
                            <br />

                            <asp:TextBox ID="TextBox4" runat="server" Visible="False" ></asp:TextBox>
                            <asp:TextBox ID="TextBox5" runat="server" Visible="False"></asp:TextBox>
            </div>
            <div class="col-md-4" style="font-size:20px;margin-top:50px">
                <address>
                  <strong>服務窗口</strong><br/>
                  業務助理 陳小姐<br/>
                  電話：08-7622818<br/>              
                  傳真：08-7623238
                </address>
                <address>
              <strong>公司地址</strong><br/>
              <a href="http://www.pabp.gov.tw/AreaBus/libA/a01070guide.asp" style="color:black">屏東縣長治鄉神農路8號(農業生物科技園區)</a>
            </address>
                <address>
                    <strong>寵物廚房客服專線</strong><br/>
                    <strong>服務時間 早上9:00-下午6:00</strong>
                </address>

            </div>
        </div>
   
</section>

<section class="container-fluid" id="section5">
    <div class="row" >
        <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
            <h2 class="text-center lato" style="color:#2894FF;font-weight:bold;font-size:40px">瑞威動物科技股份有限公司</h2>
            <hr/><br/>
            </div>
            <div style="text-align:center">
                <img src="/img/company.png" class="img2"/>
            </div>
        <br/><br/>
        <div class="col-sm-4 col-sm-offset-3 col-md-6 col-md-offset-3">
            <div class="media">
                <div style="text-align:center">
                    <p style="font-size:25px;font-weight:bold">瑞威創立於2013年中，由三位十餘年海內外經驗的台大動物營養師組成</p>
                    <p style="font-size:25px;font-weight:bold">創建之初即以寵物動物營養為發展重心</p>
                    <p style="font-size:25px;font-weight:bold;color:#FF2D2D">並發展成為符合社會公義、公益、公意之良心公司！</p>
                </div>
            </div>
            <hr/>
          
            </div>

        </div>
   
</section>





<footer id="footer" >
        <div class="container">
            <div class="row">
               <div class="col-md-4" >
                   
                        指導老師：<a href="http://mis.npust.edu.tw/files/15-1052-11381,c84-1.php?Lang=zh-tw" style="color:white">龔旭陽</a>
                        <br/>
                        團隊：<a href="https://www.facebook.com/profile.php?id=100002561753338" style="color:white">柯柏任</a>、
                    <a href="https://www.facebook.com/profile.php?id=100002363198240&fref=ts" style="color:white">林偉旋</a>、
                    <a href="https://www.facebook.com/WuANAKiN?fref=ts" style="color:white">吳軒豪</a>、
                    <a href="https://www.facebook.com/falcon10131?fref=ts" style="color:white">江宗懋</a>、
                    <a href="https://www.facebook.com/profile.php?id=100000420452921&fref=ts" style="color:white">黃凱琳</a>
                      
                   
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="https://github.com/"><i class="fa fa-github"></i></a>
                        </li>
                        <li><a href="https://www.facebook.com/RealNatureDogFood/"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="http://www.realnature.com.tw/aboutus.html"><i class="fa fa-google"></i></a>
                        </li>
                    </ul>
                </div>
                
                 <div class="col-md-4">
                    <span class="copyright"><a href="http://mis.npust.edu.tw/bin/home.php" >Copyright &copy; 屏東科技大學 資訊管理系</a></span><br/>
                    
                </div>
            </div>
       </div>
    </footer>


<div class="scroll-up">
    <a href="#section1"><i class="fa fa-angle-up"></i></a>
</div>

 
           
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="text-center"><img src="/img/avatar.png" class="img-circle"/><br/>Login</h2>
                                          
            </div>
            <div class="modal-body row">
                <h6 class="text-center">寵物廚房登入</h6>
                 <div class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" >
                    <div class="form-group">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-lg" placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-lg" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
              <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
                    <ContentTemplate>
                        <asp:Label ID="Label1" runat="server" Text="" Style="color: red"></asp:Label>
                        <div class="form-group">
                         
                            <asp:Button ID="Button1" runat="server" Text="Sign In" CssClass="btn btn-danger btn-lg btn-block" OnClick="Button1_Click"/>
           
                             <span class="pull-right"><a href="/webs/member/memberregister.aspx">Register</a></span>
                            <br/>
                            <div style="text-align:center">
                            <button class="w3-card-12 loginBtn loginBtn--facebook" type="button" onclick="Login()">Facebook登入</button>
                            <button class="w3-card-12 loginBtn loginBtn--google" type="button" onclick="login()">Google登入</button>
                            </div>
                            <br/>
                      
                        </div>
                 </ContentTemplate>
            </asp:UpdatePanel>
                </div> 
            </div>
            <div class="modal-footer">
                <h6 class="text-center">本公司絕不會透漏個人個資，請安心註冊.</h6>
            </div>
        </div>
    </div>
</div>

       
 </form>
    
  <script>
    // sandbox disable popups
    if (window.self !== window.top && window.name!="view1") {;
      window.alert = function(){/*disable alert*/};
      window.confirm = function(){/*disable confirm*/};
      window.prompt = function(){/*disable prompt*/};
      window.open = function(){/*disable open*/};
    }
    
    // prevent href=# click jump
    document.addEventListener("DOMContentLoaded", function() {
      var links = document.getElementsByTagName("A");
      for(var i=0; i < links.length; i++) {
        if(links[i].href.indexOf('#')!=-1) {
          links[i].addEventListener("click", function(e) {
          console.debug("prevent href=# click");
              if (this.hash) {
                if (this.hash=="#") {
                  e.preventDefault();
                  return false;
                }
                else {
                  /*
                  var el = document.getElementById(this.hash.replace(/#/, ""));
                  if (el) {
                    el.scrollIntoView(true);
                  }
                  */
                }
              }
              return false;
          })
        }
      }
    }, false);
  </script>
  
  <!--scripts loaded here-->
  
  <script src="/js/jquery.min2.js"></script>
  <script src="/js/bootstrap.min2.js"></script>
  <script src="/js/scripts.js"></script>
  <script src="/js/agency.min.js"></script>
  
  
  

  
</body>
</html>
