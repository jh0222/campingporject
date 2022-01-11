package com.fi.pj.member;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

	//아이디 중복확인
	public int getMemberNum(UserMember m, HttpServletRequest req) {
		System.out.println(ss.getMapper(MemberMapper.class).getMemberNum(m));
		return ss.getMapper(MemberMapper.class).getMemberNum(m);
	}

	//로그아웃
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
		req.getSession().setAttribute("loginMember2", null);
	}

	//사용자 회원가입
	public void userjoin(UserMember m, HttpServletRequest req) {
	//	UserMember umember = ss.getMapper(MemberMapper.class).
				
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "가입실패");
			return;
		}

		try {
			String u_id = mr.getParameter("u_id");
			String u_pw = mr.getParameter("u_pw");
			String u_name = mr.getParameter("u_name");
			String u_email = mr.getParameter("u_email");
			String u_addr1 = mr.getParameter("u_addr1");
			String u_addr2 = mr.getParameter("u_addr2");
			String u_addr3 = mr.getParameter("u_addr3");
			String u_address = u_addr1 + "!" + u_addr2 + "!" + u_addr3;
			String u_picture = mr.getFilesystemName("u_picture");
			u_picture = URLEncoder.encode(u_picture, "utf-8");
			u_picture = u_picture.replace("+", " ");

			m.setU_id(u_id);
			m.setU_pw(u_pw);
			m.setU_name(u_name);
			m.setU_email(u_email);
			m.setU_address(u_address);
			m.setU_picture(u_picture);

			if (ss.getMapper(MemberMapper.class).Userjoin(m) == 1) {
				req.setAttribute("result", "가입성공");
			} else {
				req.setAttribute("result", "가입실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("u_picture");
			new File(path + "/" + fileName).delete();
			req.setAttribute("result", "가입실패");
		}
		
	}

	//사장님 회원가입
	public void bossrjoin(BossMember m, HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}

}
