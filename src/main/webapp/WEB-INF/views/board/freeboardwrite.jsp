<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
자유게시판
	<form action="fbwrite.insert?f_u_id=${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }"
		method="post" enctype="multipart/form-data"
		name="writeForm" onsubmit="return wirteCheck();">
	<table border="1">
		<tr>
			<td>제목</td>
			<td><input name="subject"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input name="txt"></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input name="picture" type="file"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center"><button>등록</button></td>
		</tr>
	</table>
	</form>
</body>
</html>