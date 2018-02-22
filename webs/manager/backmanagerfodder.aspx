<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanagerfodder.aspx.cs" Inherits="webs_manager_backmanagerfodder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
    <!-- 最新編譯和最佳化的 CSS -->
    <link href="/css/bootstrap-theme.min.css" rel="stylesheet" />
    <!-- w3 card的 CSS -->
    <link href="/css/w3.css" rel="stylesheet" />
    <!-- 選擇性佈景主題 -->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- 最新編譯和最佳化的 JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

    <title></title>
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
         background-color:#222; 
          padding:10px;
        
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
                background-color: #006064; 
                
                padding:10px;
               
            }
      }
       .img{
         width:100px
     }
        .view{
         width:220px;
         height:140px;
         border:0px;
        
     }
      .view2{
         width:300px;
         height:450px;
         border:0px;
        
     }
         .zoom {
           
            position: relative;
            display: block;
            width: 400px;
            height: 450px;
            overflow: hidden;
       
        }
        .zoom_icon {
            margin-bottom:77%;
            width: 10px;
            height: 10px;
            position: absolute;
            bottom: 8px;
            margin-left: 23%;
        }

  </style>

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
</head>

<body onload="move_1();move_2();move_3();move_4();move_5();">
   <form id="form1" runat="server">

         
        <nav class="w3-sidenav w3-collapse w3-card-2 w3-animate-left" style="width: 18%;background-color: #00796B" id="mySidenav">

            <a href="javascript:void(0)" onclick="w3_close()"
                class="w3-closenav w3-large w3-hide-large">收起 &times;</a>
           
           
            <a href="#" style="color: white;margin-top:70px">
                <h3></h3>
            </a>
           <div style="margin-bottom:20px;text-align:center">
           <asp:Image ID="Image1" runat="server" ImageUrl="~/img/head.png" CssClass="img"/><br /><br />
             <asp:Label ID="Label1" runat="server" Text="管理員大大" CssClass="lab1"></asp:Label>   
           </div>

            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-user" aria-hidden="true"></i>會員管理</h4>
            </a>
            <a href="/webs/manager/backmanagersearchcustomer.aspx" style="color: white;">會員資料</a>
            <a href="/webs/manager/backmanageraddmember.aspx" style="color: white;">新增會員</a>

            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-file" aria-hidden="true"></i>資料查詢</h4>
            </a>
            <a href="/webs/manager/backmanagersearchbuy.aspx" style="color: white;">查詢會員購買紀錄</a>
            <a href="/webs/manager/backmanagersearchpet.aspx" style="color: white;">查詢會員寵物資料</a>

           <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-cutlery" aria-hidden="true"></i>訂單功能</h4>
            </a>
            <a href="/webs/manager/backmanagerorder.aspx" style="color: white;">查詢訂單</a>

             <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-paw" aria-hidden="true"></i>商品資訊</h4>
            </a>
            <a href="/webs/manager/backmanagercommodity.aspx" style="color: white;">商品修改</a>

           <a href="#" style="color: white; background-color: #006064">
            <h4><i style="padding-right: 10px" class="fa fa-shopping-basket" aria-hidden="true"></i>公告管理</h4>
            </a>
           <a href="/webs/manager/backmanagerbillboard.aspx" style="color: white;">公告修改</a>
            <a href="/webs/manager/backmanageraddbillboard.aspx" style="color: white;">公告新增</a>
                     
               <a href="#" style="color: white; background-color: #006064">
            <h4><i style="padding-right: 10px" class="fa fa-pencil-square-o" aria-hidden="true"></i>留言管理</h4>
            </a>
            <a href="/webs/manager/content.aspx" style="color: white;">留言修改</a>  

           <a href="#" style="color: white; background-color: #006064">
            <h4><i style="padding-right: 10px" class="fa fa-bar-chart" aria-hidden="true"></i>數據分析</h4>
            </a>
             <a href="/webs/manager/analysis.aspx" style="color: white;">分析</a>  

        </nav>

          <div class="c navbar-fixed-top">
               
                    <div class="a " >
                         <a href="/webs/manager/backmanagerbillboard.aspx" style="color:white;text-decoration:none;" >寵物廚房後台管理系統</a>
                         <a class="b " href="/webs/nologinhome.aspx" style="text-decoration:none;">
                            <asp:Label ID="Label2" runat="server" Text="登出"></asp:Label>
                         </a>
                    </div>
                   
                   
        </div>

        
       

           <div class="row" style="padding-top: 100px;margin-left:23%;width:70%">
           
       <div class="row" style="margin-top:5%">
                          
                                <div class="row">
                                     <div class="col-md-8">
                                         <h1 class="page-header" style="font-family: Microsoft JhengHei">客製化飼料包資料</h1>
                                     </div>
                             
                                 <div class="col-md-1 text-right">
                                     <asp:Button CssClass="btn btn-danger btn-lg" ID="Button2" OnClick="Button2_Onclick" onclientclick="return confirm('確定要刪除嗎?')" runat="server" Text="刪除" Style="height: 50px;width:100px; margin-top: 20px; margin-bottom: 15px;" />
                                 </div> 
                                    <div class="col-md-1 text-right">
                                      <asp:Button CssClass="btn btn-danger btn-lg" ID="Buttonback" OnClick="Buttonback_Onclick" runat="server" Text="詳細訂單" Style="height: 50px; margin-top: 20px; margin-bottom: 15px;" />
                                 </div> 
                                     <div class="col-md-2 text-right">
                                           <asp:Image ID="Image4" runat="server" />
                                         </div>
                            </div> 
                                   
                                <div class="col-md-4 text-center" style="margin-top: 10px;">
                                     <div class="zoom">
                                        <div class="zoom_icon">
                                             <asp:Image ID="Image2" runat="server"  CssClass="view"/>
                                        </div>
                                     <asp:Image ID="Image3" runat="server" ImageUrl="~/img/pet_bag.png" CssClass="view2"/>
                                 </div> 
                                    
                                </div>
                                <div class="col-md-8 ">
                                    
                                    <div class="col-md-6" style="margin-top:15%">
                                        
                                        <asp:Label CssClass="h1" ID="label3" runat="server" Text="飼料包名稱 : " Style="font-weight:bold;font-size:34px"/>
                                        <asp:Label CssClass="h1" ID="label_fodderName" runat="server" Text="寵物名稱" Style="color:tomato;font-size:28px" />
                                    </div>
                                    <div class="col-md-6" style="margin-top:15%">
                                       
                                       
                                        <asp:Label CssClass="h1" ID="label5" runat="server" Text="飼料包重量 : " Style="font-weight:bold;font-size:34px" />
                                        <asp:Label CssClass="h1" ID="label_fodderWeight" runat="server" Text="飼料包重量" Style="color:tomato;font-size:28px" />
                                    </div>

                                     <div class="col-md-6" >
                                       <br />
                                        <asp:Label CssClass="h1" ID="label6" runat="server" Text="寵物名稱 : " Style="font-weight:bold;font-size:34px" />
                                        <asp:Label CssClass="h1" ID="label_petName" runat="server" Text="寵物名稱" Style="color:tomato;font-size:28px" />
                                    </div>
                                    <div class="col-md-6">
                                        <br />
                                        <asp:Label CssClass="h1" ID="label7" runat="server" Text="寵物重量 : " Style="font-weight:bold;font-size:34px" />
                                        <asp:Label CssClass="h1" ID="label_petweight" runat="server" Text="寵物重量" Style="color:tomato;font-size:28px" />
                                       
                                    </div>
                                  

                    
                                    <div class="col-md-12">
                                        <br />
                                        <asp:Label CssClass="h1" ID="label10" runat="server" Text="客製化需求 : " Style="font-weight:bold;font-size:34px" />
                                        <asp:Label CssClass="h1" ID="label_petAllergens" runat="server" Text="客製化需求" Style="color:tomato;font-size:28px" />
                                    </div>
                                    
                                 <div class="col-md-2" style="margin-top:9%">
                                      <asp:Label CssClass="h1" ID="label4" runat="server" Text="$ " Style="font-weight:bold;font-size:24px;font-style:oblique;" />
                                        <asp:Label CssClass="h1" ID="label_price" runat="server" Text="價格" Style="color:tomato;font-size:36px;font-weight:bold;font-style:oblique;" />
                                     </div>     

                                 
                                  
                                        </div>
                                
                                      <div class="col-md-12">
                                    
                                              
                               <div id="div1" style="display: none;font-size: 24px; margin-bottom: 50px; padding: 20px;">
                        

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
           

           
      

    </form>
</body>
</html>
