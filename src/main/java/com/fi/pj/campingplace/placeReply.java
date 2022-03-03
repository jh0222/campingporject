package com.fi.pj.campingplace;

import java.util.Date;

public class placeReply {
	private int cr_no;
	private int cr_c_no;
	private int cr_cam_no;
	private String cr_bo_id;
	private String cr_replytxt;
	private Date cr_date;
	
	public placeReply() {
		// TODO Auto-generated constructor stub
	}

	public placeReply(int cr_no, int cr_c_no, int cr_cam_no, String cr_bo_id, String cr_replytxt, Date cr_date) {
		super();
		this.cr_no = cr_no;
		this.cr_c_no = cr_c_no;
		this.cr_cam_no = cr_cam_no;
		this.cr_bo_id = cr_bo_id;
		this.cr_replytxt = cr_replytxt;
		this.cr_date = cr_date;
	}

	public int getCr_no() {
		return cr_no;
	}

	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}

	public int getCr_c_no() {
		return cr_c_no;
	}

	public void setCr_c_no(int cr_c_no) {
		this.cr_c_no = cr_c_no;
	}

	public int getCr_cam_no() {
		return cr_cam_no;
	}

	public void setCr_cam_no(int cr_cam_no) {
		this.cr_cam_no = cr_cam_no;
	}

	public String getCr_bo_id() {
		return cr_bo_id;
	}

	public void setCr_bo_id(String cr_bo_id) {
		this.cr_bo_id = cr_bo_id;
	}

	public String getCr_replytxt() {
		return cr_replytxt;
	}

	public void setCr_replytxt(String cr_replytxt) {
		this.cr_replytxt = cr_replytxt;
	}

	public Date getCr_date() {
		return cr_date;
	}

	public void setCr_date(Date cr_date) {
		this.cr_date = cr_date;
	}

}
