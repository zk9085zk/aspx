<%@ Page Language="C#" AutoEventWireup="true" CodeFile="re_member.aspx.cs" Inherits="webs_re_member" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- 最新編譯和最佳化的 CSS -->
    <link href="/css/bootstrap-theme.min.css" rel="stylesheet" />
    <!-- w3 card的 CSS -->
    <link href="/css/w3.css" rel="stylesheet" />
    <!-- 選擇性佈景主題 -->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- 最新編譯和最佳化的 JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

    <title></title>
</head>

<body>
    <form id="form1" runat="server" style="padding: 10px">
        <nav class="navbar navbar-inverse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>登錄</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span>註冊</a></li>
            </ul>
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only"><font><font>切換導航</font></font></span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="#">寵物廚房</a>

                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="/webs/info/contact.aspx">網站介紹</a></li>
                        <li><a href="/webs/info/shoppinginfo.aspx">購物須知</a></li>
                        <li><a href="/webs/purchase/purchase.aspx">產品介紹</a></li>
                        <li><a href="#contact">聯繫我們</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="col-md-3 w3-card-12" style="padding: 5px">
            <div class="col-md-12 text-center">
                <img data-src="holder.js/140x140" class="img-circle" alt="140x140" src="https://lh4.googleusercontent.com/-lFeuiwoH4CA/AAAAAAAAAAI/AAAAAAABHxk/rKL0GJjeMvc/photo.jpg" data-holder-rendered="true" style="width: 140px; height: 140px;" />
                <div class="w3-container w3-center">
                    <p>小明</p>
                </div>
            </div>
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button1" runat="server" Text="動態訊息" />
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button2"  runat="server" Text="寵物管理" />
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button3"  runat="server" Text="訂購飼料" />
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button4"  runat="server" Text="飼料配方" />
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button5"  runat="server" Text="社群論壇" />
            <asp:Button CssClass="btn btn-default disabled btn-block w3-hover-shadow" ID="Button6"  runat="server" Text="會員設定" />
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button7"  runat="server" Text="登出" />

        </div>
        <br />
        <div class="col-md-9 w3-card-12">
            </br>
            <div class="w3-row-padding">
                <div class="w3-third ">
                    <asp:ImageButton ID="ImageButton1" src="http://www.neoimaging.cn/png2/ni_png_2_0992.png" class="w3-circle" runat="server" />
                </div>
                <div class="w3-third ">
                    </br></br>
                    <label class="w3-text-black"><b>姓名：</b></label>
                    <input class="w3-input w3-border" placeholder="王大花" type="text">
                    </br></br>
                    <label class="w3-text-black"><b>手機：</b></label>
                    <input class="w3-input w3-border" placeholder="0912345678" type="text">
                </div>

                <div class="w3-third">
                </div>



            </div>

            <p>
                <label class="w3-text-black"><b>信箱：</b></label>
                <input class="w3-input w3-border" placeholder="a0123456789@yahoo.com.tw" type="text">

                <p>

                    <label class="w3-text-black"><b>住址：</b></label>
                    <input class="w3-input w3-border" placeholder="屏東縣內埔鄉壽比路255巷Y棟385" type="text">

                    <p>

                        <label class="w3-text-black"><b>家寵：</b></label>
                        <input class="w3-input w3-border" placeholder="拉布拉多、美洲豹" type="text">

                        </br></br>
                        <div class="w3-center">
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
                            <asp:Button ID="Button8" runat="server" Text="確認" class="button button4 w3-green" style="background-color: #4CAF50" Height="50px" />
                            <asp:Button ID="Button9" runat="server" Text="取消" class="button button4 w3-pink" style="background-color: FA8072" Height="50px"/>

                            <p>
                        </div>
        </div>


    </form>
</body>

</html>


