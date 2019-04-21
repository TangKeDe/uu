<%@ page import="entity.SourceBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html ng-app="app">
<head>
    <title>资源详情</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/file.css"> <!-- Resource style -->
    <script>$(function(){
        $("input[type=file]").change(function(){$(this).parents(".uploader").find(".filename").val($(this).val());});
        $("input[type=file]").each(function(){
            if($(this).val()==""){$(this).parents(".uploader").find(".filename").val("No file selected...");}
        });
    });</script>
</head>
<body>
<form class="cd-form floating-labels">
    <%SourceBean sourceBean = (SourceBean) session.getAttribute("tmp_Material");%>
    <fieldset>
        <legend style="text-align: center;">资料详情</legend>
        <div class="icon">
            <label class="cd-label" for="subject">该资料科目为：</label>
            <p class="message" id="subject"><%=sourceBean.getsubject()%></p>
        </div>
        <div class="icon">
            <label class="cd-label" for="content">资料题目:</label>
            <p class="message" id="content"><%=sourceBean.gettitle()%></p>
        </div>
        <div class="icon">
            <div>
                <label class="cd-label" for="file01">资料内容:</label>
                <!--更改资源地址-->
                <a id="file01" href="资源地址" download="资料">
                    <img border="0" src="images/file.png" alt="下载资料">
                </a>
            </div>
        </div>
    </fieldset>
    <a href="materialHome.jsp"><input class="wrap1" type="button" id="ensure" value="确定"></a>
</form>

</body>
</html>
