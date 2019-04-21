package entity;


import dao.LoginDao;

public class SourceBean {
	private String up_time;
	private int source_num;
	private String subject;
	private String file;
	private String up_user;
	private String title;
	private UserBean tea;
	
	public String gettitle() {
		return title;
	}
	public void settitle(String title) {
		this.title = title;
	}
	public String getup_user() {
		return up_user;
	}
	public void setup_user(String up_user) {
		this.up_user = up_user;
	}
	public String getup_time() {
		return up_time;
	}
	public void setup_time(String up_time) {
		this.up_time = up_time;
	}
	public int getsource_num() {
		return source_num;
	}
	public void setsource_num(int source_num) {
		this.source_num = source_num;
	}
	public String getsubject() {
		return subject;
	}
	public void setsubject(String subject) {
		this.subject = subject;
	}
	public String getfile() {
		return file;
	}
	public void setfile(String file) {
		this.file = file;
	}
	public UserBean gettea() {
		return tea;
	}
	public void settea() {
		LoginDao s = new LoginDao();
		this.tea = s.serch_one("tea",this.up_user);
	}	
}
