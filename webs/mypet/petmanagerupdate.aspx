<%@ Page Language="C#" AutoEventWireup="true" CodeFile="petmanagerupdate.aspx.cs" Inherits="webs_petmanagerupdate" %>

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
    <link href="/css/sidebar.css" rel="stylesheet" />
     <link href="/jquery-ui-1.12.0.custom/jquery-ui.theme.css" rel="stylesheet" />
    <link href="/jquery-ui-1.12.0.custom/jquery-ui.structure.min.css" rel="stylesheet" />
    <link href="../../css/five-column.css" rel="stylesheet" />
    <link href="/css/agency.min2.css" rel="stylesheet"/>
    <script src="/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.7.js"></script>
    <script src="/jquery-ui-1.12.0.custom/jquery-ui.js"></script>
   

    <script src="/js/sidebar.js"></script>
    <script type="text/javascript">
        function getValue() {
            '<% Session.Add("fbid", null); %>';
            '<% Session.Add("googleid", null); %>';
             '<% Session.Add("user", "1"); %>';
        }
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
         background-color: #222; 
         margin-left: 5%;
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
                background-color:#222; 
                margin-left: 15%;
                padding:10px;
               
            }
      }
     .view{
         width:270px;
         height:245px;
         border:0px;
        
     }

  </style>
   


    <script>
        //datepicker
        $(function () {
            $("#birthdayy").datepicker({
                changeMonth: true,
                changeYear: true
            });
        });

    </script>


    <!--抓盪-->
    <link href="../../css/common.css" rel="stylesheet" />
    <script src="../../js/jquery.dropdown.js"></script>
    <script src="../../js/modernizr.custom.63321.js"></script>



    <script type="text/javascript">
        window.onload = function () {
            var div1 = document.getElementById('div1');
            var div2 = document.getElementById('div2');
            div1.style.display = 'none';
            div2.style.display = 'none';

            $(function () {
                $("#ddl_Spicies").dropdown({
                });
            });
            $(function () {
                $("#ddl_HairLengh").dropdown({
                });
            });
            $(function () {
                $("#ddl_Ligation").dropdown({
                });
            });
            $(function () {
                $("#ddl_Allergens").dropdown({
                    onOptionSelect: function (opt) {
                        if (opt.attr("data-value") == "yes") {
                            div1.style.display = '';
                        }
                        else {
                            div1.style.display = 'none';
                        }
                    }
                });
            });
            $(function () {
                $("#ddl_Sex").dropdown({
                });
            });
            $(function () {
                $("#ddl_Weight").dropdown({
                });
            });
            $(function () {
                $("#ddl_HairColor").dropdown({
                });
            });
            $(function () {
                $("#ddl_HairStyle").dropdown({
                });
            });
        }
    </script>


    <script>
        $(function () {
            var availableTags = [
              "柯基犬"
            , "柴犬"
            , "米克斯"
            , "玩具貴賓犬"
            , "黃金獵犬"
            , "拉布拉多犬"
            , "馬爾濟斯"
            , "長毛迷你臘腸"
            , "雪納瑞"
            , "長毛吉娃娃"
            , "短毛吉娃娃"
            , "法國鬥牛犬"
            , "巴哥犬"
            , "喜樂蒂牧羊犬"
            , "邊界牧羊犬"
            , "德國狼犬"
            , "洛威拿"
            , "拳師犬"
            , "西藏獒犬"
            , "英國鬥牛犬"
            , "杜賓犬"
            , "台灣犬"
            , "博美犬"
            , "臺灣犬"
            , "高加索犬"
            , "比熊犬"
            , "馬利諾"
            , "高山犬"
            , "米格魯"
            , "大丹"
            , "鬆獅犬"
            , "聖伯納"
            , "西施犬"
            ];
            $("#subspicies").autocomplete({
                source: availableTags
            });
        });
    </script>



    <script src="https://cdn.rawgit.com/nnattawat/flip/master/dist/jquery.flip.min.js"></script>

    <script>
        $(function () {
            $("#card_1").flip();
            $("#card_2").flip();
            $("#card_3").flip();
            $("#card_4").flip();
            $("#card_5").flip();
            $("#card_6").flip();
            $("#card_7").flip();
            $("#card_8").flip();
            $("#card_9").flip();
            $("#card_10").flip();
            $("#card_11").flip();
            $("#card_12").flip();
            $("#card_13").flip();
            $("#card_14").flip();
            $("#card_15").flip();
        });
        function updateRecord(div) {
            var s = document.getElementById("TextBox1");
            var id = div.id;
            var ID = id.split('_');

            s.value += ID[1] + ",";
        }
    </script>
    <script type="text/javascript">
        function getValue() {
            '<% Session.Add("fbid", null); %>';
            '<% Session.Add("googleid", null); %>';
             '<% Session.Add("user", "1"); %>';
        }
    </script>
    
<script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=Avatar.ClientID %>');
            var file = document.querySelector('#<%=avatarUpload.ClientID %>').files[0];
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
 


    <title></title>
</head>

<body style="background-color: #F5F5F5">
       <form id="form1" runat="server" class="form-horizontal">

 
<div id="wrapper" >
        <div class="overlay"></div>

        <!-- Sidebar -->
   <div class="c ">
               
                    <div class="a " >
                         <a href="/webs/home.aspx" style="color:white;text-decoration:none;" >寵物廚房</a>
                         <a class="b " href="/webs/nologinhome.aspx" style="text-decoration:none;">
                            <asp:Label ID="Label2" runat="server" Text="登出"></asp:Label>
                         </a>
                    </div>
                   
                   
        </div>

     
             
          
        
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation" >
            <ul class="nav sidebar-nav">
                <li class="sidebar-brand">
                    <a href="/webs/home.aspx" style="color: #55AA00;"  >
                        <h2>寵物廚房</h2>
                    </a>
                </li>
               
                    <h1 style="color:white">
                    <asp:Label ID="Label1" runat="server" Text="您尚未登入" CssClass="sider"></asp:Label></h1>
                    <asp:Image ID="Image1" runat="server" CssClass="imgimg"/>
                 

                   
               
                <li>

               </li>
                   
                    <h4 style="color:white"><i style="padding-left: 10px;color: white" class="fa fa-user" aria-hidden="true"></i>會員中心</h4>
                   
                <li>
                    <a href="/webs/member/member.aspx" style="color: white;">我的基本資料</a>
                </li>
                <li>
                    <a href="/webs/member/memberbuy.aspx" style="color: white;">我的購物紀錄</a>
                </li>

                   <h4 style="color:white"><i style="padding-left: 10px;color: white" class="fa fa-paw" aria-hidden="true"></i>寵物管理</h4>

                <li>
                    <a href="/webs/mypet/petmanager.aspx" style="color: white;">我的毛小孩</a>
                </li>
                <li>
                    <a href="/webs/mypet/petmanagerinsert.aspx" style="color: white;">註冊毛小孩</a>
                </li>

                     <h4 style="color:white"><i style="padding-left: 10px;color: white" class="fa fa-cutlery" aria-hidden="true"></i>糧身菜單</h4>

               

                <li class="dropdown">
                    <a href="/webs/fodder/fodder_pet.aspx" class="dropdown-toggle" data-toggle="dropdown">菜單設計<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="dropdown-header">寵物菜單</li>
                        <li> <a href="/webs/fodder/pet_fodder.aspx" style="color: white;">訂製我的菜</a></li>
                        
     
                    </ul>
                </li>

               <li>  
                   <a href="/webs/fodder/foddernext.aspx" style="color: white;">歷史菜單</a>
               </li>

                      <h4 style="color:white"><i style="padding-left: 10px" class="fa fa-shopping-basket" aria-hidden="true"></i>商品選購</h4>

                <li>
                     <a href="/webs/shopping.aspx" style="color: white;">我的購物車</a>
                </li>
                <li>
                    <a href="/webs/commodity.aspx" style="color: white;">寵物保健品</a>
                   
                </li>

                      <h4 style="color:white"><i style="padding-left: 10px" class="fa fa-phone" aria-hidden="true"></i>客服中心</h4>

                <li>
                     <a href="/webs/info/contact.aspx" style="color: white;">聯絡我們</a>
                </li>
                <li>
                   <a href="/webs/info/shoppinginfo.aspx" style="color: white;">購物須知</a>
                </li>
                 <li>
                   <a href="/webs/info/askme.aspx" style="color: white;">客服留言</a>
                </li>

                
              
            </ul>
        </nav>

        <!-- /#sidebar-wrapper -->
        <!-- Page Content -->
        <div id="page-content-wrapper" >
             
            <button type="button" class="hamburger is-closed" data-toggle="offcanvas">
                <span class="hamb-top"></span>
                <span class="hamb-middle"></span>
                <span class="hamb-bottom"></span>
            </button>

            <div class="container">
                
                <div class="row">
                  
                       

                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h1 class="page-header" style="font-family: Microsoft JhengHei">註冊寵物資料</h1>
                        </div>
 
                         <div class="col-md-12 text-center" style="margin-bottom:20px">
                           <asp:Image ID="Avatar" runat="server" CssClass="view" ImageUrl="~/img/noimage.png"/>
                             <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </div>
                         <div class="col-md-12 text-center" >
                           <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="col-md-5 text-center" style="text-align: center; margin-top: 10px">
                           
                        </div>


                        <div class="col-md-7 text-center" style="text-align: center; margin-top: 10px">
       
                       
                        <input id="avatarUpload" type="file" name="file" onchange="previewFile()"  runat="server" />
                           

                        </div>
                       
                        <div class="col-md-12 text-center" style="text-align: center; margin-top: 10px">
                          
                        </div>
                   
                    <div class="row">
                        <div class="col-md-2"></div>

                        <div id="select_survey" class="col-md-8">

                            <div class="col-md-6 text-center">
                                <div class="col-md-12 ">


                                    <div class="form-group">
                                        <h3>
                                            <label for="petname">毛小孩大名：</label></h3>
                                        <asp:TextBox type="text" CssClass="form-control" Style="margin-top: 40px" ID="petname" runat="server"></asp:TextBox>
                                        <!--<asp:RequiredFieldValidator ID="validName" runat="server"
                                            ErrorMessage="必須輸入寵物名稱!" ControlToValidate="petname" Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>-->
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <h3>
                                        <label style="margin-top: 10px" for="petname">毛小孩種類：</label></h3>
                                    <asp:DropDownList ID="ddl_Spicies" runat="server">
                                        <asp:ListItem Selected="True" Value="無資料!!">請選擇一種寵物種類：</asp:ListItem>
                                        <asp:ListItem class=" icon-octoface" Value="貓">貓</asp:ListItem>
                                        <asp:ListItem class="icon-firefox" Value="狗">狗</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-md-12 ">
                                    <div class="form-group">
                                        <h3>
                                            <label for="other">背毛長短：</label>
                                        </h3>
                                        <asp:DropDownList ID="ddl_HairLengh" Style="position: relative; z-index: 9999" runat="server">
                                            <asp:ListItem Selected="True" Value="無資料!!">請選擇一種</asp:ListItem>
                                            <asp:ListItem class="icon-rain" Value="無毛">無毛</asp:ListItem>
                                            <asp:ListItem class="icon-subtract" Value="短毛">短毛</asp:ListItem>
                                            <asp:ListItem class="icon-sound" Value="剛毛">剛毛</asp:ListItem>
                                            <asp:ListItem class="icon-drown" Value="長毛">長毛</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>


                                <div class="col-md-12 ">
                                    <div class="form-group">
                                        <h3>
                                            <label for="other">結紮狀況：</label>

                                        </h3>
                                        <asp:DropDownList ID="ddl_Ligation" runat="server">
                                            <asp:ListItem Selected="True" Value="無資料!!">請選擇一種</asp:ListItem>
                                            <asp:ListItem class="icon-checkmark" Value="是">有結紮</asp:ListItem>
                                            <asp:ListItem class="icon-x" Value="否">沒有結紮</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-12 ">
                                    <div class="form-group">
                                        <h3>
                                            <label for="sensitive">過敏源：</label></h3>
                                        <asp:DropDownList ID="ddl_Allergens" runat="server">
                                            <asp:ListItem Selected="True" Value="無資料!!">請選擇一種</asp:ListItem>
                                            <asp:ListItem class="icon-checkmark" Value="yes">有過敏源</asp:ListItem>
                                            <asp:ListItem class="icon-x" Value="no">無過敏源</asp:ListItem>
                                        </asp:DropDownList>

                                    
                                    </div>
                                </div>

                                <div class="col-md-12 ">
                                    <div class="form-group">
                                        <h3>
                                            <label for="birthday">寵物生日：</label></h3>
                                        <asp:TextBox Style="margin-top: 40px" CssClass="form-control" ID="birthdayy" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                            ErrorMessage="生日為必填項目!!" ControlToValidate="birthdayy" Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 text-center">
                                <h3>
                                    <label for="birthday">毛小孩的性別：</label></h3>
                                <asp:DropDownList ID="ddl_Sex" AutoPostBack="True" runat="server">
                                    <asp:ListItem Selected="True" Value="無資料!!">請選擇一種寵物性別 </asp:ListItem>
                                    <asp:ListItem class="icon-user" Value="男">男生</asp:ListItem>
                                    <asp:ListItem class="icon-user2" Value="女">女生</asp:ListItem>
                                </asp:DropDownList>


                                <div class="col-md-12" style="margin-top: 0px;">
                                    <div class="form-group">
                                        <h3>
                                            <label for="weight">體況：</label></h3>
                                        <asp:DropDownList ID="ddl_Weight" AutoPostBack="True" runat="server">
                                            <asp:ListItem Selected="True" Value="無資料!!">請選擇一種體況</asp:ListItem>
                                            <asp:ListItem class="icon-smile" Value="過瘦">過瘦</asp:ListItem>
                                            <asp:ListItem class="icon-happy" Value="瘦">瘦</asp:ListItem>
                                            <asp:ListItem class="icon-grin" Value="適中">適中</asp:ListItem>
                                            <asp:ListItem class="icon-happy" Value="過重">過重</asp:ListItem>
                                            <asp:ListItem class="icon-smile" Value="肥胖">肥胖</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-12 " style="">
                                    <div class="form-group">
                                        <h3>
                                            <label for="subspecies">毛小孩品種：</label></h3>
                                        <asp:TextBox type="text" Style="margin-top: 40px" CssClass="form-control" ID="subspicies" runat="server"></asp:TextBox>
                                        <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                            ErrorMessage="必須輸入寵物品種!!" ControlToValidate="petname" Display="Dynamic" ForeColor="#FF3300"></asp:RequiredFieldValidator>-->
                                    </div>
                                </div>

                                <div class="col-md-12" style="">
                                    <div class="form-group">
                                        <h3>
                                            <label style="margin-top: 10px;" for="haircolor">毛色：</label></h3>
                                        <asp:DropDownList ID="ddl_HairColor" AutoPostBack="True" runat="server">
                                            <asp:ListItem Selected="True" Value="無資料!!">請選擇一種毛色</asp:ListItem>
                                            <asp:ListItem Value="白色">白色</asp:ListItem>
                                            <asp:ListItem Value="黑色">黑色</asp:ListItem>
                                            <asp:ListItem Value="棕色">棕色</asp:ListItem>
                                            <asp:ListItem Value="紅色">紅色</asp:ListItem>
                                            <asp:ListItem Value="黃色">黃色</asp:ListItem>
                                            <asp:ListItem Value="金色">金色</asp:ListItem>
                                            <asp:ListItem Value="灰色">灰色</asp:ListItem>
                                            <asp:ListItem Value="藍色">藍色</asp:ListItem>
                                            <asp:ListItem Value="深褐色">深褐色</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-12 ">
                                    <div class="form-group">
                                        <h3>
                                            <label for="style">毛型：</label></h3>
                                        <asp:DropDownList ID="ddl_HairStyle" AutoPostBack="True" runat="server">
                                            <asp:ListItem Selected="True" Value="無資料!!">請選擇一種毛型 </asp:ListItem>
                                            <asp:ListItem Value="單色">單色</asp:ListItem>
                                            <asp:ListItem Value="雙色">雙色</asp:ListItem>
                                            <asp:ListItem Value="三色">三色</asp:ListItem>
                                            <asp:ListItem Value="斑紋">斑紋</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-12 " style="">
                                    <div class="form-group">
                                        <h3>
                                            <label>毛小孩體重：</label></h3>
                                        <asp:TextBox type="text" Style="margin-top: 40px" CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>
                                    </div>
                                </div>


                                <div class="col-md-12 ">
                                    <div id="div2">
                                        <h3>
                                            <label for="sensitive">過敏源種類：</label></h3>
                                        <asp:TextBox type="text" CssClass="form-control" Style="margin-top: 40px" ID="TextBox1" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-2"></div>
                        </div>

                        <div class="col-md-12 text-center" style="margin-left: 355px; margin-top: 20px; margin-bottom: 20px;">
                            <div id="div1">
                                <div class="col-md-6 ">
                                    <h3>
                                        <label style="margin-left: 50px;" for="birthday">請您點選寵物的過敏源：</label></h3>
                                    <div class="col-md-12 ">
                                        <div class="row" style="height: 125px; margin-top: 15px; text-align: center">
                                            <div class="col-md-2  col-md-15" id="card_1" onclick="updateRecord(card_1)">
                                                <div class="col-md-3 front">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>羊肉</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 back">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #E64A19; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>羊肉</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-md-15" id="card_2" onclick="updateRecord(card_2)">
                                                <div class="col-md-3 front">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>雞肉</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #AFB42B; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>雞肉</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-md-15" id="card_3" onclick="updateRecord(card_3)">
                                                <div class="front col-md-3">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鮭魚</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #0097A7; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鮭魚</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-md-15" id="card_4" onclick="updateRecord(card_4)">
                                                <div class="front col-md-3">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鱉肉</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #512DA8; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鱉肉</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-md-15" id="card_5" onclick="updateRecord(card_5)">
                                                <div class="front col-md-3">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鹿肉</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #455A64; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鹿肉</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="height: 125px; margin-top: 15px; text-align: center;">
                                            <div class="col-md-2 col-md-15" id="card_6" onclick="updateRecord(card_6)">
                                                <div class="col-md-3 front">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鴨肉</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 back">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #F57C00; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鴨肉</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-md-15" id="card_7" onclick="updateRecord(card_7)">
                                                <div class="col-md-3 front">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>牛肉</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #689F38; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>牛肉</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-md-15" id="card_8" onclick="updateRecord(card_8)">
                                                <div class="front col-md-3">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>豬肉</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #0288D1; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>豬肉</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-md-15" id="card_9" onclick="updateRecord(card_9)">
                                                <div class="front col-md-3">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>火雞肉</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #7B1FA2; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>火雞肉</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-md-15" id="card_10" onclick="updateRecord(card_10)">
                                                <div class="front col-md-3">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鵪鶉肉</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #616161; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鵪鶉肉</strong></h2>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row" style="height: 125px; margin-top: 15px; text-align: center;">

                                            <div class="col-md-2 col-md-15" id="card_11" onclick="updateRecord(card_11)">
                                                <div class="col-md-3 front">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>干貝</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 back">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #FFA000; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>干貝</strong></h2>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-2 col-md-15" id="card_12" onclick="updateRecord(card_12)">
                                                <div class="col-md-3 front">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鮪魚</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #388E3C; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鮪魚</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-md-15" id="card_13" onclick="updateRecord(card_13)">
                                                <div class="front col-md-3">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>沙丁</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #1976D2; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>沙丁</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-md-15" id="card_14" onclick="updateRecord(card_14)">
                                                <div class="front col-md-3">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鱈魚</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #C2185B; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>鱈魚</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-md-15" id="card_15" onclick="updateRecord(card_15)">
                                                <div class="front col-md-3">
                                                    <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>雞蛋</strong></h2>
                                                    </div>
                                                </div>
                                                <div class="back col-md-3">
                                                    <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #5D4037; color: rgba(255, 255, 255,1);">
                                                        <p style="margin-top: 35px;"></p>
                                                        <h2><strong>雞蛋</strong></h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row " style="margin-bottom: 100px; margin-top: 30px;">
                            <div class="col-md-6 text-right" style="">
                                <asp:Button CssClass="btn btn-primary btn-lg" ID="Buttonfinish" OnClick="Buttonfinish_Click" onclientclick="return confirm('確定要修改嗎?')" runat="server" Text="確認修改" Style="margin-top: 15px; height: 50px;" />
                            </div>
                            <div class="col-md-6" style="">
                                <asp:Button CssClass="btn btn-primary btn-lg" ID="Button1" OnClick="Buttonback_Click"  runat="server" Text="取消修改" Style="margin-top: 15px; height: 50px;" />
                            </div>
                        </div>
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
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="https://github.com/"><i class="fa fa-github"></i></a>
                        </li>
                        <li><a href="https://www.facebook.com/RealNatureDogFood/"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="http://www.realnature.com.tw/aboutus.html"><i class="fa fa-google"></i></a>
                        </li>
                    </ul>
                </div>
                
                 <div class="col-md-4">
                    <span class="copyright"><a href="http://mis.npust.edu.tw/bin/home.php" style="text-decoration:none;color:#fed136" >Copyright &copy; 屏東科技大學 資訊管理系</a></span><br/>
                    
                </div>
            </div>
       </div>
    </footer>  
         
 </div>
  

       

    </form>
</body>

</html>

