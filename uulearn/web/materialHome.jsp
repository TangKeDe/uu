<%@ page import="entity.SourceBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>学习资料首页</title>
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


    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

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
<jsp:include page="top.jsp"/>
<main class="page-content">
    <div class="container-fluid">
        <h3 align="center" style="color: #314A87 ;font-size: 30px; margin-bottom: 0px">学习资料</h3>
        <br>
    </div>
    <form name = "form_Works" action="${pageContext.request.contextPath}/login/ResultServlet" method="post">
    <Script>
        function getMaterial(string)
        {
            document.form_Works.action="${pageContext.request.contextPath}/login/ResultServlet?action=material" + string;
            document.form_Works.submit();
        }
    </Script>
    <div class="center" >
        <table id="sample2" width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr><th>科目</th><th>题目</th><th>具体内容</th></tr>
            <%List<SourceBean> sourceBeanList = (List<SourceBean>) session.getAttribute("Source_List");
                if (sourceBeanList == null){%>什么都没有<%}else{
                for (int i = 0;i < sourceBeanList.size();i++){%>
            <tr>
                <td class="left" align="center"><%=sourceBeanList.get(i).getsubject()%></td>
                <td align="center"><%=sourceBeanList.get(i).gettitle()%></td>
                <td class="right" align="center"><a onclick="getMaterial('<%=i%>')">查看详情</a></td>
            </tr>
            <%}}%>
        </table>
    </div>
    </form>
    <div style="margin-top: 100px">
        <p align="center">
            <a href="AdminIndex.jsp"><button name="ensure">返回上一级</button> </a>
        </p>
    </div>


</main><!-- page-content" -->
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>

