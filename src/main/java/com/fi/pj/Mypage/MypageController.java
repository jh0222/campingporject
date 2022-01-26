package com.fi.pj.Mypage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAO mdao;
	
	// 사용자 마이페이지
	@RequestMapping(value = "/Mypage.User", method = RequestMethod.GET)
	public String UserMypage(HttpServletRequest request) {
		
		mdao.Userinformation(request);
		mdao.Userreserve(request);
		
		request.setAttribute("contentPage", "mypage/UserMypage.jsp");
		return "main";
	}
	

	// 사장 마이페이지
	@RequestMapping(value = "/Mypage.Boss", method = RequestMethod.GET)
	public String BossMypage(HttpServletRequest request) {
			
		mdao.getBossinformation(request);
			
		request.setAttribute("contentPage", "mypage/BossMypage.jsp");
		return "main";
	}
	
	// 관리자 마이페이지
	@RequestMapping(value = "/Mypage.Manager", method = RequestMethod.GET)
	public String ManagerMypage(HttpServletRequest request) {
			
		mdao.getManagerinformation(request);
			
		request.setAttribute("contentPage", "mypage/ManagerMypage.jsp");
		return "main";
	}
	
}
