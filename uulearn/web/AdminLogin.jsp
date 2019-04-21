<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String mess=(String)request.getAttribute("messages");
    if(mess==null||mess.equals(""))
        mess="<li>欢迎登录！</li>";
%>
<html>
<head>
    <title>博主登录</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="css/login.css">
</head>
<body style="BACKGROUND-IMAGE: url(images/bg2.png)">
    <table width="777" height="523" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center">
                <form action="${pageContext.request.contextPath}/login/LoginServlet?action=login" method="post">
                    <table cellpadding="0" cellspacing="0" style="margin-top:250px">
                        <tr height="50">
                            <td>用户名：</td>
                            <td><input type="text" name="userName" style="width:200px; height: 30px"></td>
                        </tr>
                        <tr height="50">
                            <td>密&nbsp&nbsp&nbsp码：</td>
                            <td><input type="password" name="userPass" style="width:200px; height: 30px"></td>
                        </tr>
                        <tr>
                            <td><br><br></td>
                            <td align="center">
                                <input type="submit" class="btn_bg" value="登 录">
                                <input type="reset" class="btn_bg" value="重 置">
                            </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</body>
</html>