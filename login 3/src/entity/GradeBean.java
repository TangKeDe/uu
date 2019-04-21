package entity;


import dao.LoginDao;

public class GradeBean {
	private int grade_id=-1;
	private String grade_student;
	private String grade_subject;
	private int grade_score;
	private UserBean stu;
	
	public UserBean getstu() {
		return stu;
	}
	public void setstu() {
		LoginDao s = new LoginDao();
		this.stu = s.serch_one("stu",this.grade_student);
	}
	public String getgrade_student() {
		return grade_student;
	}
	public void setgrade_student(String grade_student) {
		this.grade_student = grade_student;
	}
	public int getgrade_id() {
		return grade_id;
	}
	public void setgrade_id(int grade_id) {
		this.grade_id = grade_id;
	}
	
	public String getgrade_subject() {
		return grade_subject;
	}
	public void setgrade_subject(String grade_subject) {
		this.grade_subject = grade_subject;
	}
	public int getgrade_score() {
		return grade_score;
	}
	public void setgrade_score(int grade_score) {
		this.grade_score = grade_score;
	}
}
