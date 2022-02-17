package com.fi.pj.board;

import java.util.Date;

public class CtReply {
	private int tipr_no;
	private int tipr_tip_no;
	private String tipr_u_id;
	private int tipr_owner_no;
	private String tipr_owner_id;
	private String tipr_replytxt;
	private Date tipr_date;
	private int tipr_depth;
	private String tipr_picture;
	public CtReply() {
		// TODO Auto-generated constructor stub
	}
	public int getTipr_no() {
		return tipr_no;
	}
	public void setTipr_no(int tipr_no) {
		this.tipr_no = tipr_no;
	}
	public int getTipr_tip_no() {
		return tipr_tip_no;
	}
	public void setTipr_tip_no(int tipr_tip_no) {
		this.tipr_tip_no = tipr_tip_no;
	}
	public String getTipr_u_id() {
		return tipr_u_id;
	}
	public void setTipr_u_id(String tipr_u_id) {
		this.tipr_u_id = tipr_u_id;
	}
	public int getTipr_owner_no() {
		return tipr_owner_no;
	}
	public void setTipr_owner_no(int tipr_owner_no) {
		this.tipr_owner_no = tipr_owner_no;
	}
	public String getTipr_owner_id() {
		return tipr_owner_id;
	}
	public void setTipr_owner_id(String tipr_owner_id) {
		this.tipr_owner_id = tipr_owner_id;
	}
	public String getTipr_replytxt() {
		return tipr_replytxt;
	}
	public void setTipr_replytxt(String tipr_replytxt) {
		this.tipr_replytxt = tipr_replytxt;
	}
	public Date getTipr_date() {
		return tipr_date;
	}
	public void setTipr_date(Date tipr_date) {
		this.tipr_date = tipr_date;
	}
	public int getTipr_depth() {
		return tipr_depth;
	}
	public void setTipr_depth(int tipr_depth) {
		this.tipr_depth = tipr_depth;
	}
	public String getTipr_picture() {
		return tipr_picture;
	}
	public void setTipr_picture(String tipr_picture) {
		this.tipr_picture = tipr_picture;
	}
	public CtReply(int tipr_no, int tipr_tip_no, String tipr_u_id, int tipr_owner_no, String tipr_owner_id,
			String tipr_replytxt, Date tipr_date, int tipr_depth, String tipr_picture) {
		super();
		this.tipr_no = tipr_no;
		this.tipr_tip_no = tipr_tip_no;
		this.tipr_u_id = tipr_u_id;
		this.tipr_owner_no = tipr_owner_no;
		this.tipr_owner_id = tipr_owner_id;
		this.tipr_replytxt = tipr_replytxt;
		this.tipr_date = tipr_date;
		this.tipr_depth = tipr_depth;
		this.tipr_picture = tipr_picture;
	}
	
	
}
