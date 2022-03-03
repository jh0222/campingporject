package com.fi.pj.campingplace;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fi.pj.member.MemberDAO;
import com.fi.pj.TokenMaker;


@Controller
public class CampingplaceC {
	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private CampingplaceDAO cdao;
	//리스트->heart->찜디비->아이디별로, 캠핑장별로
	@RequestMapping(value = "place.go", method = RequestMethod.GET)
	public String placeMain(placeReview pr,campingLike cl, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.getAllPlace(req);
		cdao.getheartlist(cl, req);
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
		cdao.delPlace(p, req);
		cdao.getAllPlace(req);
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
	public String placeDetailGo(placeReserve pre,Campingplace p,placeReview pr, placeReply re, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.getOnePlace(p,req);
		cdao.getAllReview(pr, req);
		cdao.getAllReply(re,req);
		cdao.reserveCheck(pre,req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return "main";
	}
	
	
	@RequestMapping(value = "review.Reg", method = RequestMethod.GET)
	public String reviewReg(placeReserve pre,Campingplace p, placeReview pr, placeReply re, HttpServletRequest req) {
		mDAO.loginCheck(req);		
		cdao.regReview(pr, req);
		cdao.getOnePlace(p,req);
		cdao.getAllReview(pr, req);
		cdao.getAllReply(re, req);
		cdao.reserveCheck(pre,req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return "main";
		
	}
	
	@RequestMapping(value = "review.del", method = RequestMethod.GET)
	public String reviewDel(placeReserve pre,Campingplace p, placeReview pr, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.delReview(pr, req); 
		cdao.getOnePlace(p,req);
		cdao.getAllReview(pr, req);
		cdao.reserveCheck(pre,req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return "main";
	}
	
	@RequestMapping(value = "review.update", method = RequestMethod.GET)
	public String snsUpdate(placeReserve pre,Campingplace p, placeReview pr, HttpServletRequest req) {
		TokenMaker.make(req);
		//int n = Integer.parseInt(req.getParameter("n"));
		if (mDAO.loginCheck(req)) {
			cdao.updateReview(pr, req);
		}
		cdao.getOnePlace(p,req);
		cdao.getAllReview(pr, req);
		cdao.reserveCheck(pre,req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return "main";
	}
	
	@RequestMapping(value = "reservation.go", method = RequestMethod.GET)
	public String placeReservation(placeReserve res, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.reservePlace(res,req);
		req.setAttribute("contentPage", "campingplace/PlaceReserve.jsp");
		return "main";
	}
	
	@RequestMapping(value = "reserve.insert", method = RequestMethod.GET)
	public String placeReserve(placeReserve res, HttpServletRequest req) {
		
		System.out.println(res.getR_cam_name());
		mDAO.loginCheck(req);
		cdao.reserve(res,req);
		req.setAttribute("contentPage", "campingplace/PlaceReserve.jsp");
		return "main";
	}
	
	@RequestMapping(value = "placelike.go", method = RequestMethod.GET)
	public String placeLike(Campingplace p, placeReview pr, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.likePlace(p,req);
		cdao.getOnePlace(p,req);
		cdao.getAllReview(pr, req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return "main";
	}

	@RequestMapping(value = "placelike.delgo", method = RequestMethod.GET)
	public String placeLikedel(Campingplace p, placeReview pr, campingLike cl, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.likePlace_del(p,req);
		cdao.getOnePlace(p,req);
		cdao.getAllReview(pr, req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return "main";
	}
	
	@RequestMapping(value = "placelike.go2", method = RequestMethod.GET)
	public String placeLike2(Campingplace p, placeReview pr, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.likePlace(p,req);
		cdao.getAllPlace(req);
		req.setAttribute("contentPage", "campingplace/campingplace.jsp");
		return "main";
	}

	@RequestMapping(value = "placelike.delgo2", method = RequestMethod.GET)
	public String placeLikedel2(Campingplace p, placeReview pr, campingLike cl, HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.likePlace_del(p,req);
		cdao.getAllPlace(req);
		req.setAttribute("contentPage", "campingplace/campingplace.jsp");
		return "main";
	}
	
	@RequestMapping(value = "heart.go", method = RequestMethod.GET)
	public String heartListGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		cdao.getHeartList(req);
		req.setAttribute("contentPage", "campingplace/campingheart.jsp");
		return "main";
	}
	
	@RequestMapping(value = "place.search", method = RequestMethod.GET)
	public String nameSearch(placeSearch ps,placeReview pr, HttpServletRequest req) {
		mDAO.loginCheck(req);		
		cdao.getPlaceSearch(ps, req);
		req.setAttribute("contentPage", "campingplace/campingplace.jsp");
		return "main";
		
	}
	
	@RequestMapping(value = "replytxt.Reg", method = RequestMethod.GET)
	public String answerReg(Campingplace p, placeReview pr, placeReply re, HttpServletRequest req) {
		mDAO.loginCheck(req);		
		cdao.regReplyTxt(re, req);
		cdao.getOnePlace(p,req);
		cdao.getAllReview(pr, req);
		cdao.getAllReply(re, req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return "main";
		
	}
	@RequestMapping(value = "capinglike.in", method = RequestMethod.GET, produces="application/json")
	public @ResponseBody int campinglikein(HttpServletRequest req) {
		
		cdao.solveLike(req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return 0;
		
	}
	@RequestMapping(value = "reply.del", method = RequestMethod.GET)
	public String answerDel(Campingplace p, placeReview pr, placeReply re, HttpServletRequest req) {
		mDAO.loginCheck(req);		
		cdao.delReplyTxt(re, req);
		cdao.getOnePlace(p,req);
		cdao.getAllReview(pr, req);
		cdao.getAllReply(re, req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return "main";
	}
	@RequestMapping(value = "reply.update", method = RequestMethod.GET)
	public String answerUpdate(Campingplace p, placeReview pr, placeReply re, HttpServletRequest req) {
		mDAO.loginCheck(req);		
		cdao.updateReplyTxt(re, req);
		cdao.getOnePlace(p,req);
		cdao.getAllReview(pr, req);
		cdao.getAllReply(re, req);
		req.setAttribute("contentPage", "campingplace/campingplace_detail.jsp");
		return "main";
	}
}
