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

	// 사용자 장바구니 전체 목록
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String usercart(CartBean c, HttpServletRequest request) {
		sdao.cart(c, request);
		request.setAttribute("contentPage", "cart/cart.jsp");
		return "main";
	}
	
}
