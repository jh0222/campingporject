package com.fi.pj.shopping;

public class ProductRank {
	private int ROWNUM;
	private int p_no;
	private String p_name;
	private int p_price;
	private String p_picture;
	private String p_txt;
	private int b_p_no;
	
	public ProductRank() {
		// TODO Auto-generated constructor stub
	}

	public int getROWNUM() {
		return ROWNUM;
	}

	public void setROWNUM(int rOWNUM) {
		ROWNUM = rOWNUM;
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

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_picture() {
		return p_picture;
	}

	public void setP_picture(String p_picture) {
		this.p_picture = p_picture;
	}

	public String getP_txt() {
		return p_txt;
	}

	public void setP_txt(String p_txt) {
		this.p_txt = p_txt;
	}

	public int getB_p_no() {
		return b_p_no;
	}

	public void setB_p_no(int b_p_no) {
		this.b_p_no = b_p_no;
	}

	public ProductRank(int rOWNUM, int p_no, String p_name, int p_price, String p_picture, String p_txt, int b_p_no) {
		super();
		ROWNUM = rOWNUM;
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_picture = p_picture;
		this.p_txt = p_txt;
		this.b_p_no = b_p_no;
	}

}
