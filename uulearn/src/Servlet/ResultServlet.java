package Servlet;

import dao.WorkDao;
import entity.ResultBean;
import entity.SourceBean;
import entity.UserBean;
import entity.WorkBean;
import sun.nio.cs.ISO_8859_2;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import static java.nio.charset.StandardCharsets.ISO_8859_1;
import static java.nio.charset.StandardCharsets.UTF_8;

public class ResultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null)
            action = "";
        if (action.substring(0,3).equals("V_R")) {
            this.view_Result(request, response,action);
        }else if (action.substring(0,4).equals("work")){
            this.submit_work(request,response,action);
        }else if(action.substring(0,8).equals("material")){
            this.get_Material(request,response,action);
        }
    }

    private void get_Material(HttpServletRequest request, HttpServletResponse response, String action) throws IOException {
        int num = Integer.parseInt(action.substring(8));
        HttpSession session = request.getSession();
        List<SourceBean> list = (List<SourceBean>) session.getAttribute("Source_List");
        session.setAttribute("tmp_Material",list.get(num));
        response.sendRedirect("../materialLearning.jsp");

    }

    private void submit_work(HttpServletRequest request, HttpServletResponse response, String action) throws IOException {
        if (action.substring(4).equals("_submit")){
            WorkBean workBean = new WorkBean();
            workBean.settitle(new String(request.getParameter("chapter").getBytes(ISO_8859_1),UTF_8));
            workBean.setfinaltime( request.getParameter("user_date"));
            workBean.setcontent(new String(request.getParameter("content").getBytes(ISO_8859_1),UTF_8)) ;
            HttpSession session = request.getSession();
            UserBean userBean = (UserBean) session.getAttribute("loginer");
            workBean.setitem(userBean.getuser_tea());
            workBean.setteacher(userBean.getuser_name());
            WorkDao workDao = new WorkDao();
            workDao.SendWork(workBean);

        }else{

        }
        response.sendRedirect("../teacherhome.jsp");
    }

    private void view_Result(HttpServletRequest request, HttpServletResponse response, String action) throws IOException {
        int num = Integer.valueOf(action.substring(3));
        HttpSession session = request.getSession();
        List<ResultBean> resultBeans = (List<ResultBean>) session.getAttribute("resultList");
        ResultBean resultBean = resultBeans.get(num);
        session.setAttribute("resultBean",resultBean);
        response.sendRedirect("../HandonContent.jsp");
    }
}
