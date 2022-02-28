package com.fi.pj.campingplace;

import java.util.List;

import com.fi.pj.board.Freeboard;

public interface PlaceMapper {
	//전체 캠핑 목록
	public List<Campingplace> getAllPlace(Campingplace p);
	public int getAllPlacecnt();
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
	//리뷰 수정
	public int ReviewUpdate(placeReview pr);
	
	//예약
	public int reserve(placeReserve res);
	
	//캠핑장 찜 
	public int placeLike(campingLike cl);
	//캠핑장 찜 목록
	public List<campingLike> getHeartList();
	//찜 취소 
	public int placeLike_del(campingLike cl);
	//찜 있는지 없는지
	public String getheart(campingLike cl);
	
	//캠핑장 이름 검색
	public List<Campingplace> Search_place(placeSearch ps);
	//public List<Campingplace> Search_host(placeSearch ps);
	
	//캠핑장 검색결과 총 cnt 
	public int Search_place_cnt(placeSearch ps);
	//public int Search_host_cnt(placeSearch ps);
	
	
	public List<Campingplace> Search_star(placeSearch ps);
	public int Search_star_cnt(placeSearch ps);
	public List<Campingplace> Search_p(placeSearch ps);
	public int getpricecnt(placeSearch ps);
	public List<Campingplace> Search_area(placeSearch ps);
	public int getareacnt(placeSearch ps);
	
	//찜리스트
	public List<campingLike> getheartlist(campingLike cl);
	
	//사장님 리뷰 답글 목록
	public List<placeReply> getAllReply(placeReply re);
	//사장님 리뷰 답글 등록
	public int ReplytxtReg(placeReply re);
	
	
	
	
	

}
