package com.fi.pj.board;

import java.util.Date;

public class Campingtipboard {
	private int tip_no;
	private String tip_u_id;
	private String tip_subject;
	private String tip_txt;
	private int tip_readcount;
	private Date tip_date;
	
	public Campingtipboard() {
		// TODO Auto-generated constructor stub
	}

	public int getTip_no() {
		return tip_no;
	}

	public void setTip_no(int tip_no) {
		this.tip_no = tip_no;
	}

	public String getTip_u_id() {
		return tip_u_id;
	}

	public void setTip_u_id(String tip_u_id) {
		this.tip_u_id = tip_u_id;
	}

	public String getTip_subject() {
		return tip_subject;
	}

	public void setTip_subject(String tip_subject) {
		this.tip_subject = tip_subject;
	}

	public String getTip_txt() {
		return tip_txt;
	}

	public void setTip_txt(String tip_txt) {
		this.tip_txt = tip_txt;
	}

	public int getTip_readcount() {
		return tip_readcount;
	}

	public void setTip_readcount(int tip_readcount) {
		this.tip_readcount = tip_readcount;
	}

	public Date getTip_date() {
		return tip_date;
	}

	public void setTip_date(Date tip_date) {
		this.tip_date = tip_date;
	}

	public Campingtipboard(int tip_no, String tip_u_id, String tip_subject, String tip_txt, int tip_readcount,
			Date tip_date) {
		super();
		this.tip_no = tip_no;
		this.tip_u_id = tip_u_id;
		this.tip_subject = tip_subject;
		this.tip_txt = tip_txt;
		this.tip_readcount = tip_readcount;
		this.tip_date = tip_date;
	}
	
}
