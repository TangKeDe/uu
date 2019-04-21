<%@ page import="entity.UserBean" %>
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
    <title>教师管理</title>
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

    <%--<link rel="stylesheet" type="text/css" href="css/demo.css">--%>
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

<main class="page-content">
    <div class="col-sm-4 text-center" style="margin-left: 210px">
            <div>
                <a href="AdminStuAdd.jsp"> <img src="img/tianjia.png" alt=""></a>
            </div>
            <p>添加</p>
    </div>
    <div class="col-sm-4 text-center">
            <div>
                <a href="AdminMain.jsp"> <img src="img/fanhui.png" alt=""></a>
            </div>
            <p>返回</p>
    </div>

    <div class="center" >



        <br/><br/>



        <table id="sample2" width="100%" border="0" cellpadding="0" cellspacing="0">

            <tr>

                <th>序号</th><th>学号</th><th>姓名</th><th>专业</th><th>班级</th><th>账户密码</th><th>操作</th>

            </tr>

            <form name = "form_change_user" action="${pageContext.request.contextPath}/login/PersonServlet" method="post" onsubmit="document.charset='utf-8'">
                <Script>
                    function get_User(string)
                    {
                        document.form_change_user.action="${pageContext.request.contextPath}/login/PersonServlet?action=stu" + string;
                        document.form_change_user.submit();
                    }
                    function delete_User(string)
                    {
                        document.form_change_user.action="${pageContext.request.contextPath}/login/PersonServlet?action=delete_stu" + string;
                        document.form_change_user.submit();
                    }
                </Script>
                <% List<UserBean> userBeanList = (List<UserBean>)session.getAttribute("student_List");
                    if (userBeanList != null && userBeanList.size() > 0){
                        for (int i = 0;i < userBeanList.size();i++){
                            UserBean userBean = userBeanList.get(i);%>
                <tr>
                    <td align="center" name = "tea_<%=i%>"><%=i+1%></td>
                    <td class="left" align="center"><%=userBean.getuser_name()%></td>
                    <td align="center"><%=userBean.getname()%></td>
                    <td align="center"><%=userBean.getuser_subject()%></td>
                    <td align="center"><%=userBean.getuser_class()%></td>
                    <td align="center"><%=userBean.getuser_password()%></td>
                    <td class="right" align="center">
                        <a onclick="get_User('<%=i%>')">修改 </a>
                        <a onclick="delete_User('<%=i%>')"> 删除</a>
                    </td>

                </tr>
                <%}}%>

            </form>

        </table>




        <br/>


        <br/><br/>



    </div>

</main><!-- page-content" -->
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>

