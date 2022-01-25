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
	
	// user 개인정보 조회
	public void getUser_infor(HttpServletRequest request) {
		MypageMapper mm = ss.getMapper(MypageMapper.class);
		List<MypageBean> Mypagelist = mm.showinformation();
		request.setAttribute("Mypagelist", Mypagelist);
	}

	public void getBoss_infor(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	public void getManager_infor(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

}
