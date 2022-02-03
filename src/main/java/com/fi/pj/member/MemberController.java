package com.fi.pj.member;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;

	// 로그인 페이지로
	@RequestMapping(value = "login.go", method = RequestMethod.GET)
	public String gologin(UserMember m, HttpServletRequest req) {
		req.setAttribute("contentPage", "member/login.jsp");
		return "main";
	}

	// 로그인 하기
	@RequestMapping(value = "member.login", method = RequestMethod.POST)
	public String login(Login l, HttpServletRequest req) {
		mDAO.login(l, req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}

	// 회원가입 페이지로
	@RequestMapping(value = "join.go", method = RequestMethod.GET)
	public String JoinGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/join.jsp");
		return "main";
	}

	// 회원가입 페이지로(사용자)
	@RequestMapping(value = "join.usergo", method = RequestMethod.GET)
	public String JoinUserGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/join_user.jsp");
		return "main";
	}

	// 회원가입 페이지로(사장님)
	@RequestMapping(value = "join.bossgo", method = RequestMethod.GET)
	public String JoinBossGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/join_boss.jsp");
		return "main";
	}

	// 회원가입 하기(사용자)
	@RequestMapping(value = "usermember.join", method = RequestMethod.POST)
	public String usermemberJoin(UserMember m, HttpServletRequest req) {
		mDAO.userjoin(m, req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}

	// 회원가입 하기(사장님)
	@RequestMapping(value = "bossmember.join", method = RequestMethod.POST)
	public String memberJoin(BossMember m, HttpServletRequest req) {
		mDAO.bossjoin(m, req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}

	// 아이디 중복확인
	@RequestMapping(value = "member.get", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody int memberGet(UserMember m, BossMember b, HttpServletRequest req) {
		return mDAO.getMemberNum(m, b, req);
	}

	// 아이디 찾기 페이지로
	@RequestMapping(value = "idsearch.go", method = RequestMethod.GET)
	public String IdsearchGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/idsearch.jsp");
		return "main";
	}

	// 로그아웃
	@RequestMapping(value = "member.logout", method = RequestMethod.GET)
	public String logout(UserMember m, HttpServletRequest req) {
		mDAO.logout(req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}

	// 사용자 마이페이지
	@RequestMapping(value = "user.info", method = RequestMethod.GET)
	public String userInfo(HttpServletRequest request) {
		
		mDAO.loginCheck(request);
		mDAO.splitUser(request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/Info_user.jsp");

		return "main";
	}

	// 사용자 정보 업데이트
	@RequestMapping(value = "user.update", method = RequestMethod.POST)
	public String userUpdate(UserMember user, HttpServletRequest request) {

		mDAO.loginCheck(request);
		mDAO.UserUpdate(user, request);
		mDAO.splitUser(request);
		request.setAttribute("contentPage", "member/Info_user.jsp");
		
		return "main";
	}

	// 사용자 탈퇴
	@RequestMapping(value = "user.bye", method = RequestMethod.GET)
	public String userBye(HttpServletRequest request) {

		mDAO.userBye(request);
		mDAO.loginCheck(request);
		request.setAttribute("contentPage", "home.jsp");
		
		return "main";
	}

	// 사장 마이페이지
	@RequestMapping(value = "boss.info", method = RequestMethod.GET)
	public String bossInfo(HttpServletRequest request) {

		mDAO.loginCheck(request);
		mDAO.splitBossAddr(request);
		request.setAttribute("contentPage", "member/Info_boss.jsp");

		return "main";
	}

	// 사장 정보 업데이트
	@RequestMapping(value = "boss.update", method = RequestMethod.GET)
	public String bossUpdate(BossMember boss, HttpServletRequest request) {

		mDAO.loginCheck(request);
		mDAO.splitBossAddr(request);
		mDAO.bossUpdate(boss, request);
		request.setAttribute("contentPage", "member/Info_boss.jsp");
		
		return "main";
	}

	// 사장 탈퇴
	@RequestMapping(value = "boss.bye", method = RequestMethod.GET)
	public String bossBye(HttpServletRequest request) {

		mDAO.bossBye(request);
		mDAO.loginCheck(request);
		request.setAttribute("contentPage", "main.jsp");
		
		return "main";
	}
	
	// 사용자 구매목록
		@RequestMapping(value = "userbuylist", method = RequestMethod.GET)
		public String userbuylist(Buy b,HttpServletRequest request) {

		mDAO.userbuylist(b,request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/buylist.jsp");
			
		return "main";
	}
		
	// 구매목록
	@RequestMapping(value = "buy.del", method = RequestMethod.GET)
		public String buydel(Buy b,HttpServletRequest request) {
		mDAO.buydel(b,request); 
		mDAO.userbuylist(b,request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/buylist.jsp");
			
		return "main";
	}
	
	// 커뮤니티
	@RequestMapping(value = "user.communities", method = RequestMethod.GET)
		public String usercommunities(Communities c,HttpServletRequest request) {
		mDAO.usercommunities(c,request); 
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/communities.jsp");
			
		return "main";
	}

}
