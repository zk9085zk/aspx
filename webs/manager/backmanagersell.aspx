<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanagersell.aspx.cs" Inherits="webs_backmanagersell" %>

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

        <div class="col-md-9 w3-card-12">
            <div class="col-md-12 text-center">
                <h1>後端即時訂單管理系統</h1>
            </div>
            <div class="col-md-12">
                <div class="col-md-4"></div>
                <div class="col-md-4 text-center">
                    <div class="form-group">
                        <h3>
                            <label for="petbirth">會員編號搜尋</label></h3>
                        <asp:TextBox type="number" CssClass="form-control" ID="petbirth" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <button type="button" style="margin-top: 50px; height: 50px;" class="btn btn-default btn-lg">搜尋</button></div>
            </div>

            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">
                        <h2>會員資料</h2>
                    </div>
                    <div class="panel-body ">
                        <h4>依資料排序：</h4>
                        <button type="button" style="margin-top: 15px; height: 50px;" class="btn btn-danger btn-lg">會員編號</button>
                        <button type="button" style="margin-top: 15px; margin-left: 30px; height: 50px;" class="btn btn-danger btn-lg">訂單金額</button>
                        <button type="button" style="margin-top: 15px; margin-left: 30px; height: 50px;" class="btn btn-danger btn-lg">訂單編號</button>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>會員編號</th>
                                <th>會員名稱</th>
                                <th>訂單編號</th>
                                <th>訂單內容</th>
                                <th>訂單金額</th>
                                <th>訂單檢視</th>
                                <th>訂單核銷</th>
                                <th>訂單刪除</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>014601</td>
                                <td>宏振綱</td>
                                <td>025301</td>
                                <td>紐崔斯Nutrience - 無穀火雞鮭魚配方</td>
                                <td>500</td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">檢視</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">核銷</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">刪除</button></div>
                                </td>
                            </tr>
                            <tr>
                                <td>014602</td>
                                <td>邱泓泉</td>
                                <td>025302</td>
                                <td>紐崔斯Nutrience - 無穀火雞鮭魚配方</td>
                                <td>700</td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">檢視</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">核銷</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">刪除</button></div>
                                </td>
                            </tr>
                            <tr>
                                <td>014603</td>
                                <td>呂國好</td>
                                <td>025303</td>
                                <td>本能(原點)Instinct - 極致鮮肉系列 - 鴨肉配方</td>
                                <td>600</td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">檢視</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">核銷</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">刪除</button></div>
                                </td>
                            </tr>
                            <tr>
                                <td>014604</td>
                                <td>張宇君</td>
                                <td>025304</td>
                                <td>渴望Orijen - 六種魚</td>
                                <td>800</td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">檢視</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">核銷</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">刪除</button></div>
                                </td>
                            </tr>
                            <tr>
                                <td>014605</td>
                                <td>張竹君</td>
                                <td>025305</td>
                                <td>紐崔斯Nutrience - 無穀火雞鮭魚配方</td>
                                <td>500</td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">檢視</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">核銷</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">刪除</button></div>
                                </td>
                            </tr>
                            <tr>
                                <td>014606</td>
                                <td>游博祥</td>
                                <td>025306</td>
                                <td>本能(原點)Instinct - 極致鮮肉系列 - 鴨肉配方</td>
                                <td>600</td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">檢視</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">核銷</button></div>
                                </td>
                                <td>
                                    <div class="col-md-4">
                                        <button type="button" style="height: 30px;" class="btn btn-default">刪除</button></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
