<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanagerupdatemember.aspx.cs" Inherits="webs_backmanagerupdatemember" %>

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
     .lab1{
         font-size:30px;
         font-weight:bold;
         color:white;
     }
  </style>
</head>

<body>
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
   
            <h1 class="page-header" style="font-family: Microsoft JhengHei">修改會員資料</h1>
            
                 
                   
             
            <div class="col-md-12" style="margin-top: 10px">
                <div class="col-md-4">
                    請輸入欲查詢會員內容:
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-md-1">
                    <b>帳號:</b>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="TextBox1" runat="server" class="col-md-12"></asp:TextBox>
                </div>
                <div class="col-md-1">
                    <b>姓名:</b>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="TextBox2" runat="server" class="col-md-12"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="Button13" OnClick="Button13_Click" class="w3-blue" runat="server" Text="查詢"></asp:Button>
                </div>
               
            </div>
      

        <div class="col-md-9 w3-card-12" style="margin-top: 20px">
            <asp:Label class="w3-green" ID="Label14" runat="server" Text="//此為查詢修改會員資料"></asp:Label>
            <ul class="w3-ul">
                <li style="height: 80px">
                    <div class="col-md-1">
                         <asp:Image ID="Image2" runat="server" Height="60px" ImageUrl="" CssClass="w3-left w3-circle w3-margin-right" />
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="Label4" runat="server"><b></b></asp:Label>
                        <asp:Label class="w3-text-blue" ID="Label3" runat="server"><b>請輸入欲修改會員</b></asp:Label><br />
                        <asp:Label ID="Label5" runat="server"><b></b></asp:Label>
                        <asp:Label ID="Label6" runat="server"><b></b></asp:Label><br />
                        <asp:Label ID="Label13" runat="server"><b></b></asp:Label>
                        <asp:Label ID="Label15" runat="server"><b></b></asp:Label>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="Label16" runat="server"><b></b></asp:Label>
                        <asp:Label ID="Label17" runat="server"><b ></b></asp:Label><br />
                        <asp:Label ID="Label18" runat="server"><b></b></asp:Label>
                        <asp:Label ID="Label19" runat="server"><b ></b></asp:Label><br />
                      
                    </div>
                    
                </li>
            </ul>
        </div>

        <div class="col-md-9 w3-card-12" style="margin-top: 20px; padding-bottom: 10px">
            <asp:Label class="w3-green" ID="Label7" runat="server" Text="//此為修改會員資料"></asp:Label><br />
            <div class="col-md-1">
                <asp:Image ID="Image4" runat="server" Height="60px" ImageUrl="" CssClass="w3-left w3-circle w3-margin-right" />
            </div>
            <div class="col-md-5">
                <asp:Label ID="Label8" runat="server"><b>姓名:</b></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" class="w3-input w3-border" placeholder=""></asp:TextBox><br />

            </div>
            <div class="col-md-6">
                <asp:Label ID="Label9" runat="server"><b>手機:</b></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server" class="w3-input w3-border" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-1">
            </div>
            <div class="col-md-11 w3-right">
                <asp:Label ID="Label10" runat="server"><b>信箱:</b></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server" class="w3-input w3-border" placeholder=""></asp:TextBox><br/>
                <asp:Label ID="Label11" runat="server"><b>住址:</b></asp:Label>
                <asp:TextBox ID="TextBox6" runat="server" class="w3-input w3-border" placeholder=""></asp:TextBox>
              
            </div>

            <div class="col-md-12 text-center" style="margin-top:10px">
                <style>
                    .button {
                        border: none;
                        color: white;
                        padding: 15px 32px;
                        text-align: center;
                        text-decoration: none;
                        display: inline-block;
                        font-size: 16px;
                        margin: 4px 2px;
                        cursor: pointer;
                    }


                    .button4 {
                        border-radius: 12px;
                    }
                </style>
                <asp:Button ID="Button15" OnClick="Button15_Click" onclientclick="return confirm('確定要修改嗎?')" runat="server" Text="確認修改" class="button button4 w3-green w3-card-12" Style="background-color: #4CAF50" Height="50px"  />
                <asp:Button ID="Button16" OnClick="Button16_Click" onclientclick="return confirm('確定要取消修改嗎?')" runat="server" Text="取消修改" class="button button4 w3-pink w3-card-12" Style="background-color: #FA8072" Height="50px" />

            </div>
         </div>

               
             
            </div>
    
    </form>
</body>

</html>


