<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.CharterBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>textchooseleft</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
</head>
<body>
<div class="muls-box">
    <div class="muls-top">
        <p class="muls" style="font-size: 30px">请选择题目范围:</p>
    </div>
    <form action="login/QuestionServlet?action=getQuestion" method="post">
        <br>
        <%
            ArrayList charterList = (ArrayList)session.getAttribute("Charter");
            if(charterList ==null||charterList.size()==0){%>
        章节目录加载失败！
        <%}
        else{
            for(int i=0;i<charterList.size();i++){
                CharterBean charterBean = (CharterBean)charterList.get(i);
        %>

        <label><input name="choose" id="choose" type="checkbox" value="<%=String.valueOf(i+1)%>" > <%=charterBean.getname()%> </label><br>
        <%}}%>
        <div id="check">
            <a><input type="submit" name="test_jiaojuan" value="开始答题"></a>
        </div>
    </form>
</div>

</body>
</html>