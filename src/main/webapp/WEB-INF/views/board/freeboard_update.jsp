<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
자유게시판
		<form action="fbwrite.update?f_no=${fb.f_no}"
			method="post" enctype="multipart/form-data"
			name="writeForm" onsubmit="return wirteCheck();">
		<table border="1">		
			<tr>
			<td>제목</td>
			<td><input name="subject" value="${fb.f_subject }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input name="txt" value="${fb.f_txt }"></td>
			</tr>
			<tr>
				<td>사진</td>
				<td>
					<img src="resources/img/${fb.f_picture }"  width="200" height="100">
					<input name="f_picture" type="hidden" value="${fb.f_picture }">
					<input name="picture" type="file">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button>수정</button></td>
			</tr>
		</table>
		</form>
		<button>삭제</button>
</body>
</html>