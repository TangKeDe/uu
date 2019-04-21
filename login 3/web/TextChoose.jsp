<%@ page import="entity.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>testchoose</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/lightbox.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <%--<link href="css/responsive.css" rel="stylesheet">--%>

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
<jsp:include page="top.jsp"/>
<div id="helloto">
    <%
        String cs_name =(String)session.getAttribute("Subject");//get the name of the course
        UserBean userBean=(UserBean) session.getAttribute("loginer");//get user's name
        if(userBean==null){
    %>姓名读取失败！<% }else{%>
    <p>您好！<%userBean.getuser_name();%>， 您所在的科目为：<%=cs_name%><%--${project.name}--%></p><%}%>
</div>
<div id="chooseleft">
    <jsp:include page="textChooseLeft.jsp"/>
</div>
<div id="chooseright">
    <%--<jsp:include page="TestChooseRight.jsp"/>--%>
</div>

</body>
</html>
