package com.fi.pj.milkit;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fi.pj.member.MemberDAO;
import com.fi.pj.member.UserMember;
import com.fi.pj.shopping.Product;
import com.fi.pj.shopping.ProductBasket;
import com.fi.pj.shopping.ProductBuy;
import com.fi.pj.shopping.ProductReview;
import com.fi.pj.shopping.Reviewinsert;
import com.fi.pj.shopping.ShoppingOrder;

@Controller
public class MilkitC {
	@Autowired
	private MilkitDAO kdao;
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private SqlSession ss;
	
	//밀키트 목록페이지
	@RequestMapping(value = "camping.milkit", method = RequestMethod.GET)
	public String milkitgo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		kdao.getAllMilkit(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping_milkit/campingMilkit_Page.jsp");
		return "main";
	}	
	
	//밀키트 등록페이지 이동
		@RequestMapping(value = "regmilkit.go", method = RequestMethod.GET )
		public String regmilkitgo(HttpServletRequest req) {
			mDAO.loginCheck(req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping_milkit/MilkitReg.jsp");
			return "main";
	}
	
	//밀키트 등록
		@RequestMapping(value = "reg.milkit", method = RequestMethod.POST )
		public String regProduct(Milkit fp,HttpServletRequest req) {
			mDAO.loginCheck(req);
			kdao.regMilkit(fp,req);   
			kdao.getAllMilkit(req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping_milkit/campingMilkit_Page.jsp");
			return "main";
		}	
		
	//밀키트 검색
	@RequestMapping(value = "search.milkit", method = RequestMethod.GET )
	public String searchProduct(Milkit fp,HttpServletRequest req) {
		mDAO.loginCheck(req);
		kdao.searchMilkit(fp,req);   
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping_milkit/campingMilkit_Page.jsp");
		return "main";
		}	
	
	//밀키트 삭제
		@RequestMapping(value = "del.milkit", method = RequestMethod.GET)
		public String delmilkit(Milkit fp,HttpServletRequest req) {
			mDAO.loginCheck(req);
			kdao.delMilkit(fp, req );
			kdao.getAllMilkit(req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping_milkit/campingMilkit_Page.jsp");
			return "main";
		}
	
	//밀키트 상세페이지(+리뷰목록)
		@RequestMapping(value = "detail.milkit", method = RequestMethod.GET)
		public String datailMilkit(MilkitReviewinsert fri,Milkit fp,HttpServletRequest req) {
			mDAO.loginCheck(req);
			kdao.getMilkit(fp,req);
			kdao.getAllMilkitReview(req);
			kdao.reviewwrite2(fri,fp,req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping_milkit/detailMilkit.jsp");	

			return "main";
		}
	//밀키트 수정페이지 이동
		@RequestMapping(value = "updatemilkit.go", method = RequestMethod.GET)
		public String updateMilkitgo(Milkit fp, HttpServletRequest req) {
			mDAO.loginCheck(req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping_milkit/updateMilkit.jsp");
			
			req.setAttribute("fp", fp);

			return "main";
		}	
	//밀키트 수정
		@RequestMapping(value = "update.milkit", method = RequestMethod.POST)
		public String updateMilkit(Milkit fp, HttpServletRequest req) {
			mDAO.loginCheck(req);
			kdao.updateMilkit(fp,req);
			kdao.getMilkit(fp, req);
			kdao.getAllMilkitReview(req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping_milkit/detailMilkit.jsp");
			return "main";
		}	
	//리뷰등록
		@RequestMapping(value = "reg.milkitreview", method = RequestMethod.GET )
		public String regmilkitreview(Milkit fp,MilkitReview fpr,MilkitReviewinsert fri,HttpServletRequest req) {
			mDAO.loginCheck(req);
			kdao.regMilkitreview(fpr,req); 
			kdao.getMilkit(fp, req); 
			kdao.getAllMilkitReview(req); 
			kdao.reviewwrite2(fri,fp,req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping_milkit/detailMilkit.jsp");	
			return "main";
			}		
		
	//밀키트 리뷰삭제
		@RequestMapping(value = "del.milkitreview", method = RequestMethod.GET)
		public String delmilkitreview(MilkitReview fpr,Milkit fp,MilkitReviewinsert fri,HttpServletRequest req) {
			mDAO.loginCheck(req);
			kdao.delMilkitreview(fpr, req);
			kdao.getMilkit(fp,req);
			kdao.getAllMilkitReview(req);
			kdao.reviewwrite2(fri,fp,req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping_milkit/detailMilkit.jsp");
			return "main";
			}	
			
		//캠핑용품 리뷰수정
		@RequestMapping(value = "update.milkitreview", method = RequestMethod.GET)
		public String updatemilkitreview(MilkitReview fpr,Milkit fp,MilkitReviewinsert fri,HttpServletRequest req) {
			mDAO.loginCheck(req);
			kdao.updateMilkitreview(fpr, req);
			kdao.getMilkit(fp,req);
			kdao.getAllMilkitReview(req);
			kdao.reviewwrite2(fri,fp,req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping_milkit/detailMilkit.jsp");
			return "main";
		    }	
		
		 //장바구니 등록
		@RequestMapping(value = "reg.milkitbasket", method = RequestMethod.POST)
		public String productbasketgo(MilkitBasket fpb, HttpServletRequest req) {
			mDAO.loginCheck(req);
			kdao.regBasketbasket(fpb,req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping/productbasket.jsp");
			return "main";
		}	
		//밀키트 구매페이지 이동
		@RequestMapping(value = "ordermilkit.go", method = RequestMethod.GET)
		public String ordermilkitgo(Milkit fp, UserMember u, MilkitShoppingOrder mso, HttpServletRequest req) {
			mDAO.loginCheck(req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping_milkit/orderMilkit.jsp");
			req.setAttribute("u", u);
			req.setAttribute("fp", fp);
			req.setAttribute("mso", mso); //수량+합계
			return "main";
		}
		
		//상품구매
		@RequestMapping(value = "reg.milkitbuy", method = RequestMethod.GET)
		public String regproductbuy(MilkitBuy mbuy, HttpServletRequest req) {
			mDAO.loginCheck(req);
			kdao.regMilkitbuy(mbuy,req);
		    req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping/Mypage.jsp");
			return "main";
		}	
		
}
