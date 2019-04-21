<%--
  Created by IntelliJ IDEA.
  User: mikir
  Date: 2019/4/12
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人中心-修改密码</title>

    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <link rel="stylesheet" href="assets/css/jquery.mCustomScrollbar.min.css" />
    <link rel="stylesheet" href="assets/css/custom.css">

</head>
<body>

<div class="page-wrapper">
    <nav id="sidebar" class="sidebar-wrapper">
        <div class="sidebar-content">
            <a href="#" id="toggle-sidebar"><i class="fa fa-bars"></i></a>
            <div class="sidebar-brand">
                <a href="#">pro sidebar</a>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li><a href="stuPCinformation.jsp"><i class="fa fa-tv"></i><span>查看个人资料</span></a></li>
                    <li><a href="stuPCscore.jsp"><i class="fa fa-bar-chart-o"></i><span>查看成绩</span></a></li>
                    <li><a href="stuPCsecret.jsp"><i class="fa fa-diamond"></i><span>修改密码</span></a></li>
                    <li><a href="home.jsp"><i class="fa fa-diamond"></i><span>返回主页</span></a></li>
                </ul>
            </div><!-- sidebar-menu  -->
        </div><!-- sidebar-content  -->

        <%--  <div class="sidebar-footer">
              <a href="#"><i class="fa fa-bell"></i><span class="label label-warning notification">3</span></a>
              <a href="#"><i class="fa fa-envelope"></i><span class="label label-success notification">7</span></a>
              <a href="#"><i class="fa fa-gear"></i></a>
              <a href="#"><i class="fa fa-power-off"></i></a>
          </div>--%>
    </nav><!-- sidebar-wrapper  -->
    <main class="page-content">
        <div class="container-fluid">
            <form name = mainForm action="login/PersonServlet?action=changePassword" method="post">
            <h3 align="center">修改密码</h3>
            <br><br>
            <div id="ResetSecret">
                <p align="center">请输入您现在的密码：</p>
                <p align="center"><input type="password" name="oldpass"></p>
                <p align="center">请输入您的新密码</p>
                <p align="center"><input type="password" name="newpass1"></p>
                <p align="center">请再输入一次</p>
                <p align="center"><input type="password" name="newpass2"></p>
                <br><br>
                <p align="center"><a><button type="submit" name="ensure">确认</button> </a></p>
            </div>
            </form>
        </div>
    </main><!-- page-content" -->
</div><!-- page-wrapper -->


<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<script src="assets/js//jquery.mCustomScrollbar.concat.min.js"></script>
<script src="assets/js/custom.js"></script>

</body>
</html>
