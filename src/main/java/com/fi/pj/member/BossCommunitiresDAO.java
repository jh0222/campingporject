package com.fi.pj.member;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class BossCommunitiresDAO {

	@Autowired
	private SqlSession ss;

	// 등록된 캠핑 정보
	public void CampingInfo(BossCommunities bc, HttpServletRequest req) {
		// 사용자 db에 저장된 주소
		BossCommunities b = ss.getMapper(BossCommunitiesMapper.class).campinginfo(bc);
		if(b != null) {
		String addr = b.getCam_address();
		String[] addr2 = addr.split("!");
		req.setAttribute("addr", addr2);
		}
		req.setAttribute("campinginfo", b);
		
	}

	// 캠핑 정보 수정
	public void CampingInfoUp(BossCommunities bc, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		String oldFile = null;
		String newFile = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			int cam_no = Integer.parseInt(mr.getParameter("cam_no"));
			oldFile = mr.getParameter("oldpicture");
			String cam_bo_id =mr.getParameter("cam_bo_id");
			String cam_name = mr.getParameter("name");
			String cam_txt = mr.getParameter("txt");
			int cam_price = Integer.parseInt(mr.getParameter("price"));
			String addr1 = mr.getParameter("up_addr1");
			String addr2 = mr.getParameter("up_addr2");
			String addr3 = mr.getParameter("up_addr3");
			String cam_address = addr1 + "!" + addr2 + "!" + addr3;
			String phone1 = mr.getParameter("up_phonenumber1");
			String phone2 = mr.getParameter("up_phonenumber2");
			String phone3 = mr.getParameter("up_phonenumber3");
			String cam_phonenumber = phone1 + phone2 + phone3;
			
			bc.setCam_no(cam_no);
			bc.setCam_bo_id(cam_bo_id);
			bc.setCam_name(cam_name);
			bc.setCam_txt(cam_txt);
			bc.setCam_phonenumber(cam_phonenumber);
			bc.setCam_price(cam_price);
			bc.setCam_address(cam_address);
			
			newFile = mr.getFilesystemName("cam_picture");
			if (newFile == null) {
				newFile = oldFile;
				bc.setCam_picture(oldFile);
			} else {
				bc.setCam_picture(newFile);
				newFile = URLEncoder.encode(newFile, "utf-8");
				newFile = newFile.replace("+", " ");
			}
			
			if (ss.getMapper(BossCommunitiesMapper.class).campinginformationupdate(bc) == 1) {
				req.setAttribute("result", "수정성공");
			} else {
				req.setAttribute("result", "수정실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "수정실패");
			return;
		}

	}

	// 캠핑정보 삭제
	public void campinginfodel(BossCommunities bc, HttpServletRequest req) {
		try {
			int cf = ss.getMapper(BossCommunitiesMapper.class).campinginfodel(bc);

			if (cf == 1) {
				
				String path = req.getSession().getServletContext().getRealPath("resources/img");
				String Cam_picture = bc.getCam_picture();
				Cam_picture = URLDecoder.decode(Cam_picture, "utf-8");
				new File(path + "/" + Cam_picture).delete();
				
				req.setAttribute("result", "삭제성공");
				
			} else {
				req.setAttribute("result", "삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "삭제실패");
		}
	}

	// 사용자들이 예약한 정보
	public void campingreserve(BossCommunities bc, HttpServletRequest req) {
		List<BossCommunities> campingreserve = ss.getMapper(BossCommunitiesMapper.class).campingreserve(bc);
		req.setAttribute("campingreserve", campingreserve);
		List<BossCommunities> campingreserve2 = ss.getMapper(BossCommunitiesMapper.class).campingreserve2(bc);
		req.setAttribute("campingreserve2", campingreserve2);
		System.out.println(bc.getR_no());
	}

	// 구매 목록
	public void buylist(BossCommunities bc, HttpServletRequest req) {
		List<BossCommunities> pbyulist = ss.getMapper(BossCommunitiesMapper.class).pbuylist(bc);
		String addr = ((BossCommunities) pbyulist).getCam_address();
		String[] addr2 = addr.split("!");
		req.setAttribute("addr", addr2);
		req.setAttribute("pbuylist", pbyulist);

		List<BossCommunities> mbyulist = ss.getMapper(BossCommunitiesMapper.class).mbuylist(bc);
		req.setAttribute("mbuylist", mbyulist);
	}

	// 내글
	public void communities(BossCommunities bc, HttpServletRequest request) {

		List<BossCommunities> communities = ss.getMapper(BossCommunitiesMapper.class).communities(bc);
		request.setAttribute("freeboard", communities);
	}

	// 자유게시판
	public void freeboard2(BossCommunities bc, HttpServletRequest request) {

		List<BossCommunities> freeboard = ss.getMapper(BossCommunitiesMapper.class).freeboard(bc);
		request.setAttribute("freeboard", freeboard);
	}

	// 캠핑팁
	public void campingtip(BossCommunities bc, HttpServletRequest request) {
		List<BossCommunities> campingtip = ss.getMapper(BossCommunitiesMapper.class).campingtip(bc);
		request.setAttribute("campingtip", campingtip);
	}

	// 레시피
	public void recipe(BossCommunities bc, HttpServletRequest request) {
		List<BossCommunities> recipe = ss.getMapper(BossCommunitiesMapper.class).recipe(bc);
		request.setAttribute("recipe", recipe);
	}

	// 구매용품 리뷰
	public void productreview(BossCommunities bc, HttpServletRequest request) {
		List<BossCommunities> productreview = ss.getMapper(BossCommunitiesMapper.class).productreview(bc);
		request.setAttribute("productreview", productreview);

		List<BossCommunities> mealreview = ss.getMapper(BossCommunitiesMapper.class).mealreview(bc);
		request.setAttribute("mealreview", mealreview);
	}

	// 구매용품 - 캠핑용품 리뷰 수정
	public void productreviewupdate(BossCommunities bc, HttpServletRequest request) {
		try {

			int pru = ss.getMapper(BossCommunitiesMapper.class).productreviewupdate(bc);

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
	public void productreviewdel(BossCommunities bc, HttpServletRequest request) {
		try {

			int prd = ss.getMapper(BossCommunitiesMapper.class).productreviewdel(bc);

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
	public void mealreviewupdate(BossCommunities bc, HttpServletRequest request) {
		try {

			int fpru = ss.getMapper(BossCommunitiesMapper.class).mealreviewupdate(bc);

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
	public void mealreviewdel(BossCommunities bc, HttpServletRequest request) {
		try {

			int fprd = ss.getMapper(BossCommunitiesMapper.class).mealreviewdel(bc);

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
	public void freeboardreview(BossCommunities bc, HttpServletRequest request) {
		List<BossCommunities> freeboardreview = ss.getMapper(BossCommunitiesMapper.class).freeboardreview(bc);
		request.setAttribute("freeboardreview", freeboardreview);
	}

	// 자유게시판 리뷰 수정
	public void freeboardreviewupdate(BossCommunities bc, HttpServletRequest request) {
		try {

			int fu = ss.getMapper(BossCommunitiesMapper.class).freeboardreviewupdate(bc);

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
	public void freeboardreviewdel(BossCommunities bc, HttpServletRequest request) {
		try {

			int fd = ss.getMapper(BossCommunitiesMapper.class).freeboardreviewdel(bc);

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
	public void campingtipreview(BossCommunities bc, HttpServletRequest request) {
		List<BossCommunities> campingtipreview = ss.getMapper(BossCommunitiesMapper.class).campingtipreview(bc);
		request.setAttribute("campingtipreview", campingtipreview);
	}

	// 레시피 리뷰 수정
	public void campingtipreviewupdate(BossCommunities bc, HttpServletRequest request) {
		try {

			int fu = ss.getMapper(BossCommunitiesMapper.class).campingtipreviewupdate(bc);

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
	public void campingtipreviewdel(BossCommunities bc, HttpServletRequest request) {
		try {

			int fd = ss.getMapper(BossCommunitiesMapper.class).campingtipreviewdel(bc);

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
	public void recipereview(BossCommunities bc, HttpServletRequest request) {
		List<BossCommunities> recipereview = ss.getMapper(BossCommunitiesMapper.class).recipereview(bc);
		request.setAttribute("recipereview", recipereview);
	}

	// 레시피 리뷰 수정
	public void recipereviewupdate(BossCommunities bc, HttpServletRequest request) {
		try {

			int fu = ss.getMapper(BossCommunitiesMapper.class).recipereviewupdate(bc);

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
	public void recipereviewdel(BossCommunities bc, HttpServletRequest request) {
		try {

			int fd = ss.getMapper(BossCommunitiesMapper.class).recipereviewdel(bc);

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

	

}
