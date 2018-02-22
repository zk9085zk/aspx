<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fodder_phone.aspx.cs" Inherits="webs_fodder_fodder_phone" %>

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
      body{
          font-family:Microsoft JhengHei;
      }
      .a{
          color: white; 
          text-align: center; 
          font-size:40px;

      }
     
      .c{
         background-color: #222; 
        
      }
      @media screen and (max-width: 480px) {


        
            .a{
                color: white; 
                text-align: center; 
                font-size:30px;
     
             
                
            }
           

            .c{
                background-color:#222; 
                padding:10px;
               
            }
      }
     .nodate{
         color:red;
     }
           .view{
         width:150px;
         height:90px;
         border:0px;
        
     }
 .view2{
         width:200px;
         height:270px;
         border:0px;
        
     }
         .zoom {
            position: relative;
            display: block;
            width: 200px;
            height: 270px;
            overflow: hidden;
            margin: 0px auto;
       
        }
        .zoom_icon {
            margin-bottom:92%;
            width: 10px;
            height: 10px;
            position: absolute;
            bottom: 8px;
            margin-left: 13%;
        }
          .opt_label {
          
            font-size: 30px;
            display: inline-block;
        }

 
  </style>
   
    <title></title>
</head>
<body style="background-color: #F5F5F5" onload="move_1();move_2();move_3();move_4();move_5();">
   <form id="form1" runat="server" class="form-horizontal">

 
<div id="wrapper" >
        <div class="overlay"></div>

        <!-- Sidebar -->
   <div class="c ">
               
                    <div class="a " >
                         <a href="/webs/home.aspx" style="color:white;text-decoration:none;" >寵物廚房</a> 
                    </div>
                   
                   
        </div>


        <!-- /#sidebar-wrapper -->
        <!-- Page Content -->
        <div id="page-content-wrapper" >
             
           

            <div class="container" style="width:88%">
                 
                <div class="row">
                               
                                <div class="row text-center" >
                                     <div class="col-md-8">
                                         <h1 class="page-header" style="font-family: Microsoft JhengHei">飼料包資料</h1>
                                     </div>    
                            </div> 
                                   
                                <div class="col-md-12" style="margin-top: 10px;text-align:">
                                     <div class="zoom">
                                        <div class="zoom_icon">
                                             <asp:Image ID="Image2" runat="server"  CssClass="view"/>
                                        </div>
                                     <asp:Image ID="Image3" runat="server" ImageUrl="~/img/pet_bag.png" CssClass="view2"/>
                                 </div> 
                                    
                                </div>
                                <div class="col-md-10 " style="margin-bottom:5%">

                                     <div class="col-md-12 text-center" style="margin-top:5%;margin-right:7%">
                                      <asp:Label CssClass="h1" ID="label4" runat="server" Text="$ " Style="font-weight:bold;font-size:24px;font-style:oblique;" />
                                        <asp:Label CssClass="h1" ID="label_price" runat="server" Text="價格" Style="color:tomato;font-size:36px;font-weight:bold;font-style:oblique;" />
                                     </div> 
                                        
                                    <div class="col-md-6" style="margin-top:7%">
                                        
                                        <asp:Label CssClass="h1" ID="label3" runat="server" Text="飼料包名稱 : " Style="font-weight:bold;font-size:24px"/>
                                        <asp:Label CssClass="h1" ID="label_fodderName" runat="server" Text="寵物名稱" Style="color:tomato;font-size:20px" />
                                    </div>
                                    <div class="col-md-6" style="margin-top:5%">

                                        <asp:Label CssClass="h1" ID="label5" runat="server" Text="飼料包重量 : " Style="font-weight:bold;font-size:24px" />
                                        <asp:Label CssClass="h1" ID="label_fodderWeight" runat="server" Text="飼料包重量" Style="color:tomato;font-size:20px" />
                                    </div>

                                     <div class="col-md-6" style="margin-top:5%">
                                        <asp:Label CssClass="h1" ID="label7" runat="server" Text="寵物重量 : " Style="font-weight:bold;font-size:24px" />
                                        <asp:Label CssClass="h1" ID="label_petweight" runat="server" Text="寵物重量" Style="color:tomato;font-size:20px" />
                                       
                                    </div>

                                    <div class="col-md-6" style="margin-top:5%">
                                        <asp:Label CssClass="h1" ID="label10" runat="server" Text="客製化需求 : " Style="font-weight:bold;font-size:24px" />
                                        <asp:Label CssClass="h1" ID="label_petAllergens" runat="server" Text="客製化需求" Style="color:tomato;font-size:20px" />
                                    </div>
                                    
                                

                              
                                        </div>
                         
                       <div class="col-md-12">
                                    
                                              
                               <div id="div1" style="display: none;font-size: 24px; margin-bottom: 50px; ">
                        


                                        <table class="table table-bordered" style="margin-top:5%">
                                            <thead>
                                                <tr>
                                                    <th class="text-center" style="font-size: 24px">營養標示</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td style="font-size: 24px">蛋白質
                                                   
                                                        
                                                             <div class="w3-progress-container" style="width:80%">
                                                                 <div id="myBar_1" class="w3-progressbar w3-red" >
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
                <div class="col-md-4" style="margin-top:10px">
                    <ul class="list-inline social-buttons">
                        <li><a href="https://github.com/"><i class="fa fa-github"></i></a>
                        </li>
                        <li><a href="https://www.facebook.com/RealNatureDogFood/"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="http://www.realnature.com.tw/aboutus.html"><i class="fa fa-google"></i></a>
                        </li>
                    </ul>
                </div>
                
                
            </div>
       </div>
    </footer>  
         
 </div>
  

       

    </form>
</body>
</html>
