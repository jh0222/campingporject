package com.fi.pj.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class BoardDAO {
	
	@Autowired
	private SqlSession ss;

	//자유게시판 전체목록 보기
	public void getAllfreeboard(HttpServletRequest req) {
		int rowSize = 10; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ //list.jsp?pg=2
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
	    int to=(pg * rowSize); //(1*10) = 10 //to
		
	    BoardPage p = new BoardPage();
	    p.setFrom(from);
	    p.setTo(to);
	    
		List<Freeboard> fb = ss.getMapper(BoardMapper.class).getAllfreeboard(p);   	 

	    int total = ss.getMapper(BoardMapper.class).getAllfreeboardcnt(); //총 게시물 수
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
		req.setAttribute("fb", fb);
		req.setAttribute("c", "freeboard.go?");
		req.setAttribute("sort", "fb");
	}

	//자유게시판 등록
	public void fbinsert(Freeboard fb, HttpServletRequest req) {
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
			String f_u_id = mr.getParameter("f_u_id");
			String f_subject = mr.getParameter("subject");
			String f_txt = mr.getParameter("txt");			

			fb.setF_u_id(f_u_id);
			fb.setF_subject(f_subject);
			fb.setF_txt(f_txt);
			
			if (ss.getMapper(BoardMapper.class).FbInsert(fb) == 1) {
				req.setAttribute("result", "등록성공");
			} else {
				req.setAttribute("result", "등록실패");
			}	
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("picture");
			new File(path + "/" + fileName).delete();
			req.setAttribute("result", "수정실패");
		}
		
	}

	//자유게시판 검색
	public void getfreeboard(Search s, HttpServletRequest req) {
		int rowSize = 10; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ //list.jsp?pg=2
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
	    int to=(pg * rowSize); //(1*10) = 10 //to

	    s.setFrom(from);
	    s.setTo(to);
		if(s.getSearchsort().equals("subject")) {
			List<Freeboard> fb = ss.getMapper(BoardMapper.class).FbSearch_subject(s);
			
			int total = ss.getMapper(BoardMapper.class).FbSearch_subject_cnt(s); //총 게시물 수
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

		    String c = "fb.search?searchsort=subject&search=" + s.getSearch() + "&";
		    
		    req.setAttribute("pg", pg);
		    req.setAttribute("block", block);
		    req.setAttribute("fromPage", fromPage);
		    req.setAttribute("toPage", toPage);
		    req.setAttribute("allPage", allPage);
			req.setAttribute("fb", fb);
			req.setAttribute("c", c);
			req.setAttribute("sort", "fb");
		} else {
			List<Freeboard> fb = ss.getMapper(BoardMapper.class).FbSearch_id(s);
			
			int total = ss.getMapper(BoardMapper.class).FbSearch_id_cnt(s); //총 게시물 수
			System.out.println(total + "????????");
		    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
		    int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

		    int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
		    int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
		    if(toPage> allPage){ // 예) 20>17
		        toPage = allPage;
		    }
		    
		    String c = "fb.search?searchsort=id&search=" + s.getSearch() + "&";

		    req.setAttribute("pg", pg);
		    req.setAttribute("block", block);
		    req.setAttribute("fromPage", fromPage);
		    req.setAttribute("toPage", toPage);
		    req.setAttribute("allPage", allPage);
			req.setAttribute("fb", fb);
			req.setAttribute("c", c);
			req.setAttribute("sort", "fb");
		}
		
	}
	
	//자유게시판 수정
	public void fbupdate(Freeboard fb, HttpServletRequest req) {
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
			String f_subject = mr.getParameter("subject");
			String f_txt = mr.getParameter("txt");			

			fb.setF_subject(f_subject);
			fb.setF_txt(f_txt);
			
			if (ss.getMapper(BoardMapper.class).FbUpdate(fb) == 1) {
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

	//자유게시판 클릭페이지 이동
	public void getonefreeboard(Freeboard fb, HttpServletRequest req) {
		Freeboard fbo = ss.getMapper(BoardMapper.class).getonefreeboard(fb);		
		req.setAttribute("fb", fbo);		
	}

	//자유게시판 삭제
	public void fbdelete(Freeboard fb, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).FbDelete(fb) == 1) {
			req.setAttribute("result", "삭제성공");
		} else {
			req.setAttribute("result", "삭제실패");
		}
		
	}

	//자유게시판 댓글 등록
	public void fbreplyinsert(FbReply fr, HttpServletRequest req) {
			String fr_owner_id = req.getParameter("fr_owner_id");
			//대댓글
			if (fr_owner_id != null) {
				if (ss.getMapper(BoardMapper.class).FbreplyInsert2(fr) == 1) {
					req.setAttribute("result", "등록성공");
				} else {
					req.setAttribute("result", "등록실패");
				}
			} 
			//댓글
			else { 
				if (ss.getMapper(BoardMapper.class).FbreplyInsert(fr) == 1) {
					req.setAttribute("result", "등록성공");
				} else {
					req.setAttribute("result", "등록실패");
				}
			}
	}

	//자유게시판 댓글 보기
	public void getfbreply(Freeboard fb, HttpServletRequest req) {
		int rowSize = 5; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ 
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1);
	    int to=(pg * rowSize); 
		
	    BoardPage p = new BoardPage();
	    p.setFrom(from);
	    p.setTo(to);
	    p.setF_no(fb.getF_no());
	    
		List<FbReply> fr = ss.getMapper(BoardMapper.class).getfbreply(p);
		List<FbReply> frr = ss.getMapper(BoardMapper.class).getfbrreply(fb);
		List<FbReply> frr_cnt = ss.getMapper(BoardMapper.class).getfbrreply_cnt(fb);

		int total = ss.getMapper(BoardMapper.class).getAllfreeboardreplycnt(fb); //총 게시물 수
	    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
	    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
	    int block = 5; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

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
	    req.setAttribute("fr", fr);
	    req.setAttribute("frr", frr);
	    req.setAttribute("frr_cnt", frr_cnt);
	}

	//자유게시판 댓글 삭제
	public void frdelete(FbReply fr, HttpServletRequest req) {
		int depth = Integer.parseInt(req.getParameter("fr_depth"));
		int fr_s = ss.getMapper(BoardMapper.class).FrDelete_update_select(fr);
		System.out.println(depth);
		
		if(depth == 3 && fr_s > 0) {
			//삭제할 댓글에 대댓글이 있을경우
			System.out.println(fr_s);
			if (ss.getMapper(BoardMapper.class).FrDelete_update(fr) == 1) {
				req.setAttribute("result", "삭제성공");
			} else {
				req.setAttribute("result", "삭제실패");
			}			
		} 
		//대댓글이며 댓글이 알수없음이고 해당 댓글에 대댓글이 하나라면
		else if(depth != 3 
				&& ss.getMapper(BoardMapper.class).FrDelete_r_select(fr) == 1
				&& ss.getMapper(BoardMapper.class).FrDelete_3_select(fr) == 1) {
			System.out.println("2:"+ss.getMapper(BoardMapper.class).FrDelete_r_select(fr));
			System.out.println("3:"+ss.getMapper(BoardMapper.class).FrDelete_3_select(fr));
			System.out.println("4:"+fr.getFr_owner_no());
			if (ss.getMapper(BoardMapper.class).FrDelete(fr) == 1 
				&& ss.getMapper(BoardMapper.class).Fr3Delete(fr) == 1) {
				req.setAttribute("result", "삭제성공");
			} else {
				req.setAttribute("result", "삭제실패");
			}						
		} else {
			if (ss.getMapper(BoardMapper.class).FrDelete(fr) == 1) {
				req.setAttribute("result", "삭제성공");
			} else {
				req.setAttribute("result", "삭제실패");
			}
		}
	}
	
	public void updateCount(Freeboard fb, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).Fbcount_update(fb) == 1) {
			req.setAttribute("result", "카운트수정성공");
		} else {
			req.setAttribute("result", "카운트수정실패");
		}	
		
	} 

	//댓글 수정
	public void frupdate(FbReply fr, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).Fr_update(fr) == 1) {
			req.setAttribute("result", "댓글 수정 성공");
		} else {
			req.setAttribute("result", "댓글 수정 실패");
		}
	}

	//캠핑팁-----------------------------------------------------------------
	//캠핑전체리스트
	public void getAllCampingtip(HttpServletRequest req) {
		int rowSize = 10; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ //list.jsp?pg=2
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
	    int to=(pg * rowSize); //(1*10) = 10 //to
		
	    BoardPage p = new BoardPage();
	    p.setFrom(from);
	    p.setTo(to);
	    
		List<Campingtipboard> b = ss.getMapper(BoardMapper.class).getAllcampingtip(p);   	 

	    int total = ss.getMapper(BoardMapper.class).getAllcampingtipcnt(); //총 게시물 수
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
		req.setAttribute("b", b);
		req.setAttribute("c", "campingtip.go?");	
		req.setAttribute("sort", "ct");
	}

	//캠핑팁 등록
	public void ctinsert(Campingtipboard cb, HttpServletRequest req) {
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
			String tip_u_id = mr.getParameter("tip_u_id");
			String tip_subject = mr.getParameter("subject");
			String tip_txt = mr.getParameter("txt");			

			cb.setTip_u_id(tip_u_id);
			cb.setTip_subject(tip_subject);
			cb.setTip_txt(tip_txt);
			
			if (ss.getMapper(BoardMapper.class).CbInsert(cb) == 1) {
				req.setAttribute("result", "등록성공");
			} else {
				req.setAttribute("result", "등록실패");
			}	
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("picture");
			new File(path + "/" + fileName).delete();
			req.setAttribute("result", "수정실패");
		}
		
	}

	//캠핑팁 검색
	public void getcampingtipboard(Search s, HttpServletRequest req) {
		int rowSize = 10; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ //list.jsp?pg=2
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
	    int to=(pg * rowSize); //(1*10) = 10 //to

	    s.setFrom(from);
	    s.setTo(to);
		if(s.getSearchsort().equals("subject")) {
			List<Campingtipboard> b = ss.getMapper(BoardMapper.class).TipSearch_subject(s);
			
			int total = ss.getMapper(BoardMapper.class).TipSearch_subject_cnt(s); //총 게시물 수
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

		    String c = "ct.search?searchsort=subject&search=" + s.getSearch() + "&";
		    
		    req.setAttribute("pg", pg);
		    req.setAttribute("block", block);
		    req.setAttribute("fromPage", fromPage);
		    req.setAttribute("toPage", toPage);
		    req.setAttribute("allPage", allPage);
			req.setAttribute("b", b);
			req.setAttribute("c", c);
			req.setAttribute("sort", "ct");
		} else {
			List<Campingtipboard> b = ss.getMapper(BoardMapper.class).TipSearch_id(s);
			
			int total = ss.getMapper(BoardMapper.class).TipSearch_id_cnt(s); //총 게시물 수
			System.out.println(total + "????????");
		    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
		    int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

		    int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
		    int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
		    if(toPage> allPage){ // 예) 20>17
		        toPage = allPage;
		    }
		    
		    String c = "ct.search?searchsort=id&search=" + s.getSearch() + "&";

		    req.setAttribute("pg", pg);
		    req.setAttribute("block", block);
		    req.setAttribute("fromPage", fromPage);
		    req.setAttribute("toPage", toPage);
		    req.setAttribute("allPage", allPage);
			req.setAttribute("b", b);
			req.setAttribute("c", c);
			req.setAttribute("sort", "ct");
		}		
	}

	//캠핑팁조회수
	public void updateCount(Campingtipboard cb, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).Cbcount_update(cb) == 1) {
			req.setAttribute("result", "카운트수정성공");
		} else {
			req.setAttribute("result", "카운트수정실패");
		}			
	}

	//캠핑팁 클릭 페이지
	public void getonectboard(Campingtipboard cb, HttpServletRequest req) {
		Campingtipboard b = ss.getMapper(BoardMapper.class).getonectboard(cb);		
		req.setAttribute("fb", b);			
	}
	
	//캠핑팁 클릭 페이지 댓글
	public void getctreply(Campingtipboard cb, HttpServletRequest req) {
		int rowSize = 5; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ 
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1);
	    int to=(pg * rowSize); 
		
	    BoardPage p = new BoardPage();
	    p.setFrom(from);
	    p.setTo(to);
	    p.setTip_no(cb.getTip_no());
	    
		List<CtReply> fr = ss.getMapper(BoardMapper.class).getctreply(p);
		List<CtReply> frr = ss.getMapper(BoardMapper.class).getctrreply(cb);
		List<CtReply> frr_cnt = ss.getMapper(BoardMapper.class).getctrreply_cnt(cb);
		
		int total = ss.getMapper(BoardMapper.class).getAllctreplycnt(cb); //총 게시물 수
	    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
	    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
	    int block = 5; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

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
	    req.setAttribute("fr", fr);
	    req.setAttribute("frr", frr);
	    req.setAttribute("frr_cnt", frr_cnt);
	}

	//캠핑팁 수정
	public void ctupdate(Campingtipboard cb, HttpServletRequest req) {
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
			String tip_subject = mr.getParameter("subject");
			String tip_txt = mr.getParameter("txt");			

			cb.setTip_subject(tip_subject);
			cb.setTip_txt(tip_txt);
			
			if (ss.getMapper(BoardMapper.class).CtUpdate(cb) == 1) {
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

	//캠핑팁 댓글 수정
	public void tiprupdate(CtReply cr, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).Cr_update(cr) == 1) {
			req.setAttribute("result", "댓글 수정 성공");
		} else {
			req.setAttribute("result", "댓글 수정 실패");
		}
	}

	//캠핑팁 삭제
	public void ctdelete(Campingtipboard cb, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).CtDelete(cb) == 1) {
			req.setAttribute("result", "삭제성공");
		} else {
			req.setAttribute("result", "삭제실패");
		}	
	}
	
	//캠핑팁 댓글 등록
	public void ctreplyinsert(CtReply cr, HttpServletRequest req) {
		String tipr_owner_id = req.getParameter("tipr_owner_id");
		//대댓글
		if (tipr_owner_id != null) {
			if (ss.getMapper(BoardMapper.class).CtreplyInsert2(cr) == 1) {
				req.setAttribute("result", "등록성공");
			} else {
				req.setAttribute("result", "등록실패");
			}
		} 
		//댓글
		else { 
			if (ss.getMapper(BoardMapper.class).CtreplyInsert(cr) == 1) {
				req.setAttribute("result", "등록성공");
			} else {
				req.setAttribute("result", "등록실패");
			}
		}
	}
	
	//캠핑팁 댓글 삭제
	public void tiprdelete(CtReply cr, HttpServletRequest req) {
		int depth = Integer.parseInt(req.getParameter("tipr_depth"));
		int fr_s = ss.getMapper(BoardMapper.class).TiprDelete_update_select(cr);
		System.out.println(depth);
		
		if(depth == 3 && fr_s > 0) {
			//삭제할 댓글에 대댓글이 있을경우
			System.out.println(fr_s);
			if (ss.getMapper(BoardMapper.class).TiprDelete_update(cr) == 1) {
				req.setAttribute("result", "삭제성공");
			} else {
				req.setAttribute("result", "삭제실패");
			}			
		} 
		//대댓글이며 댓글이 알수없음이고 해당 댓글에 대댓글이 하나라면
		else if(depth != 3 
				&& ss.getMapper(BoardMapper.class).TiprDelete_r_select(cr) == 1
				&& ss.getMapper(BoardMapper.class).TiprDelete_3_select(cr) == 1) {
			System.out.println("2:"+ss.getMapper(BoardMapper.class).TiprDelete_r_select(cr));
			System.out.println("3:"+ss.getMapper(BoardMapper.class).TiprDelete_3_select(cr));
			System.out.println("4:"+cr.getTipr_owner_no());
			if (ss.getMapper(BoardMapper.class).TiprDelete(cr) == 1 
				&& ss.getMapper(BoardMapper.class).Tipr3Delete(cr) == 1) {
				req.setAttribute("result", "삭제성공");
			} else {
				req.setAttribute("result", "삭제실패");
			}						
		} else {
			if (ss.getMapper(BoardMapper.class).TiprDelete(cr) == 1) {
				req.setAttribute("result", "삭제성공");
			} else {
				req.setAttribute("result", "삭제실패");
			}
		}
	}

	//레시피-----------------------------------------------------------------
	//레시피전체리스트
	public void getAllRecipe(HttpServletRequest req) {
		int rowSize = 12; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ //list.jsp?pg=2
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
	    int to=(pg * rowSize); //(1*10) = 10 //to
		
	    BoardPage p = new BoardPage();
	    p.setFrom(from);
	    p.setTo(to);
	    
		List<Recipe> b = ss.getMapper(BoardMapper.class).getAllrecipe(p);   	 

	    int total = ss.getMapper(BoardMapper.class).getAllrecipecnt(); //총 게시물 수
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
		req.setAttribute("b", b);
		req.setAttribute("c", "recipe.go?");	
		req.setAttribute("sort", "r");
		req.setAttribute("br",1);
	}

	//캠핑팁 등록
	public void rinsert(Recipe r, HttpServletRequest req) {
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
			String rb_u_id = mr.getParameter("rb_u_id");
			String rb_subject = mr.getParameter("subject");
			String rb_txt = mr.getParameter("txt");	
			String rb_picture = mr.getFilesystemName("picture");
			
			r.setRb_u_id(rb_u_id);
			r.setRb_subject(rb_subject);
			r.setRb_txt(rb_txt);
			r.setRb_picture(rb_picture);
			
			if (ss.getMapper(BoardMapper.class).RbInsert(r) == 1) {
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

	//캠핑팁 검색
	public void getrecipeboard(Search s, HttpServletRequest req) {
		int rowSize = 12; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ //list.jsp?pg=2
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
	    int to=(pg * rowSize); //(1*10) = 10 //to

	    s.setFrom(from);
	    s.setTo(to);
		if(s.getSearchsort().equals("subject")) {
			List<Recipe> b = ss.getMapper(BoardMapper.class).RSearch_subject(s);
			
			int total = ss.getMapper(BoardMapper.class).RSearch_subject_cnt(s); //총 게시물 수
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

		    String c = "r.search?searchsort=subject&search=" + s.getSearch() + "&";
		    
		    req.setAttribute("pg", pg);
		    req.setAttribute("block", block);
		    req.setAttribute("fromPage", fromPage);
		    req.setAttribute("toPage", toPage);
		    req.setAttribute("allPage", allPage);
			req.setAttribute("b", b);
			req.setAttribute("c", c);
			req.setAttribute("sort", "ct");
		} else {
			List<Recipe> b = ss.getMapper(BoardMapper.class).RSearch_id(s);
			
			int total = ss.getMapper(BoardMapper.class).RSearch_id_cnt(s); //총 게시물 수
			System.out.println(total + "????????");
		    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
		    int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

		    int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
		    int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
		    if(toPage> allPage){ // 예) 20>17
		        toPage = allPage;
		    }
		    
		    String c = "r.search?searchsort=id&search=" + s.getSearch() + "&";

		    req.setAttribute("pg", pg);
		    req.setAttribute("block", block);
		    req.setAttribute("fromPage", fromPage);
		    req.setAttribute("toPage", toPage);
		    req.setAttribute("allPage", allPage);
			req.setAttribute("b", b);
			req.setAttribute("c", c);
			req.setAttribute("sort", "ct");
		}		
	}

	//캠핑팁조회수
	public void updateCount(Recipe r, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).Rbcount_update(r) == 1) {
			req.setAttribute("result", "카운트수정성공");
		} else {
			req.setAttribute("result", "카운트수정실패");
		}			
	}

	//캠핑팁 클릭 페이지
	public void getoneRboard(Recipe r, HttpServletRequest req) {
		Recipe b = ss.getMapper(BoardMapper.class).getoneRboard(r);		
		req.setAttribute("fb", b);			
	}
	
	//캠핑팁 클릭 페이지 댓글
	public void getRreply(Recipe r, HttpServletRequest req) {
		int rowSize = 5; //한페이지에 보여줄 글의 수
	    int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	   
	    String strPg = req.getParameter("pg");
	    if(strPg != null){ 
	    	pg = Integer.parseInt(strPg); //.저장
	    }

	    int from = (pg * rowSize) - (rowSize-1);
	    int to=(pg * rowSize); 
		
	    BoardPage p = new BoardPage();
	    p.setFrom(from);
	    p.setTo(to);
	    p.setRb_no(r.getRb_no());
	    
		List<RReply> fr = ss.getMapper(BoardMapper.class).getrreply(p);
		List<RReply> frr = ss.getMapper(BoardMapper.class).getrrreply(r);
		List<RReply> frr_cnt = ss.getMapper(BoardMapper.class).getrrreply_cnt(r);
		
		int total = ss.getMapper(BoardMapper.class).getAllrreplycnt(r); //총 게시물 수
	    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
	    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
	    int block = 5; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>

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
	    req.setAttribute("fr", fr);
	    req.setAttribute("frr", frr);
	    req.setAttribute("frr_cnt", frr_cnt);
	}

	//캠핑팁 수정
	public void Rupdate(Recipe r, HttpServletRequest req) {
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
			String r_subject = mr.getParameter("subject");
			String r_txt = mr.getParameter("txt");	
			String old_picture = mr.getParameter("old_picture");
			String new_picture = mr.getFilesystemName("new_picture");

			r.setRb_subject(r_subject);
			r.setRb_txt(r_txt);
			if(new_picture!=null) {
				r.setRb_picture(new_picture);
			}else {
				r.setRb_picture(old_picture);
			}
			
			if (ss.getMapper(BoardMapper.class).RUpdate(r) == 1) {
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

	//캠핑팁 댓글 수정
	public void rrupdate(RReply rr, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).Rr_update(rr) == 1) {
			req.setAttribute("result", "댓글 수정 성공");
		} else {
			req.setAttribute("result", "댓글 수정 실패");
		}
	}

	//캠핑팁 삭제
	public void rdelete(Recipe r, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).RDelete(r) == 1) {
			req.setAttribute("result", "삭제성공");
		} else {
			req.setAttribute("result", "삭제실패");
		}	
	}
	
	//캠핑팁 댓글 등록
	public void rreplyinsert(RReply rr, HttpServletRequest req) {
		String rr_owner_id = req.getParameter("rr_owner_id");
		//대댓글
		if (rr_owner_id != null) {
			if (ss.getMapper(BoardMapper.class).RreplyInsert2(rr) == 1) {
				req.setAttribute("result", "등록성공");
			} else {
				req.setAttribute("result", "등록실패");
			}
		} 
		//댓글
		else { 
			if (ss.getMapper(BoardMapper.class).RreplyInsert(rr) == 1) {
				req.setAttribute("result", "등록성공");
			} else {
				req.setAttribute("result", "등록실패");
			}
		}
	}
	
	//캠핑팁 댓글 삭제
	public void Rrdelete(RReply rr, HttpServletRequest req) {
		int depth = Integer.parseInt(req.getParameter("rr_depth"));
		int fr_s = ss.getMapper(BoardMapper.class).RrDelete_update_select(rr);
		
		System.out.println("------------");
		System.out.println(fr_s);
		System.out.println("------------");
		System.out.println(depth);
		
		if(depth == 3 && fr_s > 0) {
			//삭제할 댓글에 대댓글이 있을경우
			System.out.println(fr_s);
			if (ss.getMapper(BoardMapper.class).RrDelete_update(rr) == 1) {
				req.setAttribute("result", "삭제성공");
			} else {
				req.setAttribute("result", "삭제실패");
			}			
		} 
		//대댓글이며 댓글이 알수없음이고 해당 댓글에 대댓글이 하나라면
		else if(depth != 3 
				&& ss.getMapper(BoardMapper.class).RrDelete_r_select(rr) == 1
				&& ss.getMapper(BoardMapper.class).RrDelete_3_select(rr) == 1) {
			System.out.println("2:"+ss.getMapper(BoardMapper.class).RrDelete_r_select(rr));
			System.out.println("3:"+ss.getMapper(BoardMapper.class).RrDelete_3_select(rr));
			System.out.println("4:"+rr.getRr_owner_no());
			if (ss.getMapper(BoardMapper.class).RrDelete(rr) == 1 
				&& ss.getMapper(BoardMapper.class).Rr3Delete(rr) == 1) {
				req.setAttribute("result", "삭제성공");
			} else {
				req.setAttribute("result", "삭제실패");
			}						
		} else {
			if (ss.getMapper(BoardMapper.class).RrDelete(rr) == 1) {
				req.setAttribute("result", "삭제성공");
			} else {
				req.setAttribute("result", "삭제실패");
			}
		}
	}
	
	//----------------------------------------------------------------전체
	//통합 인기 게시판
	public void Allpopular(HttpServletRequest req) {
		List<Freeboard> fb = ss.getMapper(BoardMapper.class).freepopular(); 
		List<Campingtipboard> cb = ss.getMapper(BoardMapper.class).tippopular(); 
		List<Recipe> rb = ss.getMapper(BoardMapper.class).recipepopular(); 
		
		req.setAttribute("fb", fb);
		req.setAttribute("cb", cb);
		req.setAttribute("rb", rb);
		
	}

	

}
