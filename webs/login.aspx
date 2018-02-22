<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="webs_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"/>
    <!-- 最新編譯和最佳化的 CSS -->
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />
    <!-- w3 card的 CSS -->
    <link href="../css/w3.css" rel="stylesheet" />
    <!-- 選擇性佈景主題 -->
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <!-- 最新編譯和最佳化的 JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- google -->

    <script src="http://code.jquery.com/jquery-1.7.js"></script>
    <script src="/jquery-ui-1.12.0.custom/jquery-ui.js"></script>
    <link href="/jquery-ui-1.12.0.custom/jquery-ui.theme.css" rel="stylesheet" />
    <link href="/jquery-ui-1.12.0.custom/jquery-ui.structure.min.css" rel="stylesheet" />

    <!-- FaceBook -->
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '1822513947981788', // App ID
                channelUrl: 'http://hayageek.com/examples/oauth/facebook/oauth-javascript/channel.html', // Channel File
                cookie: true,  // enable cookies to allow the server to access 
                // the session
                xfbml: true,  // parse social plugins on this page
                version: 'v2.5' // use graph api version 2.5
            });


            FB.Event.subscribe('auth.authResponseChange', function (response) {
                if (response.status === 'connected') {
                    document.getElementById("message").innerHTML += "<br>Connected to Facebook";
                    //SUCCESS

                }
                else if (response.status === 'not_authorized') {
                    document.getElementById("message").innerHTML += "<br>Failed to Connect";

                    //FAILED
                } else {
                    document.getElementById("message").innerHTML += "<br>Logged Out";

                    //UNKNOWN ERROR
                }
            });

        };

        function Login() {

            FB.login(function (response) {
                if (response.authResponse) {
                    getUserInfo();
                } else {
                    console.log('User cancelled login or did not fully authorize.');
                }
            }, { scope: 'email,user_photos,user_videos' });


        }

        function getUserInfo() {
            FB.api('/me', function (response) {
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json;',
                    url: 'login.aspx/fb',
                    data: "{ name:'" + response.name + "',id:'" + response.id + "',img:'" + "http://graph.facebook.com/" + response.id + "/picture" + "'}",
                    success: function (response) {
                        //把值顯示
                        location.href = "registerfbgoogle.aspx"
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.responseText);
                    }
                });

            });
        }
        function getPhoto() {
            FB.api('/me/picture?type=normal', function (response) {

                var str = "<br/><b>Pic</b> : <img src='" + response.data.url + "'/>";
                document.getElementById("status").innerHTML += str;

            });

        }
        function Logout() {
            FB.logout(function () { document.location.reload(); });
        }

        // Load the SDK asynchronously
        (function (d) {
            var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement('script'); js.id = id; js.async = true;
            js.src = "//connect.facebook.net/en_US/all.js";
            ref.parentNode.insertBefore(js, ref);
        }(document));

    </script>

    <!-- Google -->

    <script type="text/javascript">

        function logout() {
            gapi.auth.signOut();
            location.reload();
        }
        function login() {
            var myParams = {
                'clientid': '999773824712-mv27ugs087503b1vctlh2522amd4e0j2.apps.googleusercontent.com',
                'cookiepolicy': 'single_host_origin',
                'callback': 'loginCallback',
                'approvalprompt': 'force',
                'scope': 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
            };
            gapi.auth.signIn(myParams);
        }

        function loginCallback(result) {
            if (result['status']['signed_in']) {
                var a = 0;
                var request = gapi.client.plus.people.get(
                {
                    'userId': 'me'
                });
                request.execute(function (resp) {
                    var email = '';
                    if (resp['emails']) {
                        for (i = 0; i < resp['emails'].length; i++) {
                            if (resp['emails'][i]['type'] == 'account') {
                                email = resp['emails'][i]['value'];
                            }
                        }
                    }
                    //alert("{ name:'" + resp['displayName'] + "',id:'" + resp['id'] + "',email:'" + email + "',img:'" + resp['image']['url'] + "'}")
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json;',
                        url: 'login.aspx/google',
                        data: "{ name:'" + resp['displayName'] + "',id:'" + resp['id'] + "',email:'" + email + "',img:'" + resp['image']['url'] + "'}",
                        success: function (response) {
                            //把值顯示
                            location.href = "registerfbgoogle.aspx"
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(xhr.responseText);

                        }
                    });

                    /*document.getElementById("TextBox1").value = resp['displayName'];
                    document.getElementById("TextBox2").value = resp['id'];
                    document.getElementById("TextBox3").value = email;
                    document.getElementById("TextBox4").value = resp['image']['url'];*/

                });


            }

        }

        function onLoadCallback() {
            // gapi.client.setApiKey('999773824712-mv27ugs087503b1vctlh2522amd4e0j2.apps.googleusercontent.com');
            gapi.client.load('plus', 'v1', function () { });
        }

        $(function () {
            var nav = $('#nav');
            var win = $(window);

            $('#menu').on('click', function (e) {
                e.preventDefault();
                nav.slideToggle();
            });

            win.resize(function () {
                if (win.width() > 480 && nav.is(':hidden')) {
                    nav.removeAttr('style');
                }
            });
        });
    </script>

    <script type="text/javascript">
        (function () {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
    </script>

    <style>
        body {
            padding: 2em;
        }


        /* Shared */
        .loginBtn {
            box-sizing: border-box;
            position: relative;
            /* width: 13em;  - apply for fixed size */
            margin: 0.2em;
            padding: 0 15px 0 46px;
            border: none;
            text-align: left;
            line-height: 34px;
            white-space: nowrap;
            border-radius: 0.2em;
            font-size: 16px;
            color: #FFF;
            height: 100%;
        }

            .loginBtn:before {
                content: "";
                box-sizing: border-box;
                position: absolute;
                top: 0;
                left: 0;
                width: 34px;
                height: 100%;
            }

            .loginBtn:focus {
                outline: none;
            }

            .loginBtn:active {
                box-shadow: inset 0 0 0 32px rgba(0,0,0,0.1);
            }

        /* general */
        .loginBtn--general {
            /*font-family: "Roboto", Roboto, arial, sans-serif;*/
            background: #00DD77;
        }

            .loginBtn--general:before {
            }

            .loginBtn--general:hover,
            .loginBtn--general:focus {
                background: #00FF99;
            }

        /* Facebook */
        .loginBtn--facebook {
            background-color: #4C69BA;
            background-image: linear-gradient(#4C69BA, #3B55A0);
            /*font-family: "Helvetica neue", Helvetica Neue, Helvetica, Arial, sans-serif;*/
            text-shadow: 0 -1px 0 #354C8C;
        }

            .loginBtn--facebook:before {
                border-right: #364e92 1px solid;
                background: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_facebook.png') 6px 6px no-repeat;
            }

            .loginBtn--facebook:hover,
            .loginBtn--facebook:focus {
                background-color: #5B7BD5;
                background-image: linear-gradient(#5B7BD5, #4864B1);
            }


        /* Google */
        .loginBtn--google {
            /*font-family: "Roboto", Roboto, arial, sans-serif;*/
            background: #DD4B39;
        }

            .loginBtn--google:before {
                border-right: #BB3F30 1px solid;
                background: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_google.png') 6px 6px no-repeat;
            }

            .loginBtn--google:hover,
            .loginBtn--google:focus {
                background: #E74B37;
            }

      @media screen and (min-width: 680px) {
  nav li:first-child {
    padding-left: 30px;
  }
  nav li {
    display: inline-block;
    padding-right: 30px;
  }
}
@media (min-width: 480px) and (max-width: 680px) {
  nav li {
    text-align: center;
  }
  nav ul {
    columns: 2;
    -webkit-columns: 2;
    -moz-columns: 2;
  }
}
        @media screen and (max-width: 480px) {
            nav li {
                text-align: center;
            }

            nav ul {
                display: none;
                columns: 1;
                -webkit-columns: 1;
                -moz-columns: 1;
            }
        }
           
    </style>


    <title></title>
</head>

<body data-target="#nav" data-spy="scroll">
    <style>
        html {
            height: 100%;
        }

        body {
            background-image: url(/img/pet.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
        }
    </style>

    <form id="form1" runat="server" style="padding: 10px">

     <!--   <nav class="navbar navbar-inverse">

            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only"><font><font>切換導航</font></font></span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="#">寵物廚房</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="register.aspx">網站介紹</a></li>
                        <li><a href="txt2.aspx">購物須知</a></li>
                        <li><a href="purchase.aspx">產品介紹</a></li>
                        <li><a href="#contact">聯繫我們</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/webs/home.aspx">首頁</a></li>
                        <li><a href="/webs/manager/backmanagerhome.aspx">管理者登入</a></li>
                        <li><a href="/webs/member/memberregister.aspx">註冊</a></li>
                    </ul>
                </div>
            </div>
        </nav>    -->
       
       
     <nav class="nav navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" id="menu">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
                <a class="navbar-brand" href="/webs/home.aspx">寵物廚房</a>
            </div>
          
                <ul class="nav navbar-nav" id="nav">
                    <li><a href="/webs/home.aspx">首頁</a></li>
                    <li><a href="/webs/member/memberregister.aspx">註冊</a></li>
                    <li><a href="/webs/manager/backmanagerhome.aspx">管理者登入</a></li>
                    <li><a href="#contact">聯繫我們</a></li>
                </ul>
                      
               </div> 
        
        
    </nav> 
  

    <div class="row " style="padding: 15px"></div>


            <div class=" col-md-12 w3-card-12" style="border-width: thin;">
                <div class="row " style="padding: 10px"></div>
                <div class="text-center col-md-12">
                    <a class=" w3-text-black" style="font-size: 150%;" href="#"><font>
                <label class="w3-text-black"><b>寵物廚房登入</b></label>
                </div>
                <div class="row " style="padding: 10px"></div>
                <label class="w3-text-black"><b>帳號</b></label>
                <asp:TextBox ID="TextBox5" runat="server" class="w3-input w3-border" placeholder="account"></asp:TextBox>

                <label class="w3-text-black"><b>密碼</b></label>
                <asp:TextBox ID="TextBox6" runat="server" class="w3-input w3-border" TextMode="Password" placeholder="password"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="" Style="color: red"></asp:Label>

                <div class="row " style="padding: 10px">
                
                    
                     <div class="w3-right">
                       
                         <asp:Button ID="Button8" runat="server" Text="登入" class=" w3-card-12 loginBtn loginBtn--general" OnClick="Button8_Click" Style="height: 100%; padding-left: 15px" />
                 
                   </div>

                </div>
                
            </div>
        
                     <div class="row " style="padding: 5px"></div>
                      <div class="w3-center">
                            <button class="w3-card-12 loginBtn loginBtn--facebook" type="button" onclick="Login()">Facebook登入</button>
                     
                            <button class="w3-card-12 loginBtn loginBtn--google" type="button" onclick="login()">Google登入</button>
                       </div>
           
                
           
     
            </form>
</body>

</html>


