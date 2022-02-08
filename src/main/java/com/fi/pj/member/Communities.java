package com.fi.pj.member;

import java.util.Date;

public class Communities {

	// 자유게시판
	private int f_no;
	private String f_u_id;
	private String f_subject;
	private String f_txt;
	private String f_picture;
	private int f_readcount;
	private Date f_date;

	// 캠핑찜
	private int h_no;
	private int h_cam_no;
	private String h_u_id;
	private String h_cam_name;
	private String h_cam_address;
	private int h_campingheart;

	// 캠핑예약
	private int r_no;
	private int r_cam_no;
	private String r_u_id;
	private String r_u_name;
	private String r_u_phonenumber;
	private String r_cam_name;
	private String r_cam_picture;
	private Date r_campingstartdate;
	private Date r_campingenddate;
	private String r_campingheadcount;
	private int r_campingprice;
	private String r_cam_phonenumber;
	private String r_cam_address;

	// 캠핑팁게시판
	private int tip_no;
	private String tip_u_id;
	private String tip_subject;
	private String tip_txt;
	private String tip_picture;
	private int tip_readcount;
	private Date tip_date;

	// 레시피 게시판
	private int rb_no;
	private String rb_u_id;
	private String rb_subject;
	private String rb_txt;
	private String rb_picture;
	private int rb_readcount;
	private Date rb_date;

	// 캠핑리뷰
	private int c_no;
	private int c_cam_no;
	private String c_u_id;
	private String c_campingreview;
	private int c_campingstar;
	private Date c_date;

	// 캠핑용품 리뷰
	private int pr_no;
	private String pr_u_bo_id;
	private String pr_txt;
	private Date pr_date;

	// 밀키트 리뷰
	private int fpr_no;
	private String fpr_u_bo_id;
	private String fpr_txt;
	private Date fpr_date;
	
	// 자유게시판 리뷰
	private int fr_no;
	private int fr_f_no;
	private String fr_u_id;
	private String fr_replytxt;
	private Date fr_date;
	private String fr_picture;
	
	// 캠핑팁 리뷰
	private int tipr_no;
	private int tipr_f_no;
	private String tipr_u_id;
	private String tipr_replytxt;
	private Date tipr_date;
	private String tipr_picture;
	
	// 레시피 리뷰
	private int rr_no;
	private int rr_f_no;
	private String rr_u_id;
	private String rr_replytxt;
	private Date rr_date;
	private String rr_picture;

	public Communities() {
		// TODO Auto-generated constructor stub
	}

	public Communities(int f_no, String f_u_id, String f_subject, String f_txt, String f_picture, int f_readcount,
			Date f_date, int h_no, int h_cam_no, String h_u_id, String h_cam_name, String h_cam_address,
			int h_campingheart, int r_no, int r_cam_no, String r_u_id, String r_u_name, String r_u_phonenumber,
			String r_cam_name, String r_cam_picture, Date r_campingstartdate, Date r_campingenddate,
			String r_campingheadcount, int r_campingprice, String r_cam_phonenumber, String r_cam_address, int tip_no,
			String tip_u_id, String tip_subject, String tip_txt, String tip_picture, int tip_readcount, Date tip_date,
			int rb_no, String rb_u_id, String rb_subject, String rb_txt, String rb_picture, int rb_readcount,
			Date rb_date, int c_no, int c_cam_no, String c_u_id, String c_campingreview, int c_campingstar, Date c_date,
			int pr_no, String pr_u_bo_id, String pr_txt, Date pr_date, int fpr_no, String fpr_u_bo_id, String fpr_txt,
			Date fpr_date, int fr_no, int fr_f_no, String fr_u_id, String fr_replytxt, Date fr_date, String fr_picture,
			int tipr_no, int tipr_f_no, String tipr_u_id, String tipr_replytxt, Date tipr_date, String tipr_picture,
			int rr_no, int rr_f_no, String rr_u_id, String rr_replytxt, Date rr_date, String rr_picture) {
		super();
		this.f_no = f_no;
		this.f_u_id = f_u_id;
		this.f_subject = f_subject;
		this.f_txt = f_txt;
		this.f_picture = f_picture;
		this.f_readcount = f_readcount;
		this.f_date = f_date;
		this.h_no = h_no;
		this.h_cam_no = h_cam_no;
		this.h_u_id = h_u_id;
		this.h_cam_name = h_cam_name;
		this.h_cam_address = h_cam_address;
		this.h_campingheart = h_campingheart;
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
		this.tip_no = tip_no;
		this.tip_u_id = tip_u_id;
		this.tip_subject = tip_subject;
		this.tip_txt = tip_txt;
		this.tip_picture = tip_picture;
		this.tip_readcount = tip_readcount;
		this.tip_date = tip_date;
		this.rb_no = rb_no;
		this.rb_u_id = rb_u_id;
		this.rb_subject = rb_subject;
		this.rb_txt = rb_txt;
		this.rb_picture = rb_picture;
		this.rb_readcount = rb_readcount;
		this.rb_date = rb_date;
		this.c_no = c_no;
		this.c_cam_no = c_cam_no;
		this.c_u_id = c_u_id;
		this.c_campingreview = c_campingreview;
		this.c_campingstar = c_campingstar;
		this.c_date = c_date;
		this.pr_no = pr_no;
		this.pr_u_bo_id = pr_u_bo_id;
		this.pr_txt = pr_txt;
		this.pr_date = pr_date;
		this.fpr_no = fpr_no;
		this.fpr_u_bo_id = fpr_u_bo_id;
		this.fpr_txt = fpr_txt;
		this.fpr_date = fpr_date;
		this.fr_no = fr_no;
		this.fr_f_no = fr_f_no;
		this.fr_u_id = fr_u_id;
		this.fr_replytxt = fr_replytxt;
		this.fr_date = fr_date;
		this.fr_picture = fr_picture;
		this.tipr_no = tipr_no;
		this.tipr_f_no = tipr_f_no;
		this.tipr_u_id = tipr_u_id;
		this.tipr_replytxt = tipr_replytxt;
		this.tipr_date = tipr_date;
		this.tipr_picture = tipr_picture;
		this.rr_no = rr_no;
		this.rr_f_no = rr_f_no;
		this.rr_u_id = rr_u_id;
		this.rr_replytxt = rr_replytxt;
		this.rr_date = rr_date;
		this.rr_picture = rr_picture;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_u_id() {
		return f_u_id;
	}

	public void setF_u_id(String f_u_id) {
		this.f_u_id = f_u_id;
	}

	public String getF_subject() {
		return f_subject;
	}

	public void setF_subject(String f_subject) {
		this.f_subject = f_subject;
	}

	public String getF_txt() {
		return f_txt;
	}

	public void setF_txt(String f_txt) {
		this.f_txt = f_txt;
	}

	public String getF_picture() {
		return f_picture;
	}

	public void setF_picture(String f_picture) {
		this.f_picture = f_picture;
	}

	public int getF_readcount() {
		return f_readcount;
	}

	public void setF_readcount(int f_readcount) {
		this.f_readcount = f_readcount;
	}

	public Date getF_date() {
		return f_date;
	}

	public void setF_date(Date f_date) {
		this.f_date = f_date;
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

	public String getR_campingheadcount() {
		return r_campingheadcount;
	}

	public void setR_campingheadcount(String r_campingheadcount) {
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

	public String getTip_picture() {
		return tip_picture;
	}

	public void setTip_picture(String tip_picture) {
		this.tip_picture = tip_picture;
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

	public int getRb_no() {
		return rb_no;
	}

	public void setRb_no(int rb_no) {
		this.rb_no = rb_no;
	}

	public String getRb_u_id() {
		return rb_u_id;
	}

	public void setRb_u_id(String rb_u_id) {
		this.rb_u_id = rb_u_id;
	}

	public String getRb_subject() {
		return rb_subject;
	}

	public void setRb_subject(String rb_subject) {
		this.rb_subject = rb_subject;
	}

	public String getRb_txt() {
		return rb_txt;
	}

	public void setRb_txt(String rb_txt) {
		this.rb_txt = rb_txt;
	}

	public String getRb_picture() {
		return rb_picture;
	}

	public void setRb_picture(String rb_picture) {
		this.rb_picture = rb_picture;
	}

	public int getRb_readcount() {
		return rb_readcount;
	}

	public void setRb_readcount(int rb_readcount) {
		this.rb_readcount = rb_readcount;
	}

	public Date getRb_date() {
		return rb_date;
	}

	public void setRb_date(Date rb_date) {
		this.rb_date = rb_date;
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

	public int getFr_no() {
		return fr_no;
	}

	public void setFr_no(int fr_no) {
		this.fr_no = fr_no;
	}

	public int getFr_f_no() {
		return fr_f_no;
	}

	public void setFr_f_no(int fr_f_no) {
		this.fr_f_no = fr_f_no;
	}

	public String getFr_u_id() {
		return fr_u_id;
	}

	public void setFr_u_id(String fr_u_id) {
		this.fr_u_id = fr_u_id;
	}

	public String getFr_replytxt() {
		return fr_replytxt;
	}

	public void setFr_replytxt(String fr_replytxt) {
		this.fr_replytxt = fr_replytxt;
	}

	public Date getFr_date() {
		return fr_date;
	}

	public void setFr_date(Date fr_date) {
		this.fr_date = fr_date;
	}

	public String getFr_picture() {
		return fr_picture;
	}

	public void setFr_picture(String fr_picture) {
		this.fr_picture = fr_picture;
	}

	public int getTipr_no() {
		return tipr_no;
	}

	public void setTipr_no(int tipr_no) {
		this.tipr_no = tipr_no;
	}

	public int getTipr_f_no() {
		return tipr_f_no;
	}

	public void setTipr_f_no(int tipr_f_no) {
		this.tipr_f_no = tipr_f_no;
	}

	public String getTipr_u_id() {
		return tipr_u_id;
	}

	public void setTipr_u_id(String tipr_u_id) {
		this.tipr_u_id = tipr_u_id;
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

	public String getTipr_picture() {
		return tipr_picture;
	}

	public void setTipr_picture(String tipr_picture) {
		this.tipr_picture = tipr_picture;
	}

	public int getRr_no() {
		return rr_no;
	}

	public void setRr_no(int rr_no) {
		this.rr_no = rr_no;
	}

	public int getRr_f_no() {
		return rr_f_no;
	}

	public void setRr_f_no(int rr_f_no) {
		this.rr_f_no = rr_f_no;
	}

	public String getRr_u_id() {
		return rr_u_id;
	}

	public void setRr_u_id(String rr_u_id) {
		this.rr_u_id = rr_u_id;
	}

	public String getRr_replytxt() {
		return rr_replytxt;
	}

	public void setRr_replytxt(String rr_replytxt) {
		this.rr_replytxt = rr_replytxt;
	}

	public Date getRr_date() {
		return rr_date;
	}

	public void setRr_date(Date rr_date) {
		this.rr_date = rr_date;
	}

	public String getRr_picture() {
		return rr_picture;
	}

	public void setRr_picture(String rr_picture) {
		this.rr_picture = rr_picture;
	}

}
