﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanagerorder3.aspx.cs" Inherits="webs_manager_backmanagerorder3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
.dr{
    width:30%
}
.dr2{
    width:55%
} 
.te1{
    width:70%;
   
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
   
            <h1 class="page-header" style="font-family: Microsoft JhengHei">訂單修改
                <asp:Image ID="Image2" runat="server" ImageUrl="~/img/delivery-truck.png" CssClass="truck" />
                <asp:Label ID="Label9" runat="server" Text="配送狀態：" CssClass="truck_text"></asp:Label>
                <asp:DropDownList ID="DropDownList4" runat="server" CssClass="truck_text">
                    <asp:ListItem>未出貨</asp:ListItem>
                    <asp:ListItem>送貨中</asp:ListItem>
                    <asp:ListItem>已送達</asp:ListItem>
                </asp:DropDownList>

            </h1>
            
                                     <div class="aa">
                        
                            
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                     
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

                    <div class="row">
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



                                    <div class="row" style="padding:15px">   
                                     </div>
                                       </ContentTemplate>
                            </asp:UpdatePanel>
                                    <div class="row3">
                                         <table class="table table-striped" style="table-layout:fixed;width:100%" >
                                             
                                                     　 
                                                     <tr>
                                                         <td>訂購人</td>
                                                         <td>付款方式</td>
                                                         <td>配送方式</td>
                                                                
                                                      </tr>
                                                            
                                                                     　 
                                                                     <tr>
                                                                         <td>
                                                                             <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                                                             　 </td>
                                                                        
                                                                            
                                                                                 <td>
                                                                                     <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dr">
                                                                                         <asp:ListItem>貨到付款</asp:ListItem>
                                                                                         <asp:ListItem>ATM轉帳</asp:ListItem>
                                                                                     </asp:DropDownList>
                                                                                     　 </td>
                                                                                 <td>
                                                                                     <asp:DropDownList ID="DropDownList2" runat="server">
                                                                                         <asp:ListItem>郵寄80元</asp:ListItem>
                                                                                         <asp:ListItem>黑貓宅急便80元</asp:ListItem>
                                                                                     </asp:DropDownList>
                                                                                 </td>
                                                                                 
                                                                             </tr>
                                                                            
                                                                                 <tr>
                                                                                     <td>發票資訊</td>
                                                                                     <td>備註</td>
                                                                                     <td>總價</td>
                                                                                      
                                                                                  </tr>
                                                                                        
                                                                                             　 
                                                                                          <tr>
                                                                                               <td>
                                                                                                     <asp:DropDownList ID="DropDownList3" runat="server" CssClass="dr2">
                                                                                                         <asp:ListItem>開立二聯式紙本發票</asp:ListItem>
                                                                                                         <asp:ListItem>我要捐贈發票做公益</asp:ListItem>
                                                                                                     </asp:DropDownList>
                                                                                                     　 </td>
                               
                                                                                                         <td>
                                                                                                             <asp:TextBox ID="TextBox1" runat="server" CssClass="te1" TextMode="MultiLine"></asp:TextBox>
                                                                                                             　 </td>
                                                                                                         <td>
                                                                                                             <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                                                                                             　 </td>
                                                                                                        
                                                                                                     </tr>
                                                                                                
                                                                                      
                                               
                                           </table>
    
                                    </div>
                                   
                             <div class="row">
                                   <div class="col-md-8">
                                   
                                    </div>
                                     <div class="col-md-2">
                                         <br/>
                                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="確定修改" onclientclick="return confirm('確定要修改嗎?')" CssClass="button button1" />
                                
                                         </div>
                                    <div class="col-md-2">
                                         <br/>
                                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click"   Text="取消修改"  CssClass="button button1"  />
                                    </div>                
                             </div>
                                    <br /><br/>
                             
                       
                           
                          
                       

                        
                         
                          
                        </div>
             
            </div>
    
    </form>
</body>
</html>


