<%@ Page Language="C#" AutoEventWireup="true" CodeFile="picturetest.aspx.cs" Inherits="webs_mypet_picturetest" %>

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
    <script src="http://slideshow.triptracker.net/slide.js" type="text/javascript"></script>
    <style type="text/css">
        .saucer:hover { background-color: Silver; }
    </style>
    <title></title>
</head>

<body>
    <form id="form1" runat="server" style="padding: 10px">
        <nav class="navbar navbar-inverse">

            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only">切換導航</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="#">寵物廚房</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="txt.aspx">網站介紹</a></li>
                        <li><a href="info/shoppinginfo.aspx">購物須知</a></li>
                        <li><a href="purchase.aspx">產品介紹</a></li>
                        <li><a href="info/contact">聯繫我們</a></li>
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
            <asp:Button CssClass="btn btn-default disabled btn-block w3-hover-shadow" ID="Button1" runat="server" Text="動態訊息" />
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button2" runat="server" Text="寵物管理" />
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button3" runat="server" Text="訂購飼料" />
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button4" runat="server" Text="飼料配方" />
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button5" runat="server" Text="社群論壇" />
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button6" runat="server" Text="會員設定" />
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button7" runat="server" Text="登出" />

        </div>
        <br />
        <div class="col-md-9 w3-card-12">
            <div class="col-md-3">
                <asp:FileUpload ID="FileUpload1" runat="server" Text="上傳寵物圖片" />
            </div>
            <div class="col-md-9">
                <asp:Button CssClass="btn btn-primary " ID="Buttoncheck" OnClick="Buttoncheck_Click" runat="server" Text="上傳圖片" Style="height: 35px" />
                 <asp:Button CssClass="btn btn-danger " ID="btnDelete" OnClick="btnDelete_Click" runat="server" Text="刪除" Style="height: 35px" />
            </div>
            <div class="col-md-12">
                <asp:Label ID="Label1" runat="server" Text="上傳圖片狀態" Style="color: red;"></asp:Label>
            </div>
            <div class="col-md-12">
                <asp:Repeater ID="rptrUserPhotos" runat="server">
                    <ItemTemplate>
                        <span class="saucer" style="float: left; padding: 15px;">
                            <asp:ImageButton OnCommand="imgUserPhoto_Command" CommandArgument="<%# Container.DataItem %>" ImageUrl="<%# Container.DataItem %>" ID="imgUserPhoto" style="width: 100px; height: 100px;" runat="server" alt="" />
                            <asp:CheckBox special="<%# Container.DataItem %>" ID="cbDelete" Text="Delete" runat="server" />
                        </span>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>

</html>
