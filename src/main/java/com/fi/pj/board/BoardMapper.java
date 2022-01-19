package com.fi.pj.board;

import java.util.List;

public interface BoardMapper {

	//자유게시판 전체목록
	public List<Freeboard> getAllfreeboard();

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
	public List<FbReply> getfbreply(Freeboard fb);

	//자유게시판 댓글 삭제
	public int FrDelete(FbReply fr);
	//자유게시판 댓글 대댓글이 있는지 없는지 확인
	public int FrDelete_update_select(FbReply fr);
	//자유게시판 댓글 삭제로 수정하기
	public int FrDelete_update(FbReply fr);
	
	//자유게시판 대댓글 보기
	public List<FbReply> getfbrreply(Freeboard fb);

	

	

	

	

	

	
}
