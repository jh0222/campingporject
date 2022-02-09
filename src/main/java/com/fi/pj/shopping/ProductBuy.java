package com.fi.pj.shopping;

import java.util.Date;
//주문페이지 -> 상품결제하기
public class ProductBuy {
	private int b_no;			/*(주문번호)*/
	private String b_u_bo_id;	/*아이디*/
	private int b_p_no;		 	/*상품번호*/
	private String b_p_name;	/*상품명*/
	private int b_price;		/*(수량*p_price)*/
	private int b_number;		/*수량*/
	private String b_u_address; /*(기존 자기 정보 배송지)*/
	private String b_new_address;
	private Date b_date;	
	
	public ProductBuy() {
		
	}

	public ProductBuy(int b_no, String b_u_bo_id, int b_p_no, String b_p_name, int b_price, int b_number,
			String b_u_address, String b_new_address, Date b_date) {
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
	
	
	
}
