package com.fi.pj.campingplace;


public class campingLike {
	private int h_no;
	private int h_cam_no;
	private String h_u_id;
	private String h_cam_name;
	private String h_cam_address;
	private int h_campingheart;
	
	public campingLike() {
		// TODO Auto-generated constructor stub
	}

	public int getH_no() {
		return h_no;
	}

	public void setH_no(int h_no) {
		this.h_no = h_no;
	}

	public int getH_cam_no() {
		return h_cam_no;
	}

	public void setH_cam_no(int h_cam_no) {
		this.h_cam_no = h_cam_no;
	}

	public String getH_u_id() {
		return h_u_id;
	}

	public void setH_u_id(String h_u_id) {
		this.h_u_id = h_u_id;
	}

	public String getH_cam_name() {
		return h_cam_name;
	}

	public void setH_cam_name(String h_cam_name) {
		this.h_cam_name = h_cam_name;
	}

	public String getH_cam_address() {
		return h_cam_address;
	}

	public void setH_cam_address(String h_cam_address) {
		this.h_cam_address = h_cam_address;
	}

	public int getH_campingheart() {
		return h_campingheart;
	}

	public void setH_campingheart(int h_campingheart) {
		this.h_campingheart = h_campingheart;
	}

	public campingLike(int h_no, int h_cam_no, String h_u_id, String h_cam_name, String h_cam_address,
			int h_campingheart) {
		super();
		this.h_no = h_no;
		this.h_cam_no = h_cam_no;
		this.h_u_id = h_u_id;
		this.h_cam_name = h_cam_name;
		this.h_cam_address = h_cam_address;
		this.h_campingheart = h_campingheart;
	}
	
	
}

