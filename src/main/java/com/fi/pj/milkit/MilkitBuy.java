package com.fi.pj.milkit;

import java.util.Date;

public class MilkitBuy {
	private int fb_no;			/*(주문번호)*/
	private String fb_u_bo_id;	/*아이디*/
	private int fb_fp_no;		 	/*상품번호*/
	private String fb_fp_name;	/*상품명*/
	private int fb_price;		/*(수량*p_price)*/
	private int fb_number;		/*수량*/
	private String fb_u_address; /*(기존 자기 정보 배송지)*/
	private String fb_new_address;
	private Date fb_date;	
	
	public MilkitBuy() {
		// TODO Auto-generated constructor stub
	}

	public MilkitBuy(int fb_no, String fb_u_bo_id, int fb_fp_no, String fb_fp_name, int fb_price, int fb_number,
			String fb_u_address, String fb_new_address, Date fb_date) {
		super();
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
