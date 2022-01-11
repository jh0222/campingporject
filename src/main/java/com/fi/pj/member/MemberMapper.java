package com.fi.pj.member;

public interface MemberMapper {


	//아이디중복
	public int getMemberNum(UserMember m);

	//로그인 아이디 찾기(사용자)
	public UserMember getMemberByUID(Login l);
	//로그인 아이디 찾기(사장님)
	public BossMember getMemberByBOID(Login l);

	public int Userjoin(UserMember m);
	

}
