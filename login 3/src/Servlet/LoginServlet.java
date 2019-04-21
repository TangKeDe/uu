package Servlet;

import dao.GradeDao;
import dao.LoginDao;
import dao.ResultDao;
import entity.GradeBean;
import entity.ResultBean;
import entity.UserBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public class LoginServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * <p>
	 * This method is called when a form has its tag value method equals to get.
	 *
	 * @param request  the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException      if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action == null)
			action = "";
		if (action.equals("islogin")) {
			this.isLogin(request, response);
		}
		if (action.equals("login")) {
			try {
				this.login(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (action.equals("logout")) {
			this.logout(request, response);
		}
	}

	public void isLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String forward = "";
		HttpSession session = request.getSession();
		if (session.getAttribute("loginer") != null)
			forward = "admin/AdminIndex.jsp";
		else
			forward = "admin/login.jsp";
		response.sendRedirect(forward);
	}

	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		LoginDao masterDao = new LoginDao();
		UserBean loginer = new UserBean();
		String name = request.getParameter("userName");

		String password = request.getParameter("userPass");
		String[] type = request.getParameterValues("userType");

		String iden = "";
		if (type == null){iden = "1";}
		else{
			iden = type[0].equals("teacher") ? "3" : (type[0].equals("student") ? "2" : "1");
		}
		loginer.setuser_name(name);
		loginer.setuser_password(password);
		loginer.setuser_identity(iden);
		UserBean userBean = masterDao.login(loginer);
		if (userBean == null) {
			response.sendRedirect("../loginfaired.jsp");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginer", loginer);

			if (iden.equals("2")){
				String stu_number = loginer.getuser_name();
				GradeDao gradeDao = new GradeDao();
				List<GradeBean> gradeBeanList = gradeDao.getgrade(stu_number);
				session.setAttribute("my_Score",gradeBeanList);
				response.sendRedirect("../home.jsp");
			}
			else if(iden.equals("3")){
				ResultDao resultDao = new ResultDao();
				List<ResultBean> resultBeans = resultDao.getsubject_homework(userBean.getuser_tea());
				session.setAttribute("resultList",resultBeans);
				response.sendRedirect("../teacherhome.jsp");
			}
			else{
                List<UserBean> stu_List = masterDao.get_Userlist("stu");
                List<UserBean> tea_List = masterDao.get_Userlist("tea");
                session.setAttribute("teacher_List",tea_List);
                session.setAttribute("student_List",stu_List);
				response.sendRedirect("../AdminMain.jsp");
            }
		}


	}

	private void Load_Answer(HttpServletRequest request, HttpServletResponse response) {

	}

	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("loginer");
		RequestDispatcher rd = request.getRequestDispatcher("/IndexServlet");
		rd.forward(request, response);
	}


	/**
	 * The doPost method of the servlet. <br>
	 * <p>
	 * This method is called when a form has its tag value method equals to post.
	 *
	 * @param request  the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException      if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
