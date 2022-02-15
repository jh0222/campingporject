package com.fi.pj.user_mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class User_mypageDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getAllmypage(HttpServletRequest request) {
		
		// 개인정보 조회
		MypageMapper mm = ss.getMapper(MypageMapper.class);
		List<Usermypage> users = mm.showAllmypage();
		request.setAttribute("user", users);
	}
}
