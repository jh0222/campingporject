package com.fi.pj.board;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fi.pj.member.MemberDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class BoardController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private BoardDAO bDAO;
	
	
	//자유게시판 페이지로
	@RequestMapping(value = "freeboard.go", method = RequestMethod.GET)
	public String FreeboardGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		bDAO.getAllfreeboard(req);
		req.setAttribute("contentPage", "board/freeboard.jsp");
		return "main";
	}
	
	//캠핑장꿀팁 페이지로
	@RequestMapping(value = "campingtip.go", method = RequestMethod.GET)
	public String CampingtipGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "board/campingtip.jsp");
		return "main";
	}
		
	//레시피 페이지로
	@RequestMapping(value = "recipe.go", method = RequestMethod.GET)
	public String RecipeGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "board/recipe.jsp");
		return "main";
	}
	
	//자유게시판 작성 페이지로
	@RequestMapping(value = "fbwrite.go", method = RequestMethod.GET)
	public String FreeboardwriteGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "board/freeboardwrite.jsp");
		return "main";
	}

	//캠핑팁 작성 페이지로
	@RequestMapping(value = "ctwrite.go", method = RequestMethod.GET)
	public String CampingtipwriteGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "board/campingtipwrite.jsp");
		return "main";
	}
	
	//캠핑팁 작성 페이지로
	@RequestMapping(value = "rwrite.go", method = RequestMethod.GET)
	public String RecipewriteGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "board/recipewrite.jsp");
		return "main";
	}
	
	//자유게시판 등록
	@RequestMapping(value = "fbwrite.insert", method = RequestMethod.POST)
	public String FreeboardwriteInsert(Freeboard fb, HttpServletRequest req) {		
		bDAO.fbinsert(fb,req);
		mDAO.loginCheck(req);
		bDAO.getAllfreeboard(req);
		req.setAttribute("contentPage", "board/freeboard.jsp");
		return "main";
	}
	
	//자유게시판 검색
	@RequestMapping(value = "fb.search", method = RequestMethod.GET)
	public String FreeboardSearch(Search s, HttpServletRequest req) {		
		mDAO.loginCheck(req);
		bDAO.getfreeboard(s, req);
		req.setAttribute("contentPage", "board/freeboard.jsp");
		return "main"; 
	}
	
	//자유게시판 수정
	@RequestMapping(value = "fbwrite.updatego", method = RequestMethod.GET)
	public String FreeboardwriteUdateGo(Freeboard fb, HttpServletRequest req) {		
		mDAO.loginCheck(req);
		bDAO.getonefreeboard(fb, req);
		req.setAttribute("contentPage", "board/freeboard_update.jsp");
		return "main";
	}
	
	//자유게시판 수정
	@RequestMapping(value = "fbwrite.update", method = RequestMethod.POST)
	public String FreeboardwriteUdate(Freeboard fb, HttpServletRequest req) {	
		bDAO.fbupdate(fb,req);
		mDAO.loginCheck(req);
		bDAO.getAllfreeboard(req);
		req.setAttribute("contentPage", "board/freeboard.jsp");
		return "main";
	}
	
	//자유게시판 삭제
	@RequestMapping(value = "fbwrite.delete", method = RequestMethod.GET)
	public String FreeboardwriteDelete(Freeboard fb, HttpServletRequest req) {	
		bDAO.fbdelete(fb,req);
		mDAO.loginCheck(req);
		bDAO.getAllfreeboard(req);
		req.setAttribute("contentPage", "board/freeboard.jsp");
		return "main";
	}
	
	//자유게시판 클릭 페이지로
	@RequestMapping(value = "fbwrite.onego", method = RequestMethod.GET)
	public String FreeboardoneGo(Freeboard fb,HttpServletRequest req) {
		//int f_no = Integer.parseInt(req.getParameter("f_no"));
		mDAO.loginCheck(req);
		bDAO.getonefreeboard(fb, req);
		bDAO.getfbreply(fb,req);
		bDAO.getfbrreply(fb,req);
		req.setAttribute("contentPage", "board/freeboard_one.jsp");
		return "main";
	}
	
	//자유게시판 댓글 등록
	@RequestMapping(value = "fb_replyinsert", method = RequestMethod.GET)
	public String FreeboardreplyInsert(Freeboard fb, FbReply fr, HttpServletRequest req) {		
		bDAO.fbreplyinsert(fr,req);
		mDAO.loginCheck(req);
		bDAO.getonefreeboard(fb, req);
		bDAO.getfbreply(fb,req);
		bDAO.getfbrreply(fb,req);
		req.setAttribute("contentPage", "board/freeboard_one.jsp");
		return "main";
	}
	  
	//자유게시판 댓글 삭제
	@RequestMapping(value = "fr.delete", method = RequestMethod.GET)
	public String FreeboardwriteDelete(Freeboard fb, FbReply fr, HttpServletRequest req) {	
		bDAO.frdelete(fr,req);
		mDAO.loginCheck(req);
		bDAO.getonefreeboard(fb, req);
		bDAO.getfbreply(fb,req);
		bDAO.getfbrreply(fb,req);
		req.setAttribute("contentPage", "board/freeboard_one.jsp");
		return "main";
	}
	
	
}

