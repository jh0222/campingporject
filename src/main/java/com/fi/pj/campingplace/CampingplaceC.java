package com.fi.pj.campingplace;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CampingplaceC {
	@Autowired
	private CampingplaceDAO cdao;
	
	@RequestMapping(value = "place.go", method = RequestMethod.GET)
	public String placeMain(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "campingplace/campingplace.jsp");
		return "main";
	}
	
	
	@RequestMapping(value = "campingplace.go", method = RequestMethod.GET)
	public String placeBuy(HttpServletRequest req) {
		
		cdao.getAllPlace(req);
		req.setAttribute("contentPage", "campingplace/placeMain.jsp");
		req.setAttribute("contentPage", "campingplace/campingplace.jsp");
		
		return "main";
	}
	
	@RequestMapping(value = "place.reg", method = RequestMethod.GET)
	public String placeReg(Campingplace p, HttpServletRequest req) {
		cdao.regPlace(p, req);
		cdao.getAllPlace(req);
		return "main";
	}
	
}
