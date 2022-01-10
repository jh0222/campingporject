package com.fi.pj.member;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;

	//로그인하기
	public void login(Login l, HttpServletRequest req) {
		UserMember dbMember = ss.getMapper(MemberMapper.class).getMemberByUID(l);
		BossMember dbMember2 = ss.getMapper(MemberMapper.class).getMemberByBOID(l);
		
		if (dbMember != null) {
			if (l.pw.equals(dbMember.getU_pw())) {
				req.getSession().setAttribute("loginMember", dbMember);
				req.getSession().setMaxInactiveInterval(60 * 10);
			} else {
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else if (dbMember2 != null) {
			if (l.pw.equals(dbMember2.getBo_pw())) {
				req.getSession().setAttribute("loginMember2", dbMember2);
				req.getSession().setMaxInactiveInterval(60 * 10);
			} else {
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
		}
		
	}
	
	/*public void bosslogin(Member m, Bossmember b, HttpServletRequest req) {
		Member dbMember = ss.getMapper(MemberMapper.class).getMemberByUID(m);
		Bossmember dbMember2 = ss.getMapper(MemberMapper.class).getMemberByBOID(b);

		if (dbMember != null || dbMember2 != null) {
			if (m.getU_pw().equals(dbMember.getU_pw())) {
				req.getSession().setAttribute("loginMember", dbMember);
				req.getSession().setMaxInactiveInterval(60 * 10);
			} else if (b.getBo_pw().equals(dbMember2.getBo_pw())) {
				req.getSession().setAttribute("loginMember", dbMember2);
				req.getSession().setMaxInactiveInterval(60 * 10);
			} else {
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
		}	
	}
	*/
	
	
	public boolean loginCheck(HttpServletRequest req) {
		UserMember m = (UserMember) req.getSession().getAttribute("loginMember");
		BossMember b = (BossMember) req.getSession().getAttribute("loginMember2");
		if (m != null) {
			req.setAttribute("loginPage", "member/loginSuccess_user.jsp");
			return true;
		} else if (b != null) {
			req.setAttribute("loginPage", "member/loginSuccess_boss.jsp");
			return true;
		} else {
			req.setAttribute("loginPage", "member/logout.jsp");
			return false;
		}
	}
	
	public void join(UserMember m, HttpServletRequest req) {
		
		
	}

	//아이디 중복확인
	public int getMemberNum(UserMember m, HttpServletRequest req) {
		System.out.println(ss.getMapper(MemberMapper.class).getMemberNum(m));
		return ss.getMapper(MemberMapper.class).getMemberNum(m);
	}

	//로그아웃
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
	}

}
