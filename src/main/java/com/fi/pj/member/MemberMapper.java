package com.fi.pj.member;

public interface MemberMapper {


	//아이디중복
	public int getMemberNum(UserMember m);
	public int getBMemberNum(BossMember b);

	//로그인 아이디 찾기
	public UserMember getMemberByUID(Login l);
	public BossMember getMemberByBOID(Login l);
<<<<<<< HEAD
=======
	public Root getMemberByR(Login l);
>>>>>>> 6b758e7f64ddf43f1809ff7d47c3023f1c7127fe

	//회원가입
	public int Userjoin(UserMember m);
	public int Bossjoin(BossMember m);
<<<<<<< HEAD
=======
	
>>>>>>> 6b758e7f64ddf43f1809ff7d47c3023f1c7127fe

}
