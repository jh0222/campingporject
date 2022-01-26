package com.fi.pj.Mypage;

import java.util.Date;

public class Reservation {
	
	private int r_no;
	private int r_cam_no;
	private String r_u_id;
	private String r_u_name;
	private String r_u_phonenumber;
	private String r_cam_name;
	private String r_cam_picture;
	private Date r_campingstartdate;
	private Date r_campingenddate;
	private int r_campingheadcount;
	private int r_campingprice;
	private String r_cam_phonenumber;
	private String r_cam_address;
	
	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	public Reservation(int r_no, int r_cam_no, String r_u_id, String r_u_name, String r_cam_picture, String r_u_phonenumber,
			String r_cam_name, Date r_campingstartdate, Date r_campingenddate, int r_campingheadcount,
			int r_campingprice, String r_cam_phonenumber, String r_cam_address) {
		super();
		this.r_no = r_no;
		this.r_cam_no = r_cam_no;
		this.r_u_id = r_u_id;
		this.r_u_name = r_u_name;
		this.r_u_phonenumber = r_u_phonenumber;
		this.r_cam_name = r_cam_name;
		this.r_cam_picture = r_cam_picture;
		this.r_campingstartdate = r_campingstartdate;
		this.r_campingenddate = r_campingenddate;
		this.r_campingheadcount = r_campingheadcount;
		this.r_campingprice = r_campingprice;
		this.r_cam_phonenumber = r_cam_phonenumber;
		this.r_cam_address = r_cam_address;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getR_cam_no() {
		return r_cam_no;
	}

	public void setR_cam_no(int r_cam_no) {
		this.r_cam_no = r_cam_no;
	}

	public String getR_u_id() {
		return r_u_id;
	}

	public void setR_u_id(String r_u_id) {
		this.r_u_id = r_u_id;
	}

	public String getR_u_name() {
		return r_u_name;
	}

	public void setR_u_name(String r_u_name) {
		this.r_u_name = r_u_name;
	}

	public String getR_u_phonenumber() {
		return r_u_phonenumber;
	}

	public void setR_u_phonenumber(String r_u_phonenumber) {
		this.r_u_phonenumber = r_u_phonenumber;
	}

	public String getR_cam_name() {
		return r_cam_name;
	}

	public void setR_cam_name(String r_cam_name) {
		this.r_cam_name = r_cam_name;
	}
	
	public String getR_cam_picture() {
		return r_cam_picture;
	}

	public void setR_cam_picture(String r_cam_picture) {
		this.r_cam_picture = r_cam_picture;
	}

	public Date getR_campingstartdate() {
		return r_campingstartdate;
	}

	public void setR_campingstartdate(Date r_campingstartdate) {
		this.r_campingstartdate = r_campingstartdate;
	}

	public Date getR_campingenddate() {
		return r_campingenddate;
	}

	public void setR_campingenddate(Date r_campingenddate) {
		this.r_campingenddate = r_campingenddate;
	}

	public int getR_campingheadcount() {
		return r_campingheadcount;
	}

	public void setR_campingheadcount(int r_campingheadcount) {
		this.r_campingheadcount = r_campingheadcount;
	}

	public int getR_campingprice() {
		return r_campingprice;
	}

	public void setR_campingprice(int r_campingprice) {
		this.r_campingprice = r_campingprice;
	}

	public String getR_cam_phonenumber() {
		return r_cam_phonenumber;
	}

	public void setR_cam_phonenumber(String r_cam_phonenumber) {
		this.r_cam_phonenumber = r_cam_phonenumber;
	}

	public String getR_cam_address() {
		return r_cam_address;
	}

	public void setR_cam_address(String r_cam_address) {
		this.r_cam_address = r_cam_address;
	}
	
}
