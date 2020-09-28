package model;

//DAO패턴 연습 1. user_info테이블에 mapping하기 위한 User클래스

public class User {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String in_date;//가입일
	private String up_date; //변경일
	
	public User() {
		
	}
	public User(String user_id, String user_pw, String user_name, String user_email) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_email = user_email;

	}
	

	public User(String user_id, String user_pw, String user_name, String user_email, String in_date, String up_date) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_email = user_email;
		this.in_date = in_date;
		this.up_date = up_date;
	}


	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_email="
				+ user_email + ", in_date=" + in_date + ", up_date=" + up_date + "]";
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getIn_date() {
		return in_date;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}

	public String getUp_date() {
		return up_date;
	}

	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}
	
	
	
	
}
