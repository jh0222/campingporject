package com.fi.pj.shopping;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fi.pj.Cart.CartBean;
import com.fi.pj.Cart.CartDAO;
import com.fi.pj.member.BossMember;
import com.fi.pj.member.Buy;
import com.fi.pj.member.Login;
import com.fi.pj.member.MemberDAO;
import com.fi.pj.member.UserMember;
import com.fi.pj.milkit.Milkit;
import com.fi.pj.milkit.MilkitReviewinsert;



@Controller
public class ShoppingC {
	@Autowired
	private ShoppingDAO sdao;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private CartDAO cdao;

	
	//쇼핑페이지 이동,구매순위
	@RequestMapping(value = "shopping.go", method = RequestMethod.GET)
	public String shoppinggo(ProductRank prk,HttpServletRequest req) {
		mDAO.loginCheck(req);
		sdao.productrank(req);
		sdao.milkitrank(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/campingandmilkitMain.jsp");
		return "main";
	}
	
	//캠핑용품 목록페이지
	@RequestMapping(value = "camping.product", method = RequestMethod.GET)
	public String shoppingcamping(HttpServletRequest req) {
		mDAO.loginCheck(req);
		sdao.getAllProduct(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/campingProduct_Page.jsp");
		return "main";
	}

	//캠핑용품 등록페이지 이동
	@RequestMapping(value = "regproduct.go", method = RequestMethod.GET )
	public String regproductgo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/ProductReg.jsp");
		return "main";
	}
	
	//캠핑용품 등록
	@RequestMapping(value = "reg.product", method = RequestMethod.POST )
	public String regProduct(Product p,HttpServletRequest req) {
		mDAO.loginCheck(req);
		sdao.regProduct(p,req);   
		sdao.getAllProduct(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/campingProduct_Page.jsp");
		return "main";
	}
	
	//캠핑용품 검색
	@RequestMapping(value = "search.product", method = RequestMethod.GET )
	public String searchProduct(Product p,HttpServletRequest req) {
		mDAO.loginCheck(req);
		sdao.searchProduct(p,req);   
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/campingProduct_Page.jsp");
		return "main";
	}
	
	//캠핑용품 삭제
	@RequestMapping(value = "del.product", method = RequestMethod.GET)
	public String delProduct(Product p,HttpServletRequest req) {
		mDAO.loginCheck(req);
		sdao.delProduct(p, req );
		sdao.getAllProduct(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/campingProduct_Page.jsp");
		return "main";
	}
	
	//캠핑용품 상세페이지(+리뷰목록)
	@RequestMapping(value = "detail.product", method = RequestMethod.GET)
	public String detailProduct(Reviewinsert ri,Product p,HttpServletRequest req) {
		mDAO.loginCheck(req);
		sdao.getProduct(p,req);
		sdao.getAllProductReview(req);
		sdao.reviewwrite(ri,p,req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/detailProduct.jsp");	

		return "main";
	}
	
	//캠핑용품 상세페이지(+리뷰목록)
		@RequestMapping(value = "detail.oneproduct", method = RequestMethod.GET)
		public String detailoneProduct(Reviewinsert ri,Product p,HttpServletRequest req) {
			mDAO.loginCheck(req);
			sdao.getProduct(p,req);
			sdao.getAllProductReview(req);
			sdao.reviewwrite(ri,p,req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping/detailProduct.jsp");	

			return "main";
		}
	
	//캠핑용품 수정페이지 이동
	@RequestMapping(value = "updateproduct.go", method = RequestMethod.GET)
	public String updateProductgo(Product p, HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/updateProduct.jsp");
		
		req.setAttribute("p", p);

		return "main";
	}
	
	//캠핑용품 수정
	@RequestMapping(value = "update.product", method = RequestMethod.POST)
	public String updateProduct(Product p, HttpServletRequest req) {
		mDAO.loginCheck(req);
		sdao.updateProduct(p,req);
		sdao.getProduct(p, req);
		sdao.getAllProductReview(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/detailProduct.jsp");
		return "main";
	}
	
	//캠핑용품 리뷰등록
		@RequestMapping(value = "reg.productreview", method = RequestMethod.GET )
		public String regproductreview(Product p,ProductReview pr,Reviewinsert ri,HttpServletRequest req) {
			mDAO.loginCheck(req);
			sdao.regProductreview(pr,req); 
			sdao.getProduct(p, req); 
			sdao.getAllProductReview(req); 
			sdao.reviewwrite(ri,p,req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping/detailProduct.jsp");	
			return "main";
		}
		
	//캠핑용품 리뷰삭제
		@RequestMapping(value = "del.productreview", method = RequestMethod.GET)
		public String delproductreview(ProductReview pr,Product p,Reviewinsert ri,HttpServletRequest req) {
			mDAO.loginCheck(req);
			sdao.delProductreview(pr, req);
			sdao.getProduct(p,req);
			sdao.getAllProductReview(req);
			sdao.reviewwrite(ri,p,req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping/detailProduct.jsp");
			return "main";
		}	
		
	//캠핑용품 리뷰수정
		@RequestMapping(value = "update.productreview", method = RequestMethod.GET)
		public String updateproductreview(ProductReview pr,Product p,Reviewinsert ri,HttpServletRequest req) {
			mDAO.loginCheck(req);
			sdao.updateProductreview(pr, req);
			sdao.getProduct(p,req);
			sdao.getAllProductReview(req);
			sdao.reviewwrite(ri,p,req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping/detailProduct.jsp");
			return "main";
	    }	
		
	//캠핑용품 구매페이지 이동
		@RequestMapping(value = "orderproduct.go", method = RequestMethod.GET)
		public String orderproductgo(Product p, UserMember u,BossMember b, ShoppingOrder so, HttpServletRequest req) {
			mDAO.loginCheck(req);
			UserMember m = (UserMember) req.getSession().getAttribute("loginMember");
			b = (BossMember) req.getSession().getAttribute("loginMember2");
			if(m != null) {
				String u_addr = m.getU_address();
				String[] u_addr2 = u_addr.split("!");
				req.setAttribute("u_addr", u_addr2);
			}else {
				String bo_addr = b.getBo_address();
				String[] bo_addr2 = bo_addr.split("!");
				req.setAttribute("bo_addr", bo_addr2);
			}
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping/orderProduct.jsp");
			req.setAttribute("u", u);
			req.setAttribute("p", p);
			req.setAttribute("so", so); //수량+합계
			return "main";
		}
		
		
	//캠핑용품 구매페이지[약관 내용]	
		@RequestMapping(value = "agree1", method = RequestMethod.GET)
		public String agree1(HttpServletRequest req) {
			return "shopping/agree_msg/agree1";
		}
		@RequestMapping(value = "agree2", method = RequestMethod.GET)
		public String agree2(HttpServletRequest req) {
			return "shopping/agree_msg/agree2";
		}
		@RequestMapping(value = "agree3", method = RequestMethod.GET)
		public String agree3(HttpServletRequest req) {
			return "shopping/agree_msg/agree3";
		}
		
	    //장바구니 등록
		@RequestMapping(value = "reg.productbasket", method = RequestMethod.POST)
		public String productbasketgo(CartBean c,ProductBasket pb, HttpServletRequest req) {
			mDAO.loginCheck(req);
			sdao.regProductbasket(pb,req);
			if(mDAO.loginCheck(req)) {
				cdao.campingproduct(c, req);
			}
			req.setAttribute("contentPage", "cart/campingproduct.jsp");
			return "main";
		}	
		
		//상품구매
		@RequestMapping(value = "reg.productbuy", method = RequestMethod.GET)
		public String regproductbuy(Buy b,ProductBuy pbuy, HttpServletRequest req) {
			mDAO.loginCheck(req);
			sdao.regProductbuy(pbuy,req);
			mDAO.CBuylist(b, req);
			req.setAttribute("myPage", "../member/mypage.jsp");
			req.setAttribute("contentPage", "member/buylist.jsp");
			return "main";
		}	
		
		//디테일 로그인
		@RequestMapping(value = "login.productgo", method = RequestMethod.GET)
		public String gologin(UserMember m,Product p,HttpServletRequest req) {
			req.setAttribute("p", p);
			req.setAttribute("contentPage", "shopping/Productlogin.jsp");
			return "main";
		}
				
				//로그인하면 디테일로 이동
		@RequestMapping(value = "member.productlogin", method = RequestMethod.POST)
		public String login(Login l,Product p,Reviewinsert ri, HttpServletRequest req, HttpServletResponse response) throws IOException {
			mDAO.login(l, req,response);
			mDAO.loginCheck(req);
			sdao.getProduct(p,req);
			sdao.getAllProductReview(req);
			sdao.reviewwrite(ri,p,req);
			req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
			req.setAttribute("shoppigListPage", "../shopping/detailProduct.jsp");	
			return "main";
		}
		
		
		
		
	
}
