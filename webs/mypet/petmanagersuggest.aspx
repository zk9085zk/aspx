<%@ Page Language="C#" AutoEventWireup="true" CodeFile="petmanagersuggest.aspx.cs" Inherits="webs_petmanagersuggest" %>

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
            <asp:Button CssClass="btn btn-default btn-block w3-hover-shadow" ID="Button1" runat="server" Text="動態訊息" />
            <asp:Button CssClass="btn btn-default disabled btn-block w3-hover-shadow" ID="Button2" runat="server" Text="寵物管理" />
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
            <div class="col-md-8 text-center ">
                <h1>您指定的寵物為阿咪：</h1>
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">
                        <h2>推薦保健品</h2>
                    </div>
                    <div class="panel-body text-center">
                        <h3>
                            <p>我們根據阿咪的情況提供了一些建議食品</p>
                        </h3>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>配方名稱</th>
                                <th>營養成分</th>
                                <th>原料</th>
                                <th>比例</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>紐頓nutram - T22無穀系列(火雞肉配方)</td>
                                <td>蛋白 36% 碳水 25%</td>
                                <td>※ 火雞肉為主原料○、含雞肉粉●，雞脂肪、無馬鈴薯◎、無甘薯類</td>
                                <td>20%</td>
                            </tr>
                            <tr>
                                <td>紐崔斯Nutrience - 無穀火雞鮭魚配方</td>
                                <td>蛋白 40% 碳水 23%</td>
                                <td>※ 雞肉為主原料○、含火雞/雞肉粉●、含肝臟</td>
                                <td>40%</td>
                            </tr>
                            <tr>
                                <td>本能(原點)Instinct - 極致鮮肉系列 - 鴨肉配方</td>
                                <td>蛋白 47% 碳水 13.8%</td>
                                <td>※ 鴨肉&雞肉為主原料○、木薯●、蒙脱石</td>
                                <td>20%</td>
                            </tr>
                            <tr>
                                <td>渴望Orijen - 六種魚</td>
                                <td>蛋白 42% 碳水 18.8%</td>
                                <td>※ 魚肉為主原料○、含各式魚肉粉●、鈉</td>
                                <td>20%</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-12" style="margin-bottom: 60px">
            </div>
            <div class="col-md-12 ">
                <div class="col-md-12 w3-card-12" style="margin-bottom: 80px">
                    <div class="col-md-3" style="">
                        <asp:Image ID="Image1" ImageUrl="http://g.udn.com.tw/community/img/PSN_ARTICLE/tl2citycat/f_1966769_1.jpg" CssClass=" img-circle img-responsive" runat="server" Height="250px" Width="300px" />
                    </div>
                    <div class="col-md-9" style="">
                        <div class="col-md-6" style="">
                            <h1><strong>阿咪 </strong></h1>
                            <h3>種類：貓</h3>
                            <h3>品種：波斯貓</h3>
                            <h3>年齡：5歲</h3>
                            <h3>出生年月日：2011年4月15日</h3>
                        </div>
                        <div class="col-md-6" style="margin-top: 60px">
                            <h3>身長：73cm</h3>
                            <h3>體重：23kg</h3>
                            <h3>特殊飲食禁忌：羊肉</h3>
                            <h3>疾病：無</h3>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>

</html>
