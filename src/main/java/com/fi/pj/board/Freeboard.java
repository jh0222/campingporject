package com.fi.pj.board;

import java.util.Date;

public class Freeboard {
	private int f_no;
	private String f_u_id;
	private String f_subject;
	private String f_txt;
	private String f_picture;
	private int f_readcount;
	private Date f_date;
	
	public Freeboard() {
		// TODO Auto-generated constructor stub
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_u_id() {
		return f_u_id;
	}

	public void setF_u_id(String f_u_id) {
		this.f_u_id = f_u_id;
	}

	public String getF_subject() {
		return f_subject;
	}

	public void setF_subject(String f_subject) {
		this.f_subject = f_subject;
	}

	public String getF_txt() {
		return f_txt;
	}

	public void setF_txt(String f_txt) {
		this.f_txt = f_txt;
	}

	public String getF_picture() {
		return f_picture;
	}

	public void setF_picture(String f_picture) {
		this.f_picture = f_picture;
	}

	public int getF_readcount() {
		return f_readcount;
	}

	public void setF_readcount(int f_readcount) {
		this.f_readcount = f_readcount;
	}

	public Date getF_date() {
		return f_date;
	}

	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}

	public Freeboard(int f_no, String f_u_id, String f_subject, String f_txt, String f_picture, int f_readcount,
			Date f_date) {
		super();
		this.f_no = f_no;
		this.f_u_id = f_u_id;
		this.f_subject = f_subject;
		this.f_txt = f_txt;
		this.f_picture = f_picture;
		this.f_readcount = f_readcount;
		this.f_date = f_date;
	}
	

}
