<%@ page import="entity.ResultBean" %><%--
  Created by IntelliJ IDEA.
  User: hzyyyyyuan
  Date: 2019-04-16
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提交内容</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/file.css"> <!-- Resource style -->
    <script type="text/javascript" src="js/file.js"></script>
</head>

<form class="cd-form floating-labels">
    <%ResultBean resultBean =(ResultBean)session.getAttribute("resultBean");%>
    <%
        if(resultBean==null){
    %>作业信息获取失败！
    <%}
        else{
    %>
    <fieldset>
        <legend style="text-align: center;color: white">查看学生作业</legend>
        <div class="icon">
            <label class="cd-label" for="subject">该作业题目为：<%=resultBean.getwork().gettitle()%></label>
            <a><label>具体内容 :<%=resultBean.getcontent()%></label></a>
        </br>
            <a><label class="message" id="subject">作业提交时间为:<%=resultBean.getsubmittime()%></label></a>
        </div>

        <div class="icon">
            <table border="0">
                <tr>
                    <td><label class="cd-label" for="file01">下载附加文件:</label></td>
                    <td>
                        <!--更改资源地址-->
                        <a id="file01" href=<%=resultBean.getrider()%> download="资料">
                            <img border="0" src="images/file.png" alt="下载资料">
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </fieldset>
    <%}%>
    <a href="TeaCheckStuWork.jsp"><input class="wrap1" type="button" id="submit" value="确定" style="color: white"></a>
</form>

</html>
