package com.fi.pj.Cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.fi.pj.member.BossMember;
import com.fi.pj.member.UserMember;
=======
import com.fi.pj.user_mypage.MypageMapper;
>>>>>>> d3be522016e6e899d9a2e96f82e68725ec3f5622

@Service
public class CartDAO {
	
	@Autowired /*sql세션 땡겨오기*/
	private SqlSession ss;

<<<<<<< HEAD
	// 사용자 캠핑도구 장바구니 전체 조회
	public void Ccartlist(HttpServletRequest request) {
		CartMapper mm = ss.getMapper(CartMapper.class);
		UserMember member = (UserMember) request.getSession().getAttribute("loginMember"); // 로그인된 사용자의 정보를 member에 저장
		System.out.println(member.getU_id());
		List<CartBean> Ccartlist = mm.Ccartlist(member.getU_id());
		request.setAttribute("Ccartlist", Ccartlist);
	}
	
	// 사용자 밀키트 장바구니 전체 조회
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
	
	// 사용자 캠핑도구 장바구니 삭제
	public void DelCcartlist(HttpServletRequest request) {
		CartMapper mm = ss.getMapper(CartMapper.class);
		
	}

	// 사용자 밀키트 장바구니 삭제
	public void DelMcartlist(HttpServletRequest request) {
		CartMapper mm = ss.getMapper(CartMapper.class);
	
	}


=======
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
>>>>>>> d3be522016e6e899d9a2e96f82e68725ec3f5622
}
