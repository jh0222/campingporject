package com.fi.pj.board;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.fi.pj.member.MemberDAO;

@Controller
public class BoardController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private BoardDAO bDAO;
	
	//게시판 페이지로
	@RequestMapping(value = "board.go", method = RequestMethod.GET)
	public String boardGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "board/boardmain.jsp");
		return "main";
	}
	
	//자유-----------------------------------------------------------------
	//자유게시판 페이지로
	@RequestMapping(value = "freeboard.go", method = RequestMethod.GET)
	public String FreeboardGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		bDAO.getAllfreeboard(req);
		req.setAttribute("contentPage", "board/board.jsp");
		return "main";
	}		
	
	//자유게시판 작성 페이지로
	@RequestMapping(value = "fbwrite.go", method = RequestMethod.GET)
	public String FreeboardwriteGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("title", "자유게시판");
		req.setAttribute("sort", "fb");
		req.setAttribute("sort2", "f");
		req.setAttribute("contentPage", "board/boardwrite.jsp");
		return "main";
	}
	
	//자유게시판 등록
	@RequestMapping(value = "fbwrite.insert", method = RequestMethod.POST)
	public String FreeboardwriteInsert(Freeboard fb, HttpServletRequest req) {		
		bDAO.fbinsert(fb,req);
		mDAO.loginCheck(req);
		bDAO.getAllfreeboard(req);
		req.setAttribute("contentPage", "board/board.jsp");
		return "main";
	}
	
	//자유게시판 검색
	@RequestMapping(value = "fb.search", method = RequestMethod.GET)
	public String FreeboardSearch(Search s, HttpServletRequest req) {		
		mDAO.loginCheck(req);
		bDAO.getfreeboard(s, req);		
		req.setAttribute("contentPage", "board/board.jsp");
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
		mDAO.loginCheck(req);
		bDAO.fbupdate(fb,req);
		bDAO.getAllfreeboard(req);
		req.setAttribute("contentPage", "board/board.jsp");
		return "main";
	}
	
	//자유게시판 댓글수정
	@RequestMapping(value = "fr.update", method = RequestMethod.GET)
	public String FreeboardreplyUdate(Freeboard fb, FbReply fr, HttpServletRequest req) {			
		mDAO.loginCheck(req);
		bDAO.frupdate(fr,req);
		bDAO.getonefreeboard(fb, req);
		bDAO.getfbreply(fb,req);
		req.setAttribute("contentPage", "board/freeboard_one.jsp");
		return "main";
	}
	
	//자유게시판 삭제
	@RequestMapping(value = "fbwrite.delete", method = RequestMethod.GET)
	public String FreeboardwriteDelete(Freeboard fb, HttpServletRequest req) {	
		bDAO.fbdelete(fb,req);
		mDAO.loginCheck(req);
		bDAO.getAllfreeboard(req);
		req.setAttribute("contentPage", "board/board.jsp");
		return "main";
	}
	
	//자유게시판 클릭 페이지로(처음)
	@RequestMapping(value = "fbwrite.onego", method = RequestMethod.GET)
	public String FreeboardoneGo(Freeboard fb,HttpServletRequest req) {
		//int f_no = Integer.parseInt(req.getParameter("f_no"));
		mDAO.loginCheck(req);
		bDAO.updateCount(fb,req);
		bDAO.getonefreeboard(fb, req);
		bDAO.getfbreply(fb,req);		
		req.setAttribute("contentPage", "board/freeboard_one.jsp");
		return "main";
	}
	
	//자유게시판 클릭 페이지로(페이지이동)
	@RequestMapping(value = "fb.onego", method = RequestMethod.GET)
	public String FreeboardoneGo2(Freeboard fb,HttpServletRequest req) {		
		mDAO.loginCheck(req);
		bDAO.getonefreeboard(fb, req);
		bDAO.getfbreply(fb,req);		
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
		req.setAttribute("contentPage", "board/freeboard_one.jsp");
		return "main";
	}

	//캠핑팁-----------------------------------------------------------------
	//캠핑장꿀팁 페이지로
	@RequestMapping(value = "campingtip.go", method = RequestMethod.GET)
	public String CampingtipGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		bDAO.getAllCampingtip(req);
		req.setAttribute("contentPage", "board/board.jsp");
		return "main";
	} 
	 
	//캠핑팁 작성 페이지로
	@RequestMapping(value = "ctwrite.go", method = RequestMethod.GET)
	public String CampingtipwriteGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("title", "캠핑팁게시판");
		req.setAttribute("sort", "ct");
		req.setAttribute("sort2", "tip");
		req.setAttribute("contentPage", "board/boardwrite.jsp");
		return "main";
	}

	//자유게시판 등록
	@RequestMapping(value = "ctwrite.insert", method = RequestMethod.POST)
	public String CampingtipwriteInsert(Campingtipboard cb, HttpServletRequest req) {		
		bDAO.ctinsert(cb,req);
		mDAO.loginCheck(req);
		bDAO.getAllCampingtip(req);
		req.setAttribute("contentPage", "board/board.jsp");
		return "main";
	}
	
	//자유게시판 검색
	@RequestMapping(value = "ct.search", method = RequestMethod.GET)
	public String campingtipboardSearch(Search s, HttpServletRequest req) {		
		mDAO.loginCheck(req);
		bDAO.getcampingtipboard(s, req);		
		req.setAttribute("contentPage", "board/board.jsp");
		return "main"; 
	}
	
	//자유게시판 수정
	@RequestMapping(value = "ctwrite.updatego", method = RequestMethod.GET)
	public String campingtipwriteUdateGo(Campingtipboard cb, HttpServletRequest req) {		
		mDAO.loginCheck(req);
		bDAO.getonectboard(cb, req);
		req.setAttribute("contentPage", "board/campingtipboard_update.jsp");
		return "main";
	}
	
	//자유게시판 수정
	@RequestMapping(value = "ctwrite.update", method = RequestMethod.POST)
	public String campingtipwriteUdate(Campingtipboard cb, HttpServletRequest req) {			
		mDAO.loginCheck(req);
		bDAO.ctupdate(cb,req);
		bDAO.getAllCampingtip(req);
		req.setAttribute("contentPage", "board/board.jsp");
		return "main";
	}
	
	//자유게시판 댓글수정
	@RequestMapping(value = "ctr.update", method = RequestMethod.GET)
	public String campingtipreplyUdate(Campingtipboard cb, CtReply cr, HttpServletRequest req) {			
		mDAO.loginCheck(req);
		bDAO.tiprupdate(cr,req);
		bDAO.getonectboard(cb, req);
		bDAO.getctreply(cb,req);
		req.setAttribute("contentPage", "board/campingtipboard_one.jsp");
		return "main";
	}
	
	//자유게시판 삭제
	@RequestMapping(value = "ctwrite.delete", method = RequestMethod.GET)
	public String campingtipwriteDelete(Campingtipboard cb, HttpServletRequest req) {	
		bDAO.ctdelete(cb,req); 
		mDAO.loginCheck(req);
		bDAO.getAllCampingtip(req);
		req.setAttribute("contentPage", "board/board.jsp");
		return "main";
	}
	
	//자유게시판 클릭 페이지로(처음)
	@RequestMapping(value = "ctwrite.onego", method = RequestMethod.GET)
	public String campingtiponeGo(Campingtipboard cb,HttpServletRequest req) {
		//int f_no = Integer.parseInt(req.getParameter("f_no"));
		mDAO.loginCheck(req);
		bDAO.updateCount(cb,req);
		bDAO.getonectboard(cb, req);
		bDAO.getctreply(cb,req);		
		req.setAttribute("contentPage", "board/campingtipboard_one.jsp");
		return "main";
	}
	
	//자유게시판 클릭 페이지로(페이지이동)
	@RequestMapping(value = "ct.onego", method = RequestMethod.GET)
	public String campingtiponeGo2(Campingtipboard cb,HttpServletRequest req) {		
		mDAO.loginCheck(req);
		bDAO.getonectboard(cb, req);
		bDAO.getctreply(cb,req);		
		req.setAttribute("contentPage", "board/campingtipboard_one.jsp");
		return "main";
	}
	
	//자유게시판 댓글 등록
	@RequestMapping(value = "ct_replyinsert", method = RequestMethod.GET)
	public String campingtipreplyInsert(Campingtipboard cb, CtReply cr, HttpServletRequest req) {		
		bDAO.ctreplyinsert(cr,req); 
		mDAO.loginCheck(req);
		bDAO.getonectboard(cb, req);
		bDAO.getctreply(cb,req);
		req.setAttribute("contentPage", "board/campingtipboard_one.jsp");
		return "main";
	}
	  
	//자유게시판 댓글 삭제
	@RequestMapping(value = "ctr.delete", method = RequestMethod.GET)
	public String campingtipwriteDelete(Campingtipboard cb, CtReply cr, HttpServletRequest req) {	
		bDAO.tiprdelete(cr,req);
		mDAO.loginCheck(req);
		bDAO.getonectboard(cb, req);
		bDAO.getctreply(cb,req);
		req.setAttribute("contentPage", "board/campingtipboard_one.jsp");
		return "main";
	}

	//레시피-----------------------------------------------------------------
	//레시피 페이지로
	@RequestMapping(value = "recipe.go", method = RequestMethod.GET)
	public String RecipeGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "board/recipe.jsp");
		return "main";
	}		
		
	//레시피 작성 페이지로
	@RequestMapping(value = "rwrite.go", method = RequestMethod.GET)
	public String RecipewriteGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "board/recipewrite.jsp");
		return "main";
	}
	

	//자유게시판 등록
	@RequestMapping(value = "rwrite.insert", method = RequestMethod.POST)
	public String RecipewriteInsert(Freeboard fb, HttpServletRequest req) {		
		bDAO.fbinsert(fb,req);
		mDAO.loginCheck(req);
		bDAO.getAllfreeboard(req);
		req.setAttribute("contentPage", "board/freeboard.jsp");
		return "main";
	}
	
	//자유게시판 검색
	@RequestMapping(value = "r.search", method = RequestMethod.GET)
	public String RecipeSearch(Search s, HttpServletRequest req) {		
		mDAO.loginCheck(req);
		bDAO.getfreeboard(s, req);		
		req.setAttribute("contentPage", "board/freeboard.jsp");
		return "main"; 
	}
	
	//자유게시판 수정
	@RequestMapping(value = "rwrite.updatego", method = RequestMethod.GET)
	public String RecipewriteUdateGo(Freeboard fb, HttpServletRequest req) {		
		mDAO.loginCheck(req);
		bDAO.getonefreeboard(fb, req);
		req.setAttribute("contentPage", "board/freeboard_update.jsp");
		return "main";
	}
	
	//자유게시판 수정
	@RequestMapping(value = "rwrite.update", method = RequestMethod.POST)
	public String RecipewriteUdate(Freeboard fb, HttpServletRequest req) {			
		mDAO.loginCheck(req);
		bDAO.fbupdate(fb,req);
		bDAO.getAllfreeboard(req);
		req.setAttribute("contentPage", "board/freeboard.jsp");
		return "main";
	}
	
	//자유게시판 댓글수정
	@RequestMapping(value = "rr.update", method = RequestMethod.GET)
	public String RecipereplyUdate(Freeboard fb, FbReply fr, HttpServletRequest req) {			
		mDAO.loginCheck(req);
		bDAO.frupdate(fr,req);
		bDAO.getonefreeboard(fb, req);
		bDAO.getfbreply(fb,req);
		req.setAttribute("contentPage", "board/freeboard_one.jsp");
		return "main";
	}
	
	//자유게시판 삭제
	@RequestMapping(value = "rwrite.delete", method = RequestMethod.GET)
	public String RecipewriteDelete(Freeboard fb, HttpServletRequest req) {	
		bDAO.fbdelete(fb,req);
		mDAO.loginCheck(req);
		bDAO.getAllfreeboard(req);
		req.setAttribute("contentPage", "board/freeboard.jsp");
		return "main";
	}
	
	//자유게시판 클릭 페이지로(처음)
	@RequestMapping(value = "rwrite.onego", method = RequestMethod.GET)
	public String RecipeoneGo(Freeboard fb,HttpServletRequest req) {
		//int f_no = Integer.parseInt(req.getParameter("f_no"));
		mDAO.loginCheck(req);
		bDAO.updateCount(fb,req);
		bDAO.getonefreeboard(fb, req);
		bDAO.getfbreply(fb,req);		
		req.setAttribute("contentPage", "board/freeboard_one.jsp");
		return "main";
	}
	
	//자유게시판 클릭 페이지로(페이지이동)
	@RequestMapping(value = "r.onego", method = RequestMethod.GET)
	public String RecipeoneGo2(Freeboard fb,HttpServletRequest req) {		
		mDAO.loginCheck(req);
		bDAO.getonefreeboard(fb, req);
		bDAO.getfbreply(fb,req);		
		req.setAttribute("contentPage", "board/freeboard_one.jsp");
		return "main";
	}
	
	//자유게시판 댓글 등록
	@RequestMapping(value = "r_replyinsert", method = RequestMethod.GET)
	public String RecipereplyInsert(Freeboard fb, FbReply fr, HttpServletRequest req) {		
		bDAO.fbreplyinsert(fr,req);
		mDAO.loginCheck(req);
		bDAO.getonefreeboard(fb, req);
		bDAO.getfbreply(fb,req);
		req.setAttribute("contentPage", "board/freeboard_one.jsp");
		return "main";
	}
	  
	//자유게시판 댓글 삭제
	@RequestMapping(value = "rr.delete", method = RequestMethod.GET)
	public String RecipewriteDelete(Freeboard fb, FbReply fr, HttpServletRequest req) {	
		bDAO.frdelete(fr,req);
		mDAO.loginCheck(req);
		bDAO.getonefreeboard(fb, req);
		bDAO.getfbreply(fb,req);
		req.setAttribute("contentPage", "board/freeboard_one.jsp");
		return "main";
	}

}

