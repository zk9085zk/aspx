<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanagereditbillboard.aspx.cs" Inherits="webs_manager_backmanagerupdatebillboard" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- 最新編譯和最佳化的 CSS -->
     <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
    <!-- 最新編譯和最佳化的 CSS -->
    <link href="/css/bootstrap-theme.min.css" rel="stylesheet" />
    <!-- w3 card的 CSS -->
    <link href="/css/w3.css" rel="stylesheet" />
    <!-- 選擇性佈景主題 -->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- 最新編譯和最佳化的 JavaScript -->
    <link href="/css/sidebar.css" rel="stylesheet" />



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
   
            
                         <h1 class="page-header" style="font-family: Microsoft JhengHei">修改公告</h1>
            
            
           <br/>
            <div class="col-md-11 w3-right">

                <table style="width:100%" class="table table-striped">
                     <tr>
                          <th><asp:Label ID="Label21" runat="server"><b>時間:</b></asp:Label></th>
                          <th> <asp:Label ID="Label22" runat="server" Text=""></asp:Label></th> 
                     </tr>

                     <tr>
                           <td> <asp:Label ID="Label7" runat="server"><b>類別:</b></asp:Label></td>
                           <td>  <asp:DropDownList ID="DropDownList1" runat="server" >
                                    <asp:ListItem>公告</asp:ListItem>
                                    <asp:ListItem>活動</asp:ListItem>
                                    <asp:ListItem>維護</asp:ListItem>
                                    <asp:ListItem>緊急</asp:ListItem>
                                </asp:DropDownList> </td> 
 
                     </tr>
                     <tr>
                           <td>  <asp:Label ID="Label10" runat="server"><b>標題:</b></asp:Label></td>
                           <td> <asp:TextBox ID="TextBox6" runat="server" class="w3-input w3-border" placeholder=""></asp:TextBox> </td> 
    
                     </tr>
                     <tr>
                           <td>  <asp:Label ID="Label12" runat="server"><b>內容:</b></asp:Label></td>
                           <td>   <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server"></CKEditor:CKEditorControl></td>    
                     </tr>
                </table>


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
  
                <asp:Button ID="Button1" OnClick="Button1_Click" onclientclick="return confirm('確定要刪除嗎?')" runat="server" Text="刪除" class="button button4 w3-pink w3-card-12" Style="background-color: FA8072" Height="50px" />

                <asp:Button ID="Button16" OnClick="Button16_Click" runat="server" Text="回公告" class="button button4 w3-blue w3-card-12" Style="background-color: #0044BB" Height="50px" />
            </div>
             
            </div>
    
    </form>
</body>


</html>