package com.fi.pj.member;

import javax.servlet.http.HttpServletRequest;
<<<<<<< HEAD
=======
import org.mybatis.spring.SqlSessionTemplate;
>>>>>>> f6e97b147430655eb9830a06775b3e8435e3f9e3
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO mDAO;
<<<<<<< HEAD
	
=======

>>>>>>> f6e97b147430655eb9830a06775b3e8435e3f9e3
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
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}
	
	//회원가입 하기(사장님)
<<<<<<< HEAD
		@RequestMapping(value = "bossmember.join", method = RequestMethod.POST)
		public String memberJoin(BossMember m, HttpServletRequest req) {
			mDAO.bossjoin(m, req);
			mDAO.loginCheck(req);
			req.setAttribute("contentPage", "home.jsp");
			return "main";
		}
=======
	@RequestMapping(value = "bossmember.join", method = RequestMethod.POST)
	public String memberJoin(BossMember m, HttpServletRequest req) {
		mDAO.bossjoin(m, req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}
>>>>>>> f6e97b147430655eb9830a06775b3e8435e3f9e3
	
	//아이디 중복확인
	@RequestMapping(value = "member.get", 
			method = RequestMethod.GET, 
			produces = "application/json; charset=utf-8")
	public @ResponseBody int memberGet(UserMember m, BossMember b, HttpServletRequest req) {
		return mDAO.getMemberNum(m, b, req);
	}
	
	//아이디 찾기 페이지로
	@RequestMapping(value = "idsearch.go", method = RequestMethod.GET)
	public String IdsearchGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/idsearch.jsp");
		return "main";
	}
	
<<<<<<< HEAD
=======
	//비번 찾기 페이지로
	@RequestMapping(value = "pwsearch.go", method = RequestMethod.GET)
	public String PwsearchGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/pwsearch.jsp");
		return "main";
	}
	
>>>>>>> f6e97b147430655eb9830a06775b3e8435e3f9e3
	//로그아웃
	@RequestMapping(value = "member.logout", method = RequestMethod.GET)
	public String logout(UserMember m, HttpServletRequest req) {		
		mDAO.logout(req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}
<<<<<<< HEAD
=======
	
	//아이디 찾기
	@RequestMapping(value = "id.search", method = RequestMethod.GET)
	public String Idsearch(Login l, HttpServletRequest req) {
		System.out.println("ss"+l.getName());
		System.out.println(l.getPhonenumber());
		mDAO.idsearch(l,req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "member/idsearch2.jsp");
		return "main";
	}
>>>>>>> f6e97b147430655eb9830a06775b3e8435e3f9e3

}
