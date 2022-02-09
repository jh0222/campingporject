package com.fi.pj.campingplace;

import java.io.File;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class CampingplaceDAO {

	@Autowired
	private SqlSession ss;
	
	public void getAllPlace(HttpServletRequest req) {
		
		req.setAttribute("places", ss.getMapper(PlaceMapper.class).getAllPlace());
	}
	
	public void regPlace(Campingplace p, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "등록실패");
			return;
		}

		try {

			String cam_name = mr.getParameter("cam_name");
			String cam_bo_id = mr.getParameter("cam_bo_id");
			String cam_txt = mr.getParameter("cam_txt");	
			String cam_phonenumber = mr.getParameter("cam_phonenumber");
			int cam_price = Integer.parseInt(mr.getParameter("cam_price"));
			String cam_address = mr.getParameter("cam_address");
			String cam_longitude = mr.getParameter("cam_longitude");
			String cam_latitude = mr.getParameter("cam_latitude");
			int cam_headcount = Integer.parseInt(mr.getParameter("cam_headcount"));
			String cam_picture = mr.getFilesystemName("cam_picture");
			cam_picture = URLEncoder.encode(cam_picture, "utf-8");
			cam_picture = cam_picture.replace("+", " ");

			p.setCam_name(cam_name);
			p.setCam_bo_id(cam_bo_id);
			p.setCam_txt(cam_txt);
			p.setCam_phonenumber(cam_phonenumber);
			p.setCam_price(cam_price);
			p.setCam_address(cam_address);
			p.setCam_longitude(cam_longitude);
			p.setCam_latitude(cam_latitude);
			p.setCam_headcount(cam_headcount);
			p.setCam_picture(cam_picture);

			if (ss.getMapper(PlaceMapper.class).PlaceReg(p) == 1) {
				req.setAttribute("result", "등록성공");
			} else {
				req.setAttribute("result", "등록실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("picture");
			new File(path + "/" + fileName).delete();
			req.setAttribute("result", "등록실패");
		}
	}

	public void delPlace(Campingplace p, HttpServletRequest req) {
		
		if (ss.getMapper(PlaceMapper.class).PlaceDel(p) == 1) {
			req.setAttribute("result", "삭제성공");
		} else {
			req.setAttribute("result", "삭제실패");
		}
		req.setAttribute("places", ss.getMapper(PlaceMapper.class).getAllPlace());

	}

	public void updatePlace(Campingplace p, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "수정실패");
			return;
		}

		try {

			String cam_name = mr.getParameter("cam_name");
			String cam_txt = mr.getParameter("cam_txt");	
			String cam_phonenumber = mr.getParameter("cam_phonenumber");
			int cam_price = Integer.parseInt(mr.getParameter("cam_price"));
			String cam_address = mr.getParameter("cam_address");
			String cam_longitude = mr.getParameter("cam_longitude");
			String cam_latitude = mr.getParameter("cam_latitude");
			int cam_headcount = Integer.parseInt(mr.getParameter("cam_headcount"));
			String old_picture = mr.getParameter("old_picture");
			String new_picture = mr.getFilesystemName("new_picture");

			System.out.println(cam_name);
			System.out.println(cam_txt);
			System.out.println(cam_phonenumber);
			System.out.println(cam_price);
			System.out.println(cam_address);
			System.out.println(cam_longitude);
			System.out.println(cam_latitude);
			System.out.println(cam_headcount);
			System.out.println(new_picture);
			System.out.println(old_picture);

			p.setCam_name(cam_name);
			p.setCam_txt(cam_txt);
			p.setCam_phonenumber(cam_phonenumber);
			p.setCam_price(cam_price);
			p.setCam_address(cam_address);
			p.setCam_longitude(cam_longitude);
			p.setCam_latitude(cam_latitude);
			p.setCam_headcount(cam_headcount);
			if(new_picture!=null) {
				p.setCam_picture(new_picture);
			} else {
				p.setCam_picture(old_picture);
			}
			

			if (ss.getMapper(PlaceMapper.class).PlaceUpdate(p) == 1) {
				req.setAttribute("result", "수정성공");
			} else {
				req.setAttribute("result", "수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("picture");
			new File(path + "/" + fileName).delete();
			req.setAttribute("result", "수정실패");
		}
		
	}

	public void getOnePlace(Campingplace p, HttpServletRequest req) {
		req.setAttribute("places", ss.getMapper(PlaceMapper.class).getOnePlace(p));
		
	}

	public void regReview(placeReview pr, HttpServletRequest req) {
		if (ss.getMapper(PlaceMapper.class).ReviewReg(pr) == 1) {
			req.setAttribute("result", "등록성공");
		} else {
			req.setAttribute("result", "등록실패");
		}
	}

	public void getAllReview(placeReview pr, HttpServletRequest req) {
		req.setAttribute("reviews", ss.getMapper(PlaceMapper.class).getAllReview(pr));
		
	}

	public void delReview(placeReview pr, HttpServletRequest req) {
		if (ss.getMapper(PlaceMapper.class).ReviewDel(pr) == 1) {
			req.setAttribute("result", "삭제성공");
		} else {
			req.setAttribute("result", "삭제실패");
		}
		req.setAttribute("reviews", ss.getMapper(PlaceMapper.class).getAllReview(pr));

	}

	public void updateReview(placeReview pr, HttpServletRequest req) {
		try {
			if (ss.getMapper(PlaceMapper.class).ReviewUpdate(pr) == 1) {
				req.setAttribute("result", "댓글수정성공");
			} else {
				req.setAttribute("result", "댓글수정실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "댓글수정실패");
		}
		
	} 

	public void reservePlace(placeReserve res, HttpServletRequest req) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
		Date st =  sdf.parse(req.getParameter("start"));
		Date end = sdf.parse(req.getParameter("end"));
		
		Calendar sc = Calendar.getInstance();
		Calendar ec = Calendar.getInstance();
		// 마법처럼 ^^
		sc.setTime(st);
		ec.setTime(end);
		long aaa = ( ec.getTimeInMillis() - sc.getTimeInMillis() ) / 1000;
		long diffDays = aaa / (24 * 60 * 60);

		req.setAttribute("diffDays", diffDays);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void reserve(placeReserve res, HttpServletRequest req) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		
		try {
			Date st = sdf.parse(req.getParameter("r_campingstartdate11"));
			Date end = sdf.parse(req.getParameter("r_campingenddate11"));
			
			res.setR_campingstartdate(st);
			res.setR_campingenddate(end);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("-------------------------------------");
		System.out.println("시작"+res.getR_campingstartdate());
		System.out.println("끝"+res.getR_campingenddate());
		if (ss.getMapper(PlaceMapper.class).reserve(res) == 1) {
			req.setAttribute("result", "예약성공");
		} else {
			req.setAttribute("result", "예약실패");
		}
		
	}


	public void likePlace(Campingplace p, placeReview pr, campingLike cl, HttpServletRequest req) {
		if (ss.getMapper(PlaceMapper.class).placeLike(cl) == 1) {
			req.setAttribute("result", "찜 성공");
		} else {
			req.setAttribute("result", "찜 실패");
		}
		req.setAttribute("places", ss.getMapper(PlaceMapper.class).getOnePlace(p));
		
	}

	public void getHeartList( HttpServletRequest req) {
		req.setAttribute("hearts", ss.getMapper(PlaceMapper.class).getHeartList());
		
	}

	
}
