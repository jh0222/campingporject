package com.fi.pj.shopping;

public class ProductBasket {
	private int ba_no;          /*장바구니 no*/
	private int ba_p_no;        /*상품 no*/
	private String ba_u_bo_id;  /*유저,보스 아이디*/
	private String ba_p_name;   /*상품명 */
	private String ba_p_picture; /*상품사진*/
	private int ba_price;       /*(수량*p_price) = 가격*/
	private int ba_number;      /*바구니 총 합*/
	
	public ProductBasket() {
		// TODO Auto-generated constructor stub
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

	public ProductBasket(int ba_no, int ba_p_no, String ba_u_bo_id, String ba_p_name, String ba_p_picture, int ba_price,
			int ba_number) {
		super();
		this.ba_no = ba_no;
		this.ba_p_no = ba_p_no;
		this.ba_u_bo_id = ba_u_bo_id;
		this.ba_p_name = ba_p_name;
		this.ba_p_picture = ba_p_picture;
		this.ba_price = ba_price;
		this.ba_number = ba_number;
	}
	
	
	
	
	
}
