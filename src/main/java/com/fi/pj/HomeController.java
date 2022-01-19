package com.fi.pj;

<<<<<<< HEAD
<<<<<<< HEAD
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
=======

import javax.servlet.http.HttpServletRequest;

>>>>>>> c91ac862e616c5a18826a98668d48d5ba230d326
=======
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> 6b758e7f64ddf43f1809ff7d47c3023f1c7127fe
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

<<<<<<< HEAD
<<<<<<< HEAD
import com.fi.pj.member.MemberDAO;
=======
>>>>>>> c91ac862e616c5a18826a98668d48d5ba230d326
=======
import com.fi.pj.member.MemberDAO;
>>>>>>> 6b758e7f64ddf43f1809ff7d47c3023f1c7127fe

@Controller
public class HomeController {
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
<<<<<<< HEAD
<<<<<<< HEAD
		mDAO.loginCheck(req);
=======
		
		//req.setAttribute("loginPage", "login.jsp");
>>>>>>> c91ac862e616c5a18826a98668d48d5ba230d326
=======
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String homego(HttpServletRequest req) {
		mDAO.loginCheck(req);
>>>>>>> 6b758e7f64ddf43f1809ff7d47c3023f1c7127fe
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}
	
}
