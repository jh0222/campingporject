package com.fi.pj.Mypage;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MypageDAO {

	@Autowired
	private SqlSession ss;

	// 사용자 개인정보 조회
	public void getUserinformation(HttpServletRequest request) {
		MypageMapper mm = ss.getMapper(MypageMapper.class).getUserpage();
		
	}

	// 사장 개인정보 조회
	public void getBossinformation(HttpServletRequest request) {
	
		
	}

	// 관리자 개인정보 조회
	public void getManagerinformation(HttpServletRequest request) {
		request.setAttribute("inf", ss.getMapper(MypageMapper.class).getManagerPage());
	}



}
