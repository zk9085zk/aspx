<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backmanagerinsert.aspx.cs" Inherits="webs_backmanagerinsert" %>

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
        
       <nav class="w3-sidenav w3-collapse w3-card-2 w3-animate-left" style="width: 18%;background-color: #00796B" id="mySidenav">

            <a href="javascript:void(0)" onclick="w3_close()"
                class="w3-closenav w3-large w3-hide-large">收起 &times;</a>
           
           
            <a href="#" style="color: white;margin-top:70px">
                <h3></h3>
            </a>
           <div style="margin-bottom:20px;text-align:center">
           <asp:Image ID="Image1" runat="server" ImageUrl="~/img/head.png" CssClass="img"/><br /><br />
             <asp:Label ID="Label1" runat="server" Text="管理員大大" CssClass="lab1"></asp:Label>   
           </div>
           <a href="#" style="color: white; background-color: #006064">
            <h4><i style="padding-right: 10px" class="fa fa-shopping-basket" aria-hidden="true"></i>公告管理</h4>
            </a>
           <a href="/webs/manager/backmanagerbillboard.aspx" style="color: white;">公告修改</a>
            <a href="/webs/manager/backmanageraddbillboard.aspx" style="color: white;">公告新增</a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-user" aria-hidden="true"></i>訂單功能</h4>
            </a>
            <a href="/webs/manager/backmanagerorder.aspx" style="color: white;">查詢訂單</a>

            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-paw" aria-hidden="true"></i>商品資訊</h4>
            </a>
            <a href="/webs/manager/backmanagercommodity.aspx" style="color: white;">商品修改</a>
            
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-cutlery" aria-hidden="true"></i>會員查詢</h4>
            </a>
            <a href="/webs/manager/backmanagersearchbuy.aspx" style="color: white;">查詢會員購買紀錄</a>
            <a href="/webs/manager/backmanagersearchcustomer.aspx" style="color: white;">查詢會員自定義資料</a>
            <a href="/webs/manager/backmanagersearchpet.aspx" style="color: white;">查詢會員寵物資料</a>
            <a href="#" style="color: white; background-color: #006064">
                <h4><i style="padding-right: 10px" class="fa fa-shopping-basket" aria-hidden="true"></i>會員管理</h4>
            </a>
            <a href="/webs/manager/backmanageraddmember.aspx" style="color: white;">新增會員資料</a>
            <a href="/webs/manager/backmanagerupdatemember.aspx" style="color: white;">修改會員資料</a>
            <a href="/webs/manager/backmanagerdeletemember.aspx" style="color: white;">刪除會員資料</a>
            <a href="/webs/manager/backmanagerstatistics.aspx" style="color: white;">會員登入狀況</a>
           
               <a href="#" style="color: white; background-color: #006064">
            <h4><i style="padding-right: 10px" class="fa fa-pencil-square-o" aria-hidden="true"></i>留言管理</h4>
            </a>
            <a href="/webs/manager/content.aspx" style="color: white;">留言修改</a>  

           <a href="#" style="color: white; background-color: #006064">
            <h4><i style="padding-right: 10px" class="fa fa-bar-chart" aria-hidden="true"></i>數據分析</h4>
            </a>
             <a href="/webs/manager/analysis.aspx" style="color: white;">分析</a>  

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
                <h1>新增商品頁面</h1>
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


