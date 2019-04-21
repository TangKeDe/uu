package Servlet;

import dao.LoginDao;
import entity.UserBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class PersonServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        //System.out.println(action);
        if (action == null)
            action = "";
        if (action.equals("changePassword")) {
            this.changePassword(request, response);
        }else if(action.equals("addTeacher")){
            this.addTeacher(request,response);
        }else if(action.equals("addStudent")){
            this.addStudent(request,response);
        }else if(action.equals("teaChange")){
            this.change(request,response,action);
        }else if(action.equals("stuChange")){
            this.change(request,response,action);
        }else if (action.substring(0,3).equals("tea")){
            this.change_ready(request,response,action,"tea");
        }else if (action.substring(0,3).equals("stu")){
            this.change_ready(request,response,action,"stu");
        }else if (action.substring(0,10).equals("delete_stu")){
            this.delete(request,response,action);
        }else if (action.substring(0,10).equals("delete_tea")){
            this.delete(request,response,action);
        }

    }

    private void change_ready(HttpServletRequest request, HttpServletResponse response, String action, String user) throws IOException {
        int number = Integer.valueOf(action.substring(3));
        HttpSession session = request.getSession();
        session.setAttribute("change_type",user);
        session.setAttribute("change_num",number);
        //System.out.println(number);
        switch (user){
            case "tea" : {
                List<UserBean>  list = ((List<UserBean>)session.getAttribute("teacher_List"));
                UserBean userBean = (UserBean)list.get(number);
                session.setAttribute("changing",userBean);
                response.sendRedirect("../AdminTeaChange.jsp");
                break;
            }
            case "stu" : {
                List<UserBean>  list = ((List<UserBean>)session.getAttribute("student_List"));
                UserBean userBean = (UserBean)list.get(number);
                session.setAttribute("changing",userBean);
                response.sendRedirect("../AdminStuChange.jsp");
                break;
            }
            default:break;
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response, String action) throws IOException {
        int num = Integer.valueOf(action.substring(10));
        LoginDao loginDao = new LoginDao();
        HttpSession session = request.getSession();
        if (action.substring(0,10).equals("delete_tea")){
            List<UserBean>  list = ((List<UserBean>)session.getAttribute("teacher_List"));
            UserBean userBean = list.get(num);
            loginDao.operationuser("delete3",userBean);
            list.remove(num);
            session.setAttribute("teacher_List",list);
            response.sendRedirect("../AdminTeacher.jsp");
        }else{
            List<UserBean>  list = ((List<UserBean>)session.getAttribute("student_List"));
            UserBean userBean = (UserBean)list.get(num);
            loginDao.operationuser("delete2",userBean);
            list.remove(num);
            session.setAttribute("student_List",list);
            response.sendRedirect("../AdminStudent.jsp");
        }

    }

    private void change(HttpServletRequest request, HttpServletResponse response, String action) throws IOException {
        HttpSession session = request.getSession();
        int number = (int) session.getAttribute("change_num");
        //System.out.println(number);

        LoginDao loginDao = new LoginDao();
        switch (action){
            case "teaChange" : {
                List<UserBean> tmp = (List<UserBean>)session.getAttribute("teacher_List");
                UserBean userBean = get_From_Front(request,"tea");
                userBean.setuser_name(tmp.get(number).getuser_name());

                if (loginDao.operationuser("modify3",userBean)){
                    System.out.println("修改成功");
                    tmp.set(number,userBean);
                    session.setAttribute("teacher_List",tmp);
                    response.sendRedirect("../AdminTeacher.jsp");
                }
                break;
            }
            case "stuChange" : {
                List<UserBean> tmp = (List<UserBean>)session.getAttribute("student_List");
                UserBean userBean = get_From_Front(request,"stu");
                userBean.setuser_name(tmp.get(number).getuser_name());
                if (loginDao.operationuser("modify2",userBean)){
                    System.out.println("修改成功");
                    tmp.set(number,userBean);
                    session.setAttribute("student_List",tmp);
                    response.sendRedirect("../AdminStudent.jsp");
                }
                break;
            }
            default:break;
        }


    }

    private UserBean get_From_Front(HttpServletRequest request,String user){
        UserBean userBean = new UserBean();
        userBean.setuser_name(request.getParameter("id"));
        if (request.getParameter("password") != null) userBean.setuser_password(request.getParameter("password"));
        else {
            HttpSession session = request.getSession();
            userBean.setuser_password(((UserBean)session.getAttribute("changing")).getuser_password());
        }
        userBean.setname(new String(request.getParameter("name").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));

        switch (user){
            case "tea" :{
                userBean.setuser_tea(new String(request.getParameter("major").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                userBean.setuser_data(request.getParameter("year"));
                userBean.setuser_identity("3");

                break;
            }
            case "stu" : {
                userBean.setuser_subject(new String(request.getParameter("major").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                userBean.setuser_class(request.getParameter("class"));
                userBean.setuser_identity("2");

                break;
            }
            default:break;
        }
        return userBean;
    }
    private void addStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        LoginDao loginDao = new LoginDao();
        HttpSession session = request.getSession();
        UserBean userBean = get_From_Front(request,"stu");
        //System.out.println(new String(userBean.getname().getBytes(StandardCharsets.UTF_8)));
        if (loginDao.operationuser("add2",userBean)){
            userBean.setuser_password(loginDao.secret(userBean.getuser_password()));
            List<UserBean> tmp = (List<UserBean>)session.getAttribute("student_List");
            tmp.add(userBean);
            session.setAttribute("student_List",tmp);
            response.sendRedirect("../AdminStudent.jsp");
        }
    }

    private void addTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        LoginDao loginDao = new LoginDao();
        HttpSession session = request.getSession();
        UserBean userBean = get_From_Front(request,"tea");
        if (loginDao.operationuser("add3",userBean)){
            userBean.setuser_password(loginDao.secret(userBean.getuser_password()));
            List<UserBean> tmp = (List<UserBean>)session.getAttribute("teacher_List");
            tmp.add(userBean);
            session.setAttribute("teacher_List",tmp);
            response.sendRedirect("../AdminTeacher.jsp");
        }
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("loginer");
        String for_password = request.getParameter("oldpass");
        String aft_password1 = request.getParameter("newpass1");
        String aft_password2 = request.getParameter("newpass2");
        LoginDao loginDao = new LoginDao();
        String message;
        if (!aft_password1.equals(aft_password2) || aft_password1.equals(userBean.getuser_password())||!for_password.equals(userBean.getuser_password())){
            /*message="原密码输入错误或前后两次输入的新密码不一致或新密码与原密码相同，请重新输入";
            request.getSession().setAttribute("message",message);*/
            if (userBean.getuser_identity().equals(2)) {
                response.sendRedirect("../stuPCsecret.jsp");
            }
            else{
                response.sendRedirect("../teaPCsecret.jsp");
            }
        }
        else{
            userBean.setuser_password(aft_password1);
            if (loginDao.changeserct(userBean)){
                /*message="密码修改成功";
                request.getSession().setAttribute("message",message);*/
                System.out.println("success");
                if (userBean.getuser_identity().equals(2)) {
                    response.sendRedirect("../stuPCinformation.jsp");
                }
                else{
                    response.sendRedirect("../teaPCinformation.jsp");
                }
            }
            else {
                /*message="密码修改失败,请重新尝试";
                request.getSession().setAttribute("message",message);*/
                if (userBean.getuser_identity().equals(2)) {
                    response.sendRedirect("../stuPCsecret.jsp");
                }
                else{
                    response.sendRedirect("../teaPCsecret.jsp");
                }
            }

        }
        //System.out.println(userBean.getuser_name() + " " + for_password + " "+ aft_password1 + " "+ aft_password2);
    }
}
