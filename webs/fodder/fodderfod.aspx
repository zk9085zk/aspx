<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fodderfod.aspx.cs" Inherits="webs_fodder_fodderfod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- 圖示CSS -->

    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
    <!-- 最新編譯和最佳化的 CSS -->
    <link href="/css/bootstrap-theme.min.css" rel="stylesheet" />
    <!-- w3 card的 CSS -->
    <link href="/css/w3.css" rel="stylesheet" />
    <!-- 選擇性佈景主題 -->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- 最新編譯和最佳化的 JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function getValue() {
             '<% Session.Add("user", "1"); %>';
        }
    </script>
    <title>寵物客製化</title>
</head>

<body>
    <form id="form1" runat="server">
       <nav class="w3-sidenav w3-collapse w3-card-2 w3-animate-left" style="width: 18%; background-color: #00796B" id="mySidenav">
            <a href="javascript:void(0)" onclick="w3_close()"
                class="w3-closenav w3-large w3-hide-large">收起 &times;</a>
            <a href="#" style="color: white;">
                <h1>柚子私房菜</h1>
            </a>
            <a href="#" style="color: white;">
                <h1>歡迎您，小剛</h1>
            </a>
            <asp:Image ID="Image2" runat="server" Height="40px" Width="40px" ImageUrl="https://scontent-tpe1-1.xx.fbcdn.net/v/t1.0-9/13177259_1106987156026514_5456761746775041918_n.jpg?oh=bdfc1f82ed5e3c2cf36b26fb9fc2a16d&oe=582113BE" />
            <a href="#" style="color: white; background-color: #00695C">
                <h3>小剛</h3>
            </a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-user" aria-hidden="true"></i>會員中心</h4>
            </a>
            <a href="/webs/member/member.aspx" style="color: white;">我的基本資料</a>
            <a href="/webs/member/memberbuy.aspx" style="color: white;">我的購物紀錄</a>

            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-paw" aria-hidden="true"></i>寵物管理</h4>
            </a>
            <a href="/webs/mypet/petmanager.aspx" style="color: white;">我的毛小孩</a>
            <a href="/webs/mypet/petmanagerinsert.aspx" style="color: white;">註冊毛小孩</a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-cutlery" aria-hidden="true"></i>寵物菜單</h4>
            </a>
            <a href="/webs/fodder/foddermenu.aspx" style="color: white;">食材介紹</a>
            <a href="/webs/fodder/fodder.aspx" style="color: white;">訂製我的菜</a>
            <a href="/webs/fodder/foddernext.aspx" style="color: white;">歷史菜單</a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-shopping-basket" aria-hidden="true"></i>商品選購</h4>
            </a>
            <a href="/webs/purchase/orderform.aspx" style="color: white;">我的購物車</a>
             <a href="/webs/commodity.aspx" style="color: white;">寵物保健品</a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-phone" aria-hidden="true"></i>客服中心</h4>
            </a>
            <a href="/webs/info/contact.aspx" style="color: white;">聯絡我們</a>
            <a href="/webs/info/shoppinginfo.aspx" style="color: white;">購物須知</a>
        </nav>

        <div class="w3-main" style="margin-left: 18%;">
            <ul class="w3-navbar w3-border w3-xlarge col-md-12 navbar-fixed-top " style="background-color: #006064; position: fixed">
                <li class="col-md-2">
                    <a style="color: white; text-align: center; background-color: #004D40">
                        <h1>柚子私房菜</h1>
                    </a>
                </li>
                <li class="col-md-9">
                    <a style="color: white; text-align: center; background-color: #004D40">
                        <h1>菜單設計
                        </h1>
                    </a>
                </li>
                <li class="col-md-1 w3-black">
                    <a style="color: white; text-align: center" href="#">
                        <h1>登出</h1>
                    </a>
                </li>
            </ul>

            <div class="w3-container w3-card-12" style="padding-top: 100px">
                <div class="col-md-12">
                    <div class="col-md-12" style="padding: 10px">
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">修改專屬私房菜配方</h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-2 "></div>
                            <div class="col-md-8 w3-card-12">
                                <div class="col-md-6 ">
                                    
                                    
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                          
                        </ContentTemplate>
                    </asp:UpdatePanel>
                                   
                                   
                                    <a href="#" class="thumbnail">
                                        <asp:Image ID="Image1" CssClass="img-circle" runat="server" Height="200" Width="200" />
                                    </a>

                                </div>
                                <div class="col-md-6 ">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th colspan="2" class="text-center">營養標示</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>熱量</td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>


                                            </tr>
                                            <tr>
                                                <td>蛋白質</td>

                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>脂肪</td>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>


                                            </tr>
                                            <tr>
                                                <td>碳水化合</td>
                                                <td>
                                                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-2 "></div>

                        </div>
                        <br />


                        <div class="col-md-12 w3-card-12">
                            <br />


                            <div class="col-md-12 ">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">菜單資訊</h3>
                                    </div>
                                </div>
                                <table class="table table-hover">

                                    <tbody>

                                        <tr>
                                            <td>上傳</td>
                                            <td colspan="4">
                                                <asp:FileUpload ID="FileUpload1" runat="server" /><asp:Label ID="Label1" runat="server" Text=" "></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>私房菜命名標籤</td>
                                            <td colspan="2">
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>特殊配方</td>
                                            <td colspan="3">
                                                <div class="panel-body">
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="增重" />
                                                    <asp:CheckBox ID="CheckBox2" runat="server" Text="血糖控制" />
                                                    <asp:CheckBox ID="CheckBox3" runat="server" Text="腸胃敏感" />
                                                    <asp:CheckBox ID="CheckBox4" runat="server" Text="心臟保養" />
                                                    <asp:CheckBox ID="CheckBox5" runat="server" Text="食物敏感" />
                                                    <asp:CheckBox ID="CheckBox6" runat="server" Text="泌尿道保養" />
                                                    <asp:CheckBox ID="CheckBox7" runat="server" Text="關節保健" />
                                                    <asp:CheckBox ID="CheckBox8" runat="server" Text="腎臟保養" />
                                                    <asp:CheckBox ID="CheckBox9" runat="server" Text="減肥" />
                                                    <asp:CheckBox ID="CheckBox10" runat="server" Text="視力保健" />
                                                    <asp:CheckBox ID="CheckBox11" runat="server" Text="皮膚修護" />
                                                    <asp:CheckBox ID="CheckBox12" runat="server" Text="毛髮亮澤" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>價錢</td>
                                            <td colspan="2">
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center" colspan="4">
                                                <asp:Button ID="Button8" runat="server" Text="修改" OnClick="Button8_Click" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <footer class="w3-container w3-teal">
                <h5>為毛小孩選購菜單設計</h5>
                <p>可以為自己毛小孩客製化適合自己的菜單。</p>
            </footer>

        </div>






    </form>
</body>
</html>
