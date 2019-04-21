package Servlet;

import dao.*;
import entity.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import static java.nio.charset.StandardCharsets.ISO_8859_1;
import static java.nio.charset.StandardCharsets.UTF_8;

public class QuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null)
            action = "";
        else if (action.equals("getQuestion")) {
            this.getQuestion(request, response);
        }

        else if (action.equals("submitAnswer")) {
            this.submitAnswer(request, response);
        }
        else if (action.equals("JinGang") || action.equals("MaYuan") || action.equals("RuanJian") || action.equals("MaoGai") || action.equals("Database") || action.equals("JinGang")) {
            this.getSubject(request, response,action);
        }
        else if (action.equals("finish")) {
            this.submit(request, response,action);
        }
        else if (action.equals("next")) {
            this.submit(request, response,action);
        }
        else if (action.substring(0,4).equals("work")){
            this.get_Work_Unit(request,response,Integer.valueOf(action.substring(4)));
        }
        else if (action.equals("submitWork")){
            this.submitWork(request,response);
        }
    }

    private void submitWork(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        WorkBean workBean = (WorkBean) session.getAttribute("workbean");
        ResultBean resultBean = new ResultBean();
        resultBean.setcontent(new String(request.getParameter("workcontent").getBytes(ISO_8859_1),UTF_8));
        System.out.println("12345"+request.getParameter("workcontent"));
        UserBean userBean = (UserBean) session.getAttribute("loginer");
        resultBean.setstu_num(userBean.getuser_name());
        SimpleDateFormat dataformat = new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        String datestring= dataformat.format(date);
        resultBean.setsubmittime(datestring);
        resultBean.setitemnumber(workBean.getitemnumber());

        resultBean.sethomework_ans_subject((String)session.getAttribute("Subject"));
        ResultDao resultDao = new ResultDao();
        resultDao.SubmitWork(resultBean);
        response.sendRedirect("../HomeworkMain.jsp");
    }

    private void get_Work_Unit(HttpServletRequest request, HttpServletResponse response, int valueOf) throws IOException {
        HttpSession session = request.getSession();
        List list = (List) session.getAttribute("work_List");
        WorkDao workDao = new WorkDao();
        WorkBean workBean = (WorkBean) list.get(valueOf);
        session.setAttribute("workbean",workBean);
        response.sendRedirect("../homeworkSubmit_stu.jsp");
    }


    private void submit(HttpServletRequest request, HttpServletResponse response, String action) throws IOException {
        Map<String,String> map = new HashMap<>();
        map.put("数据结构","sjjg");
        map.put("毛泽东思想和中国特色社会主义理论体系概论","mg");
        map.put("中国近代史纲要","gy");
        map.put("马克思原理","my");

        QuestionBean questionBean = new QuestionBean();
        QuestionDao questionDao = new QuestionDao();
        String charter = (String) request.getParameter("chapter");
        questionBean.setContent((String)request.getParameter("question"));
        questionBean.setanswer1((String) request.getParameter("answer1"));
        questionBean.setanswer2((String) request.getParameter("answer2"));
        questionBean.setanswer3((String) request.getParameter("answer3"));
        questionBean.setanswer4((String) request.getParameter("answer4"));
        questionBean.settrueanswer(((String[]) request.getParameterValues("answer"))[0]);
        questionBean.setexplaination((String) request.getParameter("analysis"));
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("loginer");
        System.out.println(userBean.getuser_name());
        String tea_sub = userBean.getuser_tea();
        System.out.println(tea_sub);
        boolean success = questionDao.insertquestion(map.get(tea_sub),charter,questionBean);
        if (action.equals("next"))response.sendRedirect("../TestSubmit.jsp");
        else response.sendRedirect("../teacherhome.jsp");
    }

    private void getSubject(HttpServletRequest request, HttpServletResponse response,String action) throws IOException {
        HttpSession session = request.getSession();
        Map<String,String> name_sub = new HashMap<>();
        name_sub.put("JinGang","近代史纲要");
        name_sub.put("MaYuan","马克思原理");
        name_sub.put("MaoGai","毛泽东思想概论");
        name_sub.put("Database","数据结构");



        session.setAttribute("Subject",name_sub.get(action));
        CharterDao charterDao = new CharterDao();
        String sub = "";
        String db_sub = "";
        switch (action){
            case "JinGang" : sub = "gy";break;
            case "MaYuan" : sub = "my";db_sub="马原";break;
            case "MaoGai" : sub = "mg";break;
            case "Database" : sub ="sjjg";db_sub = "数据结构";break;
            default:break;
        }
        SourceDao sourceDao = new SourceDao();
        List<SourceBean> sourceBeans = sourceDao.getsource(db_sub);
        for (int i = 0;i < sourceBeans.size();i++){
            System.out.println(sourceBeans.get(i).gettitle());
        }
        session.setAttribute("Source_List",sourceBeans);
        session.setAttribute("sub",sub);
        List list = charterDao.get_charter(sub);
        session.setAttribute("Charter",list);
        WorkDao workDao = new WorkDao();
        List<WorkBean> workBeans = (List<WorkBean>) workDao.gethomework_teacher(db_sub);

        for (WorkBean workBean : workBeans){
            System.out.println(workBean.gettitle());
        }
        session.setAttribute("work_List",workBeans);
        response.sendRedirect("../AdminIndex.jsp");
    }

    private void submitAnswer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<QuestionBean> questionBeans = (List<QuestionBean>) request.getSession().getAttribute("quizer");
        int sum = 0;
        for (int i = 0;i < questionBeans.size();i++){
            String[] t = request.getParameterValues("q_"+(i+1));
            questionBeans.get(i).setyouranswer((t!= null && t.length > 0 && t[0] != null) ? t[0] : "no answer");
            if (questionBeans.get(i).gettrueanswer().toLowerCase().equals(questionBeans.get(i).getyouranswer().toLowerCase())){
                sum += 5;
            }
        }
        GradeBean gradeBean =new GradeBean();
        HttpSession session = request.getSession();
        String sub = (String) session.getAttribute("Subject");
        GradeDao gradeDao = new GradeDao();
        gradeBean.setgrade_subject(sub);
        UserBean userBean = (UserBean) session.getAttribute("loginer");
        gradeBean.setgrade_student(userBean.getuser_name());

        gradeDao.save_grade(gradeBean);
        List<GradeBean> list = (List<GradeBean>) session.getAttribute("my_Score");
        list.add(gradeBean);
        session.setAttribute("my_Score",list);
        session.setAttribute("quizer",questionBeans);
        //System.out.println(sum + "score");
        session.setAttribute("score",sum);
        gradeBean.setgrade_score(sum);
        response.sendRedirect("../TextHandOn.jsp");
    }

    private void getQuestion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        QuestionDao questionDao = new QuestionDao();
        List<String> list = new ArrayList<>();
        String[] chooses = request.getParameterValues("choose");
        HttpSession session = request.getSession();
        for(String i :chooses){
            list.add(session.getAttribute("sub") + "_1_" + i);
        }
        List<QuestionBean> questionBeans = questionDao.getQuestion(list);

        session.setAttribute("quizer",questionBeans);
        response.sendRedirect("../TextMain.jsp");

    }
}
