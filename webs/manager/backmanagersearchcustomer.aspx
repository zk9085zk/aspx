﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanagersearchcustomer.aspx.cs" Inherits="webs_backmanagersearchcustomer" %>

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
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
      .table{       
            text-align:center;  
            margin-top:5%      
        }
       .zz{
            margin-top:10px;
            margin-bottom:10px;
        }
      .table_a
   {
       text-align:center;
        font-size:20px;
        font-weight:bold;
        text-align:center;
         background-color:#F5F5F5;
   }
    .table_b
   {
       text-align:center;
       font-size:20px;
       text-align:center;   
   }
       .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 5px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 2px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

    .button1 {
   background-color: #f44336;
    color: white;
    border: 1px solid;
}
    
    .button2 {
   background-color: #008CBA;
    color: white;
    border: 1px solid;
   
}

.button2:hover {
    background-color: white;
    color: black;
    border: 1px solid #008CBA;
    
}
     .textbox_a
        {
            width:80%;
           
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
        
           
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

             <div class="row" style="padding-top: 100px;margin-left:23%;width:70%">
   
            <h1 class="page-header" style="font-family: Microsoft JhengHei">會員資料</h1>
            
                     
                   <div class="container">
                          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>   
                                    <ul class="nav nav-pills" >
                                        <li class="active"><a data-toggle="tab" href="#home" style="font-weight: bold; font-family: Microsoft JhengHei; font-size: large;width:200px;text-align:center" >所有會員</a></li>
                                        <li><a data-toggle="tab" href="#menu1" style="font-weight: bold; font-family: Microsoft JhengHei; font-size: large;width:200px;text-align:center">查詢會員</a></li>
                                        <li><a data-toggle="tab" href="#menu2" style="font-weight: bold; font-family: Microsoft JhengHei; font-size: large;width:200px;text-align:center">發送EMAIL</a></li>
                                    </ul>
                         </ContentTemplate>
                </asp:UpdatePanel> 
                                    <div class="tab-content">

                                        <div id="home" class="tab-pane fade in active" style="margin-top:15px">

                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>

                                                     <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

                                                      <asp:Table BorderWidth="0px" ID="Table1" runat="server" CssClass="table table-condensed">
                                                      </asp:Table>

                                                </ContentTemplate>
                                            </asp:UpdatePanel> 

                                           
                                        </div>


                                        <div id="menu1" class="tab-pane fade">
                                            
                                        
                          <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                 <ContentTemplate>
    
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
       

                 
                                          <div class="col-md-12">
                    

                                                    <div class="col-md-9 w3-card-12" style="margin-top: 20px">
                                                        <asp:Label class="w3-green" ID="Label14" runat="server" Text="//此為會員自定義資料"></asp:Label>
                                                        <ul class="w3-ul">
                                                            <li style="height: 80px">
                                                                <div class="col-md-2">
                                                                    <asp:Image ID="Image2" runat="server" CssClass="w3-left w3-circle w3-margin-right" Height="60px" />
                       
                                                                </div>
                                                                <div class="col-md-5">
                                                                     <asp:Label ID="Label4" runat="server"><b></b></asp:Label><br/>
                                                                    <asp:Label class="w3-text-blue" ID="Label3" runat="server"><b>請輸入欲搜尋會員</b></asp:Label><br />
                                                                    <asp:Label ID="Label5" runat="server" ></asp:Label><br/>
                                                                    <asp:Label ID="Label6" runat="server"></asp:Label>
                        
                        
                       
                                                                </div>
                                                                <div class="col-md-5">
                                                                    <asp:Label ID="Label7" runat="server" ></asp:Label><br/>
                                                                    <asp:Label ID="Label8" runat="server" ></asp:Label><br/>
                                                                    <asp:Label ID="Label9" runat="server" ></asp:Label><br/>
                                                                    <asp:Label ID="Label10" runat="server" ></asp:Label>
                        
                                                                </div>
                                                            </li>
                                                        </ul>
                                                     </div>

                                          </div>

                                                    
                                                </ContentTemplate>
                                            </asp:UpdatePanel>         
                                        </div>
                                        
                                        <div id="menu2" class="tab-pane fade">
                                           
                                              <div style="font-size:20px;margin-left:10%;margin-right:10px;margin-top:5%">  
                                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox_a"  Rows="4" TextMode="MultiLine"></asp:TextBox>
                                                 </div>
                                            <div style="margin-left:77%">
                                                    <asp:Button ID="Button1" runat="server" Text="發送"  OnClick="Button1_Click" CssClass="button button2"/>
                                            </div>
                                            

                                        </div>

                                    </div>
                                </div>
                   
                
    
          
           
           


                
            </div>
             
         
    
    </form>
</body>

</html>


