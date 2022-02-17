package com.fi.pj.board;

public class BoardPage {
	private int from;
	private int to;
	private int f_no;
	private int tip_no;
	private int rb_no;
	public BoardPage() {
		// TODO Auto-generated constructor stub
	}
	public int getFrom() {
		return from;
	}
	public void setFrom(int from) {
		this.from = from;
	}
	public int getTo() {
		return to;
	}
	public void setTo(int to) {
		this.to = to;
	}
	public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
	public int getTip_no() {
		return tip_no;
	}
	public void setTip_no(int tip_no) {
		this.tip_no = tip_no;
	}
	public int getRb_no() {
		return rb_no;
	}
	public void setRb_no(int rb_no) {
		this.rb_no = rb_no;
	}
	public BoardPage(int from, int to, int f_no, int tip_no, int rb_no) {
		super();
		this.from = from;
		this.to = to;
		this.f_no = f_no;
		this.tip_no = tip_no;
		this.rb_no = rb_no;
	}
	
}
