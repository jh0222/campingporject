package com.fi.pj.member;

public class Login {
	public String id;
	public String pw;
	public String name;
	public String phonenumber;
	
	public Login() {
		// TODO Auto-generated constructor stub
	}

	public Login(String id, String pw, String name, String phonenumber) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phonenumber = phonenumber;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	
}
