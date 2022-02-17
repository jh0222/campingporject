<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<table border="1">
	<tr>
		<td>캠핑장 이름</td>
		<td>캠핑장 주소</td>
	</tr>
	<c:forEach var="h" items="${hearts}">
	<tr>
		<td>${h.h_cam_name }</td>
		<td>${h.h_cam_address }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>