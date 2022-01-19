package com.fi.pj.member;

import java.util.Date;

public class UserMember {

	private int u_no;
	private String u_name;
	private String u_id;
	private String u_pw;
	private String u_email;
	private String u_address;
	private String u_phonenumber;
	private Date u_birth;
	private String u_picture;
	private int u_discount;

	
	public UserMember() {
		// TODO Auto-generated constructor stub
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public String getU_phonenumber() {
		return u_phonenumber;
	}

	public void setU_phonenumber(String u_phonenumber) {
		this.u_phonenumber = u_phonenumber;
	}

	public Date getU_birth() {
		return u_birth;
	}

	public void setU_birth(Date u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_picture() {
		return u_picture;
	}

	public void setU_picture(String u_picture) {
		this.u_picture = u_picture;
	}

	public int getU_discount() {
		return u_discount;
	}

	public void setU_discount(int u_discount) {
		this.u_discount = u_discount;
	}

	public UserMember(int u_no, String u_name, String u_id, String u_pw, String u_email, String u_address,
			String u_phonenumber, Date u_birth, String u_picture, int u_discount) {
		super();
		this.u_no = u_no;
		this.u_name = u_name;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_email = u_email;
		this.u_address = u_address;
		this.u_phonenumber = u_phonenumber;
		this.u_birth = u_birth;
		this.u_picture = u_picture;
		this.u_discount = u_discount;
	}

}
