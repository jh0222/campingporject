package com.fi.pj.campingplace;

public class Campingplace {
	private int cam_no;
	private String cam_bo_id;
	private String cam_name;
	private String cam_picture;
	private String cam_txt;
	private String cam_phonenumber;
	private int cam_price;
	private String cam_address;
	private String cam_latitude;
	private String cam_longitude;
	private int cam_headcount;
	private double star;
	
	
	public Campingplace() {
		// TODO Auto-generated constructor stub
	}


	public Campingplace(int cam_no, String cam_bo_id, String cam_name, String cam_picture, String cam_txt,
			String cam_phonenumber, int cam_price, String cam_address, String cam_latitude, String cam_longitude,
			int cam_headcount, double star) {
		super();
		this.cam_no = cam_no;
		this.cam_bo_id = cam_bo_id;
		this.cam_name = cam_name;
		this.cam_picture = cam_picture;
		this.cam_txt = cam_txt;
		this.cam_phonenumber = cam_phonenumber;
		this.cam_price = cam_price;
		this.cam_address = cam_address;
		this.cam_latitude = cam_latitude;
		this.cam_longitude = cam_longitude;
		this.cam_headcount = cam_headcount;
		this.star = star;
	}


	public int getCam_no() {
		return cam_no;
	}


	public void setCam_no(int cam_no) {
		this.cam_no = cam_no;
	}


	public String getCam_bo_id() {
		return cam_bo_id;
	}


	public void setCam_bo_id(String cam_bo_id) {
		this.cam_bo_id = cam_bo_id;
	}


	public String getCam_name() {
		return cam_name;
	}


	public void setCam_name(String cam_name) {
		this.cam_name = cam_name;
	}


	public String getCam_picture() {
		return cam_picture;
	}


	public void setCam_picture(String cam_picture) {
		this.cam_picture = cam_picture;
	}


	public String getCam_txt() {
		return cam_txt;
	}


	public void setCam_txt(String cam_txt) {
		this.cam_txt = cam_txt;
	}


	public String getCam_phonenumber() {
		return cam_phonenumber;
	}


	public void setCam_phonenumber(String cam_phonenumber) {
		this.cam_phonenumber = cam_phonenumber;
	}


	public int getCam_price() {
		return cam_price;
	}


	public void setCam_price(int cam_price) {
		this.cam_price = cam_price;
	}


	public String getCam_address() {
		return cam_address;
	}


	public void setCam_address(String cam_address) {
		this.cam_address = cam_address;
	}


	public String getCam_latitude() {
		return cam_latitude;
	}


	public void setCam_latitude(String cam_latitude) {
		this.cam_latitude = cam_latitude;
	}


	public String getCam_longitude() {
		return cam_longitude;
	}


	public void setCam_longitude(String cam_longitude) {
		this.cam_longitude = cam_longitude;
	}


	public int getCam_headcount() {
		return cam_headcount;
	}


	public void setCam_headcount(int cam_headcount) {
		this.cam_headcount = cam_headcount;
	}


	public double getStar() {
		return star;
	}


	public void setStar(double star) {
		this.star = star;
	}

}
