package com.fi.pj.campingplace;

import java.util.Date;

public class placeReview {
	private int c_no;
	private int c_cam_no;
	private String c_u_id;
	private String c_campingreview;
	private int c_campingstar;
	private Date c_date;
	
	public placeReview() {
		// TODO Auto-generated constructor stub
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getC_cam_no() {
		return c_cam_no;
	}

	public void setC_cam_no(int c_cam_no) {
		this.c_cam_no = c_cam_no;
	}

	public String getC_u_id() {
		return c_u_id;
	}

	public void setC_u_id(String c_u_id) {
		this.c_u_id = c_u_id;
	}

	public String getC_campingreview() {
		return c_campingreview;
	}

	public void setC_campingreview(String c_campingreview) {
		this.c_campingreview = c_campingreview;
	}

	public int getC_campingstar() {
		return c_campingstar;
	}

	public void setC_campingstar(int c_campingstar) {
		this.c_campingstar = c_campingstar;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

	public placeReview(int c_no, int c_cam_no, String c_u_id, String c_campingreview, int c_campingstar, Date c_date) {
		super();
		this.c_no = c_no;
		this.c_cam_no = c_cam_no;
		this.c_u_id = c_u_id;
		this.c_campingreview = c_campingreview;
		this.c_campingstar = c_campingstar;
		this.c_date = c_date;
	}

}
