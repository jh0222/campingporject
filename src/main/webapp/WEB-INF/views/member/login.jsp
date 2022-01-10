<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="member.login" method="post" name="loginForm">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input name="id"></td>
			</tr>
			<tr>
				<td>비번</td>
				<td><input name="pw" type="password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button>로그인</button></td>
			</tr>
		</table>
	</form>

	<a>아이디찾기</a>
	<a>비밀번호찾기</a>
	<a href="location.href='join.go'">회원가입</a	>
</body>
</html>