package com.fi.pj.member;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;

	//로그인하기
	public void login(Login l, HttpServletRequest req) {
		UserMember dbMember = ss.getMapper(MemberMapper.class).getMemberByUID(l);
		System.out.println(dbMember);
		BossMember dbMember2 = ss.getMapper(MemberMapper.class).getMemberByBOID(l);
		System.out.println(dbMember2);
		Root dbMember3 = ss.getMapper(MemberMapper.class).getMemberByR(l);
		System.out.println(dbMember3);
		
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
		} else if (dbMember3 != null) {
			if (l.pw.equals(dbMember3.getRoot_pw())) {				
				req.getSession().setAttribute("loginMember3", dbMember3);
				req.getSession().setMaxInactiveInterval(60 * 10);
			} else {
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
		}
		
	}
	
	//로그인 확인
	public boolean loginCheck(HttpServletRequest req) {
		UserMember m = (UserMember) req.getSession().getAttribute("loginMember");
		BossMember b = (BossMember) req.getSession().getAttribute("loginMember2");
		Root r = (Root) req.getSession().getAttribute("loginMember3");
		
		if (m != null) {
			req.setAttribute("loginPage", "member/loginSuccess.jsp");
			return true;
		} else if (b != null) {
			req.setAttribute("loginPage", "member/loginSuccess.jsp");
			return true;
		} else if (r != null) {
			req.setAttribute("loginPage", "member/loginSuccess.jsp");
			return true;
		} else {
			req.setAttribute("loginPage", "member/logout.jsp");
			return false;
		}
	}

	//아이디 중복확인
	public int getMemberNum(UserMember m, BossMember b, HttpServletRequest req) {
		System.out.println(ss.getMapper(MemberMapper.class).getMemberNum(m));
		System.out.println(ss.getMapper(MemberMapper.class).getBMemberNum(b));
		int result = ss.getMapper(MemberMapper.class).getMemberNum(m) + ss.getMapper(MemberMapper.class).getBMemberNum(b);
		return result;
	}

	//로그아웃
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
		req.getSession().setAttribute("loginMember2", null);
		req.getSession().setAttribute("loginMember3", null);
	}

	//사용자 회원가입
	public void userjoin(UserMember m, HttpServletRequest req) {		
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
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			
			String u_name = mr.getParameter("name");
			String u_id = mr.getParameter("id");
			String u_pw = mr.getParameter("pw");	
			String email = mr.getParameter("email");
			String email_address = mr.getParameter("email_address");
			String u_email = email + "@" + email_address;
			String u_addr1 = mr.getParameter("u_addr1");
			String u_addr2 = mr.getParameter("u_addr2");
			String u_addr3 = mr.getParameter("u_addr3");
			String u_address = u_addr1 + "!" + u_addr2 + "!" + u_addr3;
			String phone1 = mr.getParameter("phonenumber1");
			String phone2 = mr.getParameter("phonenumber2");
			String phone3 = mr.getParameter("phonenumber3");
			String u_phonenumber = phone1 + phone2 + phone3;
			Date u_birth = formatter.parse(mr.getParameter("birth"));
			String u_picture = mr.getFilesystemName("picture");
			u_picture = URLEncoder.encode(u_picture, "utf-8");
			u_picture = u_picture.replace("+", " ");
			

			m.setU_name(u_name);
			m.setU_id(u_id);
			m.setU_pw(u_pw);		
			m.setU_email(u_email);
			m.setU_address(u_address);
			m.setU_phonenumber(u_phonenumber);
			m.setU_birth(u_birth); 
			m.setU_picture(u_picture);

			if (ss.getMapper(MemberMapper.class).Userjoin(m) == 1) {
				req.setAttribute("result", "가입성공");
			} else {
				req.setAttribute("result", "가입실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("picture");
			new File(path + "/" + fileName).delete();
			req.setAttribute("result", "가입실패");
		}
		
	}

	//사용자 회원가입
		public void bossjoin(BossMember m, HttpServletRequest req) {		
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
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				
				String bo_name = mr.getParameter("name");
				String bo_id = mr.getParameter("id");
				String bo_pw = mr.getParameter("pw");	
				String email = mr.getParameter("email");
				String email_address = mr.getParameter("email_address");
				String bo_email = email + "@" + email_address;
				String bo_addr1 = mr.getParameter("addr1");
				String bo_addr2 = mr.getParameter("addr2");
				String bo_addr3 = mr.getParameter("addr3");
				String bo_address = bo_addr1 + "!" + bo_addr2 + "!" + bo_addr3;
				String phone1 = mr.getParameter("phonenumber1");
				String phone2 = mr.getParameter("phonenumber2");
				String phone3 = mr.getParameter("phonenumber3");
				String bo_phonenumber = phone1 + phone2 + phone3;
				Date bo_birth = formatter.parse(mr.getParameter("birth"));
				String bo_picture = mr.getFilesystemName("picture");
				bo_picture = URLEncoder.encode(bo_picture, "utf-8");
				bo_picture = bo_picture.replace("+", " ");

				m.setBo_name(bo_name);
				m.setBo_id(bo_id);
				m.setBo_pw(bo_pw);		
				m.setBo_email(bo_email);
				m.setBo_address(bo_address);
				m.setBo_phonenumber(bo_phonenumber);
				m.setBo_birth(bo_birth);
				m.setBo_picture(bo_picture);

				if (ss.getMapper(MemberMapper.class).Bossjoin(m) == 1) {
					req.setAttribute("result", "가입성공");
				} else {
					req.setAttribute("result", "가입실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
				String fileName = mr.getFilesystemName("picture");
				new File(path + "/" + fileName).delete();
				req.setAttribute("result", "가입실패");
			}
			
		}

}
