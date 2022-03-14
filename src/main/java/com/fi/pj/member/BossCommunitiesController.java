package com.fi.pj.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BossCommunitiesController {

	@Autowired
	private BossCommunitiresDAO bcDAO;

	@Autowired
	private MemberDAO mDAO;

	// 캠핑예약 삭제
		@RequestMapping(value = "campingreserve.del2", method = RequestMethod.GET)
		public String campingreserveDel(Communities c,BossCommunities bc, HttpServletRequest request) {
			mDAO.loginCheck(request);
			mDAO.campingreserveDel(c, request);
			bcDAO.campingreserve(bc, request);
			request.setAttribute("mypage2", "../member/mypage2.jsp");
			request.setAttribute("contentPage", "member/BossCampingReserve.jsp");

			return "main";
		}
	
	// 캠핑정보
	@RequestMapping(value = "boss_camping.info", method = RequestMethod.GET)
	public String CampingInfo(BossCommunities bc, HttpServletRequest req) {
		mDAO.loginCheck(req);
		bcDAO.CampingInfo(bc, req);

		req.setAttribute("mypage2", "../member/mypage2.jsp");
		req.setAttribute("contentPage", "member/BossCampingInformation.jsp");

		return "main";
	}

	// 캠핑정보 수정
	@RequestMapping(value = "boss_camping.infoupdate", method = RequestMethod.POST)
	public String CampingInfoUp(BossCommunities bc, HttpServletRequest req) {
		mDAO.loginCheck(req);
		bcDAO.CampingInfoUp(bc, req);
		bcDAO.CampingInfo(bc, req);

		req.setAttribute("mypage2", "../member/mypage2.jsp");
		req.setAttribute("contentPage", "member/BossCampingInformation.jsp");

		return "main";
	}

	// 캠핑정보 삭제
	@RequestMapping(value = "boss_camping.infodel", method = RequestMethod.GET)
	public String campinginfodel(BossCommunities bc, HttpServletRequest req) {
		mDAO.loginCheck(req);
		bcDAO.campinginfodel(bc, req);
		bcDAO.CampingInfo(bc, req);

		req.setAttribute("mypage2", "../member/mypage2.jsp");
		req.setAttribute("contentPage", "member/BossCampingInformation.jsp");

		return "main";
	}

	// 캠핑 예약 목록
	@RequestMapping(value = "boss_campingreservation", method = RequestMethod.GET)
	public String campingreservation(BossCommunities bc, HttpServletRequest req) {
		mDAO.loginCheck(req);
		bcDAO.campingreserve(bc, req);

		req.setAttribute("mypage2", "../member/mypage2.jsp");
		req.setAttribute("contentPage", "member/BossCampingReserve.jsp");

		return "main";
	}

	// 구매목록조회 - 캠핑용품
	@RequestMapping(value = "boss_Cbuylist", method = RequestMethod.GET)
	public String CBuylist(Buy b, HttpServletRequest request) {
		mDAO.loginCheck(request);
		mDAO.CBuylist(b, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/buylist3.jsp");

		return "main";
	}

	// 구매목록조회 - 밀키트
	@RequestMapping(value = "boss_Mbuylist", method = RequestMethod.GET)
	public String MBuylist(Buy b, HttpServletRequest request) {
		mDAO.loginCheck(request);
		mDAO.MBuylist(b, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/buylist4.jsp");

		return "main";
	}

	// 구매목록 삭제 - 캠핑용품
	@RequestMapping(value = "boss_Cbuylist.del", method = RequestMethod.GET)
	public String buyproductDel(Buy b, HttpServletRequest request) {
		mDAO.loginCheck(request);
		mDAO.buyproductDel(b, request);
		mDAO.CBuylist(b, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/buylist3.jsp");

		return "main";
	}

	// 구매목록 삭제 - 밀키트
	@RequestMapping(value = "boss_Mbuylist.del", method = RequestMethod.GET)
	public String buymealDel(Buy b, HttpServletRequest request) {
		mDAO.loginCheck(request);
		mDAO.buymealDel(b, request);
		mDAO.MBuylist(b, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/buylist4.jsp");

		return "main";
	}

	// 캠핑용품 후기
	@RequestMapping(value = "Cproductreview2", method = RequestMethod.GET)
	public String Cproductreview(Communities c, HttpServletRequest request) {
		mDAO.loginCheck(request);
		mDAO.Cproductreview(c, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/productreview3.jsp");

		return "main";
	}

	// 캠핑용품 후기 수정
	@RequestMapping(value = "productreview.update2", method = RequestMethod.GET)
	public String productreviewupdate(Communities c, HttpServletRequest request) {
		mDAO.loginCheck(request);
		mDAO.productreviewupdate(c, request);
		mDAO.Cproductreview(c, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/productreview3.jsp");

		return "main";
	}

	// 캠핑용품 후기 삭제
	@RequestMapping(value = "productreview.delete2", method = RequestMethod.GET)
	public String productreviewdel(Communities c, HttpServletRequest request) {
		mDAO.loginCheck(request);
		mDAO.productreviewdel(c, request);
		mDAO.Cproductreview(c, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/productreview3.jsp");

		return "main";
	}

	// 밀키트 후기
	@RequestMapping(value = "Mproductreview2", method = RequestMethod.GET)
	public String Mproductreview(Communities c, HttpServletRequest request) {
		mDAO.loginCheck(request);
		mDAO.Mproductreview(c, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/productreview4.jsp");

		return "main";
	}

	// 밀키트 후기 수정
	@RequestMapping(value = "mealreview.update2", method = RequestMethod.GET)
	public String mealreviewupdate(Communities c, HttpServletRequest request) {
		mDAO.loginCheck(request);
		mDAO.mealreviewupdate(c, request);
		mDAO.Mproductreview(c, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/productreview4.jsp");

		return "main";
	}

	// 밀키트 후기 삭제
	@RequestMapping(value = "mealreview.delete2", method = RequestMethod.GET)
	public String mealreviewdel(Communities c, HttpServletRequest request) {
		mDAO.loginCheck(request);
		mDAO.mealreviewdel(c, request);
		mDAO.Mproductreview(c, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/productreview4.jsp");

		return "main";
	}

	// 자유게시판
	@RequestMapping(value = "freeboard2", method = RequestMethod.GET)
	public String freeboard2(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.freeboard2(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/freeboard2.jsp");

		return "main";
	}

	// 캠핑팁
	@RequestMapping(value = "campingtip2", method = RequestMethod.GET)
	public String campingtip(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.campingtip(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/campingtip2.jsp");

		return "main";
	}

	// 레시피
	@RequestMapping(value = "recipe2", method = RequestMethod.GET)
	public String recipe(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.recipe(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/recipe2.jsp");

		return "main";
	}

	// 자유게시판 댓글
	@RequestMapping(value = "freeboardreview2", method = RequestMethod.GET)
	public String freeboardreview(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.freeboardreview(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/freeboardreview2.jsp");

		return "main";
	}

	// 자유게시판 댓글 수정
	@RequestMapping(value = "freeboardreview.update2", method = RequestMethod.GET)
	public String freeboardreviewupdate(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.freeboardreviewupdate(bc, request);
		bcDAO.freeboardreview(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/freeboardreview2.jsp");

		return "main";
	}

	// 자유게시판 댓글 삭제
	@RequestMapping(value = "freeboardreview.delete2", method = RequestMethod.GET)
	public String freeboardreviewdel(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.freeboardreviewdel(bc, request);
		bcDAO.freeboardreview(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/freeboardreview2.jsp");

		return "main";
	}

	// 캠핑팁 댓글
	@RequestMapping(value = "campingtipreview2", method = RequestMethod.GET)
	public String campingtipreview(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.campingtipreview(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/campingtipreview2.jsp");

		return "main";
	}

	// 캠핑팁 댓글 수정
	@RequestMapping(value = "campingtipreview.update2", method = RequestMethod.GET)
	public String campingtipreviewupdate(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.campingtipreviewupdate(bc, request);
		bcDAO.campingtipreview(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/campingtipreview2.jsp");

		return "main";
	}

	// 캠핑팁 댓글 삭제
	@RequestMapping(value = "campingtipreview.delete2", method = RequestMethod.GET)
	public String campingtipreviewdel(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.campingtipreviewdel(bc, request);
		bcDAO.campingtipreview(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/campingtipreview2.jsp");

		return "main";
	}

	// 레시피 댓글
	@RequestMapping(value = "recipereview2", method = RequestMethod.GET)
	public String recipereview(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.recipereview(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/recipereview2.jsp");

		return "main";
	}

	// 레시피 댓글 수정
	@RequestMapping(value = "recipereview.update2", method = RequestMethod.GET)
	public String recipereviewupdate(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.recipereviewupdate(bc, request);
		bcDAO.recipereview(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/recipereview2.jsp");

		return "main";
	}

	// 레시피 댓글 삭제
	@RequestMapping(value = "recipereview.delete2", method = RequestMethod.GET)
	public String recipereviewdel(BossCommunities bc, HttpServletRequest request) {
		mDAO.loginCheck(request);
		bcDAO.recipereviewdel(bc, request);
		bcDAO.recipereview(bc, request);
		request.setAttribute("myPage2", "../member/mypage2.jsp");
		request.setAttribute("contentPage", "member/recipereview2.jsp");

		return "main";
	}

}
