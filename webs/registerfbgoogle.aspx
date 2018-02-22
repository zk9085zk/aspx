<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registerfbgoogle.aspx.cs" Inherits="webs_registerfbgoogle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- 最新編譯和最佳化的 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

    <!-- 選擇性佈景主題 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

    <!-- 最新編譯和最佳化的 JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../../js/jquery.twzipcode.min.js"></script>
    <script>
        $(function () {
            $('#twzipcode').twzipcode({
                detect: true, // 偵測位置

                'css': ['county', 'district', 'zipcode'],
            });

        });

    </script>

    <style>
        .zipcode {
            width: 26%;
            font-size: 25px;
        }

        .county {
            margin-left: 5%;
            width: 32%;
            font-size: 25px;
            height: 40px;
        }

        .district {
            margin-left: 5%;
            width: 32%;
            font-size: 25px;
            height: 40px;
        }
    </style>
    <title></title>

</head>
<body>
    <form id="form1" runat="server" style="padding: 10px">
        <div class="container col-md-8 col-md-offset-2" style="margin-top: 60px">
            <label class="w3-text-black"><b>會員註冊</b></label>
            <div class=" col-md-12 w3-card-12" style="border-style: double; background-color: whitesmoke;">
                <div>
                    <center> <asp:Image src="http://www.msqq.com/d/file/icon/2014-04-01/b5e12627962868cda6cf9a6d26a8a3e3.png" ID="Image1" runat="server" Style="height: 200px; width: 200px" /> </center>
                </div>
                <div>
                    <center><asp:FileUpload ID="FileUpload1"  runat="server" /><asp:Label ID="Label1"  runat="server" Text=" " ></asp:Label></center>
                </div>
                <div class="col-md-12" style="margin-top: 40px; font-size: 25px; height: 30px">
                    <div class="col-md-3 " style="padding-left: 0px">
                        <label class="w3-text-black"><b>姓名</b></label>
                    </div>
                    <div class="col-md-3 " style="padding-right: 0px">
                        <label class="w3-text-black"><b>暱稱</b></label>
                    </div>
                    <div class="col-md-3 ">
                        <label class="w3-text-black"><b>生日</b></label>
                    </div>
                    <div class="col-md-3 ">
                        <label class="w3-text-black"><b>性別</b></label>
                    </div>
                </div>
                <div class="col-md-12" style="font-size: 25px; height: 30px">
                    <div class="col-md-3 " style="padding-left: 0px">
                        <asp:TextBox ID="TextBox1" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Name"></asp:TextBox>

                    </div>
                    <div class="col-md-3 " style="padding-right: 0px">
                        <asp:TextBox ID="TextBox2" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Nickname"></asp:TextBox>

                    </div>
                    <div class="col-md-3 ">
                        <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
                        <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css" />
                        <script>
                            $(function () {
                                $("#TextBox5").datepicker({
                                    dateFormat: "yy/mm/dd",
                                    changeMonth: true,
                                    changeYear: true
                                });

                            });
                        </script>
                        <asp:TextBox ID="TextBox5" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Birthday"></asp:TextBox>

                        <asp:CompareValidator
                            ID="dateValidator" runat="server"
                            Type="Date"
                            Operator="DataTypeCheck"
                            ControlToValidate="TextBox5"
                            ErrorMessage="[請輸入正確格式(EX:2016/05/06)！]" ForeColor="#FF3300">
                        </asp:CompareValidator>
                    </div>
                    <div class="col-md-2 ">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>

                        </asp:RadioButtonList>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 40px; font-size: 25px; height: 30px">
                    <div class="col-md-4" style="padding-left: 0px">
                        <label class="w3-text-black"><b>市話</b></label>
                    </div>
                    <div class="col-md-4 " style="padding-right: 0px">
                        <label class="w3-text-black"><b>手機1</b></label>
                    </div>
                    <div class="col-md-4 ">
                        <label class="w3-text-black"><b>手機2</b></label>
                    </div>
                </div>
                <div class="col-md-12" style="font-size: 25px; height: 30px">
                    <div class="col-md-4 " style="padding-left: 0px">
                        <asp:TextBox ID="TextBox3" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Phone"></asp:TextBox>
                    </div>

                    <div class="col-md-4 ">
                        <asp:TextBox ID="TextBox9" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Cellphone1"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="REVSmartphone"
                            runat="server" ErrorMessage="[請輸入正確手機號碼！]"
                            ValidationExpression="((\d{10})|(((\(\d{2}\))|(\d{2}-))?\d{4}(-)?\d{3}(\d)?))"
                            ControlToValidate="TextBox9" Display="Dynamic" ForeColor="#FF3300">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-4 " style="padding-right: 0px">
                        <asp:TextBox ID="TextBox4" runat="server" class="w3-input w3-border" Style="width: 100%" placeholder="Cellphone2"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                            runat="server" ErrorMessage="[請輸入正確手機號碼！]"
                            ValidationExpression="((\d{10})|(((\(\d{2}\))|(\d{2}-))?\d{4}(-)?\d{3}(\d)?))"
                            ControlToValidate="TextBox4" Display="Dynamic" ForeColor="#FF3300">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 40px; font-size: 25px; height: 30px">
                    <div class="col-md-2 " style="padding-left: 0px">
                        <label class="w3-text-black"><b>郵遞區號</b></label>
                    </div>
                    <div class="col-md-2 " style="padding-left: 0px">
                        <label class="w3-text-black"><b>地址(縣市)</b></label>
                    </div>
                    <div class="col-md-2 " style="padding-right: 0px">
                        <label class="w3-text-black"><b>地址(鄉鎮市區)</b></label>
                    </div>
                    <div class="col-md-6 ">
                        <label class="w3-text-black"><b>地址(細項)</b></label>
                    </div>
                </div>
                <div class="col-md-12" style="padding: 0px">
                    <div id="twzipcode" class="col-md-6" runat="server">
                    </div>
                    <div class="col-md-6" style="font-size: 25px; height: 30px">
                        <asp:TextBox ID="TextBox11" runat="server" class="w3-input w3-border " Style="width: 100%" placeholder="Adress"></asp:TextBox>
                        <asp:TextBox ID="TextBox6" runat="server" type="hidden"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-12" style="margin-top: 40px">
                    <div style="font-size: 25px; height: 60px">
                        <label class="w3-text-black"><b>帳號(信箱)</b></label></br>
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:TextBox ID="TextBox10" runat="server" class="w3-input w3-border" placeholder="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEmail" runat="server"
                                ControlToValidate="TextBox10"
                                ErrorMessage="[請輸入電子郵件帳號！]" Display="Dynamic" ForeColor="#FF3300">
                            </asp:RequiredFieldValidator>
                            <!--驗證E-mail格式-->
                            <asp:RegularExpressionValidator ID="REVEmail" runat="server"
                                ControlToValidate="TextBox10"
                                Display="Dynamic" ErrorMessage="[請輸入格式正確的電子郵件帳號！]"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#FF3300">
                            </asp:RegularExpressionValidator>
                        </asp:Panel>
                    </div>
                </div>
                <div class="col-md-12 text-center" style="margin-top: 40px">
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
                    <asp:Button ID="Button13" runat="server" Text="確認" class="button button4 w3-green w3-card-12" Style="background-color: #4CAF50" Height="50px" OnClientClick="return invokeMeMaster();" OnClick="Button13_Click1" />
                    <asp:Button ID="Button14" runat="server" Text="取消" class="button button4 w3-pink w3-card-12" Style="background-color: #FA8072" Height="50px" />
                    <script>

                        function invokeMeMaster() {
                            var foo = $('#twzipcode').twzipcode('get', function (el) {
                                /*alert(); // 輸出 County 選定的值。
                                alert($(el.district).val()); // 輸出 County 選定的值。
                                alert($(el.zipcode).val()); // 輸出 County 選定的值。*/
                                var str_address = document.getElementById("TextBox11").value;
                                document.all.TextBox6.value = $(el.zipcode).val() + "|" + $(el.county).val() + "|" + $(el.district).val() + "|" + str_address;
                            });

                        }
                    </script>

                </div>

            </div>
        </div>
    </form>
</body>
</html>
