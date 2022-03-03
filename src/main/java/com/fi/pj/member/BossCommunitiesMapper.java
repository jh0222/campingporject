package com.fi.pj.member;

import java.util.List;

public interface BossCommunitiesMapper {

	// 캠핑정보
	public BossCommunities campinginfo(BossCommunities bc);
	
	// 캠핑정보 - 수정
	int campinginformationupdate(BossCommunities bc);

	// 캠핑정보 - 삭제
	int campinginfodel(BossCommunities bc);

	// 캠핑 예약정보
	public List<BossCommunities> campingreserve(BossCommunities bc);

	// 캠핑용품 구매목록
	List<BossCommunities> pbuylist(BossCommunities bc);

	// 밀키트 구매목록
	List<BossCommunities> mbuylist(BossCommunities bc);

	// 자유게시판 내용
	List<BossCommunities> communities(BossCommunities bc);

	// 자유게시판 내용
	List<BossCommunities> freeboard(BossCommunities bc);

	// 캠핑팁
	List<BossCommunities> campingtip(BossCommunities bc);

	// 레시피
	List<BossCommunities> recipe(BossCommunities bc);

	// 캠핑용품 리뷰
	List<BossCommunities> productreview(BossCommunities bc);

	// 캠핑용품 리뷰 - 수정 
	int productreviewupdate(BossCommunities bc);
	
	// 캠핑용품 리뷰 - 삭제
	int productreviewdel(BossCommunities bc);
	
	// 밀키트 리뷰
	List<BossCommunities> mealreview(BossCommunities bc);

	// 밀키트 리뷰 - 수정
	int mealreviewupdate(BossCommunities bc);

	// 밀키트 리뷰 - 삭제
	int mealreviewdel(BossCommunities bc);

	// 자유게시판 댓글
	List<BossCommunities> freeboardreview(BossCommunities bc);

	// 자유게시판 댓글 - 수정
	int freeboardreviewupdate(BossCommunities bc);

	// 자유게시판 댓글 - 삭제
	int freeboardreviewdel(BossCommunities bc);

	// 캠핑팁 리뷰
	List<BossCommunities> campingtipreview(BossCommunities bc);

	// 캠핑팁 리뷰 - 수정
	int campingtipreviewupdate(BossCommunities bc);

	// 캠핑팁 리뷰 - 삭제
	int campingtipreviewdel(BossCommunities bc);

	// 레시피 리뷰
	List<BossCommunities> recipereview(BossCommunities bc);

	// 레시피 리뷰 - 수정
	int recipereviewupdate(BossCommunities bc);

	// 레시피 리뷰 - 삭제
	int recipereviewdel(BossCommunities bc);

}
