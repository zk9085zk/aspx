<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fodder.aspx.cs" Inherits="webs_fodder" %>

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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="/js/sidebar.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://cdn.rawgit.com/nnattawat/flip/master/dist/jquery.flip.min.js"></script>

   

      <script>
          $(function () {
            $("#card_0").flip();
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
            
        });
        function updateRecord(div) {
            var s = document.getElementById("TextBox1");
            var id = div.id;
            var ID = id.split('_');

            s.value += ID[1] + ",";
        
        }
    </script>

        <link href="../../css/common.css" rel="stylesheet" />
    <script src="../../js/jquery.dropdown.js"></script>
    <script src="../../js/modernizr.custom.63321.js"></script>



    <script type="text/javascript">
        window.onload = function () {
            var div3 = document.getElementById('div3');
            var div4 = document.getElementById('div4');
            var div5 = document.getElementById('div5');
            div3.style.display = 'none';
            div4.style.display = 'none';
            div5.style.display = 'none';

            $(function () {
                $("#ddl_Allergens").dropdown({
                    onOptionSelect: function (opt) {
                        if (opt.attr("data-value") == "yes") {
                            div4.style.display = '';
                            div5.style.display = 'none';
                        }
                        else {
                            div4.style.display = 'none';
                            div5.style.display = '';
                        }
                    }
                });
            });
           
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

      .icon-test:before {
             content:url(../../icon/menu.png);
              font-family: 'icomoon' !important;
    speak: none;
    font-style: normal;
    font-weight: normal;
    text-transform: none;
    line-height: 1;
    position: absolute;
    font-size: 40px;
    line-height: 40px;
    width: 50px;
    top: 50%;
    left: 15px;
    margin-top: -20px;
    text-align: center;

         }
      .icon-test2:before {
             content:url(../../icon/stop.png);
              font-family: 'icomoon' !important;
    speak: none;
    font-style: normal;
    font-weight: normal;
    text-transform: none;
    line-height: 1;
    position: absolute;
    font-size: 40px;
    line-height: 40px;
    width: 40px;
    top: 50%;
    left: 15px;
    margin-top: -20px;
    text-align: center;

         }
  </style>
    <title>寵物客製化</title>
</head>
<body>
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
                    <asp:Label ID="Label3" runat="server" Text="您尚未登入" CssClass="sider"></asp:Label></h1>
                    <asp:Image ID="Image2" runat="server" CssClass="imgimg"/>
                 

                   
               
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
                <div class="row" >
                     <div class="col-md-12">
                    <table style="text-align:center;table-layout:fixed;font-weight:bold;font-size:25px">
                        <tr>
                            <td style="color:#D3D3D3">
                                選擇寵物
                            </td>
                             <td>
                                配方選擇
                            </td>
                             <td style="color:#D3D3D3">
                                資料填寫
                            </td>
                            <td style="color:#D3D3D3">
                                完成
                            </td>
                        </tr> 
                    </table>
                         </div>
                    <div class="col-md-12">
                         <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-danger" role="progressbar"
                                     aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 50%;">
                                   
                                </div>
                            </div>
                      </div>
                    
                </div>


                <div class="row">
                  
                                              

                       
                            
                                <h1 class="page-header" style="font-family: Microsoft JhengHei">客製化配方</h1>
                    <div class="row">
                          <div class="col-md-12 text-center " style="margin-bottom:30px">
                                    
                                      
                                        <select id="ddl_Allergens">
                                            <option selected="selected" value="無資料!!">請選擇一種</option>
                                            <option class="icon-test2" value="yes">一般需求(單選)</option>
                                            <option class="icon-test"  value="no">特殊需求(複選)</option>
                                        </select>
                                   
                                </div>
                                     <div class="col-md-12 ">
                                    <div id="div3">
                                        <h3>
                                            <label for="sensitive">客製化配方：</label></h3>
                                        <asp:TextBox type="text" CssClass="form-control" Style="margin-top: 40px" ID="TextBox1" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                           </div>
                                 
                               <div id="div4">

                                    <div class="row">
                                        
                                             <div class="panel panel-primary">
                                          <div class="panel-heading">
                                                       <h3 class="panel-title" style="font-size: 28px;font-weight:bold">單選</h3>
                                                   </div>
                           
                                                <div class="panel-body">
                                                      <div style="margin-top:10px;margin-left:10px;font-size:20px">
                                                         
                                     <div class="col-md-6 text-center ">
                                        <div class="col-md-12 ">
                                           
                                
                                            <div class="row" style="height: 125px; margin-top: 15px; text-align: center">
                                                <div class="col-md-3 " id="card_0" title="增加肌肉" onclick="updateRecord(card_0)">
                                                    <div class="col-md-3 front">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>增加</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>體重</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 back">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #E64A19; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>增加</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>體重</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" id="card_1" title="減少體脂形成" onclick="updateRecord(card_1)">
                                                    <div class="col-md-3 front">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>肥胖</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>代謝</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="back col-md-3">
                                                        <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #AFB42B; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>肥胖</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>代謝</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" id="card_2" title="維持血糖穩定" onclick="updateRecord(card_2)">
                                                    <div class="front col-md-3">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>血糖</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>管理</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="back col-md-3">
                                                        <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #0097A7; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>血糖</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>管理</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" id="card_3" title="腎臟病護理" onclick="updateRecord(card_3)">
                                                    <div class="front col-md-3">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>腎臟</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>護理</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="back col-md-3">
                                                        <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #512DA8; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>腎臟</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>護理</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                      <div class="col-md-6 text-center" style="margin-top:50px">
                                        <div id="progressbar1"></div>      
                                      
                                                
                                                <asp:Button ID="Button1" class="w3-btn w3-blue" runat="server" Text="確定" OnClick="Button1_Click" OnClientClick="return confirm('確定要送出嗎?')"/>         
                                         
                                    </div>

                                                      </div>                             
                                                 </div>
                                             </div>
                                        
                                   </div>
                            </div>
                               

                  
                    <div id="div5">

                          <div class="row">
                             
                             
                            <div class="panel panel-primary">
                                       <div class="panel-heading">
                                           <h3 class="panel-title" style="font-size: 28px;font-weight:bold">複選</h3>
                                       </div>
                           
                                    <div class="panel-body">
                                          <div style="margin-top:10px;margin-left:10px;font-size:20px">
                                            
                                    <div class="col-md-6 text-center ">
                                        <div class="col-md-12 ">

                                            <div class="row" style="height: 125px; margin-top: 15px; text-align: center;">
                                                <div class="col-md-3" id="card_4" title="強化心血管保護" onclick="updateRecord(card_4)">
                                                    <div class="col-md-3 front">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>心臟</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>保養</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 back">
                                                        <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #F57C00; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>心臟</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>保養</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" id="card_5" title="減少尿道結石形成" onclick="updateRecord(card_5)">
                                                    <div class="col-md-3 front">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>泌尿道</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>保養</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="back col-md-3">
                                                        <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #689F38; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>泌尿道</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>保養</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" id="card_6" title="強化關節保護" onclick="updateRecord(card_6)">
                                                    <div class="front col-md-3">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>關節</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>保養</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="back col-md-3">
                                                        <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #0288D1; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>關節</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>保養</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" id="card_7" title="減少腎臟負擔" onclick="updateRecord(card_7)">
                                                    <div class="front col-md-3">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>消化</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>護理</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="back col-md-3">
                                                        <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #7B1FA2; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>消化</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>護理</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="height: 125px; margin-top: 15px; text-align: center;">
                                                <div class="col-md-3" id="card_8" title="強化視網膜保護" onclick="updateRecord(card_8)">
                                                    <div class="col-md-3 front">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>視力</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>保健</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 back">
                                                        <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #FFA000; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>視力</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>保健</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" id="card_9" title="加強皮膚修護" onclick="updateRecord(card_9)">
                                                    <div class="col-md-3 front">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>皮膚</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>修護</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="back col-md-3">
                                                        <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #388E3C; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>皮膚</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>修護</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" id="card_10" title="增加毛髮光澤" onclick="updateRecord(card_10)">
                                                    <div class="front col-md-3">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>毛髮</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>亮澤</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="back col-md-3">
                                                        <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #1976D2; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>毛髮</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>亮澤</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" id="card_11" title="減少糞便臭味" onclick="updateRecord(card_11)">
                                                    <div class="front col-md-3">
                                                        <div style="border-style: outset; height: 120px; width: 120px; background-color: #ffffff; color: #757575;">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>環境</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>除臭</strong></h2>
                                                        </div>
                                                    </div>
                                                    <div class="back col-md-3">
                                                        <div id="" style="border-style: outset; height: 120px; width: 120px; background-color: #C2185B; color: rgba(255, 255, 255,1);">
                                                            <p style="margin-top: 10px;"></p>
                                                            <h2><strong>環境</strong></h2>
                                                            <h2 style="margin-top: 5px;"><strong>除臭</strong></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 text-center" style="margin-top:10%">
                                        <div id="progressbar"></div>
                                    
                                               
                                                <asp:Button ID="Button2" class="w3-btn w3-blue" runat="server" Text="確定" OnClick="Button10_Click" OnClientClick="return confirm('確定要送出嗎?')"/>      
                                        
                                    </div>

                                          </div>                             
                                     </div>
                                         
                                    </div>
                              
                          
                                </div>
                                    
                                    
                                
                            </div>
                       </div>
                        <br />
             
                   
                   
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
