package com.fi.pj.member;

import java.util.Date;

public class BossMember {
	private int bo_no;
	private String bo_name;
	private String bo_id;
	private String bo_pw;
	private String bo_email;
	private String bo_address;
	private String bo_phonenumber;
	private Date bo_birth;
	private String bo_picture;
	private int bo_discount;
	
	public BossMember() {
		// TODO Auto-generated constructor stub
	}

	public int getBo_no() {
		return bo_no;
	}

	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}

	public String getBo_name() {
		return bo_name;
	}

	public void setBo_name(String bo_name) {
		this.bo_name = bo_name;
	}

	public String getBo_id() {
		return bo_id;
	}

	public void setBo_id(String bo_id) {
		this.bo_id = bo_id;
	}

	public String getBo_pw() {
		return bo_pw;
	}

	public void setBo_pw(String bo_pw) {
		this.bo_pw = bo_pw;
	}

	public String getBo_email() {
		return bo_email;
	}

	public void setBo_email(String bo_email) {
		this.bo_email = bo_email;
	}

	public String getBo_address() {
		return bo_address;
	}

	public void setBo_address(String bo_address) {
		this.bo_address = bo_address;
	}

	public String getBo_phonenumber() {
		return bo_phonenumber;
	}

	public void setBo_phonenumber(String bo_phonenumber) {
		this.bo_phonenumber = bo_phonenumber;
	}

	public Date getBo_birth() {
		return bo_birth;
	}

	public void setBo_birth(Date bo_birth) {
		this.bo_birth = bo_birth;
	}

	public String getBo_picture() {
		return bo_picture;
	}

	public void setBo_picture(String bo_picture) {
		this.bo_picture = bo_picture;
	}

	public int getBo_discount() {
		return bo_discount;
	}

	public void setBo_discount(int bo_discount) {
		this.bo_discount = bo_discount;
	}

	public BossMember(int bo_no, String bo_name, String bo_id, String bo_pw, String bo_email, String bo_address,
			String bo_phonenumber, Date bo_birth, String bo_picture, int bo_discount) {
		super();
		this.bo_no = bo_no;
		this.bo_name = bo_name;
		this.bo_id = bo_id;
		this.bo_pw = bo_pw;
		this.bo_email = bo_email;
		this.bo_address = bo_address;
		this.bo_phonenumber = bo_phonenumber;
		this.bo_birth = bo_birth;
		this.bo_picture = bo_picture;
		this.bo_discount = bo_discount;
	}

	
}
