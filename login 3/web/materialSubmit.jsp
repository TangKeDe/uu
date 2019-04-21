<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html ng-app="app">
<head>
    <title>上传资料</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/file.css"> <!-- Resource style -->
    <script type="text/javascript" src="js/file.js"></script>
</head>
<body>
<form class="cd-form floating-labels">
    <fieldset>
        <legend style="text-align: center;">发布资料</legend>
        <div class="icon">

          <p>请选择您所教的科目：</p>
            <select class="message">
                <option value ="maogai">毛概</option>
                <option value ="mayuan">马原</option>
                <option value="jingang">近纲</option>
                <option value="shujujiegou">数据结构</option>
            </select>
        </div>
        <div class="icon">
            <label class="cd-label" for="content">资料题目:</label>
            <textarea id="content"  placeholder="" autofocus style="background: transparent"></textarea>
        </div>
        <div class="icon">
            <table border="0">
                <tr>
                    <td><label class="cd-label" for="files">附加文件:</label></td>
                    <td>
                        <div class="wrap2">
                            <input id="files" class="file" type="file" style="background: transparent" onchange="show()" />附加文件
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </fieldset>
    <a href="teacherhome.jsp"><input class="wrap1" type="button" id="submit" value="提交" style="color: white"></a>
    <a href="materialSubmit.jsp"><input class="wrap1" type="button" id="cancel" value="取消" style="color: white"></a>
</form>

</body>
</html>
