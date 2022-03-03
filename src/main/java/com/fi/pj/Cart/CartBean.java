package com.fi.pj.Cart;

public class CartBean {

	private int ba_no;
	private int ba_p_no;
	private String ba_u_bo_id;
	private String ba_p_name;
	private String ba_p_picture;
	private int ba_price;
	private int ba_number;
	
	private int fba_no;
	private int fba_fp_no;
	private String fba_u_bo_id;
	private String fba_fp_name;
	private String fba_fp_picture;
	private int fba_price;
	private int fba_number;
	
	public CartBean() {
		// TODO Auto-generated constructor stub
	}

	public CartBean(int ba_no, int ba_p_no, String ba_u_bo_id, String ba_p_name, String ba_p_picture, int ba_price,
			int ba_number, int fba_no, int fba_fp_no, String fba_u_bo_id, String fba_fp_name, String fba_fp_picture,
			int fba_price, int fba_number) {
		super();
		this.ba_no = ba_no;
		this.ba_p_no = ba_p_no;
		this.ba_u_bo_id = ba_u_bo_id;
		this.ba_p_name = ba_p_name;
		this.ba_p_picture = ba_p_picture;
		this.ba_price = ba_price;
		this.ba_number = ba_number;
		this.fba_no = fba_no;
		this.fba_fp_no = fba_fp_no;
		this.fba_u_bo_id = fba_u_bo_id;
		this.fba_fp_name = fba_fp_name;
		this.fba_fp_picture = fba_fp_picture;
		this.fba_price = fba_price;
		this.fba_number = fba_number;
	}

	public int getBa_no() {
		return ba_no;
	}

	public void setBa_no(int ba_no) {
		this.ba_no = ba_no;
	}

	public int getBa_p_no() {
		return ba_p_no;
	}

	public void setBa_p_no(int ba_p_no) {
		this.ba_p_no = ba_p_no;
	}

	public String getBa_u_bo_id() {
		return ba_u_bo_id;
	}

	public void setBa_u_bo_id(String ba_u_bo_id) {
		this.ba_u_bo_id = ba_u_bo_id;
	}

	public String getBa_p_name() {
		return ba_p_name;
	}

	public void setBa_p_name(String ba_p_name) {
		this.ba_p_name = ba_p_name;
	}

	public String getBa_p_picture() {
		return ba_p_picture;
	}

	public void setBa_p_picture(String ba_p_picture) {
		this.ba_p_picture = ba_p_picture;
	}

	public int getBa_price() {
		return ba_price;
	}

	public void setBa_price(int ba_price) {
		this.ba_price = ba_price;
	}

	public int getBa_number() {
		return ba_number;
	}

	public void setBa_number(int ba_number) {
		this.ba_number = ba_number;
	}

	public int getFba_no() {
		return fba_no;
	}

	public void setFba_no(int fba_no) {
		this.fba_no = fba_no;
	}

	public int getFba_fp_no() {
		return fba_fp_no;
	}

	public void setFba_fp_no(int fba_fp_no) {
		this.fba_fp_no = fba_fp_no;
	}

	public String getFba_u_bo_id() {
		return fba_u_bo_id;
	}

	public void setFba_u_bo_id(String fba_u_bo_id) {
		this.fba_u_bo_id = fba_u_bo_id;
	}

	public String getFba_fp_name() {
		return fba_fp_name;
	}

	public void setFba_fp_name(String fba_fp_name) {
		this.fba_fp_name = fba_fp_name;
	}

	public String getFba_fp_picture() {
		return fba_fp_picture;
	}

	public void setFba_fp_picture(String fba_fp_picture) {
		this.fba_fp_picture = fba_fp_picture;
	}

	public int getFba_price() {
		return fba_price;
	}

	public void setFba_price(int fba_price) {
		this.fba_price = fba_price;
	}

	public int getFba_number() {
		return fba_number;
	}

	public void setFba_number(int fba_number) {
		this.fba_number = fba_number;
	}
	
}
