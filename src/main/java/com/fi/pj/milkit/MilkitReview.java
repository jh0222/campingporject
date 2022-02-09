package com.fi.pj.milkit;

import java.util.Date;

public class MilkitReview {
	private int fpr_no;
	private int fpr_fp_no;
	private String fpr_u_bo_id;
	private String fpr_txt;
	private Date fpr_date;
	
	public MilkitReview() {
		// TODO Auto-generated constructor stub
	}

	public MilkitReview(int fpr_no, int fpr_fp_no, String fpr_u_bo_id, String fpr_txt, Date fpr_date) {
		super();
		this.fpr_no = fpr_no;
		this.fpr_fp_no = fpr_fp_no;
		this.fpr_u_bo_id = fpr_u_bo_id;
		this.fpr_txt = fpr_txt;
		this.fpr_date = fpr_date;
	}

	public int getFpr_no() {
		return fpr_no;
	}

	public void setFpr_no(int fpr_no) {
		this.fpr_no = fpr_no;
	}

	public int getFpr_fp_no() {
		return fpr_fp_no;
	}

	public void setFpr_fp_no(int fpr_fp_no) {
		this.fpr_fp_no = fpr_fp_no;
	}

	public String getFpr_u_bo_id() {
		return fpr_u_bo_id;
	}

	public void setFpr_u_bo_id(String fpr_u_bo_id) {
		this.fpr_u_bo_id = fpr_u_bo_id;
	}

	public String getFpr_txt() {
		return fpr_txt;
	}

	public void setFpr_txt(String fpr_txt) {
		this.fpr_txt = fpr_txt;
	}

	public Date getFpr_date() {
		return fpr_date;
	}

	public void setFpr_date(Date fpr_date) {
		this.fpr_date = fpr_date;
	}
	
	
	
}
