package com.fi.pj.Cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fi.pj.member.BossMember;

@Service
public class CartDAO {

	@Autowired /* sql세션 땡겨오기 */
	private SqlSession ss;

	public void cart(CartBean c, HttpServletRequest request) {
		
		// 캠핑용품
		BossMember b = (BossMember) request.getSession().getAttribute("loginMember2");
		c.setBa_u_bo_id(b.getBo_id()); 
		
		if(c.getBa_u_bo_id() != null) {
			
		List<CartBean> campingproduct = ss.getMapper(CartMapper.class).campingproduct(c);
		request.setAttribute("campingproduct", campingproduct);
		}

		c.setFba_u_bo_id(b.getBo_id());  
		
		// 밀키트
		if(c.getFba_u_bo_id() != null) {

		List<CartBean> mealkit = ss.getMapper(CartMapper.class).mealkit(c);
		request.setAttribute("mealkit", mealkit);
		
		}
	}

	public void cartup(CartBean c, HttpServletRequest request) {
		if(ss.getMapper(CartMapper.class).cartup(c)==1) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
	}

	public void cartdel(CartBean c, HttpServletRequest request) {
		try {
			int cd = ss.getMapper(CartMapper.class).cartdel(c);
			if (cd == 1) {
				request.setAttribute("result", "삭제성공");
			} else {
				request.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "삭제실패");
		}
	}
}
