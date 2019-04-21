package dao;

import common.DB;
import entity.SourceBean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class SourceDao {
	private DB connection = null;
	private SourceBean sourceBean = null;
	
	public SourceDao() {
		connection = new DB();
	}
	
	public boolean save_source(SourceBean sourcebean) {    //�������ݿ�
		String sql = null;
		if (sourcebean!=null)					//�����Ŀ
			sql = "insert into tb_course_material(material_subject,material_title," +  //��Ҫ���ݱ��������޸�  question_xx_x_x
					"material_file_link,material_teacher_account) values ('" 
				+sourcebean.getsubject()+"','"+ sourcebean.gettitle() + "','"+ sourcebean.getfile() + "','" 
				+ sourcebean.getup_user()+"')";
		/* ִ��SQL��� */	
		boolean flag =connection.executeUpdate(sql);
		return flag;
	}
	
	public List<SourceBean> getsource(String i) {
		List sourcelist = new ArrayList();
		String sql="";
		if(!i.equals(""))
		{
			sql = "select * from tb_course_material where material_subject='"+i+"'";
			System.out.println(sql);
			ResultSet rs = connection.executeQuery(sql);
			if(rs!=null){
				try {
					while (rs.next()) {
						/* ��ȡ������Ϣ */
						sourceBean = new SourceBean();
						sourceBean.setsource_num(rs.getInt(1));
						sourceBean.setsubject(rs.getString(2));
						sourceBean.settitle(rs.getString(3));
						sourceBean.setfile(rs.getString(4));
						sourceBean.setup_user(rs.getString(5));
						sourceBean.settea();

						sourcelist.add(sourceBean);
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
		return sourcelist;
	}
}
