<%@ Page Language="C#" AutoEventWireup="true" CodeFile="foddermodify.aspx.cs" Inherits="webs_Default" %>

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
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="/js/sidebar.js"></script>
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://cdn.rawgit.com/nnattawat/flip/master/dist/jquery.flip.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js">
   


  </script>
  
    <script>
        $(function () {
            var availableTags = [
              "ActionScript",
              "AppleScript",
              "Asp",
              "BASIC",
              "C",
              "C++",
              "Clojure",
              "COBOL",
              "ColdFusion",
              "Erlang",
              "Fortran",
              "Groovy",
              "Haskell",
              "Java",
              "JavaScript",
              "Lisp",
              "Perl",
              "PHP",
              "Python",
              "Ruby",
              "Scala",
              "Scheme"
            ];
            $("#usr").autocomplete({
                source: availableTags
            });
        });
    </script>
    <script>
        $(function () {
            $("input").checkboxradio();
            $("fieldset").controlgroup();
        });
    </script>
    <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=Avatar.ClientID %>');
            var file = document.querySelector('#<%=avatarUpload.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>

    
      
      <script>
     

        function move_1() {
            var str=<asp:Literal runat="server" ID="Literal1"></asp:Literal>;
            var div1 = document.getElementById('div1');
            div1.style.display = '';
            var elem = document.getElementById("myBar_1");
            var width = 1;
            var id = setInterval(frame, 10);
            function frame() {
                if (width >= str) {
                    clearInterval(id);
                } else {
                    width++;
                    elem.style.width = width + '%';
                    document.getElementById("demo_1").innerHTML = width * 1 + '%';
                }
            }
        }
    </script>
    <script>
        function move_2() {
            var str=<asp:Literal runat="server" ID="Literal2"></asp:Literal>;
            var elem = document.getElementById("myBar_2");
            var width = 1;
            var id = setInterval(frame, 10);
            function frame() {
                if (width >= str) {
                    clearInterval(id);
                } else {
                    width++;
                    elem.style.width = width + '%';
                    document.getElementById("demo_2").innerHTML = width * 1 + '%';
                }
            }
        }
    </script>
    <script>
        function move_3() {
            var str=<asp:Literal runat="server" ID="Literal3"></asp:Literal>;
            var elem = document.getElementById("myBar_3");
            var width = 1;
            var id = setInterval(frame, 10);
            function frame() {
                if (width >= str) {
                    clearInterval(id);
                } else {
                    width++;
                    elem.style.width = width + '%';
                    document.getElementById("demo_3").innerHTML = width * 1 + '%';
                }
            }
        }
    </script>
    <script>
        function move_4() {
            var str=<asp:Literal runat="server" ID="Literal4"></asp:Literal>;
            var elem = document.getElementById("myBar_4");
            var width = 1;
            var id = setInterval(frame, 10);
            function frame() {
                if (width >= str) {
                    clearInterval(id);
                } else {
                    width++;
                    elem.style.width = width + '%';
                    document.getElementById("demo_4").innerHTML = width * 1 + '%';
                }
            }
        }
    </script>
    <script>
        function move_5() {
            var str=<asp:Literal runat="server" ID="Literal5"></asp:Literal>;
            var elem = document.getElementById("myBar_5");
            var width = 1;
            var id = setInterval(frame, 10);
            function frame() {
                if (width >= str) {
                    clearInterval(id);
                } else {
                    width++;
                    elem.style.width = width + '%';
                    document.getElementById("demo_5").innerHTML = width * 1 + '%';
                }
            }
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
      .view{
         width:270px;
         height:150px;
         border:0px;
        
     }
 .view2{
         width:350px;
         height:470px;
         border:0px;
        
     }
   .zoom {
           
            position: relative;
            display: block;
            width: 400px;
            height: 470px;
            overflow: hidden;
            margin-left:15%
        }
        .zoom_icon {
            margin-bottom:82%;
            width: 10px;
            height: 10px;
            position: absolute;
            bottom: 8px;
            margin-left: 11%;
        }
  </style>
    <title>寵物客製化</title>
</head>
<body onload="move_1();move_2();move_3();move_4();move_5();">
       <form id="form1" runat="server" class="form-horizontal">

 
<div id="wrapper" >
        <div class="overlay"></div>

        <!-- Sidebar -->
   <div class="c ">
               
                    <div class="a " >
                         <a href="/webs/home.aspx" style="color:white;text-decoration:none;" >寵物廚房</a>
                         <a class="b " href="/webs/nologinhome.aspx" style="text-decoration:none;">
                            <asp:Label ID="Label21" runat="server" Text="登出"></asp:Label>
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
                    <asp:Label ID="Label20" runat="server" Text="您尚未登入" CssClass="sider"></asp:Label></h1>
                    <asp:Image ID="Image2" runat="server" CssClass="imgimg"/>
                 

                   
               
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
               
               <div class="row" >
                     <div class="col-md-12">
                    <table style="text-align:center;table-layout:fixed;font-weight:bold;font-size:25px">
                        <tr>
                            <td style="color:#D3D3D3">
                                選擇寵物
                            </td>
                             <td style="color:#D3D3D3">
                                配方選擇
                            </td>
                             <td >
                                資料填寫
                            </td>
                            <td style="color:#D3D3D3">
                                完成
                            </td>
                        </tr> 
                    </table>
                         </div>
                    <div class="col-md-12">
                         <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar"
                                     aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 75%;">
                                   
                                </div>
                            </div>
                      </div>
                    
                </div>

                 <div class="row " style="padding: 25px"></div>
                <div class="row">
                       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                         
              
                              
            
                       <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title " style="font-size: 32px">請輸入客製化寵物包飼料名稱</h3>
                        </div>
                        <div class="panel-body">
                        
                                        
                             <div class="col-md-12 text-center" style="margin-top: 30px;margin-bottom:30px"> 
                                 
                       
                            <asp:TextBox type="text" CssClass="form-control"  ID="TextBox1" runat="server"></asp:TextBox>
                         
                                 </div>

                            </div>
                            </div>



                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title " style="font-size: 32px">毛小孩圖片上傳</h3>
                        </div>
                        <div class="panel-body">
                        
                                        <div class="row">
                             <div class="col-md-5" style="margin-top: 30px;margin-bottom:30px"> 
                                 <div class="zoom">
                                        <div class="zoom_icon">
                                             <asp:Image ID="Avatar" runat="server" CssClass="view" ImageUrl="~/img/noimage.png"/>
                                        </div>
                                     <asp:Image ID="Image4" runat="server" ImageUrl="~/img/pet_bag.png" CssClass="view2"/>
                                 </div>   
                               <div style="margin-left:35%;margin-top:10%"> 
                                   <input id="avatarUpload" type="file" name="file" onchange="previewFile()"  runat="server" />
                                 <asp:Label ID="Label3" runat="server"></asp:Label>
                                </div>  
                                 </div>
                      
                      
                                   
                               <div id="div1" class="col-md-7"  style="display: none;font-size: 24px; margin-bottom: 50px; padding: 20px;">
                        

                                        <table class="table table-bordered" style="margin-top:5%">
                                            <thead>
                                                <tr>
                                                    <th class="text-center" style="font-size: 24px">營養標示</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td style="font-size: 24px">蛋白質

                                                        
                                                             <div class="w3-progress-container">
                                                                 <div id="myBar_1" class="w3-progressbar w3-red" style="width: 10%">
                                                                     <div id="demo_1" class="w3-center w3-text-white">20%</div>
                                                                 </div>

                                                             </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: 24px">熱量
                                                      
                                                            <div class="w3-progress-container">
                                                                <div id="myBar_2" class="w3-progressbar w3-orange" style="width: 10%">
                                                                    <div id="demo_2" class="w3-center w3-text-white">20%</div>

                                                                </div>
                                                            </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: 24px">膳食纖維
                                                        
                                                            <div class="w3-progress-container">
                                                                <div id="myBar_3" class="w3-progressbar w3-yellow" style="width: 10%">
                                                                    <div id="demo_3" class="w3-center w3-text-white">20%</div>
                                                                </div>
                                                            </div>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: 24px">鈣物質
                                                      
                                                            <div class="w3-progress-container">
                                                                <div id="myBar_4" class="w3-progressbar w3-green" style="width: 10%">
                                                                    <div id="demo_4" class="w3-center w3-text-white">20%</div>
                                                                </div>
                                                            </div>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: 24px">維生素
                                                        <div class="w3-progress-container">
                                                            <div id="myBar_5" class="w3-progressbar w3-green" style="width: 20%">
                                                                <div id="demo_5" class="w3-center w3-text-white">20%</div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        
         
                           
                        </div>             
                                                    
                                        </div>
 
                            </div>
                            </div>

                      
                    

                  
                                 <div class="panel panel-primary">
                               <div class="panel-heading">
                                   <h3 class="panel-title" style="font-size: 28px;font-weight:bold">選擇重量</h3>
                               </div>
                           
                            <div class="panel-body">
                                  <div style="margin-left:10px;font-size:20px">
              
                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                                        <asp:ListItem   Value="2">2公斤</asp:ListItem>
                                                        <asp:ListItem   Value="2.5">2.5公斤</asp:ListItem>
                                                        <asp:ListItem Value="3">3公斤</asp:ListItem>
                                                        <asp:ListItem Value="5">5公斤</asp:ListItem>
                                                    </asp:RadioButtonList>
                                    <div style="text-align:center">
                                    <asp:Button ID="Button1" runat="server" Text="確認" OnClick="Button1_Click" onclientclick="return confirm('確定要新增嗎?')" CssClass="btn btn-primary btn-lg" Style=" height: 50px;width:100px"/>
                                    <asp:Button ID="Button2" runat="server" Text="取消"  OnClick="Button2_Click" onclientclick="return confirm('確定要取消嗎?')"  CssClass="btn btn-primary btn-lg" Style=" height: 50px;width:100px"/>
                                  </div>
                              


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
