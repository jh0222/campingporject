package com.fi.pj;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fi.pj.member.MemberDAO;


@Controller
public class HomeController {
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	
	public String home(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
<<<<<<< HEAD
	}
=======
	}  
>>>>>>> d3be522016e6e899d9a2e96f82e68725ec3f5622
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String homego(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}
	
}
