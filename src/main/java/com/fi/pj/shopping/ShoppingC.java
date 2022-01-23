package com.fi.pj.shopping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fi.pj.member.MemberDAO;



@Controller
public class ShoppingC {
	@Autowired
	private ShoppingDAO sdao;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSession ss;
	
	//쇼핑페이지 이동
	@RequestMapping(value = "shopping.go", method = RequestMethod.GET)
	public String shoppinggo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
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
	
	//밀키트 목록페이지
	@RequestMapping(value = "camping.milkit", method = RequestMethod.GET)
	public String shoppingmilkit(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/milkit_Page.jsp");
		return "main";
	}
	
	//캠핑용품 등록페이지 이동
	@RequestMapping(value = "regproduct.go", method = RequestMethod.GET )
	public String regproductgo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../admin/ProductReg.jsp");
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
		//sdao.getAllProduct(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/campingProduct_Page.jsp");
		return "main";
	}
	
	//캠핑용품 삭제
	@RequestMapping(value = "del.product", method = RequestMethod.GET)
	public String delMenuDo(Product p,HttpServletRequest req) {
		mDAO.loginCheck(req);
		sdao.delProduct(p, req );
		sdao.getAllProduct(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/campingProduct_Page.jsp");
		return "main";
	}
	
	//캠핑용품 상세페이지
	@RequestMapping(value = "detail.product", method = RequestMethod.GET)
	public String datailProduct(Reviewinsert ri,Product p,HttpServletRequest req) {
		mDAO.loginCheck(req);
		sdao.getProduct(p, req);
		sdao.getAllProductReview(req);
		sdao.reviewwrite(ri,req);
		
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/detailProduct.jsp");
		//req.setAttribute("reviewPage", "../shopping/campingproduct_review.jsp");

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
	
    //캠핑용품 리뷰
	@RequestMapping(value = "reg.productreview", method = RequestMethod.POST)
	public String regproductreview(Product p, HttpServletRequest req) {
		mDAO.loginCheck(req);
		sdao.updateProduct(p,req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/detailProduct.jsp");
		return "main";
	}
	
}
