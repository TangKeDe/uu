<%@ page import="java.util.List" %>
<%@ page import="entity.QuestionBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: hzyyyyyuan
  Date: 2019-04-08
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试提交界面</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <link href="css/testMain.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/lightbox.css" rel="stylesheet">
    <style>
        .hasBeenAnswer {
            background: #5d9cec;
            color:#fff;
        }

    </style>
</head>
<body>
<jsp:include page="top.jsp"/>
<div id="score">
    <p>分数：<%=session.getAttribute("score")%></p>
</div>
<div class="main">
    <div class="test_main">
        <div class="nr_check">
            <div class="test">
                <form action="" method="post">
                    <div class="check_title">
                        <a href="TextChoose.jsp"><font><input type="button" value="继续选题"></font></a>
                        　　<br>
                        <a href="AdminIndex.jsp"><font><input type="button" value="返回上一级"></font></a>
                    </div>
                    <div class="test_content_nr">
                        <ul>
                            <%  ArrayList<QuestionBean> questionBeans = (ArrayList<QuestionBean>) session.getAttribute("quizer");
                                if (questionBeans != null){
                                for (int i = 0;i < questionBeans.size();i++){QuestionBean tmp = questionBeans.get(i); %>

                            <li id=<%=i+1%>>
                                <div class="test_content_nr_tt">
                                    <i><%=i+1%></i><font><%=tmp.getContent()%></font>
                                </div>

                                <div class="test_content_nr_main">
                                    <ul>
                                        <li class="optioncheck" >
                                            A.
                                            <a name="<%="ans" + (i+1) + "1"%>"><%=tmp.getanswer1()%></a>
                                        </li>
                                        <li class="optioncheck" >
                                            B.
                                            <a name="<%="ans" + (i+1) + "2"%>"><%=tmp.getanswer2()%></a>
                                        </li>
                                        <li class="optioncheck" >
                                            C.
                                            <a name="<%="ans" + (i+1) + "3"%>"><%=tmp.getanswer3()%></a>
                                        </li>
                                        <li class="optioncheck" >
                                            D.
                                            <a name="<%="ans" + (i+1) + "4"%>"><%=tmp.getanswer4()%></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="analysis">
                                    - 正确选项： <a name="<%="ansR" + (i+1)%>"><%=tmp.gettrueanswer()%></a>
                                    <br>
                                   - 您的选项： <a name="<%="ansY" + (i+1)%>"><%=tmp.getyouranswer()%></a>
                                   <br>
                                    - 解析：
                                    <a name="analysis1"><%=tmp.getexplaination()%></a>
                                </div>
                            </li>
                            <% }} %>

                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</div>

</body>
</html>
