package com.fi.pj.campingplace;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fi.pj.member.MemberDAO;

@Controller
public class CampingplaceC {
	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private CampingplaceDAO cdao;
	
	@RequestMapping(value = "place.go", method = RequestMethod.GET)
	public String placeMain(HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.getAllPlace(req);
		req.setAttribute("contentPage", "campingplace/campingplace.jsp");
		return "main";
	}
	
	@RequestMapping(value = "placereg.go", method = RequestMethod.GET)
	public String placeRegGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "campingplace/PlaceReg.jsp");
		return "main";
	}
	
	@RequestMapping(value = "place.Reg", method = RequestMethod.POST)
	public String placeReg(Campingplace p, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.regPlace(p, req);
		cdao.getAllPlace(req);
		req.setAttribute("contentPage", "campingplace/campingplace.jsp");
		return "main";
	}
	
	@RequestMapping(value = "place.del", method = RequestMethod.GET)
	public String placeDel(Campingplace p, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.getAllPlace(req);
		cdao.delPlace(p, req);
		req.setAttribute("contentPage", "campingplace/campingplace.jsp");
		return "main";
	}
	
	@RequestMapping(value = "placeup.go", method = RequestMethod.GET)
	public String placeUpGo(Campingplace p, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.getOnePlace(p,req);
		req.setAttribute("contentPage", "campingplace/PlaceUpdate.jsp");
		return "main";
	}
	
	@RequestMapping(value = "place.Update", method = RequestMethod.POST)
	public String placeUpdate(Campingplace p, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.updatePlace(p, req);
		cdao.getAllPlace(req);
		req.setAttribute("contentPage", "campingplace/campingplace.jsp");
		return "main";
	}
	
	@RequestMapping(value = "placedetail.go", method = RequestMethod.GET)
	public String placeDetailGo(Campingplace p, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.getOnePlace(p,req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return "main";
	}
	

	
	@RequestMapping(value = "review.Reg", method = RequestMethod.POST)
	public String reviewReg(Campingplace p, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.getAllReview(p, req);
		cdao.regReview(p, req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return "main";
	}
}
