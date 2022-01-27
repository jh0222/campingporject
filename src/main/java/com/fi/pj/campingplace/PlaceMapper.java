package com.fi.pj.campingplace;

import java.util.List;

public interface PlaceMapper {
	//전체 캠핑 목록
	public List<Campingplace> getAllPlace();
	//캠핑 등록
	public int PlaceReg(Campingplace p);
	//캠핑 삭제
	public int PlaceDel(Campingplace p);
	//캠핑 수정
	public int PlaceUpdate(Campingplace p);
	//캠핑목록 하나 가져오기
	public Campingplace getOnePlace(Campingplace p);
	//리뷰 목록 
	public List<placeReview> getAllReview(placeReview pr);
	//리뷰 등록
	public int ReviewReg(placeReview pr);
	//리뷰 삭제
	public int ReviewDel(placeReview pr);

	

}
