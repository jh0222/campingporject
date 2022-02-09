package com.fi.pj.shopping;

public class Page {
	private int from;
    private int to;
    private int p_no;
    
    public Page() {
		// TODO Auto-generated constructor stub
	}

	public Page(int from, int to, int p_no) {
		super();
		this.from = from;
		this.to = to;
		this.p_no = p_no;
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

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
    
}
