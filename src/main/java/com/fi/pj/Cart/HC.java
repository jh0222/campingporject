package com.fi.pj.Cart;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HC {

	@Autowired
	private CartDAO sdao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		
		return "main";
	}
	
	@RequestMapping(value = "Cart", method = RequestMethod.GET)
	public String Cart(HttpServletRequest request) {
		
		sdao.getcampingCart(request);
		sdao.getmealkitCart(request);
		
		return "Cart";
	}
}
