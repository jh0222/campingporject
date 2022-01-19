package com.fi.pj.board;

import java.util.Date;

public class FbReply {
	private int fr_no;
	private int fr_f_no;
	private String fr_u_id;
	private int fr_owner_no;
	private String fr_owner_id;
	private String fr_replytxt;
	private Date fr_date;
	private int fr_depth;
	private String fr_picture;
	
	public FbReply() {
		// TODO Auto-generated constructor stub
	}

	public int getFr_no() {
		return fr_no;
	}

	public void setFr_no(int fr_no) {
		this.fr_no = fr_no;
	}

	public int getFr_f_no() {
		return fr_f_no;
	}

	public void setFr_f_no(int fr_f_no) {
		this.fr_f_no = fr_f_no;
	}

	public String getFr_u_id() {
		return fr_u_id;
	}

	public void setFr_u_id(String fr_u_id) {
		this.fr_u_id = fr_u_id;
	}

	public int getFr_owner_no() {
		return fr_owner_no;
	}

	public void setFr_owner_no(int fr_owner_no) {
		this.fr_owner_no = fr_owner_no;
	}

	public String getFr_owner_id() {
		return fr_owner_id;
	}

	public void setFr_owner_id(String fr_owner_id) {
		this.fr_owner_id = fr_owner_id;
	}

	public String getFr_replytxt() {
		return fr_replytxt;
	}

	public void setFr_replytxt(String fr_replytxt) {
		this.fr_replytxt = fr_replytxt;
	}

	public Date getFr_date() {
		return fr_date;
	}

	public void setFr_date(Date fr_date) {
		this.fr_date = fr_date;
	}

	public int getFr_depth() {
		return fr_depth;
	}

	public void setFr_depth(int fr_depth) {
		this.fr_depth = fr_depth;
	}

	public String getFr_picture() {
		return fr_picture;
	}

	public void setFr_picture(String fr_picture) {
		this.fr_picture = fr_picture;
	}

	public FbReply(int fr_no, int fr_f_no, String fr_u_id, int fr_owner_no, String fr_owner_id, String fr_replytxt,
			Date fr_date, int fr_depth, String fr_picture) {
		super();
		this.fr_no = fr_no;
		this.fr_f_no = fr_f_no;
		this.fr_u_id = fr_u_id;
		this.fr_owner_no = fr_owner_no;
		this.fr_owner_id = fr_owner_id;
		this.fr_replytxt = fr_replytxt;
		this.fr_date = fr_date;
		this.fr_depth = fr_depth;
		this.fr_picture = fr_picture;
	}

}
