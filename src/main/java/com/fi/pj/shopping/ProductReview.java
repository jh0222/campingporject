package com.fi.pj.shopping;

import java.util.Date;

public class ProductReview {
	private int pr_no;
	private String pr_u_id;
	private String pr_txt;
	private Date pr_date;
	
	public ProductReview() {
		// TODO Auto-generated constructor stub
	}

	public ProductReview(int pr_no, String pr_u_id, String pr_txt, Date pr_date) {
		super();
		this.pr_no = pr_no;
		this.pr_u_id = pr_u_id;
		this.pr_txt = pr_txt;
		this.pr_date = pr_date;
	}

	public int getPr_no() {
		return pr_no;
	}

	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}

	public String getPr_u_id() {
		return pr_u_id;
	}

	public void setPr_u_id(String pr_u_id) {
		this.pr_u_id = pr_u_id;
	}

	public String getPr_txt() {
		return pr_txt;
	}

	public void setPr_txt(String pr_txt) {
		this.pr_txt = pr_txt;
	}

	public Date getPr_date() {
		return pr_date;
	}

	public void setPr_date(Date pr_date) {
		this.pr_date = pr_date;
	}
	
	
	
	
	
	
}
