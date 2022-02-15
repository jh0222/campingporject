package com.fi.pj.member;

public interface MemberMapper {


	//아이디중복
	public int getMemberNum(UserMember m);
	public int getBMemberNum(BossMember b);

	//로그인 아이디 찾기
	public UserMember getMemberByUID(Login l);
	public BossMember getMemberByBOID(Login l);
	public Root getMemberByR(Login l);

	//회원가입
	public int Userjoin(UserMember m);
	public int Bossjoin(BossMember m);
	
	//회원탈퇴
	public int userBye(UserMember m);
	public int bossBye(BossMember b);
	
	//회원 정보 업데이트
	public int userUpdate(UserMember m);
	public int bossUpdate(BossMember b);
	
}
