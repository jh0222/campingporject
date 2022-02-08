<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${result}
<jsp:include page="${myPage }"></jsp:include>
<jsp:include page="${community }"></jsp:include>
<form action="campingjjimdel" >
	<table border="1">
		<tr>
			<td>번호</td>
			<td>캠핑명</td>
			<td>캠핑주소</td>
			<td>하트</td>
		</tr>
	<c:forEach var="cj" items="${campingjjim}">
		<tr>
			<td>${cj.h_no}</td>
			<td>${cj.h_cam_name}</td>
			<td>${cj.h_cam_address }</td>
			<td><button value="${cj.h_campingheart }" onclick="${cj.h_no }">찜해제</button></td>
		</tr>
	</c:forEach>
	</table>

</form>
</body>
</html>