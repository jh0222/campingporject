package com.fi.pj.Cart;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CartController {

	@Autowired
	private CartDAO sdao;

	// 카트 목록
	@RequestMapping(value = "Cart", method = RequestMethod.GET)
	public String Cart(HttpServletRequest request) {
		
		sdao.Ccartlist(request);
		sdao.Mcartlist(request);
		request.setAttribute("contentPage", "cart/cart.jsp");
		return "main";
	}
/*
	// 카트 목록 삭제
		@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
		public String deleteCart(HttpServletRequest request) {
			
			sdao.deleteCcart(request);
			sdao.deleteMcart(request);
			
			return "Cart";
		}
*/
}
