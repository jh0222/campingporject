package com.fi.pj.Cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fi.pj.member.UserMember;

@Service
public class CartDAO {
	
	@Autowired /*sql세션 땡겨오기*/
	private SqlSession ss;

	// 캠핑도구 장바구니 전체 조회
	public void Ccartlist(HttpServletRequest request) {
		CartMapper mm = ss.getMapper(CartMapper.class);
		UserMember member = (UserMember) request.getSession().getAttribute("loginMember");
		System.out.println(member.getU_id());
		List<CartBean> Ccartlist = mm.Ccartlist(member.getU_id());
		request.setAttribute("Cartlist", Ccartlist);
	}

	// 밀키트 장바구니 전체 조회
	public void Mcartlist(HttpServletRequest request) {
		CartMapper mm = ss.getMapper(CartMapper.class);
		UserMember member = (UserMember) request.getSession().getAttribute("loginMember");
		List<CartBean> Mcartlist = mm.Mcartlist(member.getU_id()); 
		request.setAttribute("Mcartlist", Mcartlist);
	}
/*
	public void deleteCcart(HttpServletRequest request) {
		// 캠핑도구 장바구니 삭제
		CartMapper mm = ss.getMapper(CartMapper.class);
		return "Cartlist";
	}

	public void deleteMcart(HttpServletRequest request) {
		// 밀키트 장바구니 삭제
		CartMapper mm = ss.getMapper(CartMapper.class);
		return "Cartlist";
	}
*/
}
