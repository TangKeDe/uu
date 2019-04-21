<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
  <head>
    <title>东北大学uu平台</title>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="online interactive education">
    <meta name="author" content="Peppa's team">

    <!-- CSS -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/supersized.css">
    <link rel="stylesheet" href="css/login.css">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
    <div class="page-container">
        <h1>Welcome to uu!</h1>
        <form name = mainForm action="login/LoginServlet?action=login" method="post" onsubmit="return Check_string_length();">
            <div>
                <label for="LoginUserName"></label><input type="text" name="userName" class="user" placeholder="Username" autocomplete="off" id="LoginUserName"/>
            </div>
            <div>
                <label>
                    <input type="password" name="userPass" class="user" placeholder="Password"/>
                </label>
            </div>
            <div id="userType">
                <input type="radio" style=" vertical-align: middle;" value="teacher" id="userTypet" name="userType"/>
                <label for="userTypet" style="  vertical-align: middle;">教师端</label>
                <input type="radio" style="vertical-align:middle " value="student" id="userTypes" name="userType" checked/>
                <label for="userTypes" style=" vertical-align: middle;">学生端</label>
            </div>
            <button type="submit" name="Sign_in">Sign in</button>
        </form>
        <div class="connect">
            <p style="margin-top:20px;">Designed by Peppa's Team</p>
        </div>
    </div>
    <div class="alert">
        <h2>消息提醒</h2>
        <div class="alert_con">
            <p id="ts"></p>
            <%--<p><%=request.getAttribute("messages") %></p>--%>
            <p style="line-height:70px"><a class="btn">确定</a></p>

        </div>

        <!-- Javascript -->
        <script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
        <script src="js/supersized.3.2.7.min.js"></script>
        <script src="js/supersized-init.js"></script>
        <script type="text/javascript">

            function Check_string_length() {
                var username = document.getElementById("LoginUserName");

                if (mainForm.userName.value === "") {
                    {
                        $("#ts").html("用户名或密码不能为空");
                        is_show();
                    }
                    return false;
                }
            }

        $(".btn").click(function () {
        is_hide();
        });
        window.onload = function () {
        $(".connect p").eq(0).animate({"left": "0%"}, 600);
        $(".connect p").eq(1).animate({"left": "0%"}, 400);
        };

        function is_hide() {
        $(".alert").animate({"top": "-40%"}, 300)
        }

        function is_show() {
        $(".alert").show().animate({"top": "45%"}, 300)
        }
        </script>
        </div>