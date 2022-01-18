package com.fi.pj.Cart;

public class CartBean {
	private String u_id;
	private String bo_id;
	private int ba_no;
	private int ba_p_no;
	private String ba_u_bo_id;
	private String p_name;
	private int ba_price;
	private int ba_number;
	private int fba_no;
	private int fba_fp_no;
	private String fba_u_bo_id;
	private String fba_fp_name;
	private int fba_price;
	private int fba_number;
	
	public CartBean(String u_id, String bo_id, int ba_no, int ba_p_no, String ba_u_bo_id, String p_name, int ba_price,
			int ba_number, int fba_no, int fba_fp_no, String fba_u_bo_id, String fba_fp_name, int fba_price,
			int fba_number) {
		super();
		this.u_id = u_id;
		this.bo_id = bo_id;
		this.ba_no = ba_no;
		this.ba_p_no = ba_p_no;
		this.ba_u_bo_id = ba_u_bo_id;
		this.p_name = p_name;
		this.ba_price = ba_price;
		this.ba_number = ba_number;
		this.fba_no = fba_no;
		this.fba_fp_no = fba_fp_no;
		this.fba_u_bo_id = fba_u_bo_id;
		this.fba_fp_name = fba_fp_name;
		this.fba_price = fba_price;
		this.fba_number = fba_number;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getBo_id() {
		return bo_id;
	}

	public void setBo_id(String bo_id) {
		this.bo_id = bo_id;
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

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
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
