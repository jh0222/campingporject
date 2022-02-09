package com.fi.pj.milkit;

public class MilkitShoppingOrder {
	private int fp_no;
	private String fp_name;
	private int fp_price;
	private String fp_fpicture;
	private String fp_txt;
	private int amount; //수량
	private int sum; //결제금액 총합
	
	public MilkitShoppingOrder() {
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

	public String getFp_fpicture() {
		return fp_fpicture;
	}

	public void setFp_fpicture(String fp_fpicture) {
		this.fp_fpicture = fp_fpicture;
	}

	public String getFp_txt() {
		return fp_txt;
	}

	public void setFp_txt(String fp_txt) {
		this.fp_txt = fp_txt;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public MilkitShoppingOrder(int fp_no, String fp_name, int fp_price, String fp_fpicture, String fp_txt, int amount,
			int sum) {
		super();
		this.fp_no = fp_no;
		this.fp_name = fp_name;
		this.fp_price = fp_price;
		this.fp_fpicture = fp_fpicture;
		this.fp_txt = fp_txt;
		this.amount = amount;
		this.sum = sum;
	}
	
	
}
