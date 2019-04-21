<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>管理员首页</title>
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

<body>
<section id="services">
    <div class="container" style="margin-top: 180px">
        <div class="row">
            <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                <div class="single-service">
                    <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
                        <a href="AdminTeacher.jsp"> <img src="img/jiaoshiguanli.png" alt=""></a>
                    </div>
                    <h2><br>修改教师信息</h2>
                </div>
            </div>

            <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                <div class="single-service" style="margin-left: 100px">
                    <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="600ms">
                        <a href="AdminStudent.jsp"><img src="img/xueshengguanli.png" alt=""></a>
                    </div>
                    <h2 style="margin-top: 5px">修改学生信息</h2>
                </div>
            </div>

            <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
                <div class="single-service" style="margin-left: 100px">
                    <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                        <a href="AdminLogin.jsp"><img src="img/tuichu.png" alt=""></a>
                    </div>
                    <h2 style="margin-top: 5px">退出登录</h2>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>

