package com.fi.pj.milkit;

public class Milkit {
	private int fp_no;
	private String fp_name;
	private int fp_price;
	private String fp_picture;
	private String fp_txt;

	public Milkit() {
		// TODO Auto-generated constructor stub
	}

	public int getFp_no() {
		return fp_no;
	}

	public void setFp_no(int fp_no) {
		this.fp_no = fp_no;
	}

	public String getFp_name() {
		return fp_name;
	}

	public void setFp_name(String fp_name) {
		this.fp_name = fp_name;
	}

	public int getFp_price() {
		return fp_price;
	}

	public void setFp_price(int fp_price) {
		this.fp_price = fp_price;
	}

	public String getFp_picture() {
		return fp_picture;
	}

	public void setFp_picture(String fp_picture) {
		this.fp_picture = fp_picture;
	}

	public String getFp_txt() {
		return fp_txt;
	}

	public void setFp_txt(String fp_txt) {
		this.fp_txt = fp_txt;
	}

	public Milkit(int fp_no, String fp_name, int fp_price, String fp_picture, String fp_txt) {
		super();
		this.fp_no = fp_no;
		this.fp_name = fp_name;
		this.fp_price = fp_price;
		this.fp_picture = fp_picture;
		this.fp_txt = fp_txt;
	}
	
}
