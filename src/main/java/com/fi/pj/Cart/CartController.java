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
	@RequestMapping(value = "UserCart", method = RequestMethod.GET)
	public String User_Cart(HttpServletRequest request) {
		sdao.Ccartlist(request);
		sdao.Mcartlist(request);
		request.setAttribute("contentPage", "cart/user_cart.jsp");
		return "main";
	}
	
	// 사장 장바구니 전체 목록
	@RequestMapping(value = "BossCart", method = RequestMethod.GET)
	public String Boss_Cart(HttpServletRequest request) {
		sdao.BCcartlist(request);
		sdao.BMcartlist(request);
		request.setAttribute("contentPage", "cart/boss_cart.jsp");
		return "main";
	}
}
