package com.fi.pj.member;

import java.util.Date;

public class Communities_boss {
	
	// 캠핑정보
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
	
	// 캠핑 예약한 사람의 대한 정보
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
	
	// 캠핑 리뷰
	private int c_no;
	private int c_cam_no;
	private String c_u_id;
	private String c_campingreview;
	private int c_campingstar;
	private Date c_date;
	
	// 사장이 단 대댓글
	private int cr_no;
	private int cr_cam_no;
	private String cr_bo_id;
	private String cr_u_id;
	private String cr_replytxt;
	private Date cr_date;
	
	// 캠핑용품 구매목록
	private int b_no;
	private String b_u_bo_id;
	private int b_p_no;
	private String b_p_name;
	private int b_price;
	private int b_number;
	private String b_u_address;
	private String b_new_address;
	private Date b_date;
	
	// 밀킬트 구매목록
	private int fb_no;
	private String fb_u_bo_id;
	private int fb_p_no;
	private String fb_p_name;
	private int fb_price;
	private int fb_number;
	private String fb_u_address;
	private String fb_new_address;
	private Date fb_date;
	
	//캠핑용품 리뷰
	private int pr_no;
	private String pr_u_bo_id;
	private String pr_txt;
	private Date pr_date;
	
	// 밀키트 리뷰
	private int fpr_no;
	private String fpr_u_bo_id;
	private String fpr_txt;
	private Date fpr_date;
	
	public Communities_boss() {
		// TODO Auto-generated constructor stub
	}

	public Communities_boss(int cam_no, String cam_bo_id, String cam_name, String cam_picture, String cam_txt,
			String cam_phonenumber, int cam_price, String cam_address, String cam_latitude, String cam_longitude,
			int cam_headcount, int r_no, int r_cam_no, String r_u_id, String r_u_name, String r_u_phonenumber,
			String r_cam_name, String r_cam_picture, Date r_campingstartdate, Date r_campingenddate,
			int r_campingheadcount, int r_campingprice, String r_cam_phonenumber, String r_cam_address, int c_no,
			int c_cam_no, String c_u_id, String c_campingreview, int c_campingstar, Date c_date, int cr_no,
			int cr_cam_no, String cr_bo_id, String cr_u_id, String cr_replytxt, Date cr_date, int b_no,
			String b_u_bo_id, int b_p_no, String b_p_name, int b_price, int b_number, String b_u_address,
			String b_new_address, Date b_date, int fb_no, String fb_u_bo_id, int fb_p_no, String fb_p_name,
			int fb_price, int fb_number, String fb_u_address, String fb_new_address, Date fb_date, int pr_no,
			String pr_u_bo_id, String pr_txt, Date pr_date, int fpr_no, String fpr_u_bo_id, String fpr_txt,
			Date fpr_date) {
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
		this.c_no = c_no;
		this.c_cam_no = c_cam_no;
		this.c_u_id = c_u_id;
		this.c_campingreview = c_campingreview;
		this.c_campingstar = c_campingstar;
		this.c_date = c_date;
		this.cr_no = cr_no;
		this.cr_cam_no = cr_cam_no;
		this.cr_bo_id = cr_bo_id;
		this.cr_u_id = cr_u_id;
		this.cr_replytxt = cr_replytxt;
		this.cr_date = cr_date;
		this.b_no = b_no;
		this.b_u_bo_id = b_u_bo_id;
		this.b_p_no = b_p_no;
		this.b_p_name = b_p_name;
		this.b_price = b_price;
		this.b_number = b_number;
		this.b_u_address = b_u_address;
		this.b_new_address = b_new_address;
		this.b_date = b_date;
		this.fb_no = fb_no;
		this.fb_u_bo_id = fb_u_bo_id;
		this.fb_p_no = fb_p_no;
		this.fb_p_name = fb_p_name;
		this.fb_price = fb_price;
		this.fb_number = fb_number;
		this.fb_u_address = fb_u_address;
		this.fb_new_address = fb_new_address;
		this.fb_date = fb_date;
		this.pr_no = pr_no;
		this.pr_u_bo_id = pr_u_bo_id;
		this.pr_txt = pr_txt;
		this.pr_date = pr_date;
		this.fpr_no = fpr_no;
		this.fpr_u_bo_id = fpr_u_bo_id;
		this.fpr_txt = fpr_txt;
		this.fpr_date = fpr_date;
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

	public int getCr_no() {
		return cr_no;
	}

	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}

	public int getCr_cam_no() {
		return cr_cam_no;
	}

	public void setCr_cam_no(int cr_cam_no) {
		this.cr_cam_no = cr_cam_no;
	}

	public String getCr_bo_id() {
		return cr_bo_id;
	}

	public void setCr_bo_id(String cr_bo_id) {
		this.cr_bo_id = cr_bo_id;
	}

	public String getCr_u_id() {
		return cr_u_id;
	}

	public void setCr_u_id(String cr_u_id) {
		this.cr_u_id = cr_u_id;
	}

	public String getCr_replytxt() {
		return cr_replytxt;
	}

	public void setCr_replytxt(String cr_replytxt) {
		this.cr_replytxt = cr_replytxt;
	}

	public Date getCr_date() {
		return cr_date;
	}

	public void setCr_date(Date cr_date) {
		this.cr_date = cr_date;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_u_bo_id() {
		return b_u_bo_id;
	}

	public void setB_u_bo_id(String b_u_bo_id) {
		this.b_u_bo_id = b_u_bo_id;
	}

	public int getB_p_no() {
		return b_p_no;
	}

	public void setB_p_no(int b_p_no) {
		this.b_p_no = b_p_no;
	}

	public String getB_p_name() {
		return b_p_name;
	}

	public void setB_p_name(String b_p_name) {
		this.b_p_name = b_p_name;
	}

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}

	public int getB_number() {
		return b_number;
	}

	public void setB_number(int b_number) {
		this.b_number = b_number;
	}

	public String getB_u_address() {
		return b_u_address;
	}

	public void setB_u_address(String b_u_address) {
		this.b_u_address = b_u_address;
	}

	public String getB_new_address() {
		return b_new_address;
	}

	public void setB_new_address(String b_new_address) {
		this.b_new_address = b_new_address;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public int getFb_no() {
		return fb_no;
	}

	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}

	public String getFb_u_bo_id() {
		return fb_u_bo_id;
	}

	public void setFb_u_bo_id(String fb_u_bo_id) {
		this.fb_u_bo_id = fb_u_bo_id;
	}

	public int getFb_p_no() {
		return fb_p_no;
	}

	public void setFb_p_no(int fb_p_no) {
		this.fb_p_no = fb_p_no;
	}

	public String getFb_p_name() {
		return fb_p_name;
	}

	public void setFb_p_name(String fb_p_name) {
		this.fb_p_name = fb_p_name;
	}

	public int getFb_price() {
		return fb_price;
	}

	public void setFb_price(int fb_price) {
		this.fb_price = fb_price;
	}

	public int getFb_number() {
		return fb_number;
	}

	public void setFb_number(int fb_number) {
		this.fb_number = fb_number;
	}

	public String getFb_u_address() {
		return fb_u_address;
	}

	public void setFb_u_address(String fb_u_address) {
		this.fb_u_address = fb_u_address;
	}

	public String getFb_new_address() {
		return fb_new_address;
	}

	public void setFb_new_address(String fb_new_address) {
		this.fb_new_address = fb_new_address;
	}

	public Date getFb_date() {
		return fb_date;
	}

	public void setFb_date(Date fb_date) {
		this.fb_date = fb_date;
	}

	public int getPr_no() {
		return pr_no;
	}

	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}

	public String getPr_u_bo_id() {
		return pr_u_bo_id;
	}

	public void setPr_u_bo_id(String pr_u_bo_id) {
		this.pr_u_bo_id = pr_u_bo_id;
	}

	public String getPr_txt() {
		return pr_txt;
	}

	public void setPr_txt(String pr_txt) {
		this.pr_txt = pr_txt;
	}

	public Date getPr_date() {
		return pr_date;
	}

	public void setPr_date(Date pr_date) {
		this.pr_date = pr_date;
	}

	public int getFpr_no() {
		return fpr_no;
	}

	public void setFpr_no(int fpr_no) {
		this.fpr_no = fpr_no;
	}

	public String getFpr_u_bo_id() {
		return fpr_u_bo_id;
	}

	public void setFpr_u_bo_id(String fpr_u_bo_id) {
		this.fpr_u_bo_id = fpr_u_bo_id;
	}

	public String getFpr_txt() {
		return fpr_txt;
	}

	public void setFpr_txt(String fpr_txt) {
		this.fpr_txt = fpr_txt;
	}

	public Date getFpr_date() {
		return fpr_date;
	}

	public void setFpr_date(Date fpr_date) {
		this.fpr_date = fpr_date;
	}
	
	
}
