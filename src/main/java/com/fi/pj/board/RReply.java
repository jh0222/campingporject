package com.fi.pj.board;

import java.util.Date;

public class RReply {
	private int rr_no;
	private int rr_rb_no;
	private String rr_u_id;
	private int rr_owner_no;
	private String rr_owner_id;
	private String rr_replytxt;
	private Date rr_date;
	private int rr_depth;
	private String rr_picture;
	private int cnt;
	public RReply() {
		// TODO Auto-generated constructor stub
	}
	public int getRr_no() {
		return rr_no;
	}
	public void setRr_no(int rr_no) {
		this.rr_no = rr_no;
	}
	public int getRr_rb_no() {
		return rr_rb_no;
	}
	public void setRr_rb_no(int rr_rb_no) {
		this.rr_rb_no = rr_rb_no;
	}
	public String getRr_u_id() {
		return rr_u_id;
	}
	public void setRr_u_id(String rr_u_id) {
		this.rr_u_id = rr_u_id;
	}
	public int getRr_owner_no() {
		return rr_owner_no;
	}
	public void setRr_owner_no(int rr_owner_no) {
		this.rr_owner_no = rr_owner_no;
	}
	public String getRr_owner_id() {
		return rr_owner_id;
	}
	public void setRr_owner_id(String rr_owner_id) {
		this.rr_owner_id = rr_owner_id;
	}
	public String getRr_replytxt() {
		return rr_replytxt;
	}
	public void setRr_replytxt(String rr_replytxt) {
		this.rr_replytxt = rr_replytxt;
	}
	public Date getRr_date() {
		return rr_date;
	}
	public void setRr_date(Date rr_date) {
		this.rr_date = rr_date;
	}
	public int getRr_depth() {
		return rr_depth;
	}
	public void setRr_depth(int rr_depth) {
		this.rr_depth = rr_depth;
	}
	public String getRr_picture() {
		return rr_picture;
	}
	public void setRr_picture(String rr_picture) {
		this.rr_picture = rr_picture;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public RReply(int rr_no, int rr_rb_no, String rr_u_id, int rr_owner_no, String rr_owner_id, String rr_replytxt,
			Date rr_date, int rr_depth, String rr_picture, int cnt) {
		super();
		this.rr_no = rr_no;
		this.rr_rb_no = rr_rb_no;
		this.rr_u_id = rr_u_id;
		this.rr_owner_no = rr_owner_no;
		this.rr_owner_id = rr_owner_id;
		this.rr_replytxt = rr_replytxt;
		this.rr_date = rr_date;
		this.rr_depth = rr_depth;
		this.rr_picture = rr_picture;
		this.cnt = cnt;
	}
	
	
}
