﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="member.aspx.cs" Inherits="webs_member" %>

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
                  
                          <h1 class="page-header" style="font-family: Microsoft JhengHei">個人資料</h1>
             <div class="w3-row-padding">
                
                <div class="w3-third ">
                    
                    
                    
                    <div class="form-group"> 
                      <asp:Label CssClass="col-sm-4 " ID="Label9" runat="server" Text="姓名："  AssociatedControlID="Label1"></asp:Label> 
                      <div class="col-sm-8">
                         <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                      </div>
                    </div>
                    
                    
                    
                    <div class="form-group"> 
                      <asp:Label CssClass="col-sm-4 " ID="Label10" runat="server" Text="電子信箱："  AssociatedControlID="Label2"></asp:Label> 
                      <div class="col-sm-8">
                         <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                      </div>
                    </div>
                    
                    
                   
                    
                    <div class="form-group"> 
                      <asp:Label CssClass="col-sm-4 " ID="Label11" runat="server" Text="手機："  AssociatedControlID="Label3"></asp:Label> 
                       <div class="col-sm-8">
                         <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                      </div>
                    </div>
                
                    

                    <div class="form-group"> 
                      <asp:Label CssClass="col-sm-4" ID="Label12" runat="server" Text="生日："  AssociatedControlID="Label4"></asp:Label> 
                       <div class="col-sm-8">
                         <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                      </div>
                    </div>
                
                    
                    
                     <div class="form-group"> 
                      <asp:Label CssClass="col-sm-4 " ID="Label13" runat="server" Text="郵遞區號："  AssociatedControlID="Label5"></asp:Label> 
                       <div class="col-sm-8">
                         <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                      </div>
                    </div>
                  
                    
                    
                     <div class="form-group"> 
                      <asp:Label CssClass="col-sm-4 " ID="Label14" runat="server" Text="城市：" AssociatedControlID="Label6" ></asp:Label> 
                       <div class="col-sm-8">
                         <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                      </div>
                    </div>
               
                    
                    
                     <div class="form-group"> 
                      <asp:Label CssClass="col-sm-4 " ID="Label15" runat="server" Text="地區："  AssociatedControlID="Label7"></asp:Label> 
                       <div class="col-sm-8">
                         <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
                      </div>
                    </div>
                   
                    
                    
                     <div class="form-group"> 
                      <asp:Label CssClass="col-sm-4 " ID="Label17" runat="server" Text="地址："  AssociatedControlID="Label8"></asp:Label> 
                       <div class="col-sm-8">
                         <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>
                      </div>
                    </div>


                        <br />
                        <br />
                </div>

                 

                <div class="w3-third">
                    <asp:ImageButton ID="ImageButton2" runat="server" src="http://www.msqq.com/d/file/icon/2014-04-01/bd20ab1e645b22c8eff3d7adf8728136.png" class="nav navbar-nav navbar-right " OnClick="ImageButton2_Click"></asp:ImageButton>
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


