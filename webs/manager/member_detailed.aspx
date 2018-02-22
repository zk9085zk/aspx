<%@ Page Language="C#" AutoEventWireup="true" CodeFile="member_detailed.aspx.cs" Inherits="webs_manager_member_detailed" %>

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
       .bb {
            width: 130px;
            height: 130px;
        }
     .img{
         width:100px
     }
     .lab1{
         font-size:30px;
         font-weight:bold;
         color:white;
     }
     .tet1{
         height:30px;
         text-align:center
     }
      .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 20px;
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
   background-color: #f44336;
    color: white;
    border: 1px solid;
}

.button2:hover {
    background-color: white;
    color: black;
    border: 1px solid #4CAF50;
    
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
    .table{       
            text-align:center;  
            
        }
       .zz{
            margin-top:10px;
            margin-bottom:10px;
        }
  </style>

     <script>
       function previewFile() {
    var preview = document.querySelector('#<%=Preview.ClientID %>');
    var file = document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
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
     
               
            <h1 class="page-header" style="font-family: Microsoft JhengHei">會員修改</h1>
                
               
            
           <div style="margin-left:8%;">
        
                  <div class="row" style="margin-top:20px">
                                  <div class="col-md-1" style="margin-top:2%">
                                        <asp:Button ID="Button4" runat="server" Text="會員總覽" CssClass="button button2" OnClick="Button4_Click"/>
                                    </div>        
                                     <div class="col-md-1"  style="margin-left:3%;margin-top:2%"> 
                                        <asp:Button ID="Button1" runat="server" Text="編輯" OnClick="Button1_Click" CssClass="button button1"/>
                                    </div>
                                   
                                      <div class="col-md-1"  style="margin-top:2%">
                                        <asp:Button ID="Button2" runat="server" Text="儲存" OnClick="Button2_Click" onclientclick="return confirm('確定要儲存嗎?')" Visible="false" CssClass="button button1"/>
                                    </div>
                                      <div class="col-md-1"  style="margin-top:2%">
                                        <asp:Button ID="Button3" runat="server" Text="取消" OnClick="Button3_Click" Visible="false" CssClass="button button2"/>
                                    </div>
                                      <div class="col-md-1"  style="margin-left:3%;margin-top:2%"> 
                                        <asp:Button ID="Button5" runat="server" Text="刪除" OnClick="Button5_Click"  Visible="false" onclientclick="return confirm('確定要刪除嗎?')" CssClass="button button1"/>
                                    </div>
                                    <div class="col-md-1"  style="margin-left:3%"> 
                                      <asp:Image ID="Preview" runat="server" CssClass="bb"/>
                                        <br/> <br/>
                                         <asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()" Visible="false"/>
                                    </div>
                               </div>
                                            <table  style="line-height:40px;width:80%">
                                                <tr >
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text="會員編號："></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>

                                                    </td>
                                                    <td>

                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td style="width:10%">
                                                        <asp:Label ID="Label4" runat="server" Text="Email："></asp:Label>
                                                        
                                                    </td>
                                                     <td>
                                                         <asp:TextBox ID="TextBox1" runat="server" Enabled="false" CssClass="tet1"></asp:TextBox>
                                                    </td>
                                                     <td>
                                                         <asp:Label ID="Label5" runat="server" Text="密碼："></asp:Label>
                                                    </td>
                                                      <td>
                                                        
                                                        <asp:TextBox ID="TextBox2" runat="server" Enabled="false" CssClass="tet1"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td >
                                                        <asp:Label ID="Label6" runat="server" Text="名稱："></asp:Label>
                                                        
                                                    </td>
                                                     <td>
                                                         <asp:TextBox ID="TextBox3" runat="server" Enabled="false" CssClass="tet1"></asp:TextBox>
                                                    </td>
                                                     <td>
                                                         <asp:Label ID="Label7" runat="server" Text="性別："></asp:Label>
                                                    </td>
                                                      <td>
                                                        
                                                        <asp:TextBox ID="TextBox4" runat="server" Enabled="false" CssClass="tet1"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>
                                                        <asp:Label ID="Label8" runat="server" Text="手機號碼："></asp:Label>
                                                        
                                                    </td>
                                                     <td>
                                                         <asp:TextBox ID="TextBox5" runat="server" Enabled="false" CssClass="tet1"></asp:TextBox>
                                                     </td>
                                                     <td>
                                                         <asp:Label ID="Label9" runat="server" Text="出生日期："></asp:Label>
                                                     </td>
                                                      <td>
                                                        
                                                       <asp:TextBox ID="TextBox6" runat="server" Enabled="false" CssClass="tet1"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    
                                                     <td>
                                                          <asp:Label ID="Label10" runat="server" Text="地址："></asp:Label>
                                                     </td>
                                                      <td>
                                                       
                                                        <asp:TextBox ID="TextBox7" runat="server" Enabled="false" CssClass="tet1"></asp:TextBox>

                                                    </td>
                                                      <td>
                                                         <asp:Label ID="Label11" runat="server" Text="最近登入"></asp:Label>
                                                     </td>
                                                      <td>
                                                        
                                                        <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                </tr>
                                                
                                                 
                                            </table> 


                                                    

                           </div>        
                                            <div>
                                                   <h1 class="page-header" style="font-family: Microsoft JhengHei">寵物資料</h1>
                                                     <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

                                                      <asp:Table BorderWidth="0px" ID="Table1" runat="server" CssClass="table table-condensed">
                                                      </asp:Table>
                                             </div>
             
            </div>
    
    </form>
</body>

</html>
