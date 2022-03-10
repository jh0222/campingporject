package com.fi.pj.member;

import java.util.Date;

public class Buy {
	
	private int b_no;
	private String b_u_bo_id;
	private int b_p_no;
	private String b_p_name;
	private int b_price;
	private int b_number;
	private String b_u_address;
	private String b_new_address;
	private Date b_date;
	
	private int fb_no;
	private String fb_u_bo_id;
	private int fb_fp_no;
	private String fb_fp_name;
	private int fb_price;
	private int fb_number;
	private String fb_u_address;
	private String fb_new_address;
	private Date fb_date;
	
	public Buy() {
		// TODO Auto-generated constructor stub
	}

	public Buy(int b_no, String b_u_bo_id, int b_p_no, String b_p_name, int b_price, int b_number, String b_u_address,
			String b_new_address, Date b_date, int fb_no, String fb_u_bo_id, int fb_fp_no, String fb_fp_name,
			int fb_price, int fb_number, String fb_u_address, String fb_new_address, Date fb_date) {
		super();
		this.b_no = b_no;
		this.b_u_bo_id = b_u_bo_id;
		this.b_p_no = b_p_no;
		this.b_p_name = b_p_name;
		this.b_price = b_price;
		this.b_number = b_number;
		this.b_u_address = b_u_address;
		this.b_new_address = b_new_address;
		this.b_date = b_date;
		this.fb_no = fb_no;
		this.fb_u_bo_id = fb_u_bo_id;
		this.fb_fp_no = fb_fp_no;
		this.fb_fp_name = fb_fp_name;
		this.fb_price = fb_price;
		this.fb_number = fb_number;
		this.fb_u_address = fb_u_address;
		this.fb_new_address = fb_new_address;
		this.fb_date = fb_date;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_u_bo_id() {
		return b_u_bo_id;
	}

	public void setB_u_bo_id(String b_u_bo_id) {
		this.b_u_bo_id = b_u_bo_id;
	}

	public int getB_p_no() {
		return b_p_no;
	}

	public void setB_p_no(int b_p_no) {
		this.b_p_no = b_p_no;
	}

	public String getB_p_name() {
		return b_p_name;
	}

	public void setB_p_name(String b_p_name) {
		this.b_p_name = b_p_name;
	}

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}

	public int getB_number() {
		return b_number;
	}

	public void setB_number(int b_number) {
		this.b_number = b_number;
	}

	public String getB_u_address() {
		return b_u_address;
	}

	public void setB_u_address(String b_u_address) {
		this.b_u_address = b_u_address;
	}

	public String getB_new_address() {
		return b_new_address;
	}

	public void setB_new_address(String b_new_address) {
		this.b_new_address = b_new_address;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public int getFb_no() {
		return fb_no;
	}

	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}

	public String getFb_u_bo_id() {
		return fb_u_bo_id;
	}

	public void setFb_u_bo_id(String fb_u_bo_id) {
		this.fb_u_bo_id = fb_u_bo_id;
	}

	public int getFb_fp_no() {
		return fb_fp_no;
	}

	public void setFb_fp_no(int fb_fp_no) {
		this.fb_fp_no = fb_fp_no;
	}

	public String getFb_fp_name() {
		return fb_fp_name;
	}

	public void setFb_fp_name(String fb_fp_name) {
		this.fb_fp_name = fb_fp_name;
	}

	public int getFb_price() {
		return fb_price;
	}

	public void setFb_price(int fb_price) {
		this.fb_price = fb_price;
	}

	public int getFb_number() {
		return fb_number;
	}

	public void setFb_number(int fb_number) {
		this.fb_number = fb_number;
	}

	public String getFb_u_address() {
		return fb_u_address;
	}

	public void setFb_u_address(String fb_u_address) {
		this.fb_u_address = fb_u_address;
	}

	public String getFb_new_address() {
		return fb_new_address;
	}

	public void setFb_new_address(String fb_new_address) {
		this.fb_new_address = fb_new_address;
	}

	public Date getFb_date() {
		return fb_date;
	}

	public void setFb_date(Date fb_date) {
		this.fb_date = fb_date;
	}

}
