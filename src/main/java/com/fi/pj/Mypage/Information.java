package com.fi.pj.Mypage;

import java.util.Date;

public class Information {
	private String root_id;
	private String root_pw;
	private String root_name;
	private String root_picture;
	
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
	
	public Information() {
		// TODO Auto-generated constructor stub
	}
	
	public Information(String root_id, String root_pw, String root_name, String root_picture, int u_no, String u_name,
			String u_id, String u_pw, String u_email, String u_address, String u_phonenumber, Date u_birth,
			String u_picture, int u_discount, int bo_no, String bo_name, String bo_id, String bo_pw, String bo_email,
			String bo_address, String bo_phonenumber, Date bo_birth, String bo_picture, int bo_discount) {
		super();
		this.root_id = root_id;
		this.root_pw = root_pw;
		this.root_name = root_name;
		this.root_picture = root_picture;
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
	public void setRoot_picture(String root_priture) {
		this.root_picture = root_priture;
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
	
}
