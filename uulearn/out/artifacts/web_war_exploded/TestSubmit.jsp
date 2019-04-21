
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传练习</title>
    <link rel="stylesheet" href="css/style.css"> <!-- Resource style -->
</head>
<body>



    <fieldset>

        <form id="form_Test" name="form_Test" class="cd-form floating-labels" action="${pageContext.request.contextPath}/login/QuestionServlet" method="post">
            <Script>
                function textsubmit(string)
                {
                    document.form_Test.action="${pageContext.request.contextPath}/login/QuestionServlet?action=" + string;
                    document.form_Test.submit();
                }
            </Script>
        <legend style="text-align: center;">发布练习题：</legend>
        <div class="icon">
            <label class="cd-label" for="chapter">该题目所在章节为：</label>
            <input class="message" type="text" name="chapter" id="chapter" placeholder="仅限输入章节的数字编号，从1开始" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="cd-name">在此输入题干:</label>
            <input class="message" type="text" name="question" id="cd-name" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="cd-A">在此输入选项A内容:</label>
            <input class="message" type="text" name="answer1" id="cd-A" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="cd-B">在此输入选项B内容:</label>
            <input class="message" type="text" name="answer2" id="cd-B" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="cd-C">在此输入选项C内容:</label>
            <input class="message" type="text" name="answer3" id="cd-C" required>
        </div>
        <div class="icon">
            <label class="cd-label" for="cd-D">在此输入选项D内容:</label>
            <input  class="message" type="text" name="answer4" id="cd-D" required>
        </div>
        <div>
            <h4><b style="color: red">*</b>正确答案为：</h4>

            <p class="cd-select icon">
                <label>
                    <select class="budget" name="answer">
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select>
                </label>
            </p>
        </div>
        <div>
            <label class="cd-label" for="analysis">解析:</label>
            <input class="message" type="text" name="analysis" id="analysis" style="background: none">
        </div>
        <div id="cd-submit">
            <a ><input type="button" value="下一题" onclick=textsubmit('submit')></a>
            <a ><input type="button" value="完成" onclick=textsubmit('finish')></a>
        </div>
        </form>
    </fieldset>

</body>
</html>
