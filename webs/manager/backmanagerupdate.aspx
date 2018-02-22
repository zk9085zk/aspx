<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanagerupdate.aspx.cs" Inherits="webs_backmanagerupdate" %>

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
    <script src="/ckeditor/ckeditor.js"></script>
    <title></title>
</head>

<body>
    <form id="form1" runat="server" style="padding: 10px">
        <nav class="navbar navbar-inverse">

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
                <asp:Button Cssclass="btn btn-danger btn-lg" ID="Buttonback" OnClick="Buttonback_Click" runat="server" Text="回上一頁" style="height: 50px; margin-top: 20px; margin-bottom: 15px;"/>
            </div>
            <div class="col-md-8 text-center">
                <h1>修改商品頁面</h1>
            </div>
            <div class="col-md-2"></div>

            <div class="col-md-12 text-center">
                <img src="http://ww.daliulian.net/imgs/image/59/5999652.jpg" class="" alt="Responsive image" style="width: 300px; height: 250px;" />
            </div>
            <div class="col-md-12 text-center">
                <button type="button" style="height: 50px; margin-top: 20px; margin-bottom: 15px;" class="btn btn-default btn-lg">上傳圖片</button>
            </div>

            <div class="row">
                <div class="col-md-2"></div>

                <div class="col-md-8 text-center">
                    <div class="col-md-6">
                        <div class="form-group">
                            <h3>
                                <label for="itemname">商品名稱</label></h3>
                            <asp:TextBox type="text" CssClass="form-control" ID="itemname" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <h3>
                                <label for="itemprice">商品價格</label></h3>
                            <asp:TextBox type="number" CssClass="form-control" ID="itemprice" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-12 w3-border">
                        <h3><strong>商品描述</strong></h3>
                        <textarea name="editor1" id="editor1" rows="10" cols="80">
                              This is my textarea to be replaced with CKEditor.
                         </textarea>
                        <script>
                            // Replace the <textarea id="editor1"> with a CKEditor
                            // instance, using default configuration.
                            CKEDITOR.replace('editor1');
                        </script>
                    </div>
                    <div class="col-md-12">
                        <button type="button" style="height: 50px; margin-top: 15px; margin-bottom: 50px;" class="btn btn-primary btn-lg">完成</button>
                    </div>
                </div>

                <div class="col-md-2"></div>
            </div>
        </div>
    </form>
</body>

</html>
