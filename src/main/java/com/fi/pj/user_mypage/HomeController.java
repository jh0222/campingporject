package com.fi.pj;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "main";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET) // 개인정보 표시
	public String mypage() {
		
		return "main";
	}
	
	@RequestMapping(value = "/mypage/contents", method = RequestMethod.GET) // 개인정보 표시
	public String mypagecontents() {
		
		return "";
	}
	
	@RequestMapping(value = "/mypage/communities", method = RequestMethod.GET) // 개인정보 표시
	public String mypagecontents() {
		
		return "main";
	}
	
}
