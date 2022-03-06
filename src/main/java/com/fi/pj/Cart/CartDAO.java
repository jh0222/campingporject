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

	@Autowired /* sql세션 땡겨오기 */
	private SqlSession ss;

	// 캠핑용품
	public void campingproduct(CartBean c, HttpServletRequest request) {

		UserMember u = (UserMember) request.getSession().getAttribute("loginMember");
		c.setBa_u_bo_id(u.getU_id());

		if (c.getBa_u_bo_id() != null) {
			List<CartBean> campingproduct = ss.getMapper(CartMapper.class).campingproduct(c);
			request.setAttribute("campingproduct", campingproduct);
		}
	}

	// 밀키트
	public void mealkit(CartBean c, HttpServletRequest request) {

		UserMember u = (UserMember) request.getSession().getAttribute("loginMember");
		c.setFba_u_bo_id(u.getU_id());

		if (c.getFba_u_bo_id() != null) {
			List<CartBean> mealkit = ss.getMapper(CartMapper.class).mealkit(c);
			request.setAttribute("mealkit", mealkit);
		}
	}

	// 캠핑용품
	public void bosscampingproduct(CartBean c, HttpServletRequest request) {

		BossMember m = (BossMember) request.getSession().getAttribute("loginMember2");
		c.setBa_u_bo_id(m.getBo_id());

		if (c.getBa_u_bo_id() != null) {
			List<CartBean> campingproduct = ss.getMapper(CartMapper.class).campingproduct(c);
			request.setAttribute("campingproduct", campingproduct);
		}
	}

	// 밀키트
	public void bossmealkit(CartBean c, HttpServletRequest request) {

		BossMember m = (BossMember) request.getSession().getAttribute("loginMember2");
		c.setFba_u_bo_id(m.getBo_id());

		if (c.getFba_u_bo_id() != null) {
			List<CartBean> mealkit = ss.getMapper(CartMapper.class).mealkit(c);
			request.setAttribute("mealkit", mealkit);
		}
	}

	// 캠핑용품 수량 변경
	public void cartup(CartBean c, HttpServletRequest request) {
		if (ss.getMapper(CartMapper.class).cartup(c) == 1) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
	}

	// 밀키트 수량 변경
	public void mealkitup(CartBean c, HttpServletRequest request) {
		if (ss.getMapper(CartMapper.class).mealkitup(c) == 1) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
	}

	// 캠핑용품 품목 하나만 삭제
	public void cartdel(CartBean c, HttpServletRequest request) {
		try {
			int cd = ss.getMapper(CartMapper.class).cartdel(c);
			System.out.println(cd);
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

	// 캠핑용품 선택 삭제
	public void selectdelete(HttpServletRequest req) {
		String[] a = req.getParameterValues("valueArr");
		for (String string : a) {
			System.out.println(string);
			ss.getMapper(CartMapper.class).selectdel(string);
		}

	}

//	public void selectdelete2(HttpServletRequest req) {
//		String a = req.getParameter("valueArr");
//		System.out.println(a);
//		String[] aa = a.split(",");
//		for (String s : aa) {
//			System.out.println(s);
//			ss.getMapper(CartMapper.class).selectdel(s);
//		}

}
