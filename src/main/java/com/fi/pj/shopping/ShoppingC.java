package com.fi.pj.shopping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShoppingC {
	@Autowired
	private ShoppingDAO sdao;

	@RequestMapping(value = "shopping.go", method = RequestMethod.GET)
	public String shoppingmain(HttpServletRequest req) {
	
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		return "main";
	}
	
	@RequestMapping(value = "camping.product", method = RequestMethod.GET)
	public String shoppingcamping(HttpServletRequest req) {
		
		sdao.getAllProduct(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/campingProduct_Page.jsp");
		return "main";
	}
	
	@RequestMapping(value = "camping.milkit", method = RequestMethod.GET)
	public String shoppingmilkit(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/milkit_Page.jsp");
		return "main";
	}
	
	@RequestMapping(value = "regproduct.go", method = RequestMethod.GET )
	public String regproductgo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../admin/ProductReg.jsp");
		return "main";
	}
	
	@RequestMapping(value = "reg.product", method = RequestMethod.POST )
	public String regproduct(Product p,HttpServletRequest req) {
		//등록하고 전체조회
		sdao.regProduct(p,req);   
		sdao.getAllProduct(req);
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		req.setAttribute("shoppigListPage", "../shopping/campingProduct_Page.jsp");
		return "main";
	}
	
}
