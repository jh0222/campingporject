package com.fi.pj.member;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fi.pj.member.UserMember;
import com.fi.pj.member.MemberMapper;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;

	// 로그인하기
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

	// 로그인 확인
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

	// 아이디 중복확인
	public int getMemberNum(UserMember m, BossMember b, HttpServletRequest req) {
		System.out.println(ss.getMapper(MemberMapper.class).getMemberNum(m));
		System.out.println(ss.getMapper(MemberMapper.class).getBMemberNum(b));
		int result = ss.getMapper(MemberMapper.class).getMemberNum(m)
				+ ss.getMapper(MemberMapper.class).getBMemberNum(b);
		return result;
	}

	// 로그아웃
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
		req.getSession().setAttribute("loginMember2", null);
		req.getSession().setAttribute("loginMember3", null);
	}

	// 사용자 회원가입
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

	// 사장 회원가입
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
			String u_pw = mr.getParameter("up_pw");
			String email = mr.getParameter("up_email");
			String email_address = mr.getParameter("up_email_address");
			String u_email = email + "@" + email_address;
			String u_addr1 = mr.getParameter("up_addr1");
			String u_addr2 = mr.getParameter("up_addr2");
			String u_addr3 = mr.getParameter("up_addr3");
			String u_address = u_addr1 + "!" + u_addr2 + "!" + u_addr3;
			String phone1 = mr.getParameter("up_phonenumber1");
			String phone2 = mr.getParameter("up_phonenumber2");
			String phone3 = mr.getParameter("up_phonenumber3");
			String u_phonenumber = phone1 + phone2 + phone3;
			Date u_birth = formatter.parse(mr.getParameter("newbirth"));
			String oldpicture = mr.getParameter("oldpicture");
			String newpicture = mr.getFilesystemName("newpicture");

			m.setU_pw(u_pw);
			m.setU_email(u_email);
			m.setU_address(u_address);
			m.setU_phonenumber(u_phonenumber);
			m.setU_birth(u_birth);

			if (newpicture != null) {
				m.setU_picture(newpicture);
			} else {
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

		String bo_email = b.getBo_email();
		String[] bo_email2 = bo_email.split("@");
		System.out.println(bo_email);
		request.setAttribute("addr", bo_addr2);
		request.setAttribute("email", bo_email2);
	}

	// 사용자 정보 업데이트
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
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			String bo_pw = mr.getParameter("up_pw");
			String email = mr.getParameter("up_email");
			String email_address = mr.getParameter("up_email_address");
			String bo_email = email + "@" + email_address;
			String bo_addr1 = mr.getParameter("up_addr1");
			String bo_addr2 = mr.getParameter("up_addr2");
			String bo_addr3 = mr.getParameter("up_addr3");
			String bo_address = bo_addr1 + "!" + bo_addr2 + "!" + bo_addr3;
			String phone1 = mr.getParameter("up_phonenumber1");
			String phone2 = mr.getParameter("up_phonenumber2");
			String phone3 = mr.getParameter("up_phonenumber3");
			String bo_phonenumber = phone1 + phone2 + phone3;
			Date birth = formatter.parse(mr.getParameter("newbirth"));
			String oldpicture = mr.getParameter("oldpicture");
			String newpicture = mr.getFilesystemName("newpicture");

			b.setBo_pw(bo_pw);
			b.setBo_email(bo_email);
			b.setBo_address(bo_address);
			b.setBo_phonenumber(bo_phonenumber);
			b.setBo_birth(birth);

			if (newpicture != null) {
				b.setBo_picture(newpicture);
			} else {
				b.setBo_picture(oldpicture);
			}

			if (ss.getMapper(MemberMapper.class).bossUpdate(b) == 1) {
				request.setAttribute("result", "수정성공");
			} else {
				request.setAttribute("result", "수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정실패");
		}
	}

	// 사용자 탈퇴
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

			} else {
				request.setAttribute("result", "탈퇴실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "탈퇴실패");
		}
	}

	// 구매목록
	public void userbuylist(Buy b, HttpServletRequest request) {
		List<Buy> userbuylist = ss.getMapper(BuylistMapper.class).userbuylist(b);
		request.setAttribute("userbuylist", userbuylist);

		List<Buy> mealbuylist = ss.getMapper(BuylistMapper.class).mealbuylist(b);
		request.setAttribute("mealbuylist", mealbuylist);

	}

	// 구매목록 삭제
	public void buyproductdel(Buy b, HttpServletRequest request) {
		try {
			int buyproductdel = ss.getMapper(BuylistMapper.class).buyproductdel(b);

			if (buyproductdel == 1) {
				request.setAttribute("result", "삭제성공");
			} else {
				request.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "삭제실패");
		}
	}

	// 구매목록 삭제
	public void buymealdel(Buy b, HttpServletRequest request) {
		try {
			int buymealdel = ss.getMapper(BuylistMapper.class).buymealdel(b);

			if (buymealdel == 1) {
				request.setAttribute("result", "삭제성공");
			} else {
				request.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "삭제실패");
		}
	}

	// 내글
	public void communities(Communities c, HttpServletRequest request) {

		List<Communities> communities = ss.getMapper(CommunitiesMapper.class).communities(c);
		request.setAttribute("freeboard", communities);
	}

	// 자유게시판
	public void freeboard(Communities c, HttpServletRequest request) {

		List<Communities> freeboard = ss.getMapper(CommunitiesMapper.class).freeboard(c);
		request.setAttribute("freeboard", freeboard);
	}

	// 캠핑찜
	public void campingjjim(Communities c, HttpServletRequest request) {

		List<Communities> campingjjim = ss.getMapper(CommunitiesMapper.class).campingjjim(c);
		request.setAttribute("campingjjim", campingjjim);
	}

	// 캠핑찜 삭제
	public void campingjjimdel(Communities c, HttpServletRequest request) {
		try {
			int jjimdel = ss.getMapper(CommunitiesMapper.class).campingjjimdel(c);

			if (jjimdel == 1) {
				request.setAttribute("result", "삭제성공");
			} else {
				request.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "삭제실패");
		}
	}

	// 캠핑예약
	public void campingreserve(Communities c, HttpServletRequest request) {
		List<Communities> campingreserve = ss.getMapper(CommunitiesMapper.class).campingreserve(c);
		request.setAttribute("campingreserve", campingreserve);
	}

	// 캠핑예약 삭제
	public void campingreservedel(Communities c, HttpServletRequest request) {
		try {
			int reservedel = ss.getMapper(CommunitiesMapper.class).reservedel(c);

			if (reservedel == 1) {
				request.setAttribute("result", "삭제성공");
			} else {
				request.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "삭제실패");
		}
	}

	// 캠핑팁
	public void campingtip(Communities c, HttpServletRequest request) {
		List<Communities> campingtip = ss.getMapper(CommunitiesMapper.class).campingtip(c);
		request.setAttribute("campingtip", campingtip);
	}

	// 레시피
	public void recipe(Communities c, HttpServletRequest request) {
		List<Communities> recipe = ss.getMapper(CommunitiesMapper.class).recipe(c);
		request.setAttribute("recipe", recipe);
	}

	// 캠핑리뷰
	public void campingreview(Communities c, HttpServletRequest request) {
		List<Communities> campingreview = ss.getMapper(CommunitiesMapper.class).campingreview(c);
		request.setAttribute("campingreview", campingreview);
	}

	// 캠핑 리뷰 수정
	public void campingreviewupdate(Communities c, HttpServletRequest request) {
		try {

			int row = ss.getMapper(ReviewMapper.class).campingreviewupdate(c);

			if (row == 1) {
				request.setAttribute("result", "수정성공");
			} else {
				request.setAttribute("result", "수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정실패");
		}
	}

	// 캠핑리뷰 삭제
	public void campingreviewdel(Communities c, HttpServletRequest request) {
		try {

			int crdel = ss.getMapper(ReviewMapper.class).campingreviewdel(c);

			if (crdel == 1) {
				request.setAttribute("result", "삭제성공");
			} else {
				request.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "삭제실패");
		}
	}

	// 구매용품 리뷰
	public void productreview(Communities c, HttpServletRequest request) {
		List<Communities> productreview = ss.getMapper(CommunitiesMapper.class).productreview(c);
		request.setAttribute("productreview", productreview);

		List<Communities> mealreview = ss.getMapper(CommunitiesMapper.class).mealreview(c);
		request.setAttribute("mealreview", mealreview);
	}

	// 구매용품 - 캠핑용품 리뷰 수정
	public void productreviewupdate(Communities c, HttpServletRequest request) {
		try {

			int pru = ss.getMapper(ReviewMapper.class).productreviewupdate(c);

			if (pru == 1) {
				request.setAttribute("result", "수정성공");
			} else {
				request.setAttribute("result", "수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정실패");
		}
	}

	// 구매용품 - 캠핑용품 리뷰 삭제
	public void productreviewdel(Communities c, HttpServletRequest request) {
		try {

			int prd = ss.getMapper(ReviewMapper.class).productreviewdel(c);

			if (prd == 1) {
				request.setAttribute("result", "삭제성공");
			} else {
				request.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "삭제실패");
		}
	}

	// 구매용품 - 밀키트 리뷰 수정
	public void mealreviewupdate(Communities c, HttpServletRequest request) {
		try {

			int fpru = ss.getMapper(ReviewMapper.class).mealreviewupdate(c);

			if (fpru == 1) {
				request.setAttribute("result", "수정성공");
			} else {
				request.setAttribute("result", "수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정실패");
		}
	}

	// 구매용품 - 밀키트 리뷰 삭제
	public void mealreviewdel(Communities c, HttpServletRequest request) {
		try {

			int fprd = ss.getMapper(ReviewMapper.class).mealreviewdel(c);

			if (fprd == 1) {
				request.setAttribute("result", "삭제성공");
			} else {
				request.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "삭제실패");
		}
	}

	// 자유게시판 리뷰
	public void freeboardreview(Communities c, HttpServletRequest request) {
		List<Communities> freeboardreview = ss.getMapper(CommunitiesMapper.class).freeboardreview(c);
		request.setAttribute("freeboardreview", freeboardreview);
	}

	// 자유게시판 리뷰 수정
	public void freeboardreviewupdate(Communities c, HttpServletRequest request) {
		try {

			int fu = ss.getMapper(ReviewMapper.class).freeboardreviewupdate(c);

			if (fu == 1) {
				request.setAttribute("result", "수정성공");
			} else {
				request.setAttribute("result", "수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정실패");
		}
	}

	// 자유게시판 리뷰 삭제
	public void freeboardreviewdel(Communities c, HttpServletRequest request) {
		try {

			int fd = ss.getMapper(ReviewMapper.class).freeboardreviewdel(c);

			if (fd == 1) {
				request.setAttribute("result", "삭제성공");
			} else {
				request.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "삭제실패");
		}
	}

	// 캠핑팁 리뷰
	public void campingtipreview(Communities c, HttpServletRequest request) {
		List<Communities> campingtipreview = ss.getMapper(CommunitiesMapper.class).campingtipreview(c);
		request.setAttribute("campingtipreview", campingtipreview);
	}

	// 레시피 리뷰 수정
	public void campingtipreviewupdate(Communities c, HttpServletRequest request) {
		try {

			int fu = ss.getMapper(ReviewMapper.class).campingtipreviewupdate(c);

			if (fu == 1) {
				request.setAttribute("result", "수정성공");
			} else {
				request.setAttribute("result", "수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정실패");
		}
	}

	// 레시피 리뷰 삭제
	public void campingtipreviewdel(Communities c, HttpServletRequest request) {
		try {

			int fd = ss.getMapper(ReviewMapper.class).campingtipreviewdel(c);

			if (fd == 1) {
				request.setAttribute("result", "삭제성공");
			} else {
				request.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "삭제실패");
		}
	}

	// 레시피 리뷰
	public void recipereview(Communities c, HttpServletRequest request) {
		List<Communities> recipereview = ss.getMapper(CommunitiesMapper.class).recipereview(c);
		request.setAttribute("recipereview", recipereview);
	}

	// 레시피 리뷰 수정
	public void recipereviewupdate(Communities c, HttpServletRequest request) {
		try {

			int fu = ss.getMapper(ReviewMapper.class).recipereviewupdate(c);

			if (fu == 1) {
				request.setAttribute("result", "수정성공");
			} else {
				request.setAttribute("result", "수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정실패");
		}
	}

	// 레시피 리뷰 삭제
	public void recipereviewdel(Communities c, HttpServletRequest request) {
		try {

			int fd = ss.getMapper(ReviewMapper.class).recipereviewdel(c);

			if (fd == 1) {
				request.setAttribute("result", "삭제성공");
			} else {
				request.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "삭제실패");
		}
	}

	public void idsearch(Login l, HttpServletRequest req) {
		System.out.println("dd" + l.getName());
		if (ss.getMapper(MemberMapper.class).idsearch(l) != null) {
			req.setAttribute("id", ss.getMapper(MemberMapper.class).idsearch(l));
		} else if (ss.getMapper(MemberMapper.class).bo_idsearch(l) != null) {
			req.setAttribute("id", ss.getMapper(MemberMapper.class).bo_idsearch(l));
		}
	}

}
