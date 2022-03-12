package com.fi.pj.Cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fi.pj.member.BossMember;
import com.fi.pj.member.MemberDAO;
import com.fi.pj.member.UserMember;
import com.fi.pj.shopping.Product;
import com.fi.pj.shopping.Reviewinsert;
import com.fi.pj.shopping.ShoppingOrder;

@Controller
public class CartController {

	@Autowired
	private CartDAO sdao;

	@Autowired
	private MemberDAO Mdao;

	// 장바구니 전체 목록
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String cart(CartBean c, HttpServletRequest request) {
		if(Mdao.loginCheck(request)) {
			sdao.campingproduct(c, request);
		}
		request.setAttribute("contentPage", "cart/campingproduct.jsp");
		return "main";
	}

	// 장바구니 수량 변경
	@RequestMapping(value = "cart.update", method = RequestMethod.POST)
	public String cartup(CartBean c, HttpServletRequest request) {
		if (Mdao.loginCheck(request)) {
			sdao.cartup(c, request);
		}
		return cart(c, request);
	}

	// 장바구니 삭제
	@RequestMapping(value = "cart.delete", method = RequestMethod.GET)
	public String cartdel(CartBean c, HttpServletRequest request) {
		if (Mdao.loginCheck(request)) {
			sdao.cartdel(c, request);
		}
		return cart(c, request);
	}

	// 장바구니 선택삭제
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String selectdelete(HttpServletRequest request) {
		if (Mdao.loginCheck(request)) {
			sdao.selectdelete(request);
//			sdao.selectdelete2(request);
		}
		return "redirect:cart";
	}

	// 밀키트 전체 목록
	@RequestMapping(value = "mealkit", method = RequestMethod.GET)
	public String mealkit(CartBean c, HttpServletRequest request) {
		if (Mdao.loginCheck(request)) {
			sdao.mealkit(c, request);
		} 
		request.setAttribute("contentPage", "cart/mealkit.jsp");
		return "main";
	}

	// 밀키트 수량 변경
	@RequestMapping(value = "mealkit.update", method = RequestMethod.POST)
	public String mealkitup(CartBean c, HttpServletRequest request) {
		if (Mdao.loginCheck(request)) {
			sdao.mealkitup(c, request);
		}
		return mealkit(c, request);
	}

	// 밀키트 삭제
	@RequestMapping(value = "mealkit.delete", method = RequestMethod.GET)
	public String mealkitdel(CartBean c, HttpServletRequest request) {
		if (Mdao.loginCheck(request)) {
			sdao.mealkitdel(c, request);
		}
		return mealkit(c, request);
	}

	// 밀키트 선택삭제
	@RequestMapping(value = "mealkits.delete", method = RequestMethod.GET)
	public String mealkitsdelete(HttpServletRequest request) {
		if (Mdao.loginCheck(request)) {
			sdao.mealkitSelectdelete(request);
		}
		return "redirect:mealkit";
	}
		
	@RequestMapping(value = "/gogo", method = RequestMethod.GET)
	public String orderproductgo(Product p, UserMember u,BossMember b, ShoppingOrder so, HttpServletRequest req) {
		/*sdao
		
		String[] aaa = req.getParameterValues("RowCheck");
		
		
		ArrayList<Product> products = new ArrayList<Product>();
		for (String string : aaa) {
			p = ss.getMapper(인터페).getProByPk			select * from pro where p_no = ??
			products.add(pp);
		}*/
		Mdao.loginCheck(req);
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
		//req.setAttribute("p", products);
		req.setAttribute("so", so); //수량+합계
		return "main";
	}
}
