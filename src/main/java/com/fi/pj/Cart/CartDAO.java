package com.fi.pj.Cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fi.pj.member.BossMember;
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
		request.setAttribute("Ccartlist", Ccartlist);
	}
	
	// 밀키트 장바구니 전체 조회
		public void Mcartlist(HttpServletRequest request) {
			CartMapper mm = ss.getMapper(CartMapper.class);
			UserMember member = (UserMember) request.getSession().getAttribute("loginMember");
			List<CartBean> Mcartlist = mm.Mcartlist(member.getU_id()); 
			request.setAttribute("Mcartlist", Mcartlist);
		}
	
	// 사장님 캠핑도구 장바구니 전체 조회
		public void BCcartlist(HttpServletRequest request) {
			CartMapper mm = ss.getMapper(CartMapper.class);
			BossMember bossmember = (BossMember) request.getSession().getAttribute("loginMember2");
			System.out.println(bossmember);
			System.out.println(bossmember.getBo_id());
			List<CartBean> Ccartlist = mm.BCcartlist(bossmember.getBo_id());
			request.setAttribute("Ccartlist", Ccartlist);
		}
	
	// 사장님 밀키트 장바구니 전체 조회
		public void BMcartlist(HttpServletRequest request) {
			CartMapper mm = ss.getMapper(CartMapper.class);
			BossMember bossmember = (BossMember) request.getSession().getAttribute("loginMember2");
			List<CartBean> Mcartlist = mm.BMcartlist(bossmember.getBo_id()); 
			request.setAttribute("Mcartlist", Mcartlist);
		}
		
	// 캠핑도구 장바구니 삭제
	public void delCcart(HttpServletRequest request) {
		
		CartMapper mm = ss.getMapper(CartMapper.class);
		
	}

	// 밀키트 장바구니 삭제
	public void delMcart(HttpServletRequest request) {
		CartMapper mm = ss.getMapper(CartMapper.class);
		
	}


}
