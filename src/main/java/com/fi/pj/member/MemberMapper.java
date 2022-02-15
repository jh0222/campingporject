package com.fi.pj.member;

import org.apache.ibatis.annotations.Param;

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
	
<<<<<<< HEAD
<<<<<<< HEAD
	//회원탈퇴
	public int userBye(UserMember m);
	public int bossBye(BossMember b);
	
	//회원 정보 업데이트
	public int userUpdate(UserMember m);
	public int bossUpdate(BossMember b);
	
=======
	//잃어버린 아이디 찾기
	//String searchId(@Param("user_name")String user_name, @Param("user_phone")String user_phone);
	//int searchPassword(String user_id, String user_email, String key); // 회원 임시 비밀번호 변경 메서드
	public String idsearch(Login l);
	public String bo_idsearch(Login l);
	
	
=======
>>>>>>> d3be522016e6e899d9a2e96f82e68725ec3f5622

>>>>>>> 782c38e9a315f6ce9cabea02628197158d8225e1
}
