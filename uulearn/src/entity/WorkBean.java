package entity;

import java.io.Serializable;

public class WorkBean {
	private String finaltime;
	private int itemnumber;
	private String item;
	private String content;
	private String teacher;
	private String title;

	public String gettitle() {
		return title;
	}
	public void settitle(String title) {
		this.title = title;
	}
	public String getteacher() {
		return teacher;
	}
	public void setteacher(String teacher) {
		this.teacher = teacher;
	}
	public String getfinaltime() {
		return finaltime;
	}
	public void setfinaltime(String finaltime) {
		this.finaltime = finaltime;
	}
	public int getitemnumber() {
		return itemnumber;
	}
	public void setitemnumber(int itemnumber) {
		this.itemnumber = itemnumber;
	}
	public String getitem() {
		return item;
	}
	public void setitem(String item) {
		this.item = item;
	}
	public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		this.content = content;
	}

}
