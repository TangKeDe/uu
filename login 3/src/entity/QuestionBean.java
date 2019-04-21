package entity;

public class QuestionBean {
	private int id=-1;
	private int typeId=-1;
	private String content="";
	private String answer1="";
	private String answer2="";
	private String answer3="";
	private String answer4="";
	private String trueanswer="";
	private String explaination = "";
	private String youranswer = "";
	

	

	public String getContent() {		
		return content;
	}	
	
	public String getCutContent(){
		int len=content.length();
		if(len<=50)
			return content;
		return content.substring(0,50)+"...";	
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getanswer1() {
		return answer1;
	}
	public void setanswer1(String answer1) {
		this.answer1 = answer1;
	}	
	public String getanswer2() {
		return answer2;
	}
	public void setanswer2(String answer2) {
		this.answer2 = answer2;
	}	
	public String getanswer3() {
		return answer3;
	}
	public void setanswer3(String answer3) {
		this.answer3 = answer3;
	}	
	public String getanswer4() {
		return answer4;
	}
	public void setanswer4(String answer4) {
		this.answer4 = answer4;
	}	
	public String gettrueanswer() {
		return trueanswer;
	}
	public void settrueanswer(String trueanswer) {
		this.trueanswer = trueanswer;
	}	
	public String getexplaination() {
		return explaination;
	}
	public void setexplaination(String explaination) {
		this.explaination = explaination;
	}

    public void setyouranswer(String s) {
	    this.youranswer = s;
    }

    public String getyouranswer() {
	    return this.youranswer;
    }
}
