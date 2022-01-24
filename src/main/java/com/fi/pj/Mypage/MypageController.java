package com.fi.pj.Mypage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	private MypageDAO mdao;
	
	@RequestMapping(value = "/User_Mypage", method = RequestMethod.GET)
	public String User(HttpServletRequest request) {
		
		mdao.getAllUserinformation(request);
		
		request.setAttribute("contentPage", "mypage/user.jsp");
		return "main";
	}
	
	@RequestMapping(value = "/Boss_Mypage", method = RequestMethod.GET)
	public String Boss(HttpServletRequest request) {
		
		mdao.getAllBossinformation(request);
		
		request.setAttribute("contentPage", "mypage/boss.jsp");
		return "main";
	}
	
	@RequestMapping(value = "/Manager_Mypage", method = RequestMethod.GET)
	public String Manager(HttpServletRequest request) {
		
		mdao.getAllManagerinformation(request);
		
		request.setAttribute("contentPage", "mypage/manager.jsp");
		return "main";
	}
	
}
