package com.fi.pj.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BossCommunitiresDAO {

	@Autowired
	private SqlSession ss;

	// 등록된 캠핑 정보
	public void CampingInfo(BossCommunities bc, HttpServletRequest req) {

		String campinginfo = ss.getMapper(BossCommunitiesMapper.class).campinginfo(bc);

		req.setAttribute("campinginfo", campinginfo);
	}

	// 예약된 정보
	public void CampingReserve(BossCommunities bc, HttpServletRequest req) {

		ss.getMapper(BossCommunitiesMapper.class).campingreserve(bc);
	}

	// 구매 목록
	public void buylist(BossCommunities bc, HttpServletRequest req) {
		List<BossCommunities> pbyulist = ss.getMapper(BossCommunitiesMapper.class).pbuylist(bc);
		req.setAttribute("pbuylist", pbyulist);

		List<BossCommunities> mbyulist = ss.getMapper(BossCommunitiesMapper.class).mbuylist(bc);
		req.setAttribute("mbuylist", mbyulist);
	}

	// 내글
	public void communities(BossCommunities bc, HttpServletRequest request) {

		List<Communities> communities = ss.getMapper(BossCommunitiesMapper.class).communities(bc);
		request.setAttribute("freeboard", communities);
	}

	// 자유게시판
	public void Bfreeboard(BossCommunities bc, HttpServletRequest request) {

		List<Communities> freeboard = ss.getMapper(BossCommunitiesMapper.class).freeboard(bc);
		request.setAttribute("freeboard", freeboard);
	}

	// 캠핑찜
	public void campingjjim(BossCommunities bc, HttpServletRequest request) {

		List<Communities> campingjjim = ss.getMapper(BossCommunitiesMapper.class).campingjjim(bc);
		request.setAttribute("campingjjim", campingjjim);
	}

	// 캠핑찜 삭제
	public void campingjjimdel(BossCommunities bc, HttpServletRequest request) {
		try {
			int jjimdel = ss.getMapper(BossCommunitiesMapper.class).campingjjimdel(bc);

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

	// 캠핑팁
	public void campingtip(BossCommunities bc, HttpServletRequest request) {
		List<Communities> campingtip = ss.getMapper(BossCommunitiesMapper.class).campingtip(bc);
		request.setAttribute("campingtip", campingtip);
	}

	// 레시피
	public void recipe(BossCommunities bc, HttpServletRequest request) {
		List<Communities> recipe = ss.getMapper(BossCommunitiesMapper.class).recipe(bc);
		request.setAttribute("recipe", recipe);
	}

	// 구매용품 리뷰
	public void productreview(BossCommunities bc, HttpServletRequest request) {
		List<Communities> productreview = ss.getMapper(BossCommunitiesMapper.class).productreview(bc);
		request.setAttribute("productreview", productreview);

		List<Communities> mealreview = ss.getMapper(BossCommunitiesMapper.class).mealreview(bc);
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
		List<Communities> freeboardreview = ss.getMapper(BossCommunitiesMapper.class).freeboardreview(bc);
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
		List<Communities> campingtipreview = ss.getMapper(BossCommunitiesMapper.class).campingtipreview(bc);
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
		List<Communities> recipereview = ss.getMapper(BossCommunitiesMapper.class).recipereview(bc);
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
