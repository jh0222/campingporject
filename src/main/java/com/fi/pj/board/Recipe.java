package com.fi.pj.board;

import java.util.Date;

public class Recipe {
	private int rb_no;
	private String rb_u_id;
	private String rb_subject;
	private String rb_txt;
	private String rb_picture;
	private int rb_readcount;
	private Date rb_date;
	
	public Recipe() {
		// TODO Auto-generated constructor stub
	}

	public Recipe(int rb_no, String rb_u_id, String rb_subject, String rb_txt, String rb_picture, int rb_readcount,
			Date rb_date) {
		super();
		this.rb_no = rb_no;
		this.rb_u_id = rb_u_id;
		this.rb_subject = rb_subject;
		this.rb_txt = rb_txt;
		this.rb_picture = rb_picture;
		this.rb_readcount = rb_readcount;
		this.rb_date = rb_date;
	}

	public int getRb_no() {
		return rb_no;
	}

	public void setRb_no(int rb_no) {
		this.rb_no = rb_no;
	}

	public String getRb_u_id() {
		return rb_u_id;
	}

	public void setRb_u_id(String rb_u_id) {
		this.rb_u_id = rb_u_id;
	}

	public String getRb_subject() {
		return rb_subject;
	}

	public void setRb_subject(String rb_subject) {
		this.rb_subject = rb_subject;
	}

	public String getRb_txt() {
		return rb_txt;
	}

	public void setRb_txt(String rb_txt) {
		this.rb_txt = rb_txt;
	}

	public String getRb_picture() {
		return rb_picture;
	}

	public void setRb_picture(String rb_picture) {
		this.rb_picture = rb_picture;
	}

	public int getRb_readcount() {
		return rb_readcount;
	}

	public void setRb_readcount(int rb_readcount) {
		this.rb_readcount = rb_readcount;
	}

	public Date getRb_date() {
		return rb_date;
	}

	public void setRb_date(Date rb_date) {
		this.rb_date = rb_date;
	}
	
}
