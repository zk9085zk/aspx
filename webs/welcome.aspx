<%@ Page Language="C#" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="webs_welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../js/jquery-3.1.1.min.js"></script>
    <!-- w3 card的 CSS -->
    <link href="/css/w3.css" rel="stylesheet" />
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


    <title>柚子私房菜</title>
</head>
<body>
    <script>
        $('.carousel').carousel({
            interval: 2000
        });
    </script>
    <form id="form1" runat="server">
        <div class="w3-row">
            <div class="w3-col m1">
                <p></p>
            </div>
            <div class="w3-col m10 w3-pale-yellow w3-card-12">
                <div class="w3-col m7">
                    <p>斯威</p>
                </div>
                <div class="w3-col m5">
                    <asp:Button CssClass="w3-btn w3-hover-khaki w3-sand" ID="Button1" runat="server" Text="關於UMIX" />
                    <asp:Button CssClass="w3-btn w3-hover-khaki w3-sand" ID="Button2" runat="server" Text="UMIX系列" />
                    <asp:Button CssClass="w3-btn w3-hover-khaki w3-sand" ID="Button3" runat="server" Text="糧身訂購" />
                    <asp:Button CssClass="w3-btn w3-hover-khaki w3-sand" ID="Button4" runat="server" Text="聯絡UMIX" />
                </div>
            </div>
            <div class="w3-col m1">
                <p></p>
            </div>
        </div>
        <div class="w3-row">
            <div class="w3-col m1">
                <p></p>
            </div>
            <div class="w3-col m10">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="../img/pet.jpg" alt="..." />
                            <div class="carousel-caption" style="color: aliceblue">
                                <h3>新威寵物食品</h3>
                                <p>新威寵物食品</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../img/pet.jpg" alt="..." />
                            <div class="carousel-caption" style="color: aliceblue">
                                <h3>狗狗</h3>
                                <p>狗狗狗</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../img/pet.jpg" alt="..." />
                            <div class="carousel-caption" style="color: aliceblue">
                                <h3>還是狗狗</h3>
                                <p>狗狗狗</p>
                            </div>
                        </div>

                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="w3-col m1">
                <p></p>
            </div>
        </div>
        <div class="w3-row" style="padding-top: 20px">
            <div class="w3-col m1">
                <p></p>
            </div>
            <div class="w3-col m10">
                <div class="w3-col m4">
                    <div class="w3-card-4" style="padding: 20px">

                        <header class="w3-container w3-pale-red">
                            <h1>關於UMIX</h1>
                        </header>

                        <div class="w3-container">
                            <p>敘述或圖片</p>
                        </div>

                        <footer class="w3-container w3-pale-red">
                            <h5>看更多</h5>
                        </footer>
                    </div>
                </div>
                <div class="w3-col m4">
                    <div class="w3-card-4" style="padding: 20px">

                        <header class="w3-container w3-pale-red">
                            <h1>UMIX系列</h1>
                        </header>

                        <div class="w3-container">
                            <p>敘述或圖片</p>
                        </div>

                        <footer class="w3-container w3-pale-red">
                            <h5>看更多</h5>
                        </footer>
                    </div>
                </div>
                <div class="w3-col m4">
                    <div class="w3-card-4" style="padding: 20px">

                        <header class="w3-container w3-pale-red">
                            <h1>糧身訂購</h1>
                        </header>

                        <div class="w3-container">
                            <asp:Button CssClass="btn-primary" ID="Button5" runat="server" Text="前往飼料調配系統" OnClick="Button5_Click" />
                            <p></p>
                        </div>

                        <footer class="w3-container w3-pale-red">
                            <h5>看更多</h5>
                        </footer>
                    </div>
                </div>
            </div>
            <div class="w3-col m1">
                <p></p>
            </div>
        </div>
        <div class="w3-row" style="padding-top: 20px">
            <div class="w3-col m1">
                <p></p>
            </div>
            <div class="w3-col m10 w3-pale-red" style="text-align: center">
                <p style="color: white">陳采琴</p>
                <p style="color: white">屏東縣長治鄉神農路8號(農業生物科技園區)</p>
                <p style="color: white">TEL：08-7622298 FAX：08-7623238</p>
                <p style="color: white">www.rfbiotech.com.tw</p>
            </div>
            <div class="w3-col m1">
                <p></p>
            </div>
        </div>
    </form>
</body>
</html>
