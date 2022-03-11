package com.fi.pj.campingplace;

import java.io.File;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import com.fi.pj.board.BoardMapper;
import com.fi.pj.board.BoardPage;
import com.fi.pj.board.Freeboard;
import com.fi.pj.member.UserMember;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class CampingplaceDAO {

	@Autowired
	private SqlSession ss;
	
	public void getAllPlace(HttpServletRequest req) {
		int rowSize = 10; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ //list.jsp?pg=2
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
	    int to=(pg * rowSize); //(1*10) = 10 //to
		
	    Campingplace p = new Campingplace();
	    p.setFrom(from);
	    p.setTo(to);

		List<Campingplace> places = ss.getMapper(PlaceMapper.class).getAllPlace(p);   	 

	    int total = ss.getMapper(PlaceMapper.class).getAllPlacecnt(); //총 게시물 수
	    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
	    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
	    int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

	    int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
	    int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
	    if(toPage> allPage){ // 예) 20>17
	        toPage = allPage;
	    }

	    req.setAttribute("pg", pg);
	    req.setAttribute("block", block);
	    req.setAttribute("fromPage", fromPage);
	    req.setAttribute("toPage", toPage);
	    req.setAttribute("allPage", allPage);
		req.setAttribute("places", places);
		req.setAttribute("c", "place.go?");
		
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
		Campingplace place = ss.getMapper(PlaceMapper.class).getOnePlace(p);
		String addr = place.getCam_address();
		String[] addr2 = addr.split("!");

		req.setAttribute("addr", addr2);
		req.setAttribute("places", place);
		
	}

	public void regReview(placeReview pr, HttpServletRequest req) {
		
		try {
			if (ss.getMapper(PlaceMapper.class).ReviewReg(pr) == 1) {
				req.setAttribute("result", "등록성공");
			} else {
				req.setAttribute("result", "등록실패");
			}
		} catch (Exception e) {
			System.out.println("에러");
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

	
	public void getHeartList( HttpServletRequest req) {
		req.setAttribute("hearts", ss.getMapper(PlaceMapper.class).getHeartList());
		
	}
	

	public void likePlace(campingLike cl,HttpServletRequest req) {
		if (ss.getMapper(PlaceMapper.class).placeLike(cl) == 1) {
			req.setAttribute("result", "찜 성공");
		} else {
			req.setAttribute("result", "찜 실패");
		}		
	}
	
	public void likePlace_del(campingLike cl, HttpServletRequest req) {
		if (ss.getMapper(PlaceMapper.class).placeLike_del(cl) == 1) {
			req.setAttribute("result", "찜 삭제성공");
		} else {
			req.setAttribute("result", "찜 삭제실패");
		}		
	}
	
	//찜 있는지 없는지
	public void getheart(campingLike cl, HttpServletRequest req) {
		String heart = ss.getMapper(PlaceMapper.class).getheart(cl);
		req.setAttribute("heart", heart);		
	}
	
	public void getheart2(campingLike cl, HttpServletRequest req) {
		String heart = ss.getMapper(PlaceMapper.class).getheart2(cl);
		req.setAttribute("heart", heart);		
	}

	//캠핑장 검색 
	public void getPlaceSearch(placeSearch ps, HttpServletRequest req) {
		int rowSize = 10; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ //list.jsp?pg=2
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
	    int to=(pg * rowSize); //(1*10) = 10 //to

	    ps.setFrom(from);
	    ps.setTo(to);
		if(ps.getSearchplace().equals("placename")) {
			List<Campingplace> p = ss.getMapper(PlaceMapper.class).Search_place(ps);
			
			int total = ss.getMapper(PlaceMapper.class).Search_place_cnt(ps); //총 게시물 수
			System.out.println(total);
		    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		    System.out.println(allPage);
		    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
		    int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

		    int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
		    System.out.println(fromPage);
		    int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
		    System.out.println(toPage);
		    if(toPage> allPage){ // 예) 20>17
		        toPage = allPage;
		    }

		    String c = "placce.search?searchplace=placename&search=" + ps.getSearch() + "&";
		    
		    req.setAttribute("pg", pg);
		    req.setAttribute("block", block);
		    req.setAttribute("fromPage", fromPage);
		    req.setAttribute("toPage", toPage);
		    req.setAttribute("allPage", allPage);
			req.setAttribute("places", p);
			req.setAttribute("c", c);
			//req.setAttribute("place", "p");
		} else if(ps.getSearchplace().equals("star")) {
			
			List<Campingplace> places = ss.getMapper(PlaceMapper.class).Search_star(ps);  	 

			int total = ss.getMapper(PlaceMapper.class).getAllPlacecnt(); //총 게시물 수
		    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
		    int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

		    int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
		    int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
		    if(toPage> allPage){ // 예) 20>17
		        toPage = allPage;
		    }

		    req.setAttribute("pg", pg);
		    req.setAttribute("block", block);
		    req.setAttribute("fromPage", fromPage);
		    req.setAttribute("toPage", toPage);
		    req.setAttribute("allPage", allPage);
			req.setAttribute("places", places);
			req.setAttribute("c", "place.go?");
		}else if(ps.getSearchplace().equals("p")) {
			
			List<Campingplace> places = ss.getMapper(PlaceMapper.class).Search_p(ps);  	 

			int total = ss.getMapper(PlaceMapper.class).getpricecnt(ps); //총 게시물 수
		    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
		    int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

		    int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
		    int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
		    if(toPage> allPage){ // 예) 20>17
		        toPage = allPage;
		    }

		    req.setAttribute("pg", pg);
		    req.setAttribute("block", block);
		    req.setAttribute("fromPage", fromPage);
		    req.setAttribute("toPage", toPage);
		    req.setAttribute("allPage", allPage);
			req.setAttribute("places", places);
			req.setAttribute("c", "place.go?");
		}else {
			List<Campingplace> places = ss.getMapper(PlaceMapper.class).Search_area(ps);  	 

			int total = ss.getMapper(PlaceMapper.class).getareacnt(ps); //총 게시물 수
		    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
		    int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

		    int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
		    int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
		    if(toPage> allPage){ // 예) 20>17
		        toPage = allPage;
		    }

		    req.setAttribute("pg", pg);
		    req.setAttribute("block", block);
		    req.setAttribute("fromPage", fromPage);
		    req.setAttribute("toPage", toPage);
		    req.setAttribute("allPage", allPage);
			req.setAttribute("places", places);
			req.setAttribute("c", "place.go?");
		}
		
	}

	public void starSearch(placeSearch ps, HttpServletRequest req) {
		int rowSize = 10; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ //list.jsp?pg=2
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
	    int to=(pg * rowSize); //(1*10) = 10 //to
		
	    Campingplace p = new Campingplace();
	    p.setFrom(from);
	    p.setTo(to);

		List<Campingplace> places = ss.getMapper(PlaceMapper.class).Search_star(ps);     	 

	    int total = ss.getMapper(PlaceMapper.class).Search_star_cnt(ps); //총 게시물 수
	    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
	    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
	    int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

	    int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
	    int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
	    if(toPage> allPage){ // 예) 20>17
	        toPage = allPage;
	    }

	    req.setAttribute("pg", pg);
	    req.setAttribute("block", block);
	    req.setAttribute("fromPage", fromPage);
	    req.setAttribute("toPage", toPage);
	    req.setAttribute("allPage", allPage);
		req.setAttribute("places", places);
		//req.setAttribute("c", "place.search_star?");
		
	}

	public void getheartlist(campingLike cl, HttpServletRequest req) {
		
		List<campingLike> cll = ss.getMapper(PlaceMapper.class).getheartlist(cl); 
		req.setAttribute("cl", cll);
		
	}
	
	public void getAllReply(placeReply re, HttpServletRequest req) {
		req.setAttribute("reply", ss.getMapper(PlaceMapper.class).getAllReply(re));
		
	}

	public void regReplyTxt(placeReply re, HttpServletRequest req) {
		
		try {
			if (ss.getMapper(PlaceMapper.class).ReplytxtReg(re) == 1) {
				req.setAttribute("result", "등록성공");
			} else {
				req.setAttribute("result", "등록실패");
			}
		} catch (Exception e) {
			System.out.println("에러");
		}
	}

	public void solveLike(HttpServletRequest req) {
		// 누를때마다 올꺼니까 눌렀을때 값이 1인지 0-인지 구분
		
		// 0이면 찜 목록에 안넣었다는거니까 insert
		//ss.getMapper(PlaceMapper.class).likeIn(cam_no 들고가기);
		
		// 1인데 눌렀다는건 삭제한다는거니까
	//	ss.getMapper(PlaceMapper.class).likeOut();
		
		
	}

	public void delReplyTxt(placeReply re, HttpServletRequest req) {
		if (ss.getMapper(PlaceMapper.class).ReplyDel(re) == 1) {
			req.setAttribute("result", "삭제성공");
		} else {
			req.setAttribute("result", "삭제실패");
		}
		req.setAttribute("reply", ss.getMapper(PlaceMapper.class).getAllReply(re));
		
	}

	public void updateReplyTxt(placeReply re, HttpServletRequest req) {
		try {
			if (ss.getMapper(PlaceMapper.class).ReplyUpdate(re) == 1) {
				req.setAttribute("result", "댓글수정성공");
			} else {
				req.setAttribute("result", "댓글수정실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "댓글수정실패");
		}
		
	}
	
	//사용자가 리뷰달 수 있는지 확인
	public void reserveCheck(placeReserve pre, HttpServletRequest req) {
		req.setAttribute("reserve",ss.getMapper(PlaceMapper.class).reserveCheck(pre));
		
	}

	

}
