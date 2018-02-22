<%@ Page Language="C#" AutoEventWireup="true" CodeFile="commodity2.aspx.cs" Inherits="webs_commodity2" %>

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
    <link href="/css/agency.min2.css" rel="stylesheet"/>

    <script src="/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="/js/sidebar.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="/js/jquery.elevatezoom.js" type="text/javascript"></script>


    <script type="text/javascript">
        function getValue() {
            '<% Session.Add("fbid", null); %>';
            '<% Session.Add("googleid", null); %>';
            '<% Session.Add("email", null); %>';
        }

       
$(function() {
    $("#Image2").elevateZoom(
/*{
zoomWindowWidth:450, 
zoomWindowHeight: 450
}*/
);
});


    </script>

  <title></title>
    
    <style>
      .d{
            color: white; 
          text-align: center; 
          font-size:40px;
          margin-left:28%;
      }
      .e{
          color:tomato;
          margin-left:40%;
          font-size:25px;
      }
      .g{
          color:cyan;
          margin-left:50%;
          font-size:25px;
      }
      .f{
         background-color: #222; 
         margin-left: 5%;
      }

      @media screen and (max-width: 480px) {


        
            .d{
                color: white; 
                text-align: center; 
                font-size:30px;
                margin-left:15%;
             
                
            }
            .e{
                 color:tomato;
                 font-size:15px;
                 margin-left:10%;

               
            }

            .f{
                background-color: #222;  
                margin-left: 15%;
                padding:10px;
               
            }
      }
        ol, ul {
            list-style: none;
        }

        .cat_warp {
            display: block;
            float: left;
            width: 990px;
            margin-top: 12px;
            margin-left: 10px;
            overflow: hidden;
        }

        .pd_block {
            display: block;
        }

        .pd_subinfo {
            display: block;
            float: left;
            overflow: hidden;
            width: 350px;
            margin-right: 15px;
        }

        .pd_pic_zoom {
            position: relative;
        }

        .zoom {
            margin-top: 80px;
            margin-bottom: 30px;
            position: relative;
            display: block;
            width: 350px;
            height: 350px;
            overflow: hidden;
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
            border: 1px solid #d5d5d5;
        }
        .zoom_photos{
            margin-top: 10px;
            margin-left:20px;
            width: 300px;
            height: 300px;
        }


        .zoom_icon {
            margin-bottom:30px;
            width: 20px;
            height: 20px;
            display: block;
            position: absolute;
            bottom: 8px;
            left: 8px;
        }

        

        .pd_thumb_list {
            overflow: hidden;
            margin-top: 10px;
        }

        .a {
            display: block;
            float: left;
            width: 90px;
            height: 90px;
        }

            .a img {
                width: 84px;
                height: 84px;
                padding: 0px;
                border: 3px solid #E45D2D;
            }

        .pd_maininfo {
            margin-top: 30px;
            display: block;
            float: left;
            width: 470px;
            min-height: 400px;
            margin-right: 10px;
            padding-top: 4px;
        }

        .pd_name {
            padding-bottom: 20px;
            margin-top: 6px;
            font-size: 20px;
            line-height: 24px;
        }

        .b {
            padding-bottom: 10px;
            border-bottom: 1px solid #d5d5d5;
        }

        .pd_point_list_div {
            position: relative;
            margin-bottom: 10px;
            padding: 10px 3px;
            border-bottom: 1px solid #d5d5d5;
        }

        .pd_point_item {
            overflow: hidden;
            font-size: 13px;
            line-height: 22px;
            color: #565656;
            padding-left: 3px;
        }

        .pd_others {
            overflow: hidden;
            margin-top: 10px;
        }

        .pd_oprice {
            display: block;
            float: left;
            margin-left: 10px;
            font-size: 13px;
            line-height: 20px;
            font-style: italic;
            color: #212121;
        }

        .del {
            margin-left: 5px;
            font-size: 16px;
            text-decoration: line-through;
        }

        .pd_tags {
            display: block;
            float: right;
        }

        .pd_buyinfo {
            overflow: hidden;
            margin-top: 10px;
            background-color: #f7f7f7;
        }

        .normal_price {
            display: block;
            overflow: hidden;
            clear: both;
            padding: 15px 10px 10px 12px;
        }

        .netprice {
            display: block;
            float: left;
            min-width: 146px;
            max-width: 200px;
            margin-right: 24px;
            font-size: 13px;
            color: #ff3c00;
            font-style: italic;
        }

        .hlight {
            display: inline-block;
            font-size: 30px;
            color: #ff3c00;
            font-weight: bold;
            margin-top: 5px;
            padding-right: 6px;
        }

            .hlight:before {
                content: "$";
                font-size: 20px;
                margin-right: 2px;
            }

        .pd_option {
            display: inline-block;
            width: 100%;
            padding-top: 10px;
            padding-bottom: 10px;
            background-color: #ededed;
            clear: both;
            line-height: 35px;
        }

        .p_specL {
            margin-right: 40px;
            display: block;
            float: left;
        }

        .opt_label {
            width: 30px;
            font-size: 14px;
            color: #212121;
            margin-left: 12px;
            margin-right: 5px;
            display: inline-block;
        }

        .single_spec {
            width: 150px;
            display: inline-block;
            padding-left: 6px;
            color: #878787;
            font-size: 14px;
            line-height: 22px;
            letter-spacing: 1px;
        }

        .p_specR {
            display: block;
            float: left;
        }

        .pd_option select {
            width: 156px;
        }

        select {
            display: inline-block;
            /* width: 127px; */
            height: 32px;
            background-color: #fff;
            border: 1px solid #a5a5a5;
            line-height: 22px;
            cursor: pointer;
            font-size: 14px;
            outline: none;
            vertical-align: middle;
            padding: 5px 3px;
        }

        .pd_detail {
            margin-top: 530px;
        }

        .pd_block_title {
            display: block;
            height: 40px;
            border-bottom: 4px solid #878787;
            width: 800px;
        }

        .pd_title_tab {
            display: block;
            float: left;
            width: 225px;
            height: 40px;
            line-height: 40px;
            font-size: 18px;
            text-align: center;
            color: #878787;
            font-weight: normal;
            background-color: #ededed;
            border-right: 2px solid #fff;
        }

        .pd_detail_cont {
            margin: 20px 30px 0 30px;
            padding-bottom: 20px;
            color: #212121;
            font-size: 14px;
            line-height: 24px;
        }

        .spec_cont {
            margin-top: 20px;
            margin-left: 30px;
            margin-right: 30px;
        }
        .button_a{
            background-color:#c00053;
            border:1px solid #c00053;
            width:160px;
            height:40px;
            color:white;
            font-size:20px;
        }
        .button_b{
            background-color:#1c6fbc;
            border:1px solid #1c6fbc;
            width:160px;
            height:40px;
            color:white;
            font-size:20px;
            background-image:url(http://www.bbq8.com.tw/archive/image/shoppingSetting/editor/commerce.png);
            background-repeat:no-repeat;
            background-size:30px 30px;
            background-position:15px 3px;
        }
        .sider{
            font-size:28px;
        }
    </style>








</head>

<body >
    <form id="form1" runat="server">

      <div id="wrapper" >
        <div class="overlay"></div>

        <!-- Sidebar -->
   <div class="f">
               
                    <div class="d " >
                         <a href="/webs/home.aspx" style="color:white;text-decoration:none;" >寵物廚房</a>
                         <a class="e" href="/webs/nologinhome.aspx" style="text-decoration:none;">
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
         
                <div class="col-md-12" style="width: 100vw">
                   

                        <div class="cat_warp">
                            <div class="pd_block">
                                <div class="pd_info">
                                    <div class="pd_subinfo">
                                        <div class="pd_pic_zoom">
                                            <div class="zoom">
                                                <div class="zoom_icon">
                                                    <img src="http://shopping.udn.com/mall/images/pc/zoom_icon.png" style="display: inline;" />
                                                </div>    
                                              <!--  <a href="#" data-zoom-image="~/commodity_photos/2.jpg">-->
                                                    <asp:Image ID="Image2" runat="server"  CssClass="zoom_photos"   />        
            
                                               <!--     <img itemprop="image" src="http://www.pet-love.com.tw/images/201403/goods_img/214_P_1395331651239.gif"  />-->
                                             
                                            </div>

                                            <!-- <div class="zoom_window" style="display: none; width: 575px; height: 500px;">
                                                <img src="http://www.pet-love.com.tw/images/201403/goods_img/214_P_1395331651239.gif" alt="【法國皇家Royal Canin】室內小型熟齡犬專用 PRIA+8(1.5公斤)" style="left: -425px; top: -500px;"/>
                                          </div>
                                          <ul class="pd_thumb_list">
                                              <li class="a">
                                                  <a href title="【法國皇家Royal Canin】室內小型熟齡犬專用 PRIA+8(1.5公斤)">
                                                      <img width="90" height="90" src="http://www.pet-love.com.tw/images/201403/goods_img/214_P_1395331651239.gif" alt="【法國皇家Royal Canin】室內小型熟齡犬專用 PRIA+8(1.5公斤)" "/>
                                                  </a>
                                              </li>
                                          </ul>
                                          -->

                                        </div>

                                    </div>
                                    <div class="pd_maininfo" style="margin-left:30px">
                                        <div class="b">
                                            <asp:Label ID="Label3" runat="server" Text="Label" CssClass="pd_name"></asp:Label>

                                        </div>
                                        <div class="pd_point_list_div">
                                            <div class="pd_point_item" itemprop="description" style="height: auto;">
                                                ★<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <p id="see_more" style="display: none;">
                                                <a class="see_more_btn" href="javascript:showDiv()">看更多簡介</a>
                                            </p>
                                            <script>
                                                if ($('.pd_point_list_div').height() > 66) {
                                                    $('#see_more').attr('style', 'display:block;');
                                                    $('.pd_point_item').attr('style', 'height:66px;');
                                                }
                                                function showDiv() {
                                                    $('.pd_point_item').attr('style', 'height:auto;');
                                                    $('#see_more').attr('style', 'display:none;');
                                                }
                                            </script>
                                        </div>
                                        <div class="pd_others">
                                            <p class="pd_oprice">
                                                建議售價
                                                  <span class="del">
                                                      $<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                                  </span>
                                            </p>
                                            <p class="pd_tags">
                                            </p>
                                        </div>
                                        <div class="pd_buyinfo">
                                            <div class="normal_price">
                                                <p class="netprice">
                                                    網路價<br />

                                                    <span class="hlight">
                                                        <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                                                    </span>

                                                </p>
                                            </div>

                                            <div style="clear: both;"></div>

                                            <div class="pd_option">

                                                <div class="p_specL">
                                                    <span class="opt_label">規格</span>
                                                    <p class="single_spec">單一規格</p>
                                                    <input type="hidden" id="dc_specxuid_0_H_006_014_003" name="dc_specxuid_1" value="U008172864" />
                                                </div>
                                                <div class="p_specR">
                                                    <span class="opt_label opt_num_label">數量</span>
                                                    
                                                    <asp:DropDownList ID="DropDownList1" runat="server" >
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                        <asp:ListItem>6</asp:ListItem>
                                                        <asp:ListItem>7</asp:ListItem>
                                                        <asp:ListItem>8</asp:ListItem>
                                                        <asp:ListItem>9</asp:ListItem>
                                                        <asp:ListItem>10</asp:ListItem>
                                                    </asp:DropDownList>
                                                   
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                        <div class="row" style="margin-top:10px">
                                            <div class="col-lg-6" style="text-align:center">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate> 
                                                <asp:Button ID="Button1" runat="server" Text="立即購" OnClick="Button1_Click" CssClass="button_a" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div class="col-lg-6" style="text-align:center">
                                                
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate> 
                                                         <asp:Button ID="Button2" runat="server"  Text="　購物車" OnClick="Button2_Click1"  CssClass="button_b"/>
                                                       
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                             
                                            </div>
                                                </div>
                                    </div>
                                </div>
                            </div>




                            <div class="pd_detail">
                                <div class="container">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a data-toggle="tab" href="#home" style="font-weight: bold; font-family: Microsoft JhengHei; font-size: large">商品介紹</a></li>
                                        <li><a data-toggle="tab" href="#menu1" style="font-weight: bold; font-family: Microsoft JhengHei; font-size: large">商品規格</a></li>
                                        <li><a data-toggle="tab" href="#menu2" style="font-weight: bold; font-family: Microsoft JhengHei; font-size: large">注意事項</a></li>

                                    </ul>

                                    <div class="tab-content">

                                        <div id="home" class="tab-pane fade in active">


                                            <div class="pd_detail_cont">
                                                <strong>
                                                    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                                                </strong>
                                                <br />
                                                <br />
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <table style="width: 708px; border: 0;">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="auto-style5" style="height: 0px">
                                                                            <span style="color: rgb(255, 0, 0); font-size: small;">
                                                                                <strong>推薦於：<asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                                                                                </strong>
                                                                            </span>

                                                                            <hr />
                                                                            <p style="text-align: center;">&nbsp;</p>
                                                                            <p style="text-align: center;">
                                                                                <asp:Image ID="Image3" runat="server" CssClass="zoom_photos" />
                                                                            </p>
                                                                            <p>
                                                                                <span style="color: rgb(0, 0, 255); font-size: medium;">
                                                                                    <strong>產品特色</strong>
                                                                                </span>&nbsp;
                                                                            </p>
                                                                            <div class="details_doublewide">
                                                                                <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label><br />
                                                                                <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label><br />
                                                                                <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label><br />
                                                                                <br />
                                                                                <hr />
                                                                                <p>&nbsp;</p>
                                                                                <p>
                                                                                    <span style="color: rgb(0, 0, 255); font-size: medium;">
                                                                                       <strong>餵食指南 / 小型室內熟齡犬</strong>                                                                                  
                                                                                     </span>
                                                                                </p>
                                                                                <p style="text-align: center;">
                                                                                    <img src="http://www.happypets.com.tw/fishpet/UploadFile/UserFiles/images/6.jpg" />
                                                                                </p>
                                                                            </div>
                                                                            <strong></strong></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </div>
                                        </div>


                                        <div id="menu1" class="tab-pane fade">

                                            <div class="pd_detail_cont">

                                                <div class="spec_cont">
                                                    <strong>
                                                        <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                                                    </strong>
                                                    <br />
                                                  <br/>


                                                    <table align="center" style="width: 700px">
                                                        <tr>
                                                            <td>
                                                                <p>
                                                                   
                                                                        <span style="color: rgb(0, 0, 255);font-size: medium;">
                                                                         <strong>成份</strong>
                                                                        </span>                              
                                                                      <p>       
                                                                        <span>
                                                                            <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
                                                                        </span>
 
                                                                </p>

                                                                <p>&nbsp;</p>
                                                                <p>
                                                                    <span style="color: rgb(0, 0, 255);font-size: medium;">      
                                                                                <strong>成分分析</strong>
                                                                    </span>
                                                                </p>
                                                                <table border="1">
                                                                    <tr class="TableHeader">
                                                                        <th style="text-align: center; height: 45px; width: 45px; background-color: #0066cc">
                                                                            <span style="color: rgb(255, 255, 255);">營養素</span></th>
                                                                        <th style="text-align: center; height: 45px; width: 45px; background-color: #0066cc">
                                                                            <span style="color: rgb(255, 255, 255);">%</span></th>
                                                                    </tr>
                                                                    <tr class="TableRow1">
                                                                        <td style="text-align: center;">蛋白質</td>
                                                                        <td style="text-align: center;">3.0</td>
                                                                    </tr>
                                                                    <tr class="TableRow2">
                                                                        <td style="text-align: center;">脂肪</td>
                                                                        <td style="text-align: center;">4.0</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: center;">灰份</td>
                                                                        <td style="text-align: center;">5.9</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: center;">纖維</td>
                                                                        <td style="text-align: center;">1.8</td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </div>
                                            </div>

                                        </div>
                                        <div id="menu2" class="tab-pane fade">

                                            <div class="pd_detail_cont">
                                                <div class="spec_cont">
                                                    <p>
                                                        製造地:<asp:Label ID="Label19" runat="server" Text="Label"></asp:Label><br />
                                                        內容物:<asp:Label ID="Label20" runat="server" Text="Label"></asp:Label>
                                                    </p>
                                                    <p style="color: red">
                                                        <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label><br />
                                                        <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>
                                                    </p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    

                </div>
           
</div>
            

        </div>
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


