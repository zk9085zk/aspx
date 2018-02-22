﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanageritem.aspx.cs" Inherits="webs_backmanagerinsert" %>

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

            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only"><font><font>切換導航<font/><font/></span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
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
            <div class="col-md-2">     
                  <asp:Button Cssclass="btn btn-success btn-lg" ID="Buttoninsert" OnClick="Buttoninsert_Click" runat="server" Text="新增商品" style="height: 50px; margin-bottom: 15px; margin-top: 20px;"/>
            </div>
            <div class="col-md-8 text-center">
                <h1>後端商品管理系統</h1>
            </div>       
            <div class="col-md-2"></div>

            <div class="col-md-12">
                <h3>購物車</h3>
            </div>          

            <div class="row">
                <div class="col-md-3 text-right"> 
                    <asp:Button CssClass="btn btn-danger" ID="Buttondelete"  OnClick="Buttondelete_Click" runat="server" Text="X" style="height: 35px;" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <a href="#" class="thumbnail">
                        <img data-src="holder.js/100%x180" alt="100%x180" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT68zGiI0TNOY1GPWh0w9lPC5X9uYytlG-ZwyDy44IgDkhaW68Odg" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;" />
                        <p>保健食品</p>
                    </a>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 text-center">             
                    <asp:Button CssClass="btn btn-primary" ID="Buttonupdate" OnClick="Buttonupdate_Click" runat="server" Text="修改" Style="height: 35px; margin-bottom: 15px;"/>
                </div>
            </div>

        </div>
    </form>
</body>

</html>
