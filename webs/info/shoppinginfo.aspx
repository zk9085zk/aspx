<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shoppinginfo.aspx.cs" Inherits="webs_shoppinginfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"/>
    <!-- 圖示CSS -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
    <!-- 最新編譯和最佳化的 CSS -->
    <link href="/css/bootstrap-theme.min.css" rel="stylesheet" />
    <!-- w3 card的 CSS -->
    <link href="/css/w3.css" rel="stylesheet" />
    <!-- 選擇性佈景主題 -->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- 最新編譯和最佳化的 JavaScript -->
    <link href="/css/sidebar.css" rel="stylesheet" />

    <link href="/css/agency.min2.css" rel="stylesheet"/>
    <script src="/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script src="/js/sidebar.js"></script>
    <script type="text/javascript">
        function getValue() {
            '<% Session.Add("fbid", null); %>';
            '<% Session.Add("googleid", null); %>';
             '<% Session.Add("user", "1"); %>';
        }
    </script>
    
  <style>
      .a{
          color: white; 
          text-align: center; 
          font-size:40px;
          margin-left:28%;
      }
      .b{
          color:tomato;
          margin-left:40%;
          font-size:25px;
      }
      .c{
         background-color: #222; 
         margin-left: 5%;
      }
      @media screen and (max-width: 480px) {


        
            .a{
                color: white; 
                text-align: center; 
                font-size:30px;
                margin-left:15%;
             
                
            }
            .b{
                 color:tomato;
                 font-size:15px;
                 margin-left:10%;

               
            }

            .c{
                background-color:#222; 
                margin-left: 15%;
                padding:10px;
               
            }
      }
     

  </style>
   
    <title></title>
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal">

 
<div id="wrapper" >
        <div class="overlay"></div>

        <!-- Sidebar -->
   <div class="c ">
               
                    <div class="a " >
                         <a href="/webs/home.aspx" style="color:white;text-decoration:none;" >寵物廚房</a>
                         <a class="b " href="/webs/nologinhome.aspx" style="text-decoration:none;">
                            <asp:Label ID="Label2" runat="server" Text="登出"></asp:Label>
                         </a>
                    </div>
                   
                   
        </div>

     
             
          
        
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation" >
            <ul class="nav sidebar-nav">
                <li class="sidebar-brand">
                    <a href="/webs/home.aspx" style="color: #55AA00;"  >
                        <h2>寵物廚房</h2>
                    </a>
                </li>
               
                    <h1 style="color:white">
                    <asp:Label ID="Label1" runat="server" Text="您尚未登入" CssClass="sider"></asp:Label></h1>
                    <asp:Image ID="Image1" runat="server" CssClass="imgimg"/>
                 

                   
               
                <li>

               </li>
                   
                    <h4 style="color:white"><i style="padding-left: 10px;color: white" class="fa fa-user" aria-hidden="true"></i>會員中心</h4>
                   
                <li>
                    <a href="/webs/member/member.aspx" style="color: white;">我的基本資料</a>
                </li>
                <li>
                    <a href="/webs/member/memberbuy.aspx" style="color: white;">我的購物紀錄</a>
                </li>

                   <h4 style="color:white"><i style="padding-left: 10px;color: white" class="fa fa-paw" aria-hidden="true"></i>寵物管理</h4>

                <li>
                    <a href="/webs/mypet/petmanager.aspx" style="color: white;">我的毛小孩</a>
                </li>
                <li>
                    <a href="/webs/mypet/petmanagerinsert.aspx" style="color: white;">註冊毛小孩</a>
                </li>

                     <h4 style="color:white"><i style="padding-left: 10px;color: white" class="fa fa-cutlery" aria-hidden="true"></i>糧身菜單</h4>

               

                <li class="dropdown">
                    <a href="/webs/fodder/fodder_pet.aspx" class="dropdown-toggle" data-toggle="dropdown">菜單設計<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="dropdown-header">寵物菜單</li>
                        <li> <a href="/webs/fodder/foddermenu.aspx" style="color: white;">食材介紹</a></li>
                        <li> <a href="/webs/fodder/pet_fodder.aspx" style="color: white;">訂製我的菜</a></li>
                        
     
                    </ul>
                </li>

               <li>  
                   <a href="/webs/fodder/foddernext.aspx" style="color: white;">歷史菜單</a>
               </li>

                      <h4 style="color:white"><i style="padding-left: 10px" class="fa fa-shopping-basket" aria-hidden="true"></i>商品選購</h4>

                <li>
                     <a href="/webs/shopping.aspx" style="color: white;">我的購物車</a>
                </li>
                <li>
                    <a href="/webs/commodity.aspx" style="color: white;">寵物保健品</a>
                   
                </li>

                      <h4 style="color:white"><i style="padding-left: 10px" class="fa fa-phone" aria-hidden="true"></i>客服中心</h4>

                <li>
                     <a href="/webs/info/contact.aspx" style="color: white;">聯絡我們</a>
                </li>
                <li>
                   <a href="/webs/info/shoppinginfo.aspx" style="color: white;">購物須知</a>
                </li>
                 <li>
                   <a href="/webs/info/askme.aspx" style="color: white;">客服留言</a>
                </li>

                
              
            </ul>
        </nav>

        <!-- /#sidebar-wrapper -->
        <!-- Page Content -->
        <div id="page-content-wrapper" >
             
            <button type="button" class="hamburger is-closed" data-toggle="offcanvas">
                <span class="hamb-top"></span>
                <span class="hamb-middle"></span>
                <span class="hamb-bottom"></span>
            </button>

            <div class="container">
                 
                <div class="row" style="margin-bottom:30px">
                  
                              
                <div class="col-md-12">
                    <article class="w3-container">
                        <div class="w3-card-2">
                            <header class="w3-container w3-blue">
                                <h3>Q1.	‧全台灣24h到貨；週末假日照常出貨。</h3>
                            </header>

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
                        </div>

                        <div class="w3-card-2">
                            <header class="w3-container w3-blue">
                                <h3>Q2.	付款方式說明：</h3>
                            </header>

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
                        </div>

                        <div class="w3-card-2">
                            <header class="w3-container w3-blue">
                                <h3>Q3.	退貨退款 </h3>
                            </header>

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
                        </div>
                    </article>

                </div>
           
                   
                </div>

            </div>
            
           

            

            
        </div>
        <!-- /#page-content-wrapper -->
                  
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
                    <span class="copyright"><a href="http://mis.npust.edu.tw/bin/home.php" style="text-decoration:none;color:#fed136" >Copyright &copy; 屏東科技大學 資訊管理系</a></span><br/>
                    
                </div>
            </div>
       </div>
    </footer>  
         
 </div>
  

       

    </form>
</body>
</html>
