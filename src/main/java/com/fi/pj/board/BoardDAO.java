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
		
			if (ss.getMapper(BoardMapper.class).FbUpdate(fb) == 1) {
				req.setAttribute("result", "등록성공");
			} else {
				req.setAttribute("result", "등록실패");
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
		int fr_f_no = Integer.parseInt(req.getParameter("fr_f_no"));
		String fr_u_id = req.getParameter("fr_u_id");		
		String fr_replytxt = req.getParameter("fr_replytxt");

		fr.setFr_f_no(fr_f_no);
		fr.setFr_u_id(fr_u_id);
		fr.setFr_replytxt(fr_replytxt);
		
		if (ss.getMapper(BoardMapper.class).FbreplyInsert(fr) == 1) {
			req.setAttribute("result", "등록성공");
		} else {
			req.setAttribute("result", "등록실패");
		}
	}

	//자유게시판 댓글 보기
	public void getfbreply(Freeboard fb, HttpServletRequest req) {
		List<FbReply> fr = ss.getMapper(BoardMapper.class).getfbreply(fb);
		req.setAttribute("fr", fr);		
	}

	//자유게시판 댓글 삭제
	public void frdelete(FbReply fr, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).FrDelete(fr) == 1) {
			req.setAttribute("result", "삭제성공");
		} else {
			req.setAttribute("result", "삭제실패");
		}
	}

}
