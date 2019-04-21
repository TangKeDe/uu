
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>后台首页</title>
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
</head>
<!--/head-->
<body>
<%--<%@ include file="top.jsp"%>--%>
<jsp:include page="top.jsp"/>
    <section id="clients">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="clients text-center wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
                        <p><img src="images/home/clients.png" class="img-responsive" alt=""></p>
                        <h1 class="title">Please choose your subject.</h1>
                        <br>
                    </div>
                    <form name = "form1" action="${pageContext.request.contextPath}/login/QuestionServlet" method="post">
                        <Script>
                            function getSubject(string)
                            {
                                document.form1.action="${pageContext.request.contextPath}/login/QuestionServlet?action=" + string;
                                document.form1.submit();
                            }
                        </Script>
                        <table class="clients-logo wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms" align="center">
                            <tr class="col-xs-3 col-sm-2">
                            </tr>
                            <tr class="col-xs-3 col-sm-2">
                                <td><img src="images/home/JinGang.png" class="img-responsive" onclick="getSubject('JinGang')" alt=""></td>
                            </tr>
                            <tr class="col-xs-3 col-sm-2">
                                <td><img src="images/home/MaYuan.png" class="img-responsive" onclick="getSubject('MaYuan')" alt=""></td>
                            </tr>
                            <tr class="col-xs-3 col-sm-2">
                                <td><img src="images/home/shujujiegou.png" class="img-responsive" onclick="getSubject('Database')" alt=""></td>
                            </tr>
                            <tr class="col-xs-3 col-sm-2">
                                <td><img src="images/home/MaoGai.png" class="img-responsive" onclick="getSubject('MaoGai')" alt=""></td>
                            </tr>
                            <tr class="col-xs-3 col-sm-2">
                            </tr>
                        </table>
                    <%--<div class="clients-logo wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="col-xs-3 col-sm-2">
                            <a href="AdminIndex.jsp"><img src="images/home/JinGang.png" class="img-responsive" name="jingang" alt=""></a>
                        </div>
                        <div class="col-xs-3 col-sm-2">
                            <a href="AdminIndex.jsp"><img src="images/home/MaYuan.png" class="img-responsive" name="mayuan" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="AdminIndex.jsp"><img src="images/home/RuanGong.png" class="img-responsive" name="ruangong" alt=""></a>
                        </div>
                       <div class="col-xs-3 col-sm-2">
                            <a href="AdminIndex.jsp"><img src="images/home/MaoGai.png" class="img-responsive" name="maogai" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="AdminIndex.jsp"><img src="images/home/OS.png" class="img-responsive" name="os" alt=""></a>
                        </div>
                        <div class="col-xs-3 col-sm-2">
                            <a href="AdminIndex.jsp"><img src="images/home/DB.png" class="img-responsive" name="db" alt=""></a>
                        </div>
                    </div>--%>
                    </form>
                </div>
            </div>
        </div>
     </section>
<!--/#clients-->

</body>
</html>
