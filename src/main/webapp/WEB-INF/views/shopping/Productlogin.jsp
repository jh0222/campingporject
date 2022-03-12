<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="member.productlogin" method="POST" name="loginForm">
		<div class="gocamping_login">
			<div class="login_id_box">
				<img class="login_id_img" src="resources/img/user.png">
				<input class="login_id" name="id" placeholder="아이디">
				<input name="p_no" type="hidden" value="${p.p_no }"> 
				<input name="pr_p_no" type="hidden" value="${p.p_no }">
				<input name="pr_u_bo_id" type="hidden" value="${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }">
			</div>
			<div class="login_pw_box">
				<img class="login_pw_img" src="resources/img/security.png">
				<input class="login_pw" name="pw" type="password" placeholder="비밀번호">
			</div>
			<br>
			<button class="login_btn">로그인</button>
		</div>
	</form>

	<div class="login_detail">
		<a href="idsearch.go">아이디찾기</a> |
		<a href="pwsearch.go">비밀번호찾기</a> |
		<a href="join.go">회원가입</a>
	</div>
</body>
</html>