<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memberbuy2.aspx.cs" Inherits="webs_member_memberbuy2" %>

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
     .img{
         width:100px
     }
     .lab1{
         font-size:30px;
         font-weight:bold;
         color:white;
     }

        .aa{
            margin-left:50px;
            margin-top:50px;
            width:90%;
        }
        
        .row{
            font-size:30px;
            font-weight:bold;
            color:black;
           
        }
         .row2{
            font-size:30px;
            font-weight:bold;
            text-align:center;
            color:blue;
        }
           .row3{
            font-size:20px;
            font-weight:bold;
            color:black;
           
        }
         
        .button_a{
            background-color:slateblue;
            color:white;
            width:120px;
            height:50px;
            border-radius:10px;
        }
       .table_a{
           font-size:30px;
            font-weight:bold;
            color:blue;
           
        }
       .table_b{
            font-size: 24px;  
            text-align:center;
        }
    .zz{
        margin-top:10px;
        margin-bottom:10px;
    }
    .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

    .button1 {
   background-color: #008CBA;
    color: white;
    border: 1px solid;
}

.button1:hover {
    background-color: white;
    color: black;
    border: 1px solid #008CBA;
    
}

.button2 {
   background-color: #4CAF50;
    color: white;
    border: 1px solid;
}

.button2:hover {
    background-color: white;
    color: black;
    border: 1px solid #4CAF50;
    
}

.button3 {
   background-color: #f44336;
    color: white;
    border: 1px solid;
}

.button3:hover {
    background-color: white;
    color: black;
    border: 1px solid #4CAF50;
    
}
input[type=text] {
    width: 190px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-size:28px;
    background-image: url('/Photos/search.png');
    background-position: 5px 15px;
    background-repeat: no-repeat;
    padding: 20px 20px 15px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 24%;
}
 
 .truck{
     width:50px;
     margin-left:57%;
     margin-bottom:5px;
 }
.truck_text{
    font-size:28px
}


    </style>
    <script type="text/javascript">
        window.onload = function () {
            var div1 = document.getElementById('div1');
            var div2 = document.getElementById('div2');

            var id1 = document.getElementById("TextBox1").value;
            var id2 = document.getElementById("TextBox2").value;

     

         
                
                    
                if (id1 == "") {
                            div1.style.display = 'none';
                            div2.style.display = '';
                        }
                else if (id2 == "") {
                            div1.style.display = '';
                            div2.style.display = 'none';
                        }
                        else {
                            div1.style.display = '';
                            div2.style.display = '';
                        }
                
         
           
        }
    </script>
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
                
                <div class="row">
                  
                                            


                                 <h1 class="page-header" style="font-family: Microsoft JhengHei">詳細訂單
                <asp:Image ID="Image2" runat="server" ImageUrl="~/img/delivery-truck.png" CssClass="truck" />
                <asp:Label ID="Label9" runat="server" Text="配送狀態：" CssClass="truck_text"></asp:Label>
                <asp:Label ID="Label10" runat="server" Text="Label" CssClass="truck_text"></asp:Label>
                                 </h1>
            
                  <div class="aa">
                        
                            
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                     <div class="col-md-8">
                                     
                                    
                                     </div>
            <div id="div1">
                   <div class="row">
                        
                            
                      <div class="panel panel-primary">
                            
                               <div class="panel-heading">
                                   <h3 class="panel-title" style="font-size: 28px;font-weight:bold">寵物保健品</h3>
                               </div>
                           
                            <div class="panel-body">
                                  <div style="margin-top:10px;margin-left:10px;font-size:20px">
                                      <asp:Table BorderWidth="0px" ID="Table1" runat="server" CssClass="table table-condensed" >           
                                         </asp:Table>


                                  </div>                             
                             </div>
                                         
                            </div>
                    </div>
              </div>
                     <div id="div2">

                         <div class=" row">   
                                 <div class="item_title">
                            
                                          <div class="panel panel-primary">
                            
                                                   <div class="panel-heading">
                                                       <h3 class="panel-title" style="font-size: 28px;font-weight:bold">客製化飼料</h3>
                                                   </div>
                           
                                                <div class="panel-body">
                                                      <div style="margin-top:10px;margin-left:10px;font-size:20px">
                                     
                                                            <asp:Table BorderWidth="0px" ID="Table2" runat="server" CssClass="table table-condensed" >
                                                                </asp:Table>

                                                      </div>                             
                                                 </div>
                                         
                                                </div>
                                       
                                     </div>
                           </div>
                    </div>
                                    <div class="row" style="padding:15px">   
                                     </div>
                                    <div class="row3">
                                         <table class="table table-striped" style="table-layout:fixed;width:100%" >
　                                            <tr class="table_a">
　                                                <td>訂購人</td>
　                                                <td>付款方式</td>
                                                  <td>配送方式</td>
　                                            </tr>
　                                            <tr>
　                                                <td>
                                                     <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
　                                                </td>
　                                                <td>
                                                      <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
　                                                </td>
                                                  <td>
                                                     <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                                  </td>
　                                            </tr>
                                              <tr class="table_a">
　                                                <td>發票資訊</td>
　                                                <td>備註</td>
                                                  <td>總價</td>
　                                            </tr>
                                              <tr>
　                                                <td>
                                                     <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
　                                                </td>
　                                                <td>
                                                    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
　                                                </td>
                                                 <td>
                                                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
　                                                </td>
　                                            </tr>
                                           </table>
    
                                    </div>

                             <div class="row">
                                   <div class="col-md-8">
                                    </div>
                                     <div class="col-md-2">
                                         </div>
                                    <div class="col-md-2">
                                         <br/>
                                          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"  Text="訂單總覽" CssClass="button button3" />
                                    </div>                
                             </div>
                                    <br /><br/>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                       
                                   
                      <asp:TextBox ID="TextBox1" runat="server" type="hidden"></asp:TextBox>
                      <asp:TextBox ID="TextBox2" runat="server" type="hidden"></asp:TextBox>
                          
                       

                        
                         
                          
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
</body></html>
