package dao;

import common.DB;
import entity.ResultBean;

import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Arrays;

import static java.nio.charset.StandardCharsets.*;


public class ResultDao {
	private DB connection = null;
	//private ResultBean resultBean = null;

	public ResultDao() {
		connection = new DB();
	}

	public boolean SubmitWork(ResultBean resultbean) {
		String sql = null;
		if (resultbean!=null)					//添加题目
			sql = "insert into tb_homework_ans(homework_ans_text,homework_ans_doc," +  //需要根据表内属性修改  question_xx_x_x
					"ans_student_id,homework_up_date,ans_homework_id,homework_ans_subject) values ('"
					+resultbean.getcontent()+"','"+ resultbean.getrider() + "','"+ resultbean.getstu_num() + "','"
					+ resultbean.getsubmittime()+"',"+resultbean.getitemnumber()+ ",'"+resultbean.gethomework_ans_subject()+"')";
		/* 执行SQL语句 */
		System.out.println(sql);
		boolean flag =connection.executeUpdate(sql);
		return flag;
	}

	//老师看作业
	public List gethomework_teacher(int i) {
		List resultlist = new ArrayList();
		String sql="";
		if(i>0)
		{
			sql = "select * from tb_homework_ans where ans_homework_id="+String.valueOf(i);
			ResultSet rs = connection.executeQuery(sql);
			if(rs!=null){
				try {
					while (rs.next()) {
						/* 获取文章信息 */
						ResultBean resultBean = new ResultBean();
						resultBean.setcontent(rs.getString(1));
						resultBean.setrider(rs.getString(2));
						resultBean.setstu_num(rs.getString(3));
						resultBean.setsubmittime(rs.getString(4));
						resultBean.setitemnumber(rs.getInt(5));
						resultBean.sethomework_ans_subject(rs.getString(6));
						resultBean.setstu();
						resultBean.setwork();

						resultlist.add(resultBean);
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
		return resultlist;
	}

	//学生看作业
	public List gethomework_stu(String i) {
		List resultlist = new ArrayList();
		String sql="";
		if(i!="")
		{
			sql = "select * from tb_homework_ans where ans_student_id='"+i+"'";
			ResultSet rs = connection.executeQuery(sql);
			if(rs!=null){
				try {
					while (rs.next()) {
						/* 获取文章信息 */
						ResultBean resultBean = new ResultBean();
						resultBean.setcontent(rs.getString(1));
						resultBean.setrider(rs.getString(2));
						resultBean.setstu_num(rs.getString(3));
						resultBean.setsubmittime(rs.getString(4));
						resultBean.setitemnumber(rs.getInt(5));
						resultBean.sethomework_ans_subject(rs.getString(6));
						resultBean.setstu();
						resultBean.setwork();

						resultlist.add(resultBean);
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
		return resultlist;
	}

	//学科作业
	public List getsubject_homework(String i) throws UnsupportedEncodingException {
		List resultlist = new ArrayList();
		String sql="";
		if(!i.equals(""))
		{
			sql = "select * from tb_homework_ans where homework_ans_subject= '"+i+"' order by ans_homework_id ASC";
			//System.out.println(sql);
			ResultSet rs = connection.executeQuery(sql);
			if(rs!=null){
				try {
					while (rs.next()) {
						/* 获取文章信息 */

						ResultBean resultBean = new ResultBean();
						resultBean.setcontent(rs.getString(1));
						resultBean.setrider(rs.getString(2));
						resultBean.setstu_num(rs.getString(3));
						resultBean.setsubmittime(rs.getString(4));
						resultBean.setitemnumber(rs.getInt(5));
						resultBean.sethomework_ans_subject(rs.getString(6));
						resultBean.setstu();
						resultBean.setwork();
						resultlist.add(resultBean);
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
		return resultlist;
	}

}
