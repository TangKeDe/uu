<%@ page import="java.util.List" %>
<%@ page import="entity.WorkBean" %><%--
  Created by IntelliJ IDEA.
  User: asiaticwormwood
  Date: 2019/4/11
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<!--------------------------作业列表----------------------------------------->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>作业列表</title>


    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>

    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap1.css">

    <link href="css/timeline.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="js/timeline-min.js"></script>

    <script type="text/javascript">

        $(document).ready(function(){

            var timeline = new Timeline("timeline", new Date("Wed Jul 01 2015"));

        });

    </script>



</head>

<body >
<jsp:include page="top.jsp"/>

<div style="overflow: auto">

    <div class="jq22-container" style="position: inherit;margin:0px 0px 0px; z-index: -1">
        <header class="jq22-header">
        </header>
        <div class="demo" style="padding: 1em 0;">
            <div class="container">
                <div class="row">
                    <div class="col-md-offset-3 col-md-6">
                        <form name = "form_Works" action="${pageContext.request.contextPath}/login/QuestionServlet" method="post">
                            <Script>
                                function getWorkUnit(string)
                                {
                                    document.form_Works.action="${pageContext.request.contextPath}/login/QuestionServlet?action=work" + string;
                                    document.form_Works.submit();
                                }
                            </Script>
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <%
                                List<WorkBean> list = (List<WorkBean>) session.getAttribute("work_List");
                                for(int i = 0; i < list.size(); i++){%>
                            <div class="panel panel-default" >
                                <div class="panel-heading" role="tab" id="heading<%=String.valueOf(i)%>">
                                    <!--作业学科------------------------------------------------>
                                    <h4 class="panel-title"> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<%=String.valueOf(i)%>" aria-expanded="true" aria-controls="collapse<%=String.valueOf(i)%>">题目<%=i+1%></a> </h4>
                                </div>
                                <div id="collapse<%=String.valueOf(i)%>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading<%=String.valueOf(i)%>">
                                    <div class="panel-body">

                                        <a class="hw-abstract" onclick="getWorkUnit('<%=i%>')"><%=list.get(i).gettitle()%></a>
                                    </div>
                                </div>
                            </div>
                            <%}%>

                            </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--<div id="wrap" style="overflow: auto">--%>

        <%--<div id="timeline">--%>

            <%--<ul>--%>

                <%--<li class="题目1" title="Wed Jul 1 2015"><a href="homeworkSubmit_stu.jsp">详情</a></li>--%>

                <%--<li class="题目2" title="Wed Jul 1 2015"><a href="homeworkSubmit_stu.jsp">详情</a></li>--%>

                <%--<li class="题目3" title="Sun Jul 19 2015"><a href="homeworkSubmit_stu.jsp">详情</a></li>--%>

                <%--<li class="题目4" title="Thu Jul 23 2015"><a href="homeworkSubmit_stu.jsp">详情</a></li>--%>

                <%--<li class="题目5" title="Wed Jul 22 2015"><a href="homeworkSubmit_stu.jsp">详情</a></li>--%>

                <%--<li class="题目6" title="Fri Jul 31 2015"><a href="homeworkSubmit_stu.jsp">详情</a></li>--%>

            <%--</ul>--%>

        <%--</div>--%>

    </div>

</div>
</body>

</html>

