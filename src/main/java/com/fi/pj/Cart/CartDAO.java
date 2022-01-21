package com.fi.pj.Cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartDAO {
	
	@Autowired /*sql세션 땡겨오기*/
	private SqlSession ss;

	public void getcampingCart(HttpServletRequest request) {
		// 캠핑도구 장바구니 전체 조회
		CartMapper mm = ss.getMapper(CartMapper.class);
		List<CartBean> Cartlist = mm.Ccartlist(); 
		request.setAttribute("Cartlist", Cartlist);
	}

	public void getmealkitCart(HttpServletRequest request) {
		// 밀키트 장바구니 전체 조회
		CartMapper mm = ss.getMapper(CartMapper.class);
		List<CartBean> Cartlist = mm.Mcartlist(); 
		request.setAttribute("Cartlist", Cartlist);
	}
/*
	public void deleteCcart(HttpServletRequest request) {
		// 캠핑도구 장바구니 삭제
		CartMapper mm = ss.getMapper(CartMapper.class);
	}

	public void deleteMcart(HttpServletRequest request) {
		// 밀키트 장바구니 삭제
		CartMapper mm = ss.getMapper(CartMapper.class);
	}
*/
}
