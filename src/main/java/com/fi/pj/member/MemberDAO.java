package com.fi.pj.member;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fi.pj.member.UserMember;
import com.fi.pj.Cart.CartBean;
import com.fi.pj.Cart.CartMapper;
import com.fi.pj.member.MemberMapper;
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
		Root dbMember3 = ss.getMapper(MemberMapper.class).getMemberByR(l);
		
		if (dbMember != null) {
			if (l.pw.equals(dbMember.getU_pw())) {
				req.getSession().setAttribute("loginMember", dbMember);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				req.getSession().setAttribute("birth", sdf.format(dbMember.getU_birth()));
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

	//사장 회원가입
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

	// 사용자 db에 저장된 주소
		public void splitUser(HttpServletRequest request) {
			UserMember m = (UserMember) request.getSession().getAttribute("loginMember");
			String u_addr = m.getU_address();
			String[] u_addr2 = u_addr.split("!");

			String u_email = m.getU_email();
			String[] u_email2 = u_email.split("@");
			System.out.println(u_email);
			request.setAttribute("addr", u_addr2);	
			request.setAttribute("email", u_email2);	
		}
		
	// 사용자 탈퇴
		public void userBye(HttpServletRequest request) {
			try {
				UserMember m = (UserMember) request.getSession().getAttribute("loginMember");

				if (ss.getMapper(MemberMapper.class).userBye(m) == 1) {
					request.setAttribute("result", "탈퇴성공");

					String path = request.getSession().getServletContext().getRealPath("resources/img");
					String U_picture = m.getU_picture();
					U_picture = URLDecoder.decode(U_picture, "utf-8");
					new File(path + "/" + U_picture).delete();

					logout(request);
					
				} else {
					request.setAttribute("result", "탈퇴실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("result", "탈퇴실패");
			}
		}
		
	// 사용자 정보 업데이트
		public void UserUpdate(UserMember user, HttpServletRequest request) {
			String path = request.getSession().getServletContext().getRealPath("resources/img");
			MultipartRequest mr = null;
			UserMember m = (UserMember) request.getSession().getAttribute("loginMember");
			String oldFile = m.getU_picture();
			String newFile = null;
			try {
				mr = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
				newFile = mr.getFilesystemName("u_picture");
				if (newFile == null) {
					newFile = oldFile;
				} else {
					newFile = URLEncoder.encode(newFile, "utf-8");
					newFile = newFile.replace("+", " ");
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("result", "수정실패");
				return;
			}

			try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				String u_name = mr.getParameter("u_name");
				String u_id = mr.getParameter("u_id");
				String u_pw = mr.getParameter("u_pw");	
				String email = mr.getParameter("u_email");
				String email_address = mr.getParameter("u_email_address");
				String u_email = email + "@" + email_address;
				String u_addr1 = mr.getParameter("u_addr1");
				String u_addr2 = mr.getParameter("u_addr2");
				String u_addr3 = mr.getParameter("u_addr3");
				String u_address = u_addr1 + "!" + u_addr2 + "!" + u_addr3;
				String phone1 = mr.getParameter("phonenumber1");
				String phone2 = mr.getParameter("phonenumber2");
				String phone3 = mr.getParameter("phonenumber3");
				String u_phonenumber = phone1 + phone2 + phone3;
				Date newbirth = formatter.parse(mr.getParameter("newbirth"));
				String oldpicture = mr.getParameter("oldpicture");
				String newpicture = mr.getFilesystemName("newpicture");

				m.setU_name(u_name);
				m.setU_id(u_id);
				m.setU_pw(u_pw);		
				m.setU_email(u_email);
				m.setU_address(u_address);
				m.setU_phonenumber(u_phonenumber);
				m.setU_birth(newbirth); 
				
				if(newpicture!=null) {
					m.setU_picture(newpicture);
				}else {
					m.setU_picture(oldpicture);
				}
				
				if (ss.getMapper(MemberMapper.class).userUpdate(m) == 1) {
					request.setAttribute("result", "수정성공");					
				} else {
					request.setAttribute("result", "수정실패");					
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("result", "수정실패");					
			}
		}	
		
	// 사장 db에 저장된 주소
	public void splitBossAddr(HttpServletRequest request) {
		BossMember b = (BossMember) request.getSession().getAttribute("loginMember2");
		String bo_addr = b.getBo_address();
		String[] bo_addr2 = bo_addr.split("!");
		request.setAttribute("boaddr", bo_addr2);	
	}
	
	// 사장 정보 업데이트
		public void bossUpdate(BossMember boss, HttpServletRequest request) {
			String path = request.getSession().getServletContext().getRealPath("resources/img");
			MultipartRequest mr = null;
			BossMember b = (BossMember) request.getSession().getAttribute("loginMember2");
			String oldFile = b.getBo_picture();
			String newFile = null;
			try {
				mr = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
				newFile = mr.getFilesystemName("bo_picture");
				if (newFile == null) {
					newFile = oldFile;
				} else {
					newFile = URLEncoder.encode(newFile, "utf-8");
					newFile = newFile.replace("+", " ");
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("result", "수정실패");
				return;
			}

			try {
					
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
				String bo_picture = mr.getFilesystemName("picture");
				bo_picture = URLEncoder.encode(bo_picture, "utf-8");
				bo_picture = bo_picture.replace("+", " ");

				b.setBo_id(bo_id);
				b.setBo_pw(bo_pw);		
				b.setBo_email(bo_email);
				b.setBo_address(bo_address);
				b.setBo_phonenumber(bo_phonenumber); 
				b.setBo_picture(bo_picture);
				if (ss.getMapper(MemberMapper.class).bossUpdate(b) == 1) {
					request.setAttribute("result", "수정성공");
					request.getSession().setAttribute("loginMember", b);
					if (!oldFile.equals(newFile)) {
						oldFile = URLDecoder.decode(oldFile, "utf-8");
						new File(path + "/" + oldFile).delete();
					}
				} else {
					request.setAttribute("result", "수정실패");
					if (!oldFile.equals(newFile)) {
						newFile = URLDecoder.decode(newFile, "utf-8");
						new File(path + "/" + newFile).delete();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("result", "수정실패");
				if (!oldFile.equals(newFile)) {
					try {
						newFile = URLDecoder.decode(newFile, "utf-8");
					} catch (UnsupportedEncodingException e1) {
						}
					new File(path + "/" + newFile).delete();
				}
			}
		}	
		
	// 사장 탈퇴
		public void bossBye(HttpServletRequest request) {
		try {
			BossMember b = (BossMember) request.getSession().getAttribute("loginMember2");

			if (ss.getMapper(MemberMapper.class).bossBye(b) == 1) {
				request.setAttribute("result", "탈퇴성공");

				String path = request.getSession().getServletContext().getRealPath("resources/img");
				String Bo_picture = b.getBo_picture();
				Bo_picture = URLDecoder.decode(Bo_picture, "utf-8");
				new File(path + "/" + Bo_picture).delete();

				logout(request);
				loginCheck(request);
			} else {
				request.setAttribute("result", "탈퇴실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "탈퇴실패");
		}
	}

	// 사용자 구매목록
	public void userbuylist(Buy b, HttpServletRequest request) {
		List<Buy> userbuylist = ss.getMapper(BuylistMapper.class).userbuylist(b);
		request.setAttribute("userbuylist", userbuylist);
		List<Buy> mealbuylist = ss.getMapper(BuylistMapper.class).mealbuylist(b);
		request.setAttribute("mealbuylist", mealbuylist);
		
	}

	public void buydel(Buy b, HttpServletRequest request) {
		if (ss.getMapper(BuylistMapper.class).userbuydel(b) == 1) {
			request.setAttribute("result", "탈퇴성공");
		} else {
			request.setAttribute("result", "탈퇴실패");
		}
		
	}

	public void usercommunities(Communities c, HttpServletRequest request) {
		
		
	}
	
}
