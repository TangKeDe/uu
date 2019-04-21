package dao;

import common.DB;
import entity.WorkBean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class WorkDao {
	private DB connection = null;
	private WorkBean workBean = null;

	public WorkDao() {
		connection = new DB();
	}

	public boolean SendWork(WorkBean workbean) {    //存入数据库
		String sql = null;
		if (workbean!=null)					//添加题目
			sql = "insert into tb_homework(homework_subject,homework_question," +  //需要根据表内属性修改  question_xx_x_x
					"homework_date,homework_teacher_account,homework_title) values ('"
					+workbean.getitem()+"','"+ workbean.getcontent() + "','"+ workbean.getfinaltime() + "','"
					+ workbean.getteacher()+"','"+workbean.gettitle()+ "')";
		/* 执行SQL语句 */
		boolean flag =connection.executeUpdate(sql);
		if(flag) {
			sql = "select * from tb_homework where homework_subject='"+workbean.getitem()+"' and homework_question='"
					+workbean.getcontent()+"' and homework_date='"+workbean.getfinaltime()+"' and homework_teacher_account='"
					+workbean.getteacher()+"' and homework_title='"+workbean.gettitle()+"'";
			ResultSet rs=connection.executeQuery(sql);
			//System.out.println("11");
			try {
				if(rs!=null&&rs.next())
				{
					workbean.setitemnumber(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
				connection.closed();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	//老师看题目
	public List<WorkBean> gethomework_teacher(String i) {
		List worklist = new ArrayList();
		String sql="";
		if(!i.equals(""))
		{
			sql = "select * from tb_homework where homework_subject ='"+i+"';";

			ResultSet rs = connection.executeQuery(sql);
			if(rs!=null){
				try {
					while (rs.next()) {
						/* 获取文章信息 */
						workBean = new WorkBean();
						workBean.setitemnumber(rs.getInt(1));
						workBean.setitem(rs.getString(2));
						workBean.setcontent(rs.getString(3));
						workBean.setfinaltime(rs.getString(4));
						workBean.setteacher(rs.getString(5));
						workBean.settitle(rs.getString(6));

						worklist.add(workBean);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally{
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					connection.closed();
				}
			}
		}
		return worklist;
	}

	//查一道题
	public WorkBean gethomework(int i) {
		String sql="";
		if(i>0)
		{
			sql = "select * from tb_homework where homework_id="+String.valueOf(i);
			ResultSet rs = connection.executeQuery(sql);
			if(rs!=null){
				try {
					while (rs.next()) {
						/* 获取文章信息 */
						workBean = new WorkBean();
						workBean.setitemnumber(rs.getInt(1));
						workBean.setitem(rs.getString(2));
						workBean.setcontent(rs.getString(3));
						workBean.setfinaltime(rs.getString(4));
						workBean.setteacher(rs.getString(5));
						workBean.settitle(rs.getString(6));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally{
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					connection.closed();
				}
			}
		}
		return workBean;
	}
}
