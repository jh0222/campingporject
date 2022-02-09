package com.fi.pj.board;

import java.util.Date;

public class Membersession {
	private int no;
	private String name;
	public String id;
	public String pw;
	public String email;
	public String address;
	public String phonenumber;
	public Date birth;
	public String picture;
	public int discount;
	
	public Membersession() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public Membersession(int no, String name, String id, String pw, String email, String address, String phonenumber,
			Date birth, String picture, int discount) {
		super();
		this.no = no;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.address = address;
		this.phonenumber = phonenumber;
		this.birth = birth;
		this.picture = picture;
		this.discount = discount;
	}
	
	
	
}
