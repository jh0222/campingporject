package com.fi.pj.shopping;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShoppingC {

	@RequestMapping(value = "shopping.go", method = RequestMethod.GET)
	public String shoppingmain(HttpServletRequest req) {
	
		req.setAttribute("contentPage", "shopping/shoppingMain.jsp");
		return "main";
	}
	
	@RequestMapping(value = "camping.product", method = RequestMethod.GET)
	public String shoppingcamping(HttpServletRequest req) {
		
		ShoppingDAO.createProduct(req);
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
	
	@RequestMapping(value = "create.product", method = RequestMethod.GET)
	public String createproduct(HttpServletRequest req) {
	
		return "shopping/createProduct";
	}
	
}
