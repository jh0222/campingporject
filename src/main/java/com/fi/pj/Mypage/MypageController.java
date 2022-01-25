package com.fi.pj.Mypage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	private MypageDAO mdao;
	
	// 사용자 마이페이지
	@RequestMapping(value = "/User_Mypage", method = RequestMethod.GET)
	public String User(HttpServletRequest request) {
		
		mdao.getUser_infor(request);
		request.setAttribute("contentPage", "mypage/user.jsp");
		return "main";
	}
	
	// 사장님 마이페이지
	@RequestMapping(value = "/Boss_Mypage", method = RequestMethod.GET)
	public String Boss(HttpServletRequest request) {
		
		mdao.getBoss_infor(request);
		request.setAttribute("contentPage", "mypage/boss.jsp");
		return "main";
	}
	
	// 관리자 마이페이지
	@RequestMapping(value = "/Manager_Mypage", method = RequestMethod.GET)
	public String Manager(HttpServletRequest request) {
		
		mdao.getManager_infor(request);
		request.setAttribute("contentPage", "mypage/manager.jsp");
		return "main";
	}
	
}
