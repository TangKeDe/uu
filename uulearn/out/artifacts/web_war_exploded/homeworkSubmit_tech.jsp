<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html ng-app="app">
<head>
    <title>上传作业</title>
    <link rel="stylesheet" href="css/style.css"> <!-- Resource style -->
    <link rel="stylesheet" href="css/file.css"> <!-- Resource style -->
    <script type="text/javascript" src="js/file.js"></script>
</head>
<body>
    <form name="form_Results" class="cd-form floating-labels" method="post">
        <Script>
            function work_option(string)
            {
                document.form_Results.action="${pageContext.request.contextPath}/login/ResultServlet?action=" + string;
                document.form_Results.submit();
            }
        </Script>

            <legend style="text-align: center;">发布作业</legend>

            <div class="icon">
                <table border="0">
                    <tr>
                        <td><label class="cd-label">该作业截止日期为：</label></td>
                        <td><input type="datetime-local"  placeholder="请选择时间"  name="user_date" id="deadline"  /></td>
                    </tr>
                </table>
            </div>
            <div class="icon">
                <label class="cd-label" for="title">该作业题目为：</label>
                <input class="message" type="text" name="chapter" id="title" required>
            </div>
            <div class="icon">
                <label class="cd-label" for="content">在此输入作业具体内容:</label>
                <textarea id="content"  placeholder="" name="content" autofocus style="background: transparent"></textarea>
            </div>
        <a><input class="wrap1" type="submit" id="submit" value="提交" onclick=work_option('work_submit') ></a>
        <a><input class="wrap1" type="submit" id="cancel" value="退出" onclick=work_option('work_exit')></a>
    </form>
</body>
</html>
