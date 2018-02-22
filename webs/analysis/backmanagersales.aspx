<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanagersales.aspx.cs" Inherits="webs_manager_backmanagersales" %>

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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://static.pureexample.com/js/flot/excanvas.min.js"></script>
    <script src="http://static.pureexample.com/js/flot/jquery.flot.min.js"></script>
    <script src="http://static.pureexample.com/js/flot/jquery.flot.pie.min.js"></script>

    <!-- CSS -->

    <style type="text/css">
      
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
     .lab1{
         font-size:30px;
         font-weight:bold;
         color:white;
     }
  
        #flotcontainer {
            width: 1000px;
            height: 800px;
            text-align: left;
        }
    </style>

    <script type="text/javascript">
        window.onload = function () {
            var a = parseInt(document.getElementById("TextBox1").value);
            var b = parseInt(document.getElementById("TextBox2").value);
            var c = parseInt(document.getElementById("TextBox3").value);

            var a_count = parseInt(document.getElementById("TextBox4").value);
            var b_count = parseInt(document.getElementById("TextBox5").value);
            var c_count = parseInt(document.getElementById("TextBox6").value);

            var id1 = document.getElementById("TextBox7").value;
            var id2 =document.getElementById("TextBox8").value;
            var id3 = document.getElementById("TextBox9").value;
  
	var chart = new CanvasJS.Chart("chartContainer",
	{
		title:{
			text: "",
			fontFamily: "Impact",
			fontWeight: "normal"
		},

		legend:{
			verticalAlign: "bottom",
			horizontalAlign: "center"
		},
		data: [
		{
		    //startAngle: 45,
           
			indexLabelFontSize: 16,
			indexLabelFontFamily: "Garamond",
			indexLabelFontColor: "darkgrey",
			indexLabelLineColor: "darkgrey",
			indexLabelPlacement: "outside",
			type: "doughnut",
			showInLegend: true,
			dataPoints: [
				{ y: a, legendText: a_count + "瓶" + "  " + id1 , indexLabel: id1 + a + "%" },
				{ y: b, legendText: b_count + "瓶" + "  " + id2 , indexLabel: id2 + b + "%" },
				{ y: c, legendText: c_count + "瓶" + "  " + id3 , indexLabel: id3 + c + "%" },
		
			]
		}
		]
	});

	chart.render();
}
</script>
    
    
    <script type="text/javascript" src="/canvasjs/canvasjs.min.js"></script>
    <title></title>
</head>

<body >
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
   
              
            <h1 class="page-header" style="font-family: Microsoft JhengHei">保健食品銷售分析</h1>
            
                <asp:TextBox ID="TextBox1" runat="server" type="hidden"></asp:TextBox>
                <asp:TextBox ID="TextBox2" runat="server" type="hidden"></asp:TextBox>
                <asp:TextBox ID="TextBox3" runat="server" type="hidden"></asp:TextBox>
                <asp:TextBox ID="TextBox4" runat="server" type="hidden"></asp:TextBox>
                <asp:TextBox ID="TextBox5" runat="server" type="hidden"></asp:TextBox>
                <asp:TextBox ID="TextBox6" runat="server" type="hidden"></asp:TextBox>
                <asp:TextBox ID="TextBox7" runat="server" type="hidden"></asp:TextBox>
                <asp:TextBox ID="TextBox8" runat="server" type="hidden"></asp:TextBox>
                <asp:TextBox ID="TextBox9" runat="server" type="hidden"></asp:TextBox>
              
                   
                 <div class="col-md-12" style="width:93%">
                    <div id="chartContainer" style="height:600px; width: 90%"></div>
                   
                     </div>
             
             
            </div>
    
    </form>
</body>
</html>
