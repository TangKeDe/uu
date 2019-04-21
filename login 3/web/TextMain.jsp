<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.QuestionBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <link href="css/testMain.css" rel="stylesheet" type="text/css" />
    <style>
        .hasBeenAnswer {
            background: #5d9cec;
            color:#fff;
        }

    </style>
</head>
<body>
<div class="main">
    <!--nr start-->
    <div class="test_main">
        <div class="nr_left">
            <div class="test">
                <form action="${pageContext.request.contextPath}/login/QuestionServlet?action=submitAnswer"  method="post">
                    <div class="test_title">
                        <p class="test_time">
                           <b class="alt-1">01:00</b>
                        </p>
                       <a><font><input type="submit" name="test_jiaojuan" value="交卷"></font></a>
                    </div>

                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>单选题</h2>
                            <p>
                                <span>共</span><i class="content_lit">20</i><span>题，</span><span>满分</span><i class="content_fs">100</i><span>分</span>
                            </p>
                        </div>
                    </div>
                    <div class="test_content_nr">
                        <ul>
                            <%
                                ArrayList QuizList=(ArrayList)session.getAttribute("quizer");//this is the name of the session, but idk what it is, so i made up one.
                                if(QuizList==null||QuizList.size()==0){// QuizList is used to load those  20 (or less) questions.
                            %>获取题库失败！<%}
                                else{
                                    for(int i=0;i<QuizList.size();i++){
                            %>
                            <li id="<%= "q"+String.valueOf(i+1)%>">
                                <%
                                    QuestionBean question = (QuestionBean) QuizList.get(i);
                                %>
                                <div class="test_content_nr_tt">
                                    <i><%=String.valueOf(i+1)%></i><span>(5分)</span><td style="text-indent:30px"><%=question.getContent()%></td>
                                </div>

                                <div class="test_content_nr_main">
                                    <ul>

                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="q_<%=String.valueOf(i+1)%>" <%--this is the name of each option, varies from the number of each question--%>
                                                   id="a<%=String.valueOf(i+1)%>_1" value="A"
                                            />



                                            <label for="a<%=String.valueOf(i+1)%>_1">
                                                A.
                                                <p class="ue" style="display: inline;"><td style="text-indent:30px"><%=question.getanswer1()%></td>
                                            </label>
                                        </li>

                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="q_<%=String.valueOf(i+1)%>"
                                                   id="a<%=String.valueOf(i+1)%>_2" value="B"
                                            />


                                            <label for="a<%=String.valueOf(i+1)%>_2">
                                                B.
                                                <p class="ue" style="display: inline;"><td style="text-indent:30px"><%=question.getanswer2()%></td>
                                            </label>
                                        </li>

                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="q_<%=String.valueOf(i+1)%>"
                                                   id="a<%=String.valueOf(i+1)%>_3" value="C"
                                            />


                                            <label for="a<%=String.valueOf(i+1)%>_3">
                                                C.
                                                <p class="ue" style="display: inline;"><td style="text-indent:30px"><%=question.getanswer3()%></td>
                                            </label>
                                        </li>

                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="q_<%=String.valueOf(i+1)%>"
                                                   id="a<%=String.valueOf(i+1)%>_4" value="D"
                                            />


                                            <label for="a<%=String.valueOf(i+1)%>_4">
                                                D.
                                                <p class="ue" style="display: inline;"><td style="text-indent:30px"><%=question.getanswer4()%></td>
                                            </label>
                                        </li>

                                    </ul>
                                </div>
                            </li>

                            <%}}%>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
        <div class="nr_right">
            <div class="nr_rt_main">
                <div class="rt_nr1">
                    <div class="rt_nr1_title">
                       <h1>
                            答题卡
                        </h1>
                        <p class="test_time">
                            <b class="alt-1">01:00</b>
                        </p>
                    </div>

                    <div class="rt_content">
                        <div class="rt_content_tt">
                            <h2>单选题</h2>
                            <p>
                                <span>共</span><i class="content_lit">20 </i><span>题</span>
                            </p>
                        </div>
                        <div class="rt_content_nr answerSheet">
                            <ul>

                                <li><a href="#q1">1</a></li>

                                <li><a href="#q2">2</a></li>

                                <li><a href="#q3">3</a></li>

                                <li><a href="#q4">4</a></li>

                                <li><a href="#q5">5</a></li>

                                <li><a href="#q6">6</a></li>

                                <li><a href="#q7">7</a></li>

                                <li><a href="#q8">8</a></li>

                                <li><a href="#q9">9</a></li>

                                <li><a href="#q10">10</a></li>

                                <li><a href="#q11">11</a></li>

                                <li><a href="#q12">12</a></li>

                                <li><a href="#q13">13</a></li>

                                <li><a href="#q14">14</a></li>

                                <li><a href="#q15">15</a></li>

                                <li><a href="#q16">16</a></li>

                                <li><a href="#q17">17</a></li>

                                <li><a href="#q18">18</a></li>

                                <li><a href="#q19">19</a></li>

                                <li><a href="#q20">20</a></li>

                            </ul>
                        </div>
        </div>
    </div>
</div>
        </div>
    </div>
</div>
            <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
            <script src="js/jquery.easy-pie-chart.js"></script>
            <!--时间js-->
            <script src="js/jquery.countdown.js"></script>
            <script>
                window.jQuery(function($) {
                    "use strict";

                    $('time').countDown({
                        with_separators : false
                    });
                    $('.alt-1').countDown({
                        css_class : 'countdown-alt-1'
                    });
                    $('.alt-2').countDown({
                        css_class : 'countdown-alt-2'
                    });

                });


                $(function() {
                    $('li.option label').click(function() {
                        debugger;
                        var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
                        var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
                        // 设置已答题
                        if(!cardLi.hasClass('hasBeenAnswer')){
                            cardLi.addClass('hasBeenAnswer');
                        }

                    });
                });
            </script>
</body>
</html>