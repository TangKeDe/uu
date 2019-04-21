<%@ page import="entity.UserBean" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: hzyyyyyuan
  Date: 2019-04-17
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改学生信息</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <link rel="stylesheet" href="assets/css/jquery.mCustomScrollbar.min.css" />
    <link rel="stylesheet" href="assets/css/custom.css">

</head>
<body>
<div>
    <br>
    <h3 align="center">修改学生信息</h3>
    <br>
</div>
<form name = "form_change_user" action="${pageContext.request.contextPath}/login/PersonServlet?action=stuChange" method="post" onsubmit="document.charset='utf-8'">

<table align="center">
    <tr>
        <td width="548" align="center" valign="top">
            <table border="2" bordercolor="darkblue" rules="none" width="95%" height="500" cellspacing="0" cellpadding="0" style="margin-top:30px" >
                <%int num = (int) session.getAttribute("change_num");
                    UserBean userBean = (UserBean) ((List)session.getAttribute("student_List")).get(num);
                %>
                <tr>
                    <td align="left" style="margin-left: 20px"><br>&nbsp&nbsp&nbsp&nbsp学号原内容为：</td>
                    <td style="text-indent:30px"><%=userBean.getuser_name()%></td>
                </tr>
                <tr>
                    <td align="left" style="margin-left: 20px">&nbsp&nbsp&nbsp&nbsp您希望修改为：</td>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <td align="left" style="margin-left: 20px">&nbsp&nbsp&nbsp&nbsp姓名原内容为：</td>
                    <td style="text-indent:30px"><%=userBean.getname()%></td>
                </tr>
                <tr>
                    <td align="left" style="margin-left: 20px">&nbsp&nbsp&nbsp&nbsp您希望修改为：</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td align="left" style="margin-left: 20px">&nbsp&nbsp&nbsp&nbsp专业原内容为：</td>
                    <td style="text-indent:30px"><%=userBean.getuser_subject()%></td>
                </tr>
                <tr>
                    <td align="left" style="margin-left: 20px">&nbsp&nbsp&nbsp&nbsp您希望修改为：</td>
                    <td><input type="text" name="major"></td>
                </tr>
                <tr>
                    <td align="left" style="margin-left: 20px">&nbsp&nbsp&nbsp&nbsp班级原内容为：</td>
                    <td style="text-indent:30px"><%=userBean.getuser_class()%></td>
                </tr>
                <tr>
                    <td align="left" style="margin-left: 20px">&nbsp&nbsp&nbsp&nbsp您希望修改为：</td>
                    <td><input type="text" name="class"><br></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<div>
    <br>
    <p align="center" style="color: red">注：填写<b>需要改动</b>的科目的同时，将其他栏目的信息也要填上。</p>
    <br>
    <p align="center">
        <a><button type="submit" name="ensure">完成</button> </a>
    </p>
</div>
</form>
</body>
</html>
