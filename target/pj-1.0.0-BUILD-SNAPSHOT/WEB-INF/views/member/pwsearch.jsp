<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="search_title">비밀번호 찾기</div>
<form action="pw_search" method="post">
	<div class="id_search">
		<div class="search_title2">인증된 이메일만 정보 찾기가 가능합니다</div>
		<div class="id_search2">
			<div class="id_search_title">
				아이디 &nbsp;&nbsp;
			</div>
			<div class="id_search_txt">
				<input name="id" placeholder="ex) kk123">
			</div>
		</div>
		<div class="id_search2">
			<div class="id_search_title">
				이메일 &nbsp;&nbsp;
			</div>
			<div class="id_search_txt">
				<input name="email" placeholder="ex) E-mail@gmail.com">
			</div>
		</div>
		<div style="text-align:center;">
			<button class="searchbtn">찾기</button>
		</div>
	</div>
</form>
</body>
</html>