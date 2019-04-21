
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>添加学生信息</title>
    <link rel="stylesheet" href="css/style.css"> <!-- Resource style -->
</head>
<body>

<form class="cd-form floating-labels " action="${pageContext.request.contextPath}/login/PersonServlet?action=addStudent" method="post">
    <fieldset>
        <legend style="text-align: center;">添加学生信息</legend>
        <div class="icon">
            <label class="cd-label" for="id">学号：</label>
            <input class="message" type="text" name="id" id="id" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="name">姓名：</label>
            <input class="message" type="text" name="name" id="name" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="major">专业：</label>
            <input class="message" type="text" name="major" id="major" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="major">班级：</label>
            <input class="message" type="text" name="class" id="class" required>
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
