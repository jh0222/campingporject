package com.fi.mj;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class CampingPlaceC {
	
	@Autowired
	private CampingPlaceDAO cpDAO;
	
	@RequestMapping(value = "campingplace.go", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		cpDAO.getAllMsg(req);
		
		//req.setAttribute("loginPage", "login.jsp");
		req.setAttribute("contentPage", "campingplace.jsp");
		return "index";
	}
	
}
