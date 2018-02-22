<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanagercommodity3.aspx.cs" Inherits="webs_manager_backmanagercommodity3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
            margin-top:40px;
            margin-bottom:30px;
        }
        .image_a{
             width: 200px;
            height: 200px;
        }
        .fileUpload {
    position: relative;
    overflow: hidden;
    margin: 10px;
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
}

.tb10 {
	background-repeat:repeat-x;
	border:1px solid #d1c7ac;
	color:#333333;
	padding:3px;
	font-family:tahoma, arial, sans-serif;
    width:50%;
  
}
.table_a{
            font-size:20px;
            font-weight:bold;
            color:black;
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
   
            <h1 class="page-header" style="font-family: Microsoft JhengHei">修改寵物保健品</h1>
            
           <div class="aa">
                        <table  class="table table-striped">
                            <tr>
                                <td class="table_a">
                                    商品名稱:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_a">
                                    適用:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_a">
                                    成分:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_a">
                                    特色1:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_a">
                                    特色2:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_a">
                                    特色3:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_a">
                                    建議售價:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox7" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="table_a">
                                    網路價:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox8" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td class="table_a">
                                    產地:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox9" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td class="table_a">
                                    注意事項1:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox10" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td class="table_a">
                                    注意事項2:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox11" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td class="table_a">
                                    內容物:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox12" runat="server" CssClass="tb10"></asp:TextBox>
                                </td>
                            </tr>
                            
                        </table>

                          <div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                   <asp:Image ID="Preview" runat="server" Width="150" Height="150"  />  
                                </div>
                                 <div class="col-md-4">
                                     <br/> <br/> <br/> <br/> <br/> <br/>
                                    
                                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()" />
                                        
                                </div>
                                <div class="col-md-2">
                                     <br/> <br/> <br/> 
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" onclientclick="return confirm('確定要修改嗎?')" Text="確定修改"  CssClass="button button1" />
                                </div>
                                <div class="col-md-2">
                                     <br/> <br/> <br/> 
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click"  Text="取消修改"  CssClass="button button1" />
                                </div>
                                <br />
                             </div>
                            </div>
                      </div>
             
            </div>
    
    </form>
</body>
</html>
