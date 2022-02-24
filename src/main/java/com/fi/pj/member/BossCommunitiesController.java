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

	// 캠핑정보
	@RequestMapping(value = "boss_camping.info", method = RequestMethod.GET)
	public String CampingInfo(BossCommunities bc, HttpServletRequest req) {

		bcDAO.CampingInfo(bc, req);

		req.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		req.setAttribute("contentPage", "member/BossCampingInformation.jsp");

		return "main";
	}

	// 캠핑정보 수정
	@RequestMapping(value = "boss_camping.infoupdate", method = RequestMethod.POST)
	public String CampingInfoUp(BossCommunities bc, HttpServletRequest req) {

		bcDAO.CampingInfoUp(bc, req);
		bcDAO.CampingInfo(bc, req);

		req.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		req.setAttribute("contentPage", "member/BossCampingInformation.jsp");

		return "main";
	}

	// 캠핑정보 삭제
	@RequestMapping(value = "boss_camping.infodel", method = RequestMethod.GET)
	public String campinginfodel(BossCommunities bc, HttpServletRequest req) {

		bcDAO.campinginfodel(bc, req);
		bcDAO.CampingInfo(bc, req);

		req.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		req.setAttribute("contentPage", "member/BossCampingInformation.jsp");

		return "main";
	}

	// 캠핑 예약 목록
	@RequestMapping(value = "boss_campingreservation", method = RequestMethod.GET)
	public String campingreservation(BossCommunities bc, HttpServletRequest req) {

		bcDAO.campingreserve(bc, req);

		req.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		req.setAttribute("contentPage", "member/BossCampingReserve.jsp");

		return "main";
	}

	// 구매목록
	@RequestMapping(value = "boss_buylist", method = RequestMethod.GET)
	public String buylist(BossCommunities bc, HttpServletRequest req) {

		bcDAO.buylist(bc, req);

		req.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		req.setAttribute("contentPage", "member/BossBuylist.jsp");

		return "main";
	}

	// 내글
	@RequestMapping(value = "boss_communities", method = RequestMethod.GET)
	public String communities(BossCommunities bc, HttpServletRequest request) {
		bcDAO.communities(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossFreeboard.jsp");

		return "main";
	}

	// 자유게시판
	@RequestMapping(value = "boss_freeboard", method = RequestMethod.GET)
	public String freeboard(BossCommunities bc, HttpServletRequest request) {
		bcDAO.Bfreeboard(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossFreeboard.jsp");

		return "main";
	}

	// 캠핑팁
	@RequestMapping(value = "boss_campingtip", method = RequestMethod.GET)
	public String campingtip(BossCommunities bc, HttpServletRequest request) {
		bcDAO.campingtip(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossCampingtip.jsp");

		return "main";
	}

	// 레시피
	@RequestMapping(value = "boss_recipe", method = RequestMethod.GET)
	public String recipe(BossCommunities bc, HttpServletRequest request) {
		bcDAO.recipe(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossRecipe.jsp");

		return "main";
	}

	// 구매용품 리뷰
	@RequestMapping(value = "boss_productreview", method = RequestMethod.GET)
	public String productreview(BossCommunities bc, HttpServletRequest request) {
		bcDAO.productreview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossProductreview.jsp");

		return "main";
	}

	// 캠핑용품 리뷰 수정
	@RequestMapping(value = "boss_productreview.update", method = RequestMethod.GET)
	public String productreviewupdate(BossCommunities bc, HttpServletRequest request) {
		bcDAO.productreviewupdate(bc, request);
		bcDAO.productreview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossProductreview.jsp");

		return "main";
	}

	// 캠핑용품 리뷰 삭제
	@RequestMapping(value = "boss_productreview.delete", method = RequestMethod.GET)
	public String productreviewdel(BossCommunities bc, HttpServletRequest request) {
		bcDAO.productreviewdel(bc, request);
		bcDAO.productreview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossProductreview.jsp");

		return "main";
	}

	// 밀키트 리뷰 수정
	@RequestMapping(value = "boss_mealreview.update", method = RequestMethod.GET)
	public String mealreviewupdate(BossCommunities bc, HttpServletRequest request) {
		bcDAO.mealreviewupdate(bc, request);
		bcDAO.productreview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossProductreview.jsp");

		return "main";
	}

	// 밀키트 리뷰 삭제
	@RequestMapping(value = "boss_mealreview.delete", method = RequestMethod.GET)
	public String mealreviewdel(BossCommunities bc, HttpServletRequest request) {
		bcDAO.mealreviewdel(bc, request);
		bcDAO.productreview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossProductreview.jsp");

		return "main";
	}

	// 자유게시판 댓글
	@RequestMapping(value = "boss_freeboardreview", method = RequestMethod.GET)
	public String freeboardreview(BossCommunities bc, HttpServletRequest request) {
		bcDAO.freeboardreview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossFreeboardreview.jsp");

		return "main";
	}

	// 자유게시판 댓글 수정
	@RequestMapping(value = "boss_freeboardreview.update", method = RequestMethod.GET)
	public String freeboardreviewupdate(BossCommunities bc, HttpServletRequest request) {
		bcDAO.freeboardreviewupdate(bc, request);
		bcDAO.freeboardreview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossFreeboardreview.jsp");

		return "main";
	}

	// 자유게시판 댓글 삭제
	@RequestMapping(value = "boss_freeboardreview.delete", method = RequestMethod.GET)
	public String freeboardreviewdel(BossCommunities bc, HttpServletRequest request) {
		bcDAO.freeboardreviewdel(bc, request);
		bcDAO.freeboardreview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossFreeboardreview.jsp");

		return "main";
	}

	// 캠핑팁 댓글
	@RequestMapping(value = "boss_campingtipreview", method = RequestMethod.GET)
	public String campingtipreview(BossCommunities bc, HttpServletRequest request) {
		bcDAO.campingtipreview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossCampingtipreview.jsp");

		return "main";
	}

	// 캠핑팁 댓글 수정
	@RequestMapping(value = "boss_campingtipreview.update", method = RequestMethod.GET)
	public String campingtipreviewupdate(BossCommunities bc, HttpServletRequest request) {
		bcDAO.campingtipreviewupdate(bc, request);
		bcDAO.campingtipreview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossCampingtipreview.jsp");

		return "main";
	}

	// 캠핑팁 댓글 삭제
	@RequestMapping(value = "boss_campingtipreview.delete", method = RequestMethod.GET)
	public String campingtipreviewdel(BossCommunities bc, HttpServletRequest request) {
		bcDAO.campingtipreviewdel(bc, request);
		bcDAO.campingtipreview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossCampingtipreview.jsp");

		return "main";
	}

	// 레시피 댓글
	@RequestMapping(value = "boss_recipereview", method = RequestMethod.GET)
	public String recipereview(BossCommunities bc, HttpServletRequest request) {
		bcDAO.recipereview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossRecipereview.jsp");

		return "main";
	}

	// 레시피 댓글 수정
	@RequestMapping(value = "boss_recipereview.update", method = RequestMethod.GET)
	public String recipereviewupdate(BossCommunities bc, HttpServletRequest request) {
		bcDAO.recipereviewupdate(bc, request);
		bcDAO.recipereview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossRecipereview.jsp");

		return "main";
	}

	// 레시피 댓글 삭제
	@RequestMapping(value = "boss_recipereview.delete", method = RequestMethod.GET)
	public String recipereviewdel(BossCommunities bc, HttpServletRequest request) {
		bcDAO.recipereviewdel(bc, request);
		bcDAO.recipereview(bc, request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("community", "../member/community2.jsp");
		request.setAttribute("contentPage", "member/BossRecipereview.jsp");

		return "main";
	}

}
