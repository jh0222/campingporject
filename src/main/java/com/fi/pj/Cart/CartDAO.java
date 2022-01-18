package com.fi.pj.Cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fi.pj.user_mypage.MypageMapper;

@Service
public class CartDAO {
	
	@Autowired /*sql세션 땡겨오기*/
	private SqlSession ss;

	public void getcampingCart(HttpServletRequest request) {
		// 캠핑도구 장바구니 전체 조회
		CartMapper mm = ss.getMapper(CartMapper.class);
		List<CartBean> Carts = mm.showAllcampingcart(); // select문
		request.setAttribute("Carts", Carts);
	}

	public void getmealkitCart(HttpServletRequest request) {
		// 밀키트 장바구니 전체 조회
		CartMapper mm = ss.getMapper(CartMapper.class);
		List<CartBean> Carts = mm.showAllmealkitcart(); // select문
		request.setAttribute("Carts", Carts);
	}
}
