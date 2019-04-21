<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>科目首页</title>
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
</head><!--/head-->

<body>
    <%--<%@ include file="top.jsp"%>--%>
    <jsp:include page="top.jsp"/>

<section id="home-slider">
    <div class="container">
        <div class="row">
            <div class="main-slider">
                <div class="slide-text">
                    <%
                        String subject = (String) session.getAttribute("Subject");

                    %>
                    <h1 style="color: #314A87">您当前的科目为：<br><br>&nbsp&nbsp&nbsp&nbsp<%=subject%></h1>
                </div>
                <img src="images/home/slider/hill.png" class="slider-hill" alt="slider image">
                <img src="images/home/slider/house.png" class="slider-house" alt="slider image">
                <img src="images/home/slider/sun.png" class="slider-sun" alt="slider image">
                <img src="images/home/slider/birds1.png" class="slider-birds1" alt="slider image">
                <img src="images/home/slider/birds2.png" class="slider-birds2" alt="slider image">
            </div>
        </div>
    </div>
    <div class="preloader"><i class="fa fa-sun-o fa-spin"></i></div>
</section>
<!--/#home-slider-->

<section id="services">
    <div class="container">
        <div class="row">
            <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                <div class="single-service">
                    <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
                       <a href="TextChoose.jsp"> <img src="images/home/icon1.png" alt=""></a>
                    </div>
                    <h2>在线练习</h2>
                </div>
            </div>
            <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                <div class="single-service">
                    <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="600ms">
                        <a href="HomeworkMain.jsp"><img  src="images/home/icon2.png" alt=""></a>
                    </div>
                    <h2>作业</h2>
                </div>
            </div>
            <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
                <div class="single-service">
                    <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                        <a href="materialHome.jsp"><img src="images/home/icon3.png" alt=""></a>
                    </div>
                    <h2>学习资料</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/lightbox.min.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>
