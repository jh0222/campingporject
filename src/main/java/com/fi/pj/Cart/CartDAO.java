package com.fi.pj.Cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartDAO {

	@Autowired /* sql세션 땡겨오기 */
	private SqlSession ss;

	public void cart(CartBean c, HttpServletRequest request) {
		// 캠핑용품
		List<CartBean> campingproduct = ss.getMapper(CartMapper.class).campingproduct(c);
		request.setAttribute("campingproduct", campingproduct);

		// 밀키트
		List<CartBean> mealkit = ss.getMapper(CartMapper.class).mealkit(c);
		request.setAttribute("mealkit", mealkit);
	}
}
