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
	
	//로그인 페이지로 
	@RequestMapping(value = "login.go", method = RequestMethod.GET)
	public String gologin(UserMember m, HttpServletRequest req) {	
		req.setAttribute("contentPage", "member/login.jsp");
		return "main";
	}
	
	//로그인 하기
	@RequestMapping(value = "member.login", method = RequestMethod.POST)
	public String login(Login l, HttpServletRequest req) {
		mDAO.login(l, req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}

	//회원가입 페이지로
	@RequestMapping(value = "join.go", method = RequestMethod.GET)
	public String JoinGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/join.jsp");
		return "main";
	}
	
	//회원가입 페이지로(사용자)
	@RequestMapping(value = "join.usergo", method = RequestMethod.GET)
	public String JoinUserGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/join_user.jsp");
		return "main";
	}
	
	//회원가입 페이지로(사장님)
	@RequestMapping(value = "join.bossgo", method = RequestMethod.GET)
	public String JoinBossGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/join_boss.jsp");
		return "main";
	}
	
	//회원가입 하기(사용자)
	@RequestMapping(value = "usermember.join", method = RequestMethod.POST)
	public String usermemberJoin(UserMember m, HttpServletRequest req) {
		mDAO.userjoin(m, req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "main.jsp");
		return "main";
	}
	
	//회원가입 하기(사장님)
		@RequestMapping(value = "bossmember.join", method = RequestMethod.POST)
		public String memberJoin(BossMember m, HttpServletRequest req) {
			mDAO.bossrjoin(m, req);
			mDAO.loginCheck(req);
			req.setAttribute("contentPage", "main.jsp");
			return "main";
		}
	
	//아이디 중복확인
	@RequestMapping(value = "member.get", 
			method = RequestMethod.GET, 
			produces = "application/json; charset=utf-8")
	public @ResponseBody int memberGet(UserMember m, HttpServletRequest req) {
		return mDAO.getMemberNum(m, req);
	}
	
	//로그아웃
	@RequestMapping(value = "member.logout", method = RequestMethod.GET)
	public String logout(UserMember m, HttpServletRequest req) {		
		mDAO.logout(req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}

}
