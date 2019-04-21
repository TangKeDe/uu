package entity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class UserBean implements Serializable {
	private String user_name;          //帐号
	private String user_num="";				//
	private String user_class="";				//学生班级
	private String user_password="";			//密码
	private int subjectnumber = 0;			//学科数
	private Map<String,String> score = new HashMap<>();
	private String user_identity="-1";     //用户类型  学生还是老师  1管理员2学生3老师
	private String name;                   //姓名
	private String user_subject="";			//专业
	private String user_tea="";				//教的科目
	private String user_data="";     //入职年份

	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	public String getuser_subject() {
		return user_subject;
	}
	public void setuser_subject(String user_subject) {
		this.user_subject = user_subject;
	}
	public String getuser_tea() {
		return user_tea;
	}
	public void setuser_tea(String user_tea) {
		this.user_tea = user_tea;
	}
	public String getuser_data() {
		return user_data;
	}
	public void setuser_data(String user_data) {
		this.user_data = user_data;
	}
	public void addscore(String subject,String score)
	{
		this.score.put(subject,score);
	}
	public String getscore(String subject) {
		return score.getOrDefault(subject,"none");
	}
	public Map getallscore() {
		return score;
	}
	public int getsubjectnumber() {
		return subjectnumber;
	}
	public void setsubjectnumber(int subjectnumber) {
		this.subjectnumber = subjectnumber;
	}
	public String getuser_name() {
		return user_name;
	}
	public void setuser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getuser_num() {
		return user_num;
	}
	public void setuser_num(String user_num) {
		this.user_num = user_num;
	}
	public String getuser_class() {
		return user_class;
	}
	public void setuser_class(String user_class) {
		this.user_class = user_class;
	}
	public String getuser_password() {
		return user_password;
	}
	public void setuser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getuser_identity() {
		return user_identity;
	}
	public void setuser_identity(String user_identity) {
		this.user_identity = user_identity;
	}
	//如果要加密的话，加密函数加在这，bean里直接存加密后的函数
}

