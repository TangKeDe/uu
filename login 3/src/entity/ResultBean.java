package entity;

import dao.LoginDao;
import dao.WorkDao;

public class ResultBean {
	private String submittime;
	private String rider="";    //附加文件
	private String content;
	private String stu_num;
	private int itemnumber;
	private String homework_ans_subject;
	private UserBean stu;
	private WorkBean work;

	public WorkBean getwork() {
		return work;
	}
	public void setwork() {
		WorkDao s = new WorkDao();
		this.work = s.gethomework(this.itemnumber);
	}
	public UserBean getstu() {
		return stu;
	}
	public void setstu() {
		LoginDao s = new LoginDao();
		this.stu = s.serch_one("stu",this.stu_num);
	}
	public String gethomework_ans_subject() {
		return homework_ans_subject;
	}
	public void sethomework_ans_subject(String homework_ans_subject) {
		this.homework_ans_subject = homework_ans_subject;
	}
	public String getstu_num() {
		return stu_num;
	}
	public void setstu_num(String stu_num) {
		this.stu_num = stu_num;
	}
	public int getitemnumber() {
		return itemnumber;
	}
	public void setitemnumber(int itemnumber) {
		this.itemnumber = itemnumber;
	}
	public String getsubmittime() {
		return submittime;
	}
	public void setsubmittime(String submittime) {
		this.submittime = submittime;
	}
	public String getrider() {
		return rider;
	}
	public void setrider(String rider) {
		this.rider = rider;
	}
	public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		this.content = content;
	}
}
