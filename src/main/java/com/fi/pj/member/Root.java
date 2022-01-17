package com.fi.pj.member;

public class Root {
	private String root_id;
	private String root_pw;
	
	public Root() {
		// TODO Auto-generated constructor stub
	}

	public String getRoot_id() {
		return root_id;
	}

	public void setRoot_id(String root_id) {
		this.root_id = root_id;
	}

	public String getRoot_pw() {
		return root_pw;
	}

	public void setRoot_pw(String root_pw) {
		this.root_pw = root_pw;
	}

	public Root(String root_id, String root_pw) {
		super();
		this.root_id = root_id;
		this.root_pw = root_pw;
	}
	
}
