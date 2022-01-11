package com.fi.pj;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		//req.setAttribute("loginPage", "login.jsp");
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}
	
}
