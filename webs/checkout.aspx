<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="webs_checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        function ismaxlength(obj) {
            var mlength = obj.getAttribute ? parseInt(obj.getAttribute("maxlength")) : ""
            if (obj.getAttribute && obj.value.length > mlength)
                obj.value = obj.value.substring(0, mlength)
        }
      

            function test()
            {
            window.history.back();
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


      .item_title
      {
          font-size:16px;
          font-weight:bold;
          line-height:160%;
          margin-bottom:10px;
          margin-top:20px;
      }
      ins
      {
          background-image:url("/img/icon_title.png");
          background-position:0 0;
          background-repeat:no-repeat;
          display:block;
          width:5px;
          height:25px;
          float:left;
          margin-right:5px;
      }
      .table_all td
      {
           border-bottom:2px #DCDCDC solid;
      }
      .table_a{
            font-size: 24px; 
            text-align:center;
            width:90%;
          
        }
   
        .zz{
            margin-top:10px;
            margin-bottom:10px;
        }
         .row2{
             
            font-size:20px;
            font-weight:bold;
            text-align:center;
            background-color:#F5F5F5;
        
           
        }
         .table_td
         {
             text-align:right;
             padding-bottom:8px;
         }
         
         .label_a
         {
             color:red;
             font-size:35px;
         }
         .label_b
         {
             color:red;
             font-size:35px;
         }
         .label_b:before 
         {
                content: " $";
                font-size: 30px;
                margin-right: 2px;
          }
        .textbox_a
        {
            width:100%;
           
        }
        .button_a
         {
             font-size:15px;
             color:#fff;
             border:1px solid #222;
             letter-spacing:2px;
             padding:.5em 2.5em;
             background-color:#3d3c3a;
             border-radius:5px;
             
         }
        
  </style>
</head>
<body>
    <form id="form1" runat="server">
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


       


       
        <div id="page-content-wrapper" >
            <button type="button" class="hamburger is-closed" data-toggle="offcanvas">
                <span class="hamb-top"></span>
                <span class="hamb-middle"></span>
                <span class="hamb-bottom"></span>
            </button>
            <div class="container">
               
                <div class="row">
                     <div class="col-md-12">
                    <table style="text-align:center;table-layout:fixed;font-weight:bold;font-size:25px">
                        <tr>
                            <td style="color:#D3D3D3">
                                確認商品資料
                            </td>
                             <td>
                                付款結帳
                            </td>
                             <td style="color:#D3D3D3">
                                購物完成
                            </td>
                        </tr> 
                    </table>
                         </div>
                    <div class="col-md-12">
                         <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar"
                                     aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 66%;">
                                    
                                </div>
                            </div>
                      </div>
                    
                </div>
                 <div class="row " style="padding: 15px"></div>


                <div class="panel panel-default">
                            
                     <div class="panel-body" style="margin-left:25px;margin-right:25px">
                        
                    <div class="row">
                        <div class="item_title">
                            <ins></ins>
                            宅配到貨商品明細
                        </div>
                         <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row" >
                                <div class="col-md-2" style="text-align:center;font-size:20px;font-weight:bold">
                                    圖片
                                 </div>
                                <div class="col-md-8" style="text-align:center;font-size:20px;font-weight:bold">
                                    商品名稱
                                 </div>
                                <div class="col-md-1" style="text-align:right;font-size:20px;font-weight:bold">
                                    數量	
                                 </div>
                                <div class="col-md-1" style="text-align:center;font-size:20px;font-weight:bold">
                                    小計
                                 </div>
                                    </div>
                              </div>
                            <div class="panel-body">
                                  
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                  <asp:Table BorderWidth="0px" ID="Table1" runat="server" CssClass="table_all"></asp:Table>
                             
                                <table style=" font-size:30px"  border="0">
　                                    <tr class="table_tr">
　                                        <td class="table_td">
                                               購物車內合計有 <asp:Label ID="Label3" runat="server" Text="Label" CssClass="label_a"></asp:Label> 項商品，消費含稅總金額<asp:Label ID="Label4" runat="server" Text="Label" CssClass="label_b"></asp:Label>
　                                        </td>
　                                    </tr>
                                  
                                    </table>
                                 </ContentTemplate>
                        </asp:UpdatePanel>
     
                                    </div>                
                            </div>
                        </div>

                    <div class="row">
                        <div class="item_title">
                            <ins></ins>
                            請選擇付款方式
                        </div>
                      <div class="panel panel-default">
                            
                               <div class="panel-heading">
                                   <h3 class="panel-title" style="font-size: 28px;font-weight:bold">付款方式</h3>
                               </div>
                           
                            <div class="panel-body">
                                  <div style="margin-top:10px;margin-left:10px;font-size:20px">
                                      <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                          <asp:ListItem>貨到付款</asp:ListItem>
                                          <asp:ListItem>ATM轉帳</asp:ListItem>
                                          <asp:ListItem>歐付寶</asp:ListItem>
                                      </asp:RadioButtonList>

                                  </div>                             
                             </div>
                                         
                            </div>
                    </div>

                 <div class="row">
                        <div class="item_title">
                            <ins></ins>
                            請選擇配送方式
                        </div>
                      <div class="panel panel-default">
                            
                               <div class="panel-heading">
                                   <h3 class="panel-title" style="font-size: 28px;font-weight:bold">配送方式</h3>
                               </div>
                           
                            <div class="panel-body">
                                  <div style="margin-top:10px;margin-left:10px;font-size:20px">
                                      <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                                          <asp:ListItem>郵寄80元</asp:ListItem>
                                          <asp:ListItem>黑貓宅急便80元</asp:ListItem>
                                          
                                      </asp:RadioButtonList>

                                  </div>                             
                             </div>
                                         
                            </div>
                    </div>

                 <div class="row">
                     <div class="item_title">
                            <ins></ins>
                            請選擇發票資訊
                        </div>
                     <div class="panel panel-default">
                      <div class="panel-heading">
                                   <h3 class="panel-title" style="font-size: 28px;font-weight:bold">發票資訊</h3>
                               </div>
                           
                            <div class="panel-body">
                                  <div style="margin-top:10px;margin-left:10px;font-size:20px">
                                      <asp:RadioButtonList ID="RadioButtonList3" runat="server">
                                          <asp:ListItem>開立二聯式紙本發票</asp:ListItem>
                                          <asp:ListItem>我要捐贈發票做公益</asp:ListItem>
                                      </asp:RadioButtonList>

                                  </div>                             
                             </div>
                        
                         </div>
                    </div>

                 <div class="row">
                     <div class="item_title">
                            <ins></ins>
                            訂購人資訊
                        </div>
                     <div class="panel panel-default">
                      <div class="panel-heading">
                                   <h3 class="panel-title" style="font-size: 28px;font-weight:bold">訂購人</h3>
                               </div>
                           
                            <div class="panel-body">
                                  <div style="margin-top:10px;margin-left:10px;margin-bottom:10px;font-size:20px">
                                      訂購人：<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                      <p></p>
                                      電話：<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>  
                                       <p></p>
                                      地址：<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label><asp:Label ID="Label8" runat="server" Text="Label"></asp:Label><asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                                     
                                  </div>                             
                             </div>
                        
                         </div>
                    </div>

                 <div class="row">
                     <div class="item_title">
                            <ins></ins>
                            商品配送特殊需求
                        </div>
                     <div class="panel panel-default">
                      <div class="panel-heading">
                                   <h3 class="panel-title" style="font-size: 28px;font-weight:bold">備註</h3>
                               </div>
                           
                            <div class="panel-body" >
                                  <div style="font-size:20px;margin-left:10px;margin-right:10px">  
                                      <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox_a" Rows="3" TextMode="MultiLine" >本人親簽，送貨前請先電聯</asp:TextBox>
                                  </div>                             
                             </div>
                         <div class="pane1-body">
                             
                             </div>
                         </div>
                    </div>

            </div>
                     <div class="panel-footer">
                         <div class="row">
                         <div class="col-md-5" style="padding:8px">
                         <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >« 回上一步</asp:LinkButton>   
                             </div>  
                         <div class="col-md-7">   
                            <asp:Button ID="Button1" runat="server" CssClass="button_a" OnClick="Button1_Click" onclientclick="return confirm('確定購買嗎?')" Text="確認付款" />
                             </div> 
                             </div>
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
