package com.fi.pj.Mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fi.pj.member.BossMember;
import com.fi.pj.member.UserMember;


@Service
public class MypageDAO {

	@Autowired
	private SqlSession ss; // db작업을 위함

	// 사용자 개인정보 조회
	public void Userinformation(HttpServletRequest request) {
		
		MypageMapper mm = ss.getMapper(MypageMapper.class);
		UserMember m = (UserMember) request.getSession().getAttribute("loginMember"); // 로그인된 사용자의 정보
		Information i = mm.getUserinformation(m.getU_id());
		System.out.println(m.getU_id());
		request.setAttribute("User", i);
	}

	// 사장 개인정보 조회
	public void getBossinformation(HttpServletRequest request) {
	
		BossMember b = (BossMember) request.getSession().getAttribute("loginMember2"); // 로그인된 사장의 정보
		//request.setAttribute("Boss" );
	}

	// 관리자 개인정보 조회
	public void getManagerinformation(HttpServletRequest request) {
		request.setAttribute("Manager", ss.getMapper(MypageMapper.class).getManagerinformation());
	}

	// 사용자가 예약한 캠핑장 조회
	public void Userreserve(HttpServletRequest request) {
		
		MypageMapper mm = ss.getMapper(MypageMapper.class);
		UserMember m = (UserMember) request.getSession().getAttribute("loginMember");
		System.out.println(m.getU_id());
		List<Reservation> Ureservelist = mm.getUreservelist(m.getU_id());
		request.setAttribute("Ureservelist", Ureservelist);
		
	}



}
