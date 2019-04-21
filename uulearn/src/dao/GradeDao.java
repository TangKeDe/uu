package dao;

import common.DB;
import entity.GradeBean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Arrays;



public class GradeDao {
	private DB connection = null;
	private GradeBean gradeBean =null;
	
	public GradeDao() {
		connection = new DB();
	}
	
	public boolean save_grade(GradeBean gradebean) {
		String sql = null;
		if (gradebean!=null)					//�����Ŀ
			sql = "insert into tb_grade(grade_student,grade_subject,"   //��Ҫ���ݱ��������޸�  question_xx_x_x
					+"grade_score) values ('" +gradebean.getgrade_student()+"','"+ gradebean.getgrade_subject() + "',"+gradebean.getgrade_score() +")";
		/* ִ��SQL��� */	
		boolean flag =connection.executeUpdate(sql);
		return flag;
	}
	
	public List getgrade(String i) {
		List gradelist = new ArrayList();
		String sql="";
		if(i!="")
		{
			sql = "select * from tb_grade where grade_student='"+i+"' order  by grade_id ASC";
			ResultSet rs = connection.executeQuery(sql);
			if(rs!=null){
				try {
					while (rs.next()) {
						/* ��ȡ������Ϣ */
						gradeBean = new GradeBean();
						gradeBean.setgrade_id(rs.getInt(1));
						gradeBean.setgrade_student(rs.getString(2));
						gradeBean.setgrade_subject(rs.getString(3));
						gradeBean.setgrade_score(rs.getInt(4));
						gradeBean.setstu();

						gradelist.add(gradeBean);
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
		return gradelist;
	}
}
