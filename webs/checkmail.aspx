<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkmail.aspx.cs" Inherits="webs_checkmail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" style="font-size:40px" Text="恭喜認證成功"></asp:Label></br></br>
        <asp:Button ID="Button1" runat="server" Text="前往首頁" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
