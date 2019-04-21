<%@ page import="entity.ResultBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>教师查看学生作业</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/lightbox.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    <link rel="stylesheet" type="text/css" href="css/main.css" />

    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <link rel="stylesheet" href="assets/css/jquery.mCustomScrollbar.min.css" />
    <link rel="stylesheet" href="assets/css/custom.css">


    <link rel="stylesheet" type="text/css" href="css/tablemain.css" />

    <script  src="js/jquery.js"></script>

    <script  src="js/colResizable-1.3.min.js"></script>

    <script type="text/javascript">

        $(function(){



            var onSampleResized = function(e){

                var columns = $(e.currentTarget).find("th");

                var msg = "columns widths: ";

                columns.each(function(){ msg += $(this).width() + "px; "; })

                $("#sample2Txt").html(msg);



            };



            $("#sample2").colResizable({

                liveDrag:true,

                gripInnerHtml:"<div class='grip'></div>",

                draggingClass:"dragging",

                onResize:onSampleResized});



        });

    </script>


</head>

<body>
<%--<%@ include file="top.jsp"%>--%>
<jsp:include page="teachertop.jsp"/>
<div class="center" style="margin-left: 20px">
    <%
        ArrayList resultList=(ArrayList)session.getAttribute("resultList");//get the list of homework
    %>
    <br/>
    <form name = "form_Results" action="${pageContext.request.contextPath}/login/ResultServlet" method="post">
        <Script>
            function getUnit(string)
            {
                document.form_Results.action="${pageContext.request.contextPath}/login/ResultServlet?action=V_R" + string;
                document.form_Results.submit();
            }
        </Script>
    <table id="sample2" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <th>作业编号</th><th>学生姓名</th><th>学生学号</th><th>学生班级</th><th>学生提交内容</th>
        </tr>
        <%
            if(resultList==null){
        %>
        作业读取失败！
        <%}
            else{
                for(int i=0;i<resultList.size();i++){
                    ResultBean resultBean =(ResultBean)resultList.get(i);
        %>
        <tr>
            <td class="left"><%=String.valueOf(resultBean.getitemnumber())%></td><td><%=resultBean.getstu().getname()%></td><td><%=resultBean.getstu_num()%></td><td><%=resultBean.getstu().getuser_class()%></td><td class="right"><a onclick="getUnit('<%=i%>')">查看提交内容</a></td>
        </tr>
        <%}}%>

    </table>
    </form>
    <br/>
</div>


<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>

