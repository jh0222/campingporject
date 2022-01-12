package com.fi.pj.shopping;

public class Product {
	private int p_no;
	private String p_name;
	private String p_picture;
	private int p_price;
	private String p_txt;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int p_no, String p_name, String p_picture, int p_price, String p_txt) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_picture = p_picture;
		this.p_price = p_price;
		this.p_txt = p_txt;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_picture() {
		return p_picture;
	}

	public void setP_picture(String p_picture) {
		this.p_picture = p_picture;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_txt() {
		return p_txt;
	}

	public void setP_txt(String p_txt) {
		this.p_txt = p_txt;
	}
	
	
	
}
