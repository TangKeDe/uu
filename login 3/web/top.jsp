<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>��̨-ҳͷ</title>
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
        <li><a href="home.jsp">��ҳ</a></li>
        <li><a href="notice.jsp">��Ϣ</a></li>
        <li><a href="PersonalCenter.jsp">��������</a></li>
        <li><a href="index.jsp">�˳�</a></li>
    </ul>
</div>
</header>
</html>
