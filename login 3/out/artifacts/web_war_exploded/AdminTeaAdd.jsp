
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加教师信息</title>
    <link rel="stylesheet" href="css/style.css"> <!-- Resource style -->
</head>
<body>

<form class="cd-form floating-labels " action="${pageContext.request.contextPath}/login/PersonServlet?action=addTeacher" method="post">
    <fieldset>
        <legend style="text-align: center;">添加教师信息</legend>
        <div class="icon">
            <label class="cd-label" for="id">工号：</label>
            <input class="message" type="text" name="id" id="id" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="name">姓名：</label>
            <input class="message" type="text" name="name" id="name" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="major">学科：</label>
            <input class="message" type="text" name="major" id="major" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="year">入职年份：</label>
            <input class="message" type="text" name="year" id="year" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="major">密码：</label>
            <input class="password" type="password" name="password" id="password" required>
        </div>
        <div id="cd-submit">
            <a href="AdminTeacher.jsp"><input type="button" value="完成"></a>
        </div>
    </fieldset>
</form>
</body>
</html>
