<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>后台-页头</title>
    <base href="<%=basePath%>">
    <link href="css/main.css" rel="stylesheet">
    <%--<link type="text/css" rel="stylesheet" href="<%=path%>css/main.css">--%>
</head>
<header id="topAssign">
<div class="collapse navbar-collapse" style="margin-left: 30px">
    <ul class="nav navbar-nav navbar-left">
        <a href="home.jsp"><img src="images/logo.png" alt="logo"></a>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li><a href="home.jsp">主页</a></li>
        <li><a href="notice.jsp">消息</a></li>
        <li><a href="PersonalCenter.jsp">个人中心</a></li>
        <li><a href="index.jsp">退出</a></li>
    </ul>
</div>
</header>
</html>
