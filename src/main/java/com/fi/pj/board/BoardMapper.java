package com.fi.pj.board;

import java.util.List;

public interface BoardMapper {

	//자유게시판 전체목록
	public List<Freeboard> getAllfreeboard(Page p);

	//자유게시판 등록
	public int FbInsert(Freeboard fb);
	//사진 없을때
	public int FbInsert2(Freeboard fb);

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
	public List<FbReply> getfbreply(Page p);

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
	//조회수
	public int Fbcount_update(Freeboard fb);
	//총 자유게시판 수
	public int getAllfreeboardcnt();
	//총 댓글 수
	public int getAllfreeboardreplycnt(Freeboard fb);
	//댓글 수정
	public int Fr_update(FbReply fr);

	

	

	

	

	

	

	

	

	

	
}
