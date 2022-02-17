<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<jsp:param value="ci" name="${campinginfo }"/>
	<tr>
		<td>번호</td>
		<td>캠핑명</td>
		<td>캠핑주소</td>
		<td>캠핑사진</td>
		<td>소개</td>
		<td>전화번호</td>
		<td>기본가격</td>
	</tr>
	<tr>
		<td>${ci.cam_no }"
		<td><c:out value="${ci.cam_name }"></c:out> </td>
		<td><c:out value="${ci.cam_address }"></c:out> </td>
		<td><c:out value="${ci.cam_picture }"></c:out> </td>
		<td><c:out value="${ci.cam_txt }"></c:out> </td>
		<td><c:out value="${ci.cam_phonenumber }"></c:out> </td>
		<td><c:out value="${ci.cam_price }"></c:out> </td>
	</tr>
</table>
</body>
</html>