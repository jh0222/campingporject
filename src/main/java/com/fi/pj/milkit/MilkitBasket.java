package com.fi.pj.milkit;

public class MilkitBasket {
	private int fba_no;          /*장바구니 no*/
	private int fba_fp_no;        /*상품 no*/
	private String fba_u_bo_id;  /*유저,보스 아이디*/
	private String fba_fp_name;   /*상품명 */
	private String fba_fp_picture; /*상품사진*/
	private int fba_price;       /*(수량*p_price) = 가격*/
	private int fba_number;      /*바구니 총 합*/
	
	public MilkitBasket() {
		// TODO Auto-generated constructor stub
	}

	public MilkitBasket(int fba_no, int fba_fp_no, String fba_u_bo_id, String fba_fp_name, String fba_fp_picture,
			int fba_price, int fba_number) {
		super();
		this.fba_no = fba_no;
		this.fba_fp_no = fba_fp_no;
		this.fba_u_bo_id = fba_u_bo_id;
		this.fba_fp_name = fba_fp_name;
		this.fba_fp_picture = fba_fp_picture;
		this.fba_price = fba_price;
		this.fba_number = fba_number;
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
