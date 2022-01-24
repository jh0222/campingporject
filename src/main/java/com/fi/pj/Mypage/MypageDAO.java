package com.fi.pj.Mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageDAO {

	@Autowired
	private SqlSession ss;
	
	public void getAllUserinformation(HttpServletRequest request) {
		
		// user 개인정보 조회
		MypageMapper mm = ss.getMapper(MypageMapper.class);
		List<MypageBean> Mypagelist = mm.showUserinform();
		request.setAttribute("contentPage", "mypage/user.jsp");
	}

	public void getAllBossinformation(HttpServletRequest request) {
		
	}

	public void getAllManagerinformation(HttpServletRequest request) {
		
	}

}
