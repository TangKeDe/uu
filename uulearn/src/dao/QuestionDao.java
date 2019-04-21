package dao;

import common.DB;
import entity.CharterBean;
import entity.QuestionBean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Arrays;


public class QuestionDao {
	private DB connection = null;
	private QuestionBean questionBean = null;

	public QuestionDao() {
		connection = new DB();
	}


	public static int[] randomArray(int min,int max,int n){  
	    int len = max-min+1;  
	      
	    if(max < min || n > len){  
	        return null;  
	    }  
	      
	    //��ʼ��������Χ�Ĵ�ѡ����  
	    int[] source = new int[len];  
	       for (int i = min; i < min+len; i++){  
	        source[i-min] = i;  
	       }  
	         
	       int[] result = new int[n];  
	       Random rd = new Random();  
	       int index = 0;  
	       for (int i = 0; i < result.length; i++) {  
	        //��ѡ����0��(len-2)���һ���±�  
	           index = Math.abs(rd.nextInt() % len--);  
	           //�������������������  
	           result[i] = source[index];  
	           //����ѡ�����б�������������ô�ѡ����(len-1)�±��Ӧ�����滻  
	           source[index] = source[len];  
	       }  
	       return result;  
	}  
	
	
	public void acquireinformation(final List questionlist,String sql) {
		ResultSet rs = connection.executeQuery(sql);
		if(rs!=null){
			try {
				while (rs.next()) {
					/* ��ȡ������Ϣ */
					questionBean = new QuestionBean();
					questionBean.setId(rs.getInt(1));
					questionBean.setContent(rs.getString(2));
					questionBean.setanswer1(rs.getString(3));
					questionBean.setanswer2(rs.getString(4));
					questionBean.setanswer3(rs.getString(5));					
					questionBean.setanswer4(rs.getString(6));
					questionBean.settrueanswer(rs.getString(7));
					//questionBean.setexplaination(rs.getString(8));

					questionlist.add(questionBean);
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

	public List<QuestionBean> getQuestion(List typeId) {
		List questionlist = new ArrayList();
		String sql = "";
		int number = typeId.size();
		if(number>=20)
		{
			int[] ti=randomArray(1,number,20);
			assert ti != null;
			Arrays.sort(ti);
			for(int i=0;i<20;i++)
			{	
				sql="select * from question_"+typeId.get(ti[i]-1)+" order by RAND() limit 1";
				acquireinformation(questionlist,sql);
			}
		}
		else {
			int min=20/number;
			int[] tt=randomArray(1,number,20%number);
			assert tt != null;
			Arrays.sort(tt);
			for(int i=0;i<number;i++)
			{
				int xx=min;
				if(Arrays.binarySearch(tt,i+1)>=0) {
					xx=xx+1;
				}
				sql="select * from question_"+typeId.get(i)+" order by RAND() limit "+String.valueOf(xx);
				acquireinformation(questionlist,sql);
			}
		}
		return questionlist;
	}

	public boolean insertquestion(String oper,String unit,QuestionBean questionBean) {
		/* 生成SQL语句 */
		String sql = null;
		CharterBean cc = new CharterBean();
		CharterDao dd = new CharterDao();
		cc = dd.get_charter_1(oper,"question_"+oper+"_1_"+unit);
		if (oper!="")					//添加题目
			sql = "insert into question_"+oper+"_1_"+unit+"(num,question,a," +  //需要根据表内属性修改  question_xx_x_x
					"b,c,d,ans) values ("
					+String.valueOf(cc.getnumber()+1)+",'"+ questionBean.getContent() + "','"+ questionBean.getanswer1() + "','"
					+ questionBean.getanswer2() + "','"+ questionBean.getanswer3()+ "','"
					+ questionBean.getanswer4()+ "','" + questionBean.gettrueanswer()+ "')";
		/* 执行SQL语句 */
		boolean flag =connection.executeUpdate(sql);
		if(flag) dd.updata(oper, 1, cc);
		return flag;
	}
}
