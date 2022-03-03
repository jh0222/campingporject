package com.fi.pj.board;

import java.util.List;



public interface BoardMapper {
	//자유게시판 전체목록
	public List<Freeboard> getAllfreeboard(BoardPage p);
	//자유게시판 등록
	public int FbInsert(Freeboard fb);
	//전체검색
	public List<Freeboard> FbSearch_id(Search s);
	public List<Freeboard> FbSearch_subject(Search s);
	//자유게시판 수정
	public int FbUpdate(Freeboard fb);
	//자유게시판 삭제
	public int FbDelete(Freeboard fb);
	//자유게시판 하나 보기
	public Freeboard getonefreeboard(Freeboard fb);
	//자유게시판 댓글 등록
	public int FbreplyInsert(FbReply fr);
	public int FbreplyInsert2(FbReply fr);
	public int FbreplyInsert3(FbReply fr);
	//자유게시판 댓글 보기
	public List<FbReply> getfbreply(BoardPage p);
	//자유게시판 댓글 삭제
	public int FrDelete(FbReply fr);
	//자유게시판 댓글 대댓글이 있는지 없는지 확인
	public int FrDelete_update_select(FbReply fr);
	//자유게시판 댓글 삭제로 수정하기
	public int FrDelete_update(FbReply fr);
	//3알수없음에 대댓글이 하나인 경우
	public int FrDelete_r_select(FbReply fr);
	//자유게시판 3알수없음 있는지 확인
	public int FrDelete_3_select(FbReply fr);
	//댓글3 알수없음도 같이 삭제
	public int Fr3Delete(FbReply fr);
	//자유게시판 대댓글 보기
	public List<FbReply> getfbrreply(Freeboard fb);
	//대댓글 총갯수
	public List<FbReply> getfbrreply_cnt(Freeboard fb);
	//조회수
	public int Fbcount_update(Freeboard fb);
	//총 자유게시판 수
	public int getAllfreeboardcnt();
	//총 댓글 수
	public int getAllfreeboardreplycnt(Freeboard fb);
	//댓글 수정
	public int Fr_update(FbReply fr);
	//게시판 검색결과 총 cnt
	public int FbSearch_subject_cnt(Search s);
	public int FbSearch_id_cnt(Search s);

	//캠핑팁-----------------------------------------------------------------
	//캠핑전체리스트
	public List<Campingtipboard> getAllcampingtip(BoardPage p);
	public int getAllcampingtipcnt();
	//캠핑팁 등록
	public int CbInsert(Campingtipboard cb);
	//검색
	public List<Campingtipboard> TipSearch_subject(Search s);
	public List<Campingtipboard> TipSearch_id(Search s);
	public int TipSearch_subject_cnt(Search s);
	public int TipSearch_id_cnt(Search s);
	//조회수
	public int Cbcount_update(Campingtipboard cb);
	//클릭페이지
	public Campingtipboard getonectboard(Campingtipboard cb);
	public List<CtReply> getctreply(BoardPage p);
	public List<CtReply> getctrreply(Campingtipboard cb);
	public int getAllctreplycnt(Campingtipboard cb);
	//캠핑팁 수정
	public int CtUpdate(Campingtipboard cb);
	public int Cr_update(CtReply cr);	
	//캠핑팁 삭제
	public int CtDelete(Campingtipboard cb);
	//캠핑팁 댓글 등록
	public int CtreplyInsert2(CtReply cr);
	public int CtreplyInsert(CtReply cr);
	//댓글 삭제
	public int TiprDelete_update_select(CtReply cr);
	public int TiprDelete_r_select(CtReply cr);
	public int TiprDelete_3_select(CtReply cr);
	public int TiprDelete(CtReply cr);
	public int Tipr3Delete(CtReply cr);
	public int TiprDelete_update(CtReply cr);

	//레시피-----------------------------------------------------------------
	//전체리스트
	public List<Recipe> getAllrecipe(BoardPage p);
	public int getAllrecipecnt();
	//등록
	public int RbInsert(Recipe r);
	//검색
	public List<Recipe> RSearch_subject(Search s);
	public int RSearch_subject_cnt(Search s);
	public List<Recipe> RSearch_id(Search s);
	public int RSearch_id_cnt(Search s);
	//조회수
	public int Rbcount_update(Recipe r);
	//클릭페이지
	public Recipe getoneRboard(Recipe r);
	public List<RReply> getrreply(BoardPage p);
	public List<RReply> getrrreply(Recipe r);
	public int getAllrreplycnt(Recipe r);
	//수정
	public int RUpdate(Recipe r);
	public int Rr_update(RReply rr);
	//삭제
	public int RDelete(Recipe r);
	//댓글 등록
	public int RreplyInsert2(RReply rr);
	public int RreplyInsert(RReply rr);
	//댓글 삭제
	public int RrDelete_update_select(RReply rr);
	public int RrDelete_update(RReply rr);
	public int RrDelete_r_select(RReply rr);
	public int RrDelete_3_select(RReply rr);
	public int RrDelete(RReply rr);
	public int Rr3Delete(RReply rr);
	
	//-------------------------------------------
	//인기 게시판
	public List<Freeboard> freepopular();
	public List<Campingtipboard> tippopular();
	public List<Recipe> recipepopular();

	public List<CtReply> getctrreply_cnt(Campingtipboard cb);
	public List<RReply> getrrreply_cnt(Recipe r);
	

	
}
