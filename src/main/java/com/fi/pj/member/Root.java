package com.fi.pj.member;

public class Root {
	private String root_id;
	private String root_pw;
	private String root_name;
	private String root_picture;
	
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

	public String getRoot_name() {
		return root_name;
	}

	public void setRoot_name(String root_name) {
		this.root_name = root_name;
	}

	public String getRoot_picture() {
		return root_picture;
	}

	public void setRoot_picture(String root_picture) {
		this.root_picture = root_picture;
	}

	public Root(String root_id, String root_pw, String root_name, String root_picture) {
		super();
		this.root_id = root_id;
		this.root_pw = root_pw;
		this.root_name = root_name;
		this.root_picture = root_picture;
	}

}
