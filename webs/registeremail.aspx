<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="webs_upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

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
    <script src="http://code.jquery.com/jquery-1.7.js"></script>
    <script src="/jquery-ui-1.12.0.custom/jquery-ui.js"></script>
    <link href="/jquery-ui-1.12.0.custom/jquery-ui.theme.css" rel="stylesheet" />
    <link href="/jquery-ui-1.12.0.custom/jquery-ui.structure.min.css" rel="stylesheet" />
    <link href="../../css/five-column.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
   
         <div class="col-md-6 text-center" style="margin-top: 30px">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <fieldset>
                                    </fieldset>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                      
                        <div class="col-md-7 text-center" style="text-align: center; margin-top: 10px">
                            <asp:FileUpload ID="FileUpload1" runat="server" Text="上傳寵物圖片" Style="" />
                        </div>
                        <div class="col-md-12 text-center" style="margin-top: 10px">
                            <asp:Label ID="Label1" Style="color: red;" runat="server" Text="上傳圖片狀態"></asp:Label>
                        </div>
                        <div class="col-md-12 text-center" style="text-align: center; margin-top: 10px">
                            <asp:Button CssClass="btn btn-success " ID="Buttoncheck" OnClick="Buttoncheck_Click" runat="server" Text="確認上傳" Style="height: 35px" />
                        </div>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        
   
    </div>
    
    </form>
</body>
</html>
