package com.fi.pj.member;

public class LoginMember {
	public String id;
	public String pw;
	
	public LoginMember() {
		// TODO Auto-generated constructor stub
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

	public LoginMember(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}
	
	
}
