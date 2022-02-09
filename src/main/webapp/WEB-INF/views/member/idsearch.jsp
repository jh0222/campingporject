<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>가입했던 이름과 전화번호를 적어주세요</h2>
<form action="id.search">
	<table border="1">
		<tr>
			<td colspan="2" align="center">아이디 찾기</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input name="name"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input name="phonenumber"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><button>찾기</button></td>
		</tr>
	</table>
</form>
</body>
</html>