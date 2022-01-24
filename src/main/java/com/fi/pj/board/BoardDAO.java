package com.fi.pj.board;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fi.pj.member.MemberMapper;
import com.fi.pj.member.UserMember;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class BoardDAO {
	
	@Autowired
	private SqlSession ss;

	//자유게시판 전체목록 보기
	public void getAllfreeboard(HttpServletRequest req) {
		List<Freeboard> fb = ss.getMapper(BoardMapper.class).getAllfreeboard();
		req.setAttribute("fb", fb);
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
			String f_picture = mr.getFilesystemName("picture");
			f_picture = URLEncoder.encode(f_picture, "utf-8");
			f_picture = f_picture.replace("+", " ");

			fb.setF_u_id(f_u_id);
			fb.setF_subject(f_subject);
			fb.setF_txt(f_txt);
			fb.setF_picture(f_picture);

			if (ss.getMapper(BoardMapper.class).FbInsert(fb) == 1) {
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

	//자유게시판 검색
	public void getfreeboard(Search s, HttpServletRequest req) {
		if(s.getSearchsort().equals("f_subject")) {
			List<Freeboard> fb = ss.getMapper(BoardMapper.class).FbSearch_subject(s);
			req.setAttribute("fb", fb);
		} else {
			List<Freeboard> fb = ss.getMapper(BoardMapper.class).FbSearch_id(s);
			req.setAttribute("fb", fb);
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
			String newpicture = mr.getFilesystemName("picture");
			System.out.println(newpicture);
			String oldpicture = mr.getParameter("f_picture");
			
			fb.setF_subject(f_subject);
			fb.setF_txt(f_txt);
			if(newpicture != null) {
				fb.setF_picture(newpicture);
			} else {
				fb.setF_picture(oldpicture);
			}
			
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
		List<FbReply> fr = ss.getMapper(BoardMapper.class).getfbreply(fb);
		req.setAttribute("fr", fr);		
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

	public void getfbrreply(Freeboard fb, HttpServletRequest req) {
		List<FbReply> frr = ss.getMapper(BoardMapper.class).getfbrreply(fb);
		req.setAttribute("frr", frr);		
	}

	

}
