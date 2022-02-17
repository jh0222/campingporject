package com.fi.pj.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;

	//로그인 페이지로 
	@RequestMapping(value = "login.go", method = RequestMethod.GET)
	public String gologin(UserMember m, HttpServletRequest req) {
		req.setAttribute("contentPage", "member/login.jsp");
		return "main";
	}

	// 로그인 하기
	@RequestMapping(value = "member.login", method = RequestMethod.POST)
	public String login(Login l, HttpServletRequest req) {
		mDAO.login(l, req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}

	// 회원가입 페이지로
	@RequestMapping(value = "join.go", method = RequestMethod.GET)
	public String JoinGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/join.jsp");
		return "main";
	}

	// 회원가입 페이지로(사용자)
	@RequestMapping(value = "join.usergo", method = RequestMethod.GET)
	public String JoinUserGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/join_user.jsp");
		return "main";
	}

	// 회원가입 페이지로(사장님)
	@RequestMapping(value = "join.bossgo", method = RequestMethod.GET)
	public String JoinBossGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/join_boss.jsp");
		return "main";
	}

	// 회원가입 하기(사용자)
	@RequestMapping(value = "usermember.join", method = RequestMethod.POST)
	public String usermemberJoin(UserMember m, HttpServletRequest req) {
		mDAO.userjoin(m, req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}

	// 회원가입 하기(사장님)
	@RequestMapping(value = "bossmember.join", method = RequestMethod.POST)
	public String memberJoin(BossMember m, HttpServletRequest req) {
		mDAO.bossjoin(m, req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}

	// 아이디 중복확인
	@RequestMapping(value = "member.get", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody int memberGet(UserMember m, BossMember b, HttpServletRequest req) {
		return mDAO.getMemberNum(m, b, req);
	}

	// 아이디 찾기 페이지로
	@RequestMapping(value = "idsearch.go", method = RequestMethod.GET)
	public String IdsearchGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/idsearch.jsp");
		return "main";
	}

	//비번 찾기 페이지로
	@RequestMapping(value = "pwsearch.go", method = RequestMethod.GET)
	public String PwsearchGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "member/pwsearch.jsp");
		return "main";
	}
	
	//로그아웃
	@RequestMapping(value = "member.logout", method = RequestMethod.GET)
	public String logout(UserMember m, HttpServletRequest req) {
		mDAO.logout(req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main";
	}
	
	//아이디 찾기
	@RequestMapping(value = "id.search", method = RequestMethod.GET)
	public String Idsearch(Login l, HttpServletRequest req) {
		System.out.println("ss"+l.getName());
		System.out.println(l.getPhonenumber());
		mDAO.idsearch(l,req);
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "member/idsearch2.jsp");
		return "main";
	}

	// 사용자 마이페이지
	@RequestMapping(value = "user.info", method = RequestMethod.GET)
	public String userInfo(HttpServletRequest request) {

		mDAO.loginCheck(request);
		mDAO.splitUser(request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/Info_user.jsp");

		return "main";
	}

	// 사용자 정보 업데이트 - 비밀번호, 이메일, 주소, 생일, 전화번호, 사진 변경 가능하게
	@RequestMapping(value = "user.update", method = RequestMethod.POST)
	public String userUpdate(UserMember user, HttpServletRequest request) {

		mDAO.loginCheck(request);
		mDAO.UserUpdate(user, request);
		mDAO.splitUser(request);
		request.setAttribute("contentPage", "member/Info_user.jsp");

		return "main";
	}

	// 사용자 탈퇴 - 팝업창으로 정말 탈퇴할건지 묻고 '예'면 사용자 데이터 삭제
	@RequestMapping(value = "user.bye", method = RequestMethod.GET)
	public String userBye(HttpServletRequest request) {

		mDAO.userBye(request);
		mDAO.loginCheck(request);
		request.setAttribute("contentPage", "home.jsp");

		return "main";
	}

	// 사장 마이페이지
	@RequestMapping(value = "boss.info", method = RequestMethod.GET)
	public String bossInfo(HttpServletRequest request) {

		mDAO.loginCheck(request);
		mDAO.splitBossAddr(request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("contentPage", "member/Info_boss.jsp");

		return "main";
	}

	// 사장 정보 수정
	@RequestMapping(value = "boss.update", method = RequestMethod.POST)
	public String bossUpdate(BossMember boss, HttpServletRequest request) {

		mDAO.loginCheck(request);
		mDAO.bossUpdate(boss, request);
		mDAO.splitBossAddr(request);
		request.setAttribute("BossCommunities", "../member/BossCommunities.jsp");
		request.setAttribute("contentPage", "member/Info_boss.jsp");

		return "main";
	}

	// 사장 탈퇴
	@RequestMapping(value = "boss.bye", method = RequestMethod.GET)
	public String bossBye(HttpServletRequest request) {

		mDAO.bossBye(request);
		mDAO.loginCheck(request);
		request.setAttribute("contentPage", "home.jsp");

		return "main";
	}
	
	// 캠핑찜
	@RequestMapping(value = "campingjjim", method = RequestMethod.GET)
	public String campingjjim(Communities c, HttpServletRequest request) {
		mDAO.campingjjim(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/campingjjim.jsp");

		return "main";
	}

	// 캠핑찜 삭제
	@RequestMapping(value = "campingjjim.del", method = RequestMethod.GET)
	public String campingjjimdel(Communities c, HttpServletRequest request) {

		mDAO.campingjjimdel(c, request);
		mDAO.campingjjim(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/campingjjim.jsp");

		return "main";
	}

	// 캠핑예약
	@RequestMapping(value = "campingreservation", method = RequestMethod.GET)
	public String campingreserve(Communities c, HttpServletRequest request) {
		mDAO.campingreserve(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/campingreserve.jsp");

		return "main";
	}

	// 캠핑예약 삭제
	@RequestMapping(value = "campingreserve.del", method = RequestMethod.GET)
	public String reservedel(Communities c, HttpServletRequest request) {
		mDAO.campingreservedel(c, request);
		mDAO.campingreserve(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/campingreserve.jsp");

		return "main";
	}

	// 사용자 구매목록
	@RequestMapping(value = "userbuylist", method = RequestMethod.GET)
	public String userbuylist(Buy b, HttpServletRequest request) {

		mDAO.userbuylist(b, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/buylist.jsp");

		return "main";
	}

	// 구매목록 삭제 - 캠핑용품
	@RequestMapping(value = "buyproduct.del", method = RequestMethod.GET)
	public String buyproductdel(Buy b, HttpServletRequest request) {
		mDAO.buyproductdel(b, request);
		mDAO.userbuylist(b, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/buylist.jsp");

		return "main";
	}

	// 구매목록 삭제 - 밀키트
	@RequestMapping(value = "buymeal.del", method = RequestMethod.GET)
	public String buymealdel(Buy b, HttpServletRequest request) {
		mDAO.buymealdel(b, request);
		mDAO.userbuylist(b, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("contentPage", "member/buylist.jsp");

		return "main";
	}

	// 내글
	@RequestMapping(value = "communities", method = RequestMethod.GET)
	public String communities(Communities c, HttpServletRequest request) {
		mDAO.communities(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/UserCommunities.jsp");

		return "main";
	}

	// 자유게시판
	@RequestMapping(value = "freeboard", method = RequestMethod.GET)
	public String freeboard(Communities c, HttpServletRequest request) {
		mDAO.freeboard(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/UserCommunities.jsp");

		return "main";
	}

	// 캠핑팁
	@RequestMapping(value = "campingtip", method = RequestMethod.GET)
	public String campingtip(Communities c, HttpServletRequest request) {
		mDAO.campingtip(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/campingtip.jsp");

		return "main";
	}

	// 레시피
	@RequestMapping(value = "recipe", method = RequestMethod.GET)
	public String recipe(Communities c, HttpServletRequest request) {
		mDAO.recipe(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/recipe.jsp");

		return "main";
	}

	// 캠핑 리뷰
	@RequestMapping(value = "campingreview", method = RequestMethod.GET)
	public String campingreview(Communities c, HttpServletRequest request) {
		mDAO.campingreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/campingreview.jsp");

		return "main";
	}

	// 캠핑 리뷰 수정
	@RequestMapping(value = "campingreview.update", method = RequestMethod.GET)
	public String campingreviewupdate(Communities c, HttpServletRequest request) {
		mDAO.campingreviewupdate(c, request);
		mDAO.campingreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/campingreview.jsp");

		return "main";
	}

	// 캠핑 리뷰 삭제
	@RequestMapping(value = "campingreview.delete", method = RequestMethod.GET)
	public String campingreviewdel(Communities c, HttpServletRequest request) {
		mDAO.campingreviewdel(c, request);
		mDAO.campingreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/campingreview.jsp");

		return "main";
	}

	// 구매용품 리뷰
	@RequestMapping(value = "productreview", method = RequestMethod.GET)
	public String productreview(Communities c, HttpServletRequest request) {
		mDAO.productreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/productreview.jsp");

		return "main";
	}

	// 캠핑용품 리뷰 수정
	@RequestMapping(value = "productreview.update", method = RequestMethod.GET)
	public String productreviewupdate(Communities c, HttpServletRequest request) {
		mDAO.productreviewupdate(c, request);
		mDAO.productreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/productreview.jsp");

		return "main";
	}

	// 캠핑용품 리뷰 삭제
	@RequestMapping(value = "productreview.delete", method = RequestMethod.GET)
	public String productreviewdel(Communities c, HttpServletRequest request) {
		mDAO.productreviewdel(c, request);
		mDAO.productreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/productreview.jsp");

		return "main";
	}

	// 밀키트 리뷰 수정
	@RequestMapping(value = "mealreview.update", method = RequestMethod.GET)
	public String mealreviewupdate(Communities c, HttpServletRequest request) {
		mDAO.mealreviewupdate(c, request);
		mDAO.productreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/productreview.jsp");

		return "main";
	}

	// 밀키트 리뷰 삭제
	@RequestMapping(value = "mealreview.delete", method = RequestMethod.GET)
	public String mealreviewdel(Communities c, HttpServletRequest request) {
		mDAO.mealreviewdel(c, request);
		mDAO.productreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/productreview.jsp");

		return "main";
	}

	// 자유게시판 리뷰
	@RequestMapping(value = "freeboardreview", method = RequestMethod.GET)
	public String freeboardreview(Communities c, HttpServletRequest request) {
		mDAO.freeboardreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/freeboardreview.jsp");

		return "main";
	}

	// 자유게시판 리뷰 수정
	@RequestMapping(value = "freeboardreview.update", method = RequestMethod.GET)
	public String freeboardreviewupdate(Communities c, HttpServletRequest request) {
		mDAO.freeboardreviewupdate(c, request);
		mDAO.freeboardreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/freeboardreview.jsp");

		return "main";
	}

	// 자유게시판 리뷰 삭제
	@RequestMapping(value = "freeboardreview.delete", method = RequestMethod.GET)
	public String freeboardreviewdel(Communities c, HttpServletRequest request) {
		mDAO.freeboardreviewdel(c, request);
		mDAO.freeboardreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/freeboardreview.jsp");

		return "main";
	}

	// 캠핑팁 리뷰
	@RequestMapping(value = "campingtipreview", method = RequestMethod.GET)
	public String campingtipreview(Communities c, HttpServletRequest request) {
		mDAO.campingtipreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/campingtipreview.jsp");

		return "main";
	}

	// 캠핑팁 리뷰 수정
	@RequestMapping(value = "campingtipreview.update", method = RequestMethod.GET)
	public String campingtipreviewupdate(Communities c, HttpServletRequest request) {
		mDAO.campingtipreviewupdate(c, request);
		mDAO.campingtipreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/campingtipreview.jsp");

		return "main";
	}

	// 캠핑팁 리뷰 삭제
	@RequestMapping(value = "campingtipreview.delete", method = RequestMethod.GET)
	public String campingtipreviewdel(Communities c, HttpServletRequest request) {
		mDAO.campingtipreviewdel(c, request);
		mDAO.campingtipreview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/campingtipreview.jsp");

		return "main";
	}

	// 레시피 리뷰
	@RequestMapping(value = "recipereview", method = RequestMethod.GET)
	public String recipereview(Communities c, HttpServletRequest request) {
		mDAO.recipereview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/recipereview.jsp");

		return "main";
	}

	// 레시피 리뷰 수정
	@RequestMapping(value = "recipereview.update", method = RequestMethod.GET)
	public String recipereviewupdate(Communities c, HttpServletRequest request) {
		mDAO.recipereviewupdate(c, request);
		mDAO.recipereview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/recipereview.jsp");

		return "main";
	}

	// 레시피 리뷰 삭제
	@RequestMapping(value = "recipereview.delete", method = RequestMethod.GET)
	public String recipereviewdel(Communities c, HttpServletRequest request) {
		mDAO.recipereviewdel(c, request);
		mDAO.recipereview(c, request);
		request.setAttribute("myPage", "../member/mypage.jsp");
		request.setAttribute("community", "../member/community.jsp");
		request.setAttribute("contentPage", "member/recipereview.jsp");

		return "main";
	}

}
