package com.fi.pj.Cart;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fi.pj.member.MemberDAO;

@Controller
public class CartController {

	@Autowired
	private CartDAO sdao;
	
	@Autowired
	private MemberDAO Mdao;

	// 장바구니 전체 목록
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String cart(CartBean c, HttpServletRequest request) {
		Mdao.loginCheck(request);
		sdao.cart(c, request);
		request.setAttribute("contentPage", "cart/cart.jsp");
		return "main";
	}

	// 장바구니 수량 변경
	@RequestMapping(value = "cart.update", method = RequestMethod.POST)
	public String cartup(CartBean c, HttpServletRequest request) {
		if(Mdao.loginCheck(request)) {
			sdao.cartup(c, request);
		}
		return cart(c,request);
	}

	// 장바구니 삭제
	@RequestMapping(value = "cart.delete", method = RequestMethod.POST)
	public String cartdel(CartBean c, HttpServletRequest request) {
		if(Mdao.loginCheck(request)) {
			sdao.cartdel(c, request);
		}
		return cart(c, request);
	}
}
