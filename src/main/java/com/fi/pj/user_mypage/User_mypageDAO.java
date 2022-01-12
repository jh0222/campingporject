package com.fi.pj.user_mypage;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class User_mypageDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getAllmypage(HttpServletRequest request) {
		
		// 개인정보 조회
		MyMapper mm = ss.getMapper(MyMapper.class);
		mm.showAllmypage();
	}

}
