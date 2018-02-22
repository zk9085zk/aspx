<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanageraddmember.aspx.cs" Inherits="webs_backmanageraddmember" %>

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

     <!-- 最新編譯和最佳化的 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"/>

    <!-- 選擇性佈景主題 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css"/>

    <!-- 最新編譯和最佳化的 JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../../js/jquery.twzipcode.min.js"></script>
    <script>
        $(function () {
            $('#twzipcode').twzipcode({
                detect: true, // 偵測位置

                'css': ['county', 'district', 'zipcode'],
            });

        });

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

        .zipcode {
            width: 26%;
            font-size: 25px;
        }

        .county {
            margin-left: 5%;
            width: 32%;
            font-size: 25px;
            height: 40px;
        }

        .district {
            margin-left: 5%;
            width: 32%;
            font-size: 25px;
            height: 40px;
        }
    </style>

    <title></title>
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
        
           

             <div class="row" style="padding-top: 100px;margin-left:23%;width:80%">
   
            <h1 class="page-header" style="font-family: Microsoft JhengHei">新增會員資料</h1>
            
                        
                <div >
                    <div class="col-md-9 ">
                        
                        <div class=" col-md-12 " style="border-style: double; background-color: whitesmoke;">
                            <div>
                                <center> <asp:Image src="http://www.msqq.com/d/file/icon/2014-04-01/b5e12627962868cda6cf9a6d26a8a3e3.png" ID="Image2" runat="server" Style="height: 200px; width: 200px" /> </center>
                            </div>
                            <div>
                                <center><asp:FileUpload ID="FileUpload1"  runat="server" /><asp:Label ID="Label3"  runat="server" Text=" " ></asp:Label></center>
                            </div>
                            <div class="col-md-12" style="margin-top: 40px; font-size: 25px; height: 30px">
                                <div class="col-md-3 " style="padding-left: 0px">
                                    <label class="w3-text-black"><b>姓名</b></label>
                                </div>
                                <div class="col-md-3 " style="padding-right: 0px">
                                    <label class="w3-text-black"><b>暱稱</b></label>
                                </div>
                                <div class="col-md-3 ">
                                    <label class="w3-text-black"><b>生日</b></label>
                                </div>
                                <div class="col-md-3 ">
                                    <label class="w3-text-black"><b>性別</b></label>
                                </div>
                            </div>
                            <div class="col-md-12" style="font-size: 25px; height: 30px">
                                <div class="col-md-3 " style="padding-left: 0px">
                                    <asp:TextBox ID="TextBox1" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Name"></asp:TextBox>

                                </div>
                                <div class="col-md-3 " style="padding-right: 0px">
                                    <asp:TextBox ID="TextBox2" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Nickname"></asp:TextBox>

                                </div>
                                <div class="col-md-3 ">
                                    <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                                    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css" />
                                    <script>
                                        $(function () {
                                            $("#TextBox5").datepicker({
                                                dateFormat: "yy/mm/dd",
                                                changeMonth: true,
                                                changeYear: true
                                            });

                                        });
                                    </script>
                                    <asp:TextBox ID="TextBox5" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Birthday"></asp:TextBox>

                                    <asp:CompareValidator
                                        ID="dateValidator" runat="server"
                                        Type="Date"
                                        Operator="DataTypeCheck"
                                        ControlToValidate="TextBox5"
                                        ErrorMessage="[請輸入正確格式(EX:2016/05/06)！]" ForeColor="#FF3300">
                                    </asp:CompareValidator>
                                </div>
                                <div class="col-md-2 ">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem>男</asp:ListItem>
                                        <asp:ListItem>女</asp:ListItem>
                                        <asp:ListItem>其他</asp:ListItem>

                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="col-md-12" style="margin-top: 40px; font-size: 25px; height: 30px">
                                <div class="col-md-4" style="padding-left: 0px">
                                    <label class="w3-text-black"><b>市話</b></label>
                                </div>
                                <div class="col-md-4 " style="padding-right: 0px">
                                    <label class="w3-text-black"><b>手機1</b></label>
                                </div>
                                <div class="col-md-4 ">
                                    <label class="w3-text-black"><b>手機2</b></label>
                                </div>
                            </div>
                            <div class="col-md-12" style="font-size: 25px; height: 30px">
                                <div class="col-md-4 " style="padding-left: 0px">
                                    <asp:TextBox ID="TextBox3" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Phone"></asp:TextBox>
                                </div>

                                <div class="col-md-4 ">
                                    <asp:TextBox ID="TextBox9" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Cellphone1"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="REVSmartphone"
                                        runat="server" ErrorMessage="[請輸入正確手機號碼！]"
                                        ValidationExpression="((\d{10})|(((\(\d{2}\))|(\d{2}-))?\d{4}(-)?\d{3}(\d)?))"
                                        ControlToValidate="TextBox9" Display="Dynamic" ForeColor="#FF3300">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-4 " style="padding-right: 0px">
                                    <asp:TextBox ID="TextBox4" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Cellphone2"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                        runat="server" ErrorMessage="[請輸入正確手機號碼！]"
                                        ValidationExpression="((\d{10})|(((\(\d{2}\))|(\d{2}-))?\d{4}(-)?\d{3}(\d)?))"
                                        ControlToValidate="TextBox4" Display="Dynamic" ForeColor="#FF3300">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-12" style="margin-top: 40px; font-size: 25px; height: 30px">
                                <div class="col-md-2 " style="padding-left: 0px">
                                    <label class="w3-text-black"><b>郵遞區號</b></label>
                                </div>
                                <div class="col-md-2 " style="padding-left: 0px">
                                    <label class="w3-text-black"><b>地址(縣市)</b></label>
                                </div>
                                <div class="col-md-2 " style="padding-right: 0px">
                                    <label class="w3-text-black"><b>地址(鄉鎮市區)</b></label>
                                </div>
                                <div class="col-md-6 ">
                                    <label class="w3-text-black"><b>地址(細項)</b></label>
                                </div>
                            </div>
                            <div class="col-md-12" style="padding: 0px">
                                <div id="twzipcode" class="col-md-6" runat="server">
                                </div>
                                <div class="col-md-6" style="font-size: 25px; height: 30px">
                                    <asp:TextBox ID="TextBox11" runat="server" class="w3-input w3-border " Style="width: 100%" placeholder="Adress"></asp:TextBox>
                                    <asp:TextBox ID="TextBox6" runat="server" type="hidden"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-12" style="margin-top: 40px">
                                <div style="font-size: 25px; height: 60px">
                                    <label class="w3-text-black"><b>帳號(信箱)</b></label></br>
                        <asp:TextBox ID="TextBox10" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Email"></asp:TextBox>
                                    <!--驗證E-mail格式-->
                                    <asp:RegularExpressionValidator ID="REVEmail" runat="server"
                                        ControlToValidate="TextBox10"
                                        Display="Dynamic" ErrorMessage="[請輸入格式正確的電子郵件帳號！]"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#FF3300">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div style="margin-top: 40px; font-size: 25px; height: 60px">
                                    <label class="w3-text-black"><b>密碼</b></label></br>
                        <asp:TextBox ID="TextBox12" runat="server" class="w3-input w3-border" TextMode="Password" Style="width: 100%" placeholder="密碼長度7，請包含英數字"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                                        runat="server" ErrorMessage="[請輸入正確格式(密碼長度7，請包含英數字)！]"
                                        ValidationExpression="^.*(?=.{7,})(?=.*\d)(?=.*[a-zA-Z]).*$"
                                        ControlToValidate="TextBox12" Display="Dynamic" ForeColor="#FF3300">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div style="margin-top: 40px; font-size: 25px; height: 60px">
                                    <label class="w3-text-black"><b>密碼確認</b></label></br>
                        <asp:TextBox ID="TextBox13" runat="server" class="w3-input w3-border" TextMode="Password" Style="width: 100%" placeholder="password again"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox12" ControlToValidate="TextBox13"
                                        ErrorMessage="[密碼輸入錯誤！]" ForeColor="Red"></asp:CompareValidator>
                                </div>
                            </div>
                            <div class="col-md-12 text-center" style="margin-top: 40px">
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
                                <asp:Button ID="Button13" runat="server" Text="確認" class="button button4 w3-green w3-card-12" Style="background-color: #4CAF50" Height="50px" OnClientClick="return invokeMeMaster();" OnClick="Button13_Click1" />
                                <asp:Button ID="Button14" runat="server" Text="取消" class="button button4 w3-pink w3-card-12" Style="background-color: #FA8072" Height="50px" OnClick="Button14_Click1"  />
                                <script>

                                    function invokeMeMaster() {
                                        var foo = $('#twzipcode').twzipcode('get', function (el) {
                                            /*alert(); // 輸出 County 選定的值。
                                            alert($(el.district).val()); // 輸出 County 選定的值。
                                            alert($(el.zipcode).val()); // 輸出 County 選定的值。*/
                                            var str_address = document.getElementById("TextBox11").value;
                                            document.all.TextBox6.value = $(el.zipcode).val() + "|" + $(el.county).val() + "|" + $(el.district).val() + "|" + str_address;
                                        });

                                    }
                                </script>

                            </div>

                        </div>
                    </div>

                </div>
        
             
            </div>
    
    </form>
</body>

</html>


