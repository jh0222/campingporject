package com.fi.pj;

<<<<<<< HEAD
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
=======

import javax.servlet.http.HttpServletRequest;

>>>>>>> c91ac862e616c5a18826a98668d48d5ba230d326
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

<<<<<<< HEAD
import com.fi.pj.member.MemberDAO;
=======
>>>>>>> c91ac862e616c5a18826a98668d48d5ba230d326

@Controller
public class HomeController {
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
<<<<<<< HEAD
		mDAO.loginCheck(req);
=======
		
		//req.setAttribute("loginPage", "login.jsp");
>>>>>>> c91ac862e616c5a18826a98668d48d5ba230d326
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}
	
}
