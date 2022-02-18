package com.fi.pj.shopping;

import java.util.Date;

public class ProductReview {
	private int pr_no;
	private int pr_p_no;
	private String pr_u_bo_id;
	private String pr_txt;
	private int pr_star;
	private Date pr_date;
	
	
	public ProductReview() {
		// TODO Auto-generated constructor stub
	}


	public ProductReview(int pr_no, int pr_p_no, String pr_u_bo_id, String pr_txt, int pr_star, Date pr_date) {
		super();
		this.pr_no = pr_no;
		this.pr_p_no = pr_p_no;
		this.pr_u_bo_id = pr_u_bo_id;
		this.pr_txt = pr_txt;
		this.pr_star = pr_star;
		this.pr_date = pr_date;
	}


	public int getPr_no() {
		return pr_no;
	}


	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}


	public int getPr_p_no() {
		return pr_p_no;
	}


	public void setPr_p_no(int pr_p_no) {
		this.pr_p_no = pr_p_no;
	}


	public String getPr_u_bo_id() {
		return pr_u_bo_id;
	}


	public void setPr_u_bo_id(String pr_u_bo_id) {
		this.pr_u_bo_id = pr_u_bo_id;
	}


	public String getPr_txt() {
		return pr_txt;
	}


	public void setPr_txt(String pr_txt) {
		this.pr_txt = pr_txt;
	}


	public int getPr_star() {
		return pr_star;
	}


	public void setPr_star(int pr_star) {
		this.pr_star = pr_star;
	}


	public Date getPr_date() {
		return pr_date;
	}


	public void setPr_date(Date pr_date) {
		this.pr_date = pr_date;
	}
	


	
	
	
}
