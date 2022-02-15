package com.fi.pj.user_mypage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@Autowired
	private User_mypageDAO mdao;
	
	@RequestMapping(value = "/user_mypage", method = RequestMethod.GET) // 개인정보 표시
	public String mypage(HttpServletRequest request) {
		
		mdao.getAllmypage(request);
		
		return "main";
	}
	
	@RequestMapping(value = "/user_mypage/contents", method = RequestMethod.GET) // 개인정보 표시
	public String mypagecontents(HttpServletRequest request) {
		
		return "user_mypage";
	}
	
	@RequestMapping(value = "/user_mypage/communities", method = RequestMethod.GET) // 개인정보 표시
	public String mypagecommunities(HttpServletRequest request) {
		
		return "user_mypage";
	}
	
}
