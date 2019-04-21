<%@ page import="entity.WorkBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html ng-app="app">
<head>
    <title>作业详情</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/file.css"> <!-- Resource style -->
    <script type="text/javascript" src="js/file.js"></script>
</head>
<body>
<form class="cd-form floating-labels" <%--enctype="multipart/form-data"--%> id="sendWork" method="post" name="sendWork" <%--action="${pageContext.request.contextPath}/login/QuestionServlet"--%> >
    <Script>
        function submitWork()
        {
            document.sendWork.action="${pageContext.request.contextPath}/login/QuestionServlet?action=submitWork";
            document.sendWork.submit();
        }
    </Script>
    <%
        WorkBean workBean = (WorkBean)session.getAttribute("workbean");
        if(workBean==null){
    %><a>获取作业相关信息失败！</a>
    <%}
        else{
    %>
    <fieldset>
        <legend style="text-align: center;">作业详情</legend>
        <div class="icon">
            <label class="cd-label" for="subject">该作业科目为：</label>
            <p class="message" id="subject"><%=workBean.getitem()%></p>
        </div>
        <div class="icon">
            <label class="cd-label">该作业截止日期为为：</label>
            <p  id="date"><%=workBean.getfinaltime()%></p>
        </div>
        <div class="icon">
            <label class="cd-label" for="title">该作业题目为：</label>
            <p id="title"><%=workBean.gettitle()%></p>
        </div>
        <div class="icon">
            <label class="cd-label" for="title">该作业具体内容为：</label>
            <p id="content"><%=workBean.getcontent()%></p>
        </div>
        <%}%>

        <%--<div class="icon">
            <table border="0">
                <tr>
                    <td><label class="cd-label" for="file01">下载附加文件:</label></td>
                    <td>
                        <!--更改资源地址-->
                        <a id="file01" href="资源地址" download="资料">
                            <img border="0" src="images/file.png" alt="下载资料">
                        </a>
                    </td>
                </tr>
            </table>
        </div>--%>

        <div class="icon">
            <label class="cd-label" for="solution">提交作业内容:</label>
            <input id="solution" name="workcontent" style="background: transparent">
        </div>
        <div class="icon">
            <table>
                <tr>
                    <td><label class="cd-label" for="files">选择上传文件:</label></td>
                    <td>
                        <div class="wrap2">
                            <input id="files" class="file" type="file" name="uploadFile" style="background: transparent" onchange="show()" />上传文件
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </fieldset>
    <a><button class="wrap1" name="Sign_in" onclick="submitWork()">提交</button></a>

    <a href="HomeworkMain.jsp"><input class="wrap1" type="button" value="退出"></a>
</form>

</body>
</html>
