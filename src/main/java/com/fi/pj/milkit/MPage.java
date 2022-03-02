package com.fi.pj.milkit;

public class MPage {
	private int from;
    private int to;
    private int fp_no;
   
   public MPage() {
	// TODO Auto-generated constructor stub
}

public MPage(int from, int to, int fp_no) {
	super();
	this.from = from;
	this.to = to;
	this.fp_no = fp_no;
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

public int getFp_no() {
	return fp_no;
}

public void setFp_no(int fp_no) {
	this.fp_no = fp_no;
}
   
   

}
